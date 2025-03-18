# Projeto SQL: Índices e Procedures

# Parte 1 – Criação de índices para melhorar a performance de consultas sobre as tabelas `departments` e `employees`.

# Consultas realizadas:
- Qual o departamento com maior número de pessoas?
- Quais são os departamentos por cidade?
- Relação de empregados por departamento

# Índices criados:
- `idx_department_id`  usado para junções e agrupamentos com `department_id`
- `idx_location` → otimiza busca por cidade

# Objetivo:
Melhorar a velocidade das consultas mais frequentes, baseando-se nos campos mais usados nos filtros e agrupamentos.

# Parte 2 – Criação de procedures para inserção, atualização, deleção e consulta de dados nas tabelas dos cenários *universidade* e *e-commerce*.

# Funcionamento:
- Procedure recebe uma variável de controle (`acao`)
- Executa: `1 = SELECT`, `2 = UPDATE`, `3 = DELETE`, `4 = INSERT`
- Estrutura baseada em `IF` com parâmetros de entrada
