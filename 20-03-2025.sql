insert into pais values(77,'JAMAICA');

--- Criar um bloco anônimo para realizar esse mesmo INSERT;

DECLARE 
    v_id NUMBER := &VALOR;
    v_nome VARCHAR2(30) := '&NOME';
BEGIN
    INSERT INTO pais VALUES (
        v_id,
        v_nome
    );
COMMIT;
END;

CREATE OR REPLACE PROCEDURE insert_pais (
    v_id NUMBER,
    v_nome VARCHAR2
) AS
BEGIN
    INSERT INTO pais VALUES (
        v_id,
        v_nome
    );
    
    COMMIT;
END insert_pais;

--- Os 4 fazem a mesma coisa para inserir (depende da linguagem do backend)

EXEC insert_pais(586, 'AFRICA DO SUL');

EXECUTE insert_pais(586, 'AFRICA DO SUL');

CALL insert_pais(586, 'AFRICA DO SUL');

BEGIN
insert_pais(586, 'AFRICA DO SUL');
END;

--- Fazer um PROCEDURE para realizar updates na tabela pais;

CREATE OR REPLACE PROCEDURE update_pais (
    p_cod NUMBER,
    p_nome VARCHAR2
) AS
BEGIN
    UPDATE pais
    SET
        nom_pais = p_nome
    WHERE
        cod_pais = p_cod;
        
    COMMIT;
END update_pais;


CREATE OR REPLACE PROCEDURE delete_pais (
    p_cod NUMBER
) AS
BEGIN
    DELETE FROM pais
    WHERE
        cod_pais = p_cod;
        
    COMMIT;
END delete_pais;


--- Crie uma PROCEDURE que você passe o código do cliente e retorne o último
-- pedido comprado, nome do cliente e produto comprado.

SELECT
    ped.cod_pedido,
    cli.cod_cliente,
    cli.nom_cliente,
    ped.dat_pedido,
    prod.nom_produto
FROM
        pedido ped
    INNER JOIN cliente cli ON ( ped.cod_cliente = cli.cod_cliente )
    INNER JOIN item_pedido item on ( ped.cod_pedido = item.cod_pedido )
    INNER JOIN produto prod on ( item.cod_produto = prod.cod_produto )
WHERE
    ped.cod_cliente = 74
    and ped.cod_pedido = 130501

--- EXERCICIO 7
CREATE OR REPLACE PROCEDURE rel_pedidos (p.cod_ped number) as
begin for x in
    SELECT
        ped.cod_pedido,
        cli.cod_cliente,
        cli.nom_cliente,
        MAX(ped.dat_pedido),
        prod.nom_produto 
FROM
    pedido ped
    INNER JOIN cliente cli on ( ped.cod_cliente = cli.cod_cliente )
    INNER JOIN item_pedido item on ( ped.cod_pedido = item.cod_pedido )
    INNER JOIN produto prod on ( item.cod_produto = prod.cod_produto )
WHERE
        ped.cod_cliente = 74
    AND ped.cod_pedido = 130501
GROUP BY
    ped.cod_pedido,
    cli.cod_cliente,
    cli.nom_cliente,
    prod.nom_produto
LOOP;
    dbms_output.put_line (x.cod_cliente, x.nom_cliente);
END LOOP;
END;
