CREATE DATABASE Banco_Academia_Davipedroza; --Criar banco de dados Banco_Academia

USE Banco_Academia_fernando; --Selecionar banco de dados Banco_Academia

--comando para listar todos os bancos de dados existentes no servidor SQL Server
SELECT name AS NomeDoBanco
FROM sys.databases
ORDER BY name;

--comando para listar o banco de dados atual
SELECT DB_NAME() AS BancoAtual;

--Criando Tabelas Professores
CREATE TABLE Professores (
    IdProfessor INT PRIMARY KEY IDENTITY(1,1), --Identity para auto incrementar o IdProfessor
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, -- Unique para não permitir emails duplicados
    Especialidade VARCHAR(100) NOT NULL,
);
CREATE TABLE Alunos(
    IdAluno INT PRIMARY KEY IDENTITY(1,1), --Identity para auto incremento o Idaluno
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, -- Unique para não permitir emails duplicados 
    Turma VARCHAR(50) NOT NULL,
    DataNascimento DATE NOT NULL, 
    Ativo BIT NOT NULL CONSTRAINT DF_Alunos_Ativos DEFAULT 1, -- Default para definir o valor padrão como 1 (ativo)
); 

CREATE TABLE Cursos(
    IdCurso INT PRIMARY KEY IDENTITY(1,1), --Identity para auto incrementar o IdCurso
    NomeCurso VARCHAR(100) NOT NULL UNIQUE, -- Unique para não permitir cursos duplicados
    CargaHoraria INT NOT NULL CHECK (CargaHoraria > 0 AND CargaHoraria <= 200), -- Check para validar a carga horária
    IdProfessor INT NOT NULL,
    Ativo BIT NOT NULL DEFAULT 1, -- Default para definir o valor padrão como 1 (ativo)
);

CREATE TABLE Matriculas(
    IdMatricula INT IDENTITY(1,1) PRIMARY KEY, -- Identity para auto incrementar o idMatricula 
    IdAluno INT NOT NULL,
    IdCurso INT NOT NULL,
    DataMatricula DATA NOT NULL CONSTRAINT DF_Matriculas DEFAULT (CONVERT(DATE,GETDATE())),-- Default para definir a adta atual como valor padrão
    NotaFinal DECIMAL(4,2) NULL CHECK (NotaFinal BETWEEN 0 AND 10), -- Check para validar a anota final
    StatusMatricula VARCHAR(20) NOT NULL CONSTRAINT DF_Matriculas_Status DEFAULT 'Ativa', -- Default para definir o valor padrão como 'ativa'

    CONSTRAINT UQ_Matriculas_AlunosCurso UNIQUE (IdAluno, IdCurso), -- Unique para não permitir que um aluno se matricule no mesmo curso masi de uma vez 
    CONSTRAINT FK_Matriculas_Alunos--CONSTRAINT para criar a chave estrangeira
        FOREIGN KEY (IdAluno ) REFERENCES Alunos(IdAlunos), -- CONSTRAINT para criar a chave estrangeira
    CONSTRAINT FK_Matriculas_Cursos --CONSTRAINT para criar a chave estrangeira
        FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso), -- Para criar a chave estrangeira, referenciando a tabela curso 
    CONSTRAINT FK_Cursos_Professores --CONSTRAINT para criar a chave estrangeira
        FOREIGN KEY (IdProfessor) REFERENCES Professores(IdProfessor),
);

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

SELECT name AS Tabelas
FROM sys.databases
ORDER BY name;

------ CRIANDO TABELAS --------

INSERT INTO Professores (Nome, Email, Especialidade)
VALUES
('Ana Martins',     'ana.martins@academia.com',    'Banco de Dados'),
('Carlos Ribeiro',  'carlos.ribeiro@academia.com', 'Programação'),
('Fernanda Lima',   'fernanda.lima@academia.com',  'Desenvolvimento Web'),
('Rafael Souza',    'rafael.souza@academia.com',   'Redes de Computadores');

--------------------------------------------------------------------------------

INSERT INTO Cursos (NomeCurso, CargaHoraria, IdProfessor)
VALUES
('Banco de Dados Inicial', 40, 1),
('SQL Server Essencial',   36, 1),
('Lógica de Programação',  40, 2),
('JavaScript para Jovens', 32, 2),
('HTML e CSS',             30, 3),
('Fundamentos de Redes',   24, 4);

--------------------------------------------------------------------------------

INSERT INTO aluno (Nome, Email, Turma, DataNascimento)
VALUES
('Alice Pereira',   'alice.pereira@escola.com',   '2INFO-A', '2008-03-14'),
('Bruno Alves',     'bruno.alves@escola.com',     '2INFO-A', '2008-07-22'),
('Camila Rocha',    'camila.rocha@escola.com',    '2INFO-A', '2008-01-30'),
('Diego Santos',    'diego.santos@escola.com',    '2INFO-B', '2007-11-09'),
('Elisa Nunes',     'elisa.nunes@escola.com',     '2INFO-B', '2008-05-18'),
('Felipe Costa',    'felipe.costa@escola.com',    '2INFO-B', '2008-09-02'),
('Gabriela Melo',   'gabriela.melo@escola.com',   '2INFO-C', '2007-12-12'),
('Henrique Luz',    'henrique.luz@escola.com',    '2INFO-C', '2008-06-28'),
('Isabela Torres',  'isabela.torres@escola.com',  '2INFO-C', '2008-02-06'),
('João Mendes',     'joao.mendes@escola.com',     '2INFO-C', '2007-08-25');

