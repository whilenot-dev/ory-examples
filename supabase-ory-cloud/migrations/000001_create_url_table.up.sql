CREATE TABLE IF NOT EXISTS url (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL DEFAULT '',
	hash varchar(10) NOT NULL DEFAULT '',
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	expired_at TIMESTAMP WITH TIME ZONE,
	owner_id VARCHAR(36) NOT NULL DEFAULT ''
);

CREATE UNIQUE INDEX idx_url_hash ON url(hash);

CREATE TABLE IF NOT EXISTS url_view (
	id SERIAL PRIMARY KEY,
	referer VARCHAR(255) NOT NULL DEFAULT '',
	url_id INT NOT NULL,
	CONSTRAINT fk_url_view FOREIGN KEY(url_id) REFERENCES url(id)
);

