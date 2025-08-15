CREATE TABLE insert_clientes (
    id NUMBER,
    nome VARCHAR2(40),
    email VARCHAR2(50),
    data_cadastro DATE
);

CREATE OR REPLACE PACKAGE pkg_aula_01 AS
    PROCEDURE  insert_cliente ( 
    p_id NUMBER,
    p_nome VARCHAR2,
    p_email VARCHAR2,
    p_data_cadastro DATE
);
    
    FUNCTION contar_clientes RETURN NUMBER;
    
END pkg_aula_01;

CREATE OR REPLACE PACKAGE BODY pkg_aula_01 AS
    PROCEDURE insert_cliente (
        p_id            NUMBER,
        p_nome          VARCHAR2,
        p_email         VARCHAR2,
        p_data_cadastro DATE
    ) IS
    BEGIN   
        INSERT INTO insert_clientes VALUES (p_id,
                                            p_nome,
                                            p_email,
                                            p_data_cadastro);
        COMMIT;
    END insert_cliente;

    FUNCTION contar_clientes RETURN NUMBER IS 
        v_total NUMBER;
    BEGIN
        SELECT 
            COUNT(1) 
        INTO V_TOTAL    
        FROM 
            insert_clientes;
        
        RETURN v_total;
    END contar_clientes;
    
END pkg_aula_01;

SELECT pkg_aula_01.contar_clientes FROM DUAL;

CALL pkg_aula_01.insert_cliente(10, 'VERGILIO', 'PF1788@FIAP.COM.BR', SYSDATE);

-- Crie um package que contenha uma função para contar o total de pedido 
-- e uma procedure para fazer inserções de novos pedidos;
