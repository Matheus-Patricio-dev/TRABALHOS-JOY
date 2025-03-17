
-- FOI UTILIZADO O BANCO DE DADOS DO ULTIMO DESENVOLVIMENTO

CREATE TABLE log_funcionarios (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mensagem TEXT,
    data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criando a função que será usada pelo trigger
CREATE OR REPLACE FUNCTION log_novo_funcionario()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_funcionarios (mensagem)
    VALUES (CONCAT('Novo funcionário: ', NEW.nome, ' - Cargo: ', NEW.cargo));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criando o trigger e associando à função
CREATE TRIGGER after_insert_funcionario
AFTER INSERT ON funcionarios
FOR EACH ROW
EXECUTE FUNCTION log_novo_funcionario();


INSERT INTO funcionarios (nome, cargo, departamento_id)
VALUES ('João Silva', 'Desenvolvedor', 1);

SELECT * FROM log_funcionarios;

