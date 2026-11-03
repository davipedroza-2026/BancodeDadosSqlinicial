 CREATE TABLE Estudante(
    ID_Estudante INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Turma VARCHAR(50) NOT NULL,
    Apelido VARCHAR(30)
);

select * from Estudante;
go

Create table Videos(
    ID_Video INT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Data_Publicacao DATE NOT NULL,
    Duracao TIME NOT NULL,
    MatriculaEstudante INT NOT NULL,
    FOREIGN KEY (MatriculaEstudante) REFERENCES Estudante(ID_Estudante)
);

select name as tabela
from sys.tables
Order by name;

select * from Videos;
go

INSERT INTO Estudante (ID_Estudante, Nome, Turma, Apelido)
VALUES
(1, 'Peter Parker','2A','Homem-Aranha'),
(2,'Mary Jane','2A','MJ'),
(3,'Tony Stark','3B','Homem de Ferro'),
(4, 'Natasha Romanoff', '2B', 'Viúva Negra'),
(5, 'Thor Odinson', '2B', 'Thor'),
(6, 'Bruce Wayne', '2B', 'Batman'),
(7, 'Clark Kent', '2C', 'Superman'),
(8, 'Diana Prince', '2C', 'Mulher-Maravilha'),
(9, 'Barry Allen', '2C', 'Flash'),
(10, 'Arthur Curry', '2A', 'Aquaman');

Select * from Estudante;

INSERT INTO Videos (ID_Video, Titulo, Descricao, Data_Publicacao, Duracao, MatriculaEstudante)
VALUES
(1, 'Teia de Dados','Homem-Aranha I', '2023-01-15', '00:45:00', 1),
(2, 'Amor e Ação','Mary Jane II', '2023-02-20', '00:50:00', 2),
(3, 'Homem de Ferro: Ascensão','Tony Stark III', '2023-03-10', '01:30:00', 3),
(4, 'Agente Secreta','Natasha Romanoff IV', '2023-04-05', '01:15:00', 4),
(5, 'Deus do Trovão','Thor Odinson V', '2023-05-12', '01:20:00', 5),
(6, 'Cavaleiro das Trevas','Bruce Wayne VI', '2023-06-18', '01:40:00', 6),
(7, 'O Homem de Aço','Clark Kent VII', '2023-07-22', '01:25:00', 7),
(8, 'A Princesa Guerreira','Diana Prince VIII', '2023-08-30', '01:35:00', 8),
(9, 'Velocidade Extrema','Barry Allen IX', '2023-09-14', '01:10:00', 9),
(10, 'Rei dos Mares','Arthur Curry X', '2023-10-05', '01:50:00', 10);

    Select * from Estudantes;



SELECT --Select responsável por selecionar os dados das tabelas Videos e Estudantes

v.Titulo, -- v .Titulo seleciona o titulo do video da tabela Videos

e.Nome AS Autor, -- e.Nome seleciona o nome do estudante da tabela Estudantes e renomeia a coluna como Autor

e.Apelido AS Heroi, --e.Apelido seleciona o apelido do estudante da tabela Estudantes e renomeia a coluna como heroi

v.Duracao, --v.Duracao selecionaa duracao do video da tabela videos

FROM Videos AS v -- FROM Videos AS v seleciona a tabela Videos e renomeia como v
