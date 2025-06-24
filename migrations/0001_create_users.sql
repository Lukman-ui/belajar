-- Migration number: 0001 	 2025-06-19T15:46:55.001Z

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT
);

INSERT INTO users(name, address) VALUES ('Andre', 'Purwosari'), ('Andian', 'Sukorejo'), ('Ana', 'Pandaaan');