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

-- Consultar dados usando SELECT com WHERE

-- Selecionar todos os dados da tabela Cursos onde a duração é maior que 4 semestres
SELECT * FROM Cursos
WHERE DuracaoSemestres > 4;
-- Exemplo de uso do WHERE com operador de comparação (>). 
-- Retorna cursos com duração maior que 4 semestres.

-- Selecionar todos os dados da tabela Alunos cujo nome contém 'Ana'
SELECT * FROM Alunos
WHERE NomeAluno LIKE '%Ana%';
-- Exemplo de uso do WHERE com operador LIKE para buscar padrões em texto.
-- Retorna alunos cujo nome contém a substring 'Ana'.

-- Selecionar todas as notas dos alunos onde a nota é maior ou igual a 8.0
SELECT * FROM Notas
WHERE Nota >= 8.0;
-- Exemplo de uso do WHERE com operador de comparação (>=).
-- Retorna notas maiores ou iguais a 8.0.

-- Consultar dados combinando tabelas com WHERE
-- Exibir informações dos alunos junto com os cursos e notas, onde a nota é maior ou igual a 8.0
SELECT A.NomeAluno, C.NomeCurso, N.Nota
FROM Notas N
JOIN Alunos A ON N.CodigoAluno = A.CodigoAluno
JOIN Cursos C ON N.CodigoCurso = C.CodigoCurso
WHERE N.Nota >= 8.0;
-- Exemplo de uso do WHERE em uma consulta combinada com JOIN.
-- Retorna informações dos alunos, cursos e notas onde a nota é maior ou igual a 8.0.

-- Comando WHERE com operadores lógicos (AND, OR, NOT) para combinar múltiplas condições
-- Exemplo: Selecionar cursos com duração maior que 4 semestres e onde o nome contém 'Web'
SELECT * FROM Cursos
WHERE DuracaoSemestres > 4 AND NomeCurso LIKE '%Web%';
-- Usando AND para combinar duas condições: duração maior que 4 semestres e nome contendo 'Web'.

-- Exemplo de WHERE com NOT para excluir resultados
-- Selecionar alunos que não estão no curso com código 1
SELECT * FROM Alunos
WHERE Curso NOT IN (1);
-- Usando NOT IN para excluir registros onde o código do curso é 1.

-- Comando WHERE com BETWEEN para especificar um intervalo
-- Exemplo: Selecionar notas entre 7.0 e 9.0
SELECT * FROM Notas
WHERE Nota BETWEEN 7.0 AND 9.0;
-- Usando BETWEEN para filtrar resultados dentro de um intervalo específico.

-- Comando WHERE com IS NULL para verificar valores nulos
-- Exemplo: Selecionar alunos sem notas registradas (supondo que a tabela Notas possa ter registros nulos)
SELECT A.NomeAluno
FROM Alunos A
LEFT JOIN Notas N ON A.CodigoAluno = N.CodigoAluno
WHERE N.CodigoNota IS NULL;
-- Usando LEFT JOIN e IS NULL para encontrar alunos que não têm notas registradas.

