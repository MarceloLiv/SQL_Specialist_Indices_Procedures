CREATE DATABASE IF NOT EXISTS project_db;
USE project_db;

-- Criando tabela de estudantes
DROP TABLE IF EXISTS university_students;
CREATE TABLE university_students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100)
);

-- Inserindo dados iniciais
INSERT INTO university_students (name, course) VALUES
('Alice Martins', 'Engenharia'),
('Bruno Farias', 'Direito'),
('Clara Souza', 'Medicina');

-- Criando a procedure para manipular estudantes
DELIMITER //
CREATE PROCEDURE manage_student (
    IN action_type INT,
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_course VARCHAR(100)
)
BEGIN
    IF action_type = 1 THEN
        INSERT INTO university_students (name, course)
        VALUES (p_name, p_course);
        
    ELSEIF action_type = 2 THEN
        UPDATE university_students
        SET name = p_name, course = p_course
        WHERE id = p_id;
        
    ELSEIF action_type = 3 THEN
        DELETE FROM university_students
        WHERE id = p_id;
    END IF;
END;
//
DELIMITER ;

-- Criando tabela de produtos
DROP TABLE IF EXISTS ecommerce_products;
CREATE TABLE ecommerce_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(100)
);

-- Inserindo dados iniciais
INSERT INTO ecommerce_products (name, price, category) VALUES
('Notebook Dell', 3500.00, 'Eletrônicos'),
('Camiseta Polo', 89.90, 'Vestuário'),
('Fone Bluetooth', 150.00, 'Acessórios');

-- Criando a procedure para manipular produtos
DELIMITER //
CREATE PROCEDURE manage_product (
    IN action_type INT,
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_category VARCHAR(100)
)
BEGIN
    IF action_type = 1 THEN
        INSERT INTO ecommerce_products (name, price, category)
        VALUES (p_name, p_price, p_category);
        
    ELSEIF action_type = 2 THEN
        UPDATE ecommerce_products
        SET name = p_name, price = p_price, category = p_category
        WHERE id = p_id;
        
    ELSEIF action_type = 3 THEN
        DELETE FROM ecommerce_products
        WHERE id = p_id;
    END IF;
END;
//
DELIMITER ;

-- Inserir novo estudante
CALL manage_student(1, NULL, 'Diego Lima', 'Administração');

-- Atualizar estudante (id 2)
CALL manage_student(2, 2, 'Bruno Farias', 'Ciência da Computação');

-- Remover estudante (id 3)
CALL manage_student(3, 3, NULL, NULL);

-- Inserir novo produto
CALL manage_product(1, NULL, 'Teclado Gamer', 220.00, 'Periféricos');

-- Atualizar produto (id 2)
CALL manage_product(2, 2, 'Camiseta Polo Premium', 99.90, 'Vestuário');
