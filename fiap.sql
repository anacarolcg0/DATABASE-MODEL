SET SERVEROUTPUT ON;

DECLARE
    genero CHAR(1) := '&VALOR';
BEGIN
    IF UPPER (GENERO) = 'F' THEN
        dbms_output.PUT_LINE('O GENERO INFORMADO � FEMININO');
    ELSIF upper(genero) = 'M' THEN
        dbms_output.PUT_LINE('O GENERO INFORMADO � MASCULINO');
    ELSE
        dbms_output.PUT_LINE('N�O INFORMADO');
    END IF;
END;
