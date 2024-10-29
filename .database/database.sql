-- Apagar o banco de dados
-- Ateção! só use isso em modo de desenvolvimento.
DROP DATABASE IF EXISTS crudtrecos;

-- cria banco de dados "novamente
-- Perigo! só use isso em modo de desenvolvemento.
CREATE DATABASE crudtrecos
-- seleciona a tabela de caracterres utf-8 (acentuação).
CHARACTER SET utf8mb4
-- Permite buscas case-insensitive (A=a, ç=c, ã=a).
COLLATE utf8mb4_unicode_ci;

-- Seleciona o banco de dados
-- Todos comodandos senguintes sejam para este banco de dados
USE crudtrecos;
 
 -- Cria a tabela da entidade "usario"
 -- Prefixo dos atributos 
CREATE TABLE usuario(
    u_id INT PRIMARY KEY auto_increment,
    u_data TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    U_NOME VARCHAR(127) NOT NULL,
    U_nascimento DATE NOT NULL,
    u_email VARCHAR(255) NOT NULL,
    u_senha VARCHAR(63) NOT NULL,
    u_status ENUM ('on', 'off', 'del') DEFAULT 'on'

)
-- Cria a tabela da entidade "treco"
 -- Prefixo dos atributos 
CREATE TABLE treco(
    t_id INT PRIMARY KEY auto_increment,
    t_data TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    t_usuario INT NOT NULL,
    t_nome VARCHAR(127) NOT NULL,
    t_descricao TEXT,
    t_localizacao VARCHAR(255),
    t_status ENUM ('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (t_usuario) REFERENCES usuario(u_id)
);