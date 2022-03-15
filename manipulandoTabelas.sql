SELECT nomeEstudio, count(nomeEstudio)
FROM filme
GROUP BY nomeEstudio
HAVING COUNT(nomeEstudio) = (SELECT MAX(A.CNT)
                             FROM(SELECT COUNT(nomeEstudio) as CNT
                                  FROM filme
                                  GROUP BY(nomeEstudio)) as A)
;
SELECT genero, count(genero)
FROM filme
GROUP BY genero
HAVING COUNT(genero) = (SELECT MAX(A.CNT)
                             FROM(SELECT COUNT(genero) as CNT
                                  FROM filme
                                  GROUP BY(genero)) as A)
;
SELECT  nomeEstudio, COUNT(*)
FROM filme
GROUP BY nomeEstudio 
ORDER BY COUNT(*) DESC
;
SELECT dataNascimento, nomeArtistico
FROM atoratriz
WHERE dataNascimento = (SELECT MAX(dataNascimento) FROM atoratriz)
OR dataNascimento = (SELECT MIN(dataNascimento) FROM atoratriz)
;
SELECT nome, custoTotalFilme
FROM filme
WHERE custoTotalFilme = (SELECT MAX(custoTotalFilme) FROM filme)
;
SELECT nomeArtistico, cachee
FROM filme_ator_atriz
WHERE cachee = (SELECT MAX(cachee) FROM filme_ator_atriz)
;
SELECT nomeArtistico, dataNascimento, anoOscar
FROM atoratriz
WHERE dataNascimento = (SELECT MAX(dataNascimento) FROM atoratriz WHERE sexo = "Masculino" and categoriaOscar = "Melhor Ator") OR dataNascimento = (SELECT MAX(dataNascimento) FROM atoratriz WHERE sexo = "Feminino" and categoriaOscar = "Melhor Atriz")