--------------------------------------------------------------------------------

INSERT INTO Matriculas (IdAluno, IdCurso, DataMatricula, NotaFinal, StatusMatricula)
VALUES
    (1, 1, '2026-02-03', 8.50, 'Concluída'),
    (1, 5, '2026-02-03', 9.00, 'Concluída'),
    (2, 1, '2026-02-03', 7.00, 'Concluída'),
    (2, 3, '2026-02-04', 8.00, 'Ativa'),
    (3, 2, '2026-02-04', 9.50, 'Concluída'),
    (3, 4, '2026-02-04', NULL, 'Ativa'),
    (4, 3, '2026-02-05', 6.50, 'Concluída'),
    (5, 5, '2026-02-05', 8.50, 'Concluída'),
    (6, 6, '2026-02-06', NULL, 'Ativa'),
    (7, 1, '2026-02-06', 7.50, 'Concluída'),
    (8, 2, '2026-02-07', 10.00, 'Concluída'),
    (8, 6, '2026-02-07', 8.00, 'Concluída'),
    (9, 4, '2026-02-08', NULL, 'Ativa'),
    (9, 5, '2026-02-08', 9.00, 'Concluída'),
    (10, 3, '2026-02-09', 7.00, 'Concluída'),
    (10, 2, '2026-02-09', NULL, 'Ativa');

-----CONSULTAR OS DADOS INSERIDOS-----

SELECT * FROM Professores;
SELECT * FROM Cursos;
SELECT * FROM Alunos;
SELECT * FROM Matriculas;

    --CONSULTAS BASICAS: SELECT 
--Selecionar todas os professores cadastrados
SELECT * FROM Professores;

--SELECIONAR SOMENTE COLUNAS ESPECIFICAS DA TABELA PROFESSORES 
SELECT Nome FROM Professores;

--APELIDO PARA DEIXAR O TITULO MAIS CLARO NA RESPOSTA
SELECT Nome AS NomeDoAluno, Turma AS Sala FROM Alunos;

--CONSULTA POR ORDEM ALFABETICA
SELECT Nome, Turma 
FROM Alunos 
ORDER BY Nome ASC; --ASC PARA ORDEM CRESCENTE (PADRÃO) E DESC PARA ORDEM DESCRECENTE

-- OS 5 PRIMEIRO REGISTROS DE ALUNOS CADASTRADOS 
SELECT Alunos
ORDER BY Nome;

SELECT * FROM Alunos;

-- FILTROS COM WHERE 
-- WHERE FILTARA AS LINHAS. LEIA A CONSULTA COMO UMA FRASE: "SELECIONE OS NOMES E TURMAS DOS ALUNOS ONDE A TURMA SEJA IGUAL A '2INFO-A''
-- IGUAL A 
SELECT Nome,Turma
FROM Alunos
WHERE Turma = '2INFO-A';

-- DIFERNTE DE 
SELECT Nome,Turma
FROM Alunos
WHERE Turma = '2INFO-A'; -- OU SEJA, SELECIONE OS NOMES E TURMAS DOS ALUNOS ONDE A TURMA SEJA DIFERENTE DE '2INFO-A''

--AND: AS duas condições devem ser verdadeiras para que o registro seja retornado na consulta.
SELECT Nome, Turma, DataNascimento
FROM Alunos
WHERE Turma = '2INFO-A' AND DataNascimento > '2008-01-01'; --OU SEJA, SELECIONE OS NOMES , TURMAS E DATAS DE NASCIMENTO DOS ALUNOS ONDE A TURMA SEJA IGUAL A '2INFO-A'EA DATA DE NASCIMENTO SEJA MAIOR QUE "200-01-01

--OR PELO MENOS UMA CONDIÇÃO DEVE SER VERDADEIRA 
SELECT Nome, Turma
FROM Alunos
WHERE Turma = '2INFO-A'OR DataNascimento > '2008-01-01'; --OU SEJA, SELECIONE OS NOMES E TURMAS DOS ALUNOS ONDE A TURMA SEJA IGUAL A '2INFO-A'OU A DATA DENASCIMENTO SEJA MAIOR QUE '2008-01-01''

-- IN Versão mais curta para variar valores 
SELECT Nome, Turma
FROM Alunos
WHERE Turma IN ('2INFO-A', '2INFO-B'); --OU SEJA, SELECIONE OS NOMES E TURMAS DOS ALUNOS ONDE A TURMA SEJA IGUAL A '2INFO-A'OU '2INFO-B''

-- LIKE: % SIGNIFICA "QUALQUER QUANTIDADE  DE CARACTERES" E _ SIGNIFICA "QUALQUER CARACTERE""
SELECT Nome,Email
FROM Alunos 
WHERE Nome LIKE '%es'; --OU SEJA , SELECIONE OS NOMES E EMAISLS DOS ALUNOS ONDE O EMAIL TERMINA COM '@escola.com


