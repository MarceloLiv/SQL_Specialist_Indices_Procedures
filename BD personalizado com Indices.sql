CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- Criação da tabela de departamentos
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Inserção de dados na tabela departments
INSERT INTO departments (name, city) VALUES
('Financeiro', 'São Paulo'),
('Recursos Humanos', 'São Paulo'),
('TI', 'Campinas'),
('Marketing', 'Rio de Janeiro'),
('Vendas', 'Belo Horizonte');

-- Criação da tabela de empregados
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    city VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Inserção de dados na tabela employees
INSERT INTO employees (name, department_id, city) VALUES
('João Silva', 1, 'São Paulo'),
('Maria Souza', 1, 'São Paulo'),
('Carlos Lima', 1, 'São Paulo'),
('Ana Paula', 2, 'São Paulo'),
('Bruno Rocha', 3, 'Campinas'),
('Fernanda Alves', 3, 'Campinas'),
('Lucas Mendes', 3, 'Campinas'),
('Juliana Freitas', 4, 'Rio de Janeiro'),
('Rafael Dias', 5, 'Belo Horizonte'),
('Patrícia Gomes', 5, 'Belo Horizonte');

-- 1. Qual o departamento com maior número de pessoas?

SELECT d.name AS departamento, COUNT(e.id) AS total_funcionarios
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.id
ORDER BY total_funcionarios DESC
LIMIT 1;

-- 2. Quais são os departamentos por cidade?

SELECT city, GROUP_CONCAT(name ORDER BY name SEPARATOR ', ') AS departamentos
FROM departments
GROUP BY city;

-- 3. Relação de empregados por departamento

SELECT d.name AS departamento, e.name AS funcionario
FROM employees e
JOIN departments d ON e.department_id = d.id
ORDER BY d.name, e.name;

-- CRIAÇÃO DOS ÍNDICES OTIMIZADOS

-- Índice no campo de junção (melhora JOIN entre employees e departments)
CREATE INDEX idx_employees_department_id ON employees(department_id);

-- Índice no campo city da tabela departments (melhora GROUP BY e WHERE futuros)
CREATE INDEX idx_departments_city ON departments(city);

-- Índice no campo name da tabela departments (auxilia ORDER BY e GROUP_CONCAT)
CREATE INDEX idx_departments_name ON departments(name);

-- Índice no campo city da tabela employees (caso queira agrupar/filtrar futuramente por cidade dos funcionários)
CREATE INDEX idx_employees_city ON employees(city);

