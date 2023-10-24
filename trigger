-- Criação do banco de dados
CREATE DATABASE BancoDeDadosProz;

-- Conecta-se ao banco de dados
\c BancoDeDadosProz;

-- Criação da tabela "Produtos"
CREATE TABLE Produtos (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Preco NUMERIC(10, 2)
);

-- Criação da tabela "Vendas"
CREATE TABLE Vendas (
    ID SERIAL PRIMARY KEY,
    ProdutoID INTEGER,
    Quantidade INTEGER,
    DataVenda DATE,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos (ID)
);

-- Criação do trigger para registrar vendas
CREATE OR REPLACE FUNCTION RegistrarVenda() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Vendas (ProdutoID, Quantidade, DataVenda)
    VALUES (NEW.ProdutoID, NEW.Quantidade, CURRENT_DATE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Vincula o trigger à tabela "Produtos" para acionar no INSERT
CREATE TRIGGER TriggerRegistrarVenda
AFTER INSERT ON Produtos
FOR EACH ROW
EXECUTE FUNCTION RegistrarVenda();
