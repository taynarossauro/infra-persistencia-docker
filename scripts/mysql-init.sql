CREATE DATABASE IF NOT EXISTS master;

USE master;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, email) VALUES
('taynara', 'taynararaqueliz@gmail.com'),
('lucas', 'lucas@hotmail.com'),
('pedro', 'pedro@outlook.com'),
('douglas', 'douglas@gmail.com');