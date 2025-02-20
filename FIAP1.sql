SELECT 
*
FROM pf1788.pais a
INNER JOIN pf1788.estado b ON (a.cod_pais = b.cod_pais)


SELECT 
    a.nom_pais  pais,
    COUNT(nom_estado) "QTD ESTADO"
FROM
    pf1788.pais a
    LEFT JOIN pf1788.estado b ON ( a.cod_pais = b.cod_pais )
    WHERE A.NOM_PAIS = 'Brazil'
GROUP BY
    a.nom_pais
    HAVING COUNT(nom_estado) >0
ORDER BY 2;


-- TRAZER QUANTAS CIDADES O ESTADO TEM
SELECT
    a.nom_pais  pais,
    b.nom_estado    estado,
    COUNT (nom_cidade) "QTD CIDADE"
FROM
    pf1788.pais a 
    LEFT JOIN pf1788.estado b ON (a.cod_pais = b.cod_pais)
    INNER JOIN pf1788.cidade c ON (b.cod_estado = c.cod_estado)
    -- WHERE A.NOM_PAIS = 'Brazil'
GROUP BY 
    a.nom_pais,
    b.nom_estado
    HAVING COUNT (nom_estado) >0
ORDER BY 3;


