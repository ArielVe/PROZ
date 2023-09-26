CREATE TABLE ALUNO(
	id_aluno SERIAL PRIMARY KEY,
  	nome VARCHAR(24),
  	email VARCHAR(30),
  	endereco VARCHAR(50)
);

INSERT INTO ALUNO 
	(nome, email, endereco)
VALUES
	('João Carlos', 'jcarlos@gmail.com', 'rua 13 de maio'),
    ('José Vitor', 'jvitor@gmail.com', 'rua da saudade'),
    ('Paulo André', 'pandr@gmail.com', 'rua do sol');
    
SELECT * FROM ALUNO;
