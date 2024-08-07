-- Criação da tabela Cursos
CREATE TABLE Cursos (
    CodigoCurso INTEGER PRIMARY KEY,          
    NomeCurso TEXT NOT NULL,                  
    DuracaoSemestres INTEGER                  
);

-- Criação da tabela Alunos
CREATE TABLE Alunos (
    CodigoAluno INTEGER PRIMARY KEY,          
    NomeAluno TEXT NOT NULL,                  
    Curso INTEGER,                            
    FOREIGN KEY (Curso) REFERENCES Cursos (CodigoCurso)  
);

-- Criação da tabela Notas
CREATE TABLE Notas (
    CodigoNota INTEGER PRIMARY KEY,           
    CodigoAluno INTEGER,                      
    CodigoCurso INTEGER,                      
    Nota REAL,                                
    FOREIGN KEY (CodigoAluno) REFERENCES Alunos (CodigoAluno), 
    FOREIGN KEY (CodigoCurso) REFERENCES Cursos (CodigoCurso)  
);

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (CodigoCurso, NomeCurso, DuracaoSemestres)
VALUES (1, 'Análise e Desenvolvimento de Sistemas', 6),
       (2, 'Ciência da Computação', 8),
       (3, 'Engenharia de Software', 10);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (CodigoAluno, NomeAluno, Curso)
VALUES (1, 'Lucas Oliveira', 1),
       (2, 'Mariana Costa', 2),
       (3, 'Felipe Souza', 1),
       (4, 'Amanda Pereira', 3);

-- Inserindo dados na tabela Notas
INSERT INTO Notas (CodigoNota, CodigoAluno, CodigoCurso, Nota)
VALUES (1, 1, 1, 8.5),
       (2, 2, 2, 7.0),
       (3, 3, 1, 9.0),
       (4, 4, 3, 6.5);

-- Comentários explicativos:

-- 1. **Criação das Tabelas**:

--    - **Cursos**: Define a estrutura para armazenar informações sobre cursos, com um identificador único para cada curso.

--    - **Alunos**: Define a estrutura para armazenar informações sobre alunos, associando cada aluno a um curso específico através de uma chave estrangeira.

--    - **Notas**: Define a estrutura para armazenar as notas dos alunos em cursos específicos, associando notas a alunos e cursos através de chaves estrangeiras.

-- 2. **Inserção de Dados**:

--    - **Cursos**: Adiciona três cursos com diferentes nomes e durações.

--    - **Alunos**: Adiciona quatro alunos, com informações de quais cursos eles estão matriculados.

--    - **Notas**: Adiciona as notas dos alunos nos cursos em que estão matriculados.

-- 3. **Uso do Comando INSERT INTO**:

--    - **Sintaxe Básica**:
--      ```sql
--      INSERT INTO Nome_Da_Tabela (Coluna_1, Coluna_2, Coluna_3, ...)
--      VALUES (Valor_1, Valor_2, Valor_3, ...);
--      ```

--    - **Nome_Da_Tabela**: Nome da tabela onde os dados serão inseridos.

--    - **(Coluna_1, Coluna_2, Coluna_3, ...)**: Lista de colunas onde os dados serão inseridos. Se não especificadas, os valores devem estar na ordem das colunas da tabela.

--    - **VALUES (Valor_1, Valor_2, Valor_3, ...)**: Valores a serem inseridos nas colunas correspondentes. Cada valor deve corresponder ao tipo de dado da coluna.

--    - **Inserção Simples**: Adiciona um único registro em uma tabela.

--    - **Inserção de Vários Registros**: Adiciona múltiplos registros em uma única instrução `INSERT INTO` separando os conjuntos de valores por vírgulas.

