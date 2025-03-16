-- Criando a tabela de departamentos
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela de funcionários
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Criando a tabela de projetos
CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcionario_id INT,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);


-- Inserindo departamentos
INSERT INTO departamentos (nome) VALUES 
('TI'), 
('Marketing'), 
('Financeiro');

-- Inserindo funcionários
INSERT INTO funcionarios (nome, cargo, departamento_id) VALUES 
('Ana Souza', 'Desenvolvedora', 1), 
('Carlos Lima', 'Analista', 2), 
('Mariana Costa', 'Gerente', 3);

-- Inserindo projetos
INSERT INTO projetos (nome, funcionario_id) VALUES 
('Sistema Web', 1), 
('Campanha Publicitária', 2), 
('Relatório Financeiro', 3);

-- Listar funcionários e seus departamentos
SELECT funcionarios.nome, funcionarios.cargo, departamentos.nome AS departamento
FROM funcionarios
JOIN departamentos ON funcionarios.departamento_id = departamentos.id;

-- Listar funcionários com seus projetos
SELECT funcionarios.nome, funcionarios.cargo, projetos.nome AS projeto
FROM funcionarios
JOIN projetos ON funcionarios.id = projetos.funcionario_id;

-- Listar todos os dados conectando funcionários, departamentos e projetos
SELECT funcionarios.nome, funcionarios.cargo, departamentos.nome AS departamento, projetos.nome AS projeto
FROM funcionarios
JOIN departamentos ON funcionarios.departamento_id = departamentos.id
LEFT JOIN projetos ON funcionarios.id = projetos.funcionario_id;