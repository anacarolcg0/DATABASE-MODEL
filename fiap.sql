SET SERVEROUTPUT ON;

DECLARE
    genero CHAR(1) := '&VALOR';
BEGIN
    IF UPPER (GENERO) = 'F' THEN
        dbms_output.PUT_LINE('O GENERO INFORMADO É FEMININO');
    ELSIF upper(genero) = 'M' THEN
        dbms_output.PUT_LINE('O GENERO INFORMADO É MASCULINO');
    ELSE
        dbms_output.PUT_LINE('NÃO INFORMADO');
    END IF;
END;
