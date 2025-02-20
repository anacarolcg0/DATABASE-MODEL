SET SERVEROUTPUT ON;

DECLARE
    idade NUMBER;
    nome VARCHAR2(30) := 'VERGILIO';
    endereco VARCHAR2(50) := '&DIGITE_ENDERECO';
    salario NUMBER := 1500;
    dollar NUMBER := 45;
    carro NUMBER := &VALOR;
BEGIN
    idade := 39;
    dbms_output.put_line('A IDADE INFORMADA É: ' || idade);
    dbms_output.put_line('MEU NOME É: ' || nome);
    dbms_output.put_line('SEU ENDEREÇO É: ' || endereco);
    dbms_output.put_line('O SALÁRIO COM ACRÉSCIMO DE 25% É: R$' || salario * 1.25);
    dbms_output.put_line('45 DÓLARES EM REAIS SÃO: R$' || dollar * 5.75);
    dbms_output.put_line('VALOR DO CARRO À VISTA R$:' || carro);
    dbms_output.put_line('VALOR DAS PARCELAS EM 10x R$:' || (carro * 1.03)/10);
    dbms_output.put_line('VALOR TOTAL FINANCIADO R$:' || (carro * 1.03));
END;

