
let messages = [];
let editingId = null;

async function fetchMessages() {
  const res = await fetch("/api/messages");
  messages = await res.json();
  renderMessages();
}

function renderMessages() {
  const container = document.getElementById("chat-container");
  container.innerHTML = "";
  messages.forEach(msg => {
    const div = document.createElement("div");
    div.innerHTML = `${msg.text}
      <button onclick="editMessage('${msg.id}')">edit</button>
      <button onclick="deleteMessage('${msg.id}')">hapus</button>`;
    container.appendChild(div);
  });
}

function editMessage(id) {
  const msg = messages.find(m => m.id === id);
  document.getElementById("messageInput").value = msg.text;
  editingId = id;
}

async function deleteMessage(id) {
  await fetch(`/api/messages/${id}`, { method: "DELETE" });
  await fetchMessages();
}

async function updateMessage() {
  const input = document.getElementById("messageInput");
  const text = input.value;
  if (editingId) {
    await fetch(`/api/messages/${editingId}`, {
      method: "PUT",
      body: JSON.stringify({ text }),
    });
    editingId = null;
  } else {
    await fetch("/api/messages", {
      method: "POST",
      body: JSON.stringify({ text }),
    });
  }
  input.value = "";
  await fetchMessages();
}

fetchMessages();
