-- 1. CRIAÇÃO DAS TABELAS (Estrutura)

-- Crie uma table Escola com os campos id(pk), nome e descrição
CREATE TABLE Escola (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Crie table turno com os campos id(pk), nome e descricao
CREATE TABLE turno (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Crie table cursos com os campos id(pk), id_escola(fk), id_turno(fk), nome, descrição e carga_horaria
CREATE TABLE cursos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_escola INTEGER,
    id_turno INTEGER,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria INTEGER,
    FOREIGN KEY (id_escola) REFERENCES Escola(id),
    FOREIGN KEY (id_turno) REFERENCES turno(id)
);

-- Crie table disciplinas com os campos id(pk), id_curso(fk) nome, descrição
CREATE TABLE disciplinas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_curso INTEGER,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Crie table alunos com os campos id(pk), id_escola(fk), nome, data_de_nascimento, email
CREATE TABLE alunos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_escola INTEGER,
    nome VARCHAR(100) NOT NULL,
    data_de_nascimento DATE,
    email VARCHAR(100),
    FOREIGN KEY (id_escola) REFERENCES Escola(id)
);

-- Crie uma tabela de relacionamento n:n pegando o relacionamento de alunos com cursos
CREATE TABLE alunos_cursos (
    id_aluno INTEGER,
    id_curso INTEGER,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- 2. POPULAÇÃO DAS TABELAS (Inserção de Dados)

-- Popule Escolas com 2
INSERT INTO Escola (nome, descricao) VALUES 
('Escola Técnica Central', 'Ensino focado em tecnologia e ciências exatas'),
('Escola Secundária das Artes', 'Focada em humanidades e artes visuais');

-- Popule turnos
INSERT INTO turno (nome, descricao) VALUES 
('Manhã', 'Aulas das 07:30 às 12:00'),
('Tarde', 'Aulas das 13:00 às 17:30'),
('Noite', 'Aulas das 18:30 às 22:30');

-- Popule de cursos com 5
INSERT INTO cursos (id_escola, id_turno, nome, descricao, carga_horaria) VALUES 
(1, 1, 'Desenvolvimento de Software', 'Curso técnico de programação', 1200),
(1, 3, 'Redes de Computadores', 'Infraestrutura e segurança', 1000),
(2, 1, 'Design Gráfico', 'Comunicação visual e edição', 800),
(2, 2, 'Fotografia', 'Técnicas de fotografia analógica e digital', 600),
(1, 2, 'Eletrónica', 'Circuitos e microcontroladores', 1200);

-- Popule de disciplinas com 12
INSERT INTO disciplinas (id_curso, nome, descricao) VALUES 
(1, 'Algoritmos', 'Lógica de programação e estruturas de dados'),
(1, 'Bases de Dados', 'Modelagem e linguagem SQL'),
(1, 'Desenho Web', 'HTML, CSS e JavaScript'),
(2, 'Redes I', 'Topologias e modelos OSI'),
(2, 'Sistemas Operativos', 'Administração de Linux e Windows'),
(3, 'Teoria da Cor', 'Psicologia e aplicação de cores'),
(3, 'Ilustração Digital', 'Uso de softwares vetoriais'),
(4, 'Iluminação', 'Técnicas de luz de estúdio'),
(4, 'Edição de Imagem', 'Pós-produção em Photoshop'),
(5, 'Sistemas Digitais', 'Portas lógicas e álgebra de Boole'),
(5, 'Eletricidade Básico', 'Corrente, tensão e resistência'),
(1, 'Engenharia de Software', 'Ciclo de vida e metodologias ágeis');

-- Popule a tabela de alunos com 50 alunos
INSERT INTO alunos (id_escola, nome, data_de_nascimento, email) VALUES 
(1, 'Aluno Um', '2005-01-10', 'aluno1@email.com'), (2, 'Aluno Dois', '2004-02-15', 'aluno2@email.com'),
(1, 'Aluno Três', '2005-03-20', 'aluno3@email.com'), (2, 'Aluno Quatro', '2003-04-25', 'aluno4@email.com'),
(1, 'Aluno Cinco', '2006-05-30', 'aluno5@email.com'), (2, 'Aluno Seis', '2005-06-05', 'aluno6@email.com'),
(1, 'Aluno Sete', '2004-07-12', 'aluno7@email.com'), (2, 'Aluno Oito', '2006-08-18', 'aluno8@email.com'),
(1, 'Aluno Nove', '2005-09-22', 'aluno9@email.com'), (2, 'Aluno Dez', '2004-10-28', 'aluno10@email.com'),
(1, 'Aluno Onze', '2005-11-03', 'aluno11@email.com'), (2, 'Aluno Doze', '2003-12-09', 'aluno12@email.com'),
(1, 'Aluno Treze', '2006-01-14', 'aluno13@email.com'), (2, 'Aluno Catorze', '2005-02-19', 'aluno14@email.com'),
(1, 'Aluno Quinze', '2004-03-27', 'aluno15@email.com'), (2, 'Aluno Dezasseis', '2006-04-02', 'aluno16@email.com'),
(1, 'Aluno Dezassete', '2005-05-08', 'aluno17@email.com'), (2, 'Aluno Dezoito', '2004-06-13', 'aluno18@email.com'),
(1, 'Aluno Dezanove', '2006-07-21', 'aluno19@email.com'), (2, 'Aluno Vinte', '2005-08-26', 'aluno20@email.com'),
(1, 'Aluno Vinte e Um', '2004-09-01', 'aluno21@email.com'), (2, 'Aluno Vinte e Dois', '2006-10-07', 'aluno22@email.com'),
(1, 'Aluno Vinte e Três', '2005-11-12', 'aluno23@email.com'), (2, 'Aluno Vinte e Quatro', '2004-12-17', 'aluno24@email.com'),
(1, 'Aluno Vinte e Cinco', '2006-01-23', 'aluno25@email.com'), (2, 'Aluno Vinte e Seis', '2005-02-28', 'aluno26@email.com'),
(1, 'Aluno Vinte e Sete', '2004-03-05', 'aluno27@email.com'), (2, 'Aluno Vinte e Oito', '2006-04-11', 'aluno28@email.com'),
(1, 'Aluno Vinte e Nove', '2005-05-16', 'aluno29@email.com'), (2, 'Aluno Trinta', '2004-06-22', 'aluno30@email.com'),
(1, 'Aluno Trinta e Um', '2006-07-29', 'aluno31@email.com'), (2, 'Aluno Trinta e Dois', '2005-08-04', 'aluno32@email.com'),
(1, 'Aluno Trinta e Três', '2004-09-09', 'aluno33@email.com'), (2, 'Aluno Trinta e Quatro', '2006-10-15', 'aluno34@email.com'),
(1, 'Aluno Trinta e Cinco', '2005-11-20', 'aluno35@email.com'), (2, 'Aluno Trinta e Seis', '2004-12-25', 'aluno36@email.com'),
(1, 'Aluno Trinta e Sete', '2006-01-31', 'aluno37@email.com'), (2, 'Aluno Trinta e Oito', '2005-02-06', 'aluno38@email.com'),
(1, 'Aluno Trinta e Nove', '2004-03-14', 'aluno39@email.com'), (2, 'Aluno Quarenta', '2006-04-19', 'aluno40@email.com'),
(1, 'Aluno Quarenta e Um', '2005-05-24', 'aluno41@email.com'), (2, 'Aluno Quarenta e Dois', '2004-06-30', 'aluno42@email.com'),
(1, 'Aluno Quarenta e Três', '2006-07-06', 'aluno43@email.com'), (2, 'Aluno Quarenta e Quatro', '2005-08-11', 'aluno44@email.com'),
(1, 'Aluno Quarenta e Cinco', '2004-09-16', 'aluno45@email.com'), (2, 'Aluno Quarenta e Seis', '2006-10-22', 'aluno46@email.com'),
(1, 'Aluno Quarenta e Sete', '2005-11-27', 'aluno47@email.com'), (2, 'Aluno Quarenta e Oito', '2004-12-03', 'aluno48@email.com'),
(1, 'Aluno Quarenta e Nove', '2006-01-08', 'aluno49@email.com'), (2, 'Aluno Cinquenta', '2005-02-14', 'aluno50@email.com');

-- (Opcional) Matricular os 5 primeiros alunos em alguns cursos para testar o relacionamento N:N
INSERT INTO alunos_cursos (id_aluno, id_curso) VALUES 
(1, 1), (2, 3), (3, 2), (4, 4), (5, 5), (1, 5);