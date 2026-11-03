------------ALTERANDO TABELAS--------------
-------------------------------------------
------------CRIAR TABELA-------------------

CREATE TABLE Teste (
    Id_Teste INT PRIMARY KEY, --CHAVE PRIMARIA
    descricao VARCHAR
);

---------INSERINDO DADOS NA TABELA-------------
INSERT INTO Teste (Id_Teste, descricao)
VALUES (1, 'Primeiro resgistro');

Select * FROM Teste;

-------------ADICIONAR COLUNA------------------
ALTER TABLE Teste 
ADD Observacao VARCHAR(100)NOT NULL;

INSERT INTO Teste (Id_Teste,descricao, Observacao)
VALUES ('2','resgistro criando depois,' 'Primeira Observacao');


SELECT * FROM Teste;



