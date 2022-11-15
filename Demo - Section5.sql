set serveroutput on;

----Impl�citos

DECLARE 
CLIENTE varchar(20);
BEGIN 
SELECT NOMCLI INTO CLIENTE FROM CLIENTE WHERE IDCLI=1;
DBMS_OUTPUT.PUT_LINE(CLIENTE);
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
IF SQL%FOUND THEN 
DBMS_OUTPUT.PUT_LINE('Aqui tenemos una fila');
END IF;
END;

-------------Explicitos
DECLARE 
v_nomcli CLIENTE.NOMCLI%TYPE;
v_apecli CLIENTE.APECLI%TYPE;
v_dnicli CLIENTE.DNICLI%TYPE;

cursor c_cursorcliente is 
SELECT NOMCLI,APECLI,DNICLI 
FROM CLIENTE
WHERE IDCLI=1;

BEGIN
    OPEN c_cursorcliente;
    FETCH c_cursorcliente into v_nomcli,v_apecli,v_dnicli;
    CLOSE c_cursorcliente;
    DBMS_OUTPUT.PUT_LINE('Nombre Cliente:'|| v_nomcli);
    DBMS_OUTPUT.PUT_LINE('Apellidos:'|| v_apecli);
    DBMS_OUTPUT.PUT_LINE('DNI:'|| v_dnicli);
END;


-------------Explicitos LOOP FETCH
DECLARE 
v_nomcli CLIENTE.NOMCLI%TYPE;
v_apecli CLIENTE.APECLI%TYPE;
v_dnicli CLIENTE.DNICLI%TYPE;

cursor c_cursorcliente is 
SELECT NOMCLI,APECLI,DNICLI 
FROM CLIENTE
WHERE DOMCLI= '2 DE MAYO';

BEGIN
    OPEN c_cursorcliente;
    LOOP
    FETCH c_cursorcliente into v_nomcli,v_apecli,v_dnicli;
    EXIT WHEN c_cursorcliente%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Nombre Cliente:'|| v_nomcli);
    DBMS_OUTPUT.PUT_LINE('Apellidos:'|| v_apecli);
    DBMS_OUTPUT.PUT_LINE('DNI:'|| v_dnicli);
    END LOOP;
    CLOSE c_cursorcliente;
END;


-----FOR LOOP

DECLARE 
CURSOR C_PRODUCTO
IS 
SELECT 
NOMPRO,PREPRO,DESPRO 
FROM PRODUCTO;

BEGIN 
FOR F_PRODUCTO IN C_PRODUCTO
LOOP
    DBMS_OUTPUT.PUT_LINE('Producto: '|| f_producto.NOMPRO ||' / '||'Precio: s/.'||f_producto.PREPRO||' / '||'Descripci�n: '||f_producto.DESPRO);
END LOOP;
END;

--- Ejemplo Basico FOR LOOP

DECLARE
  suma number:=0;
BEGIN
  FOR variable IN 1..10 LOOP
    suma := suma + variable;
    dbms_output.put_line(suma);
  END LOOP;
 
END;





