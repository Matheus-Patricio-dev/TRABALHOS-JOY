CREATE TABLE compras (
    id SERIAL PRIMARY KEY,
    produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    data_compra DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO compras (produto, quantidade, data_compra) VALUES
('Notebook', 3, '2025-03-15'),
('Teclado', 5, '2025-03-15'),
('Mouse', 2, '2025-03-16'),
('Monitor', 4, '2025-03-16'),
('Notebook', 1, '2025-03-16');

CREATE OR REPLACE PROCEDURE relatorio_vendas_diario(IN data_consulta DATE)
LANGUAGE plpgsql AS $$
DECLARE 
    linha RECORD;
BEGIN
    FOR linha IN 
        SELECT produto, SUM(quantidade) AS total_vendido 
        FROM compras 
        WHERE data_compra = data_consulta 
        GROUP BY produto 
        ORDER BY total_vendido DESC
    LOOP
        RAISE NOTICE 'Produto: %, Quantidade Vendida: %', linha.produto, linha.total_vendido;
    END LOOP;
END;
$$;


CALL relatorio_vendas_diario('2025-03-16');