set serveroutput on;

DECLARE 
	V_CONTADOR NUMBER(2):= 1; 
BEGIN 
LOOP 	
	DBMS_OUTPUT.PUT_LINE(V_CONTADOR); 
	V_CONTADOR := V_CONTADOR + 1; 
	EXIT WHEN V_CONTADOR > 20; 
END LOOP; 
END;


-------------------------
DECLARE
 v_inicio NUMBER := 1; 
    v_fim NUMBER := 10; 
    v_soma_impares NUMBER := 0; 
    v_impares NUMBER := 0; 
    v_soma_pares NUMBER := 0; 
    v_pares NUMBER := 0; 
    v_contador NUMBER; 
    v_media_pares NUMBER; 
BEGIN
    FOR v_contador IN v_inicio..v_fim LOOP
        IF MOD(v_contador, 2) = 0 THEN 
            v_soma_pares := v_soma_pares + v_contador;
            v_pares := v_pares + 1; 
        ELSE
            v_soma_impares := v_soma_impares + v_contador; 
            v_impares := v_impares + 1; 
        END IF;
    END LOOP;

    IF v_pares <> 0 THEN
        v_media_pares := v_soma_pares / v_pares;
    ELSE
        v_media_pares := 0; 
    END IF;

    DBMS_OUTPUT.PUT_LINE('Soma dos números ímpares: ' || v_soma_impares);
    DBMS_OUTPUT.PUT_LINE('Média dos números pares: ' || v_media_pares);
END;