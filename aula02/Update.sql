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
(5, 5, 5, 9.0);

-- Atualizações com UPDATE

-- Atualizar o nome do curso com CodigoCurso = 1 para 'Programação em Python'
UPDATE Cursos
SET NomeCurso = 'Programação em Python'
WHERE CodigoCurso = 1;

-- Atualizar a nota de Carlos Pereira (CodigoAluno = 2) para 8.5
UPDATE Notas
SET Nota = 8.5
WHERE CodigoAluno = 2;

-- Atualizar a duração do curso 'Banco de Dados' para 6 semestres
UPDATE Cursos
SET DuracaoSemestres = 6
WHERE NomeCurso = 'Banco de Dados';

-- Atualizar o nome do aluno 'Lucas Costa' para 'Lucas Silva'
UPDATE Alunos
SET NomeAluno = 'Lucas Silva'
WHERE NomeAluno = 'Lucas Costa';

-- Consultar dados para verificar as atualizações

-- Consultar todos os cursos
SELECT * FROM Cursos;

-- Consultar todas as notas
SELECT * FROM Notas;

-- Consultar todos os alunos
SELECT * FROM Alunos;

