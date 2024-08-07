-- Criação das tabelas

-- Tabela de Cursos
CREATE TABLE Cursos (
    CodigoCurso INTEGER PRIMARY KEY,
    NomeCurso TEXT NOT NULL,
    DuracaoSemestres INTEGER NOT NULL
);

-- Tabela de Alunos
CREATE TABLE Alunos (
    CodigoAluno INTEGER PRIMARY KEY,
    NomeAluno TEXT NOT NULL,
    Curso INTEGER NOT NULL,
    FOREIGN KEY (Curso) REFERENCES Cursos (CodigoCurso)
);

-- Tabela de Notas
CREATE TABLE Notas (
    CodigoNota INTEGER PRIMARY KEY,
    CodigoAluno INTEGER NOT NULL,
    CodigoCurso INTEGER NOT NULL,
    Nota REAL NOT NULL,
    FOREIGN KEY (CodigoAluno) REFERENCES Alunos (CodigoAluno),
    FOREIGN KEY (CodigoCurso) REFERENCES Cursos (CodigoCurso)
);

-- Inserir dados nas tabelas

-- Inserir dados na tabela Cursos
INSERT INTO Cursos (CodigoCurso, NomeCurso, DuracaoSemestres)
VALUES 
(1, 'Introdução à Programação', 4),
(2, 'Estruturas de Dados', 4),
(3, 'Banco de Dados', 4),
(4, 'Desenvolvimento Web', 4),
(5, 'Engenharia de Software', 6);

-- Inserir dados na tabela Alunos
INSERT INTO Alunos (CodigoAluno, NomeAluno, Curso)
VALUES 
(1, 'Ana Silva', 1),
(2, 'Carlos Pereira', 2),
(3, 'Mariana Santos', 3),
(4, 'Pedro Oliveira', 4),
(5, 'Lucas Costa', 5);

-- Inserir dados na tabela Notas
INSERT INTO Notas (CodigoNota, CodigoAluno, CodigoCurso, Nota)
VALUES 
(1, 1, 1, 9.5),
(2, 2, 2, 8.0),
(3, 3, 3, 7.5),
(4, 4, 4, 6.0),
(5, 5, 5, 9.0),
(6, 1, 2, 7.0),
(7, 2, 3, 8.5),
(8, 3, 4, 6.5);

-- Consultas com WHERE BETWEEN

-- Selecionar notas entre 7.0 e 9.0
SELECT *
FROM Notas
WHERE Nota BETWEEN 7.0 AND 9.0;

-- Selecionar alunos que receberam notas entre 6.0 e 8.0
SELECT Alunos.NomeAluno, Notas.Nota
FROM Alunos
JOIN Notas ON Alunos.CodigoAluno = Notas.CodigoAluno
WHERE Notas.Nota BETWEEN 6.0 AND 8.0;

-- Selecionar cursos com duração entre 4 e 6 semestres
SELECT *
FROM Cursos
WHERE DuracaoSemestres BETWEEN 4 AND 6;

