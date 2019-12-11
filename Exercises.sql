
DELETE FROM carro;
DELETE FROM cliente;
DELETE FROM especialidade;
DELETE FROM funcionario;
DELETE FROM funcionario_horasDeTrabalho;
DELETE FROM marca;
DELETE FROM modelo;
DELETE FROM modeloCarro_peca;
DELETE FROM peca;
DELETE FROM armazem;
DELETE FROM pecas_utilizadas;
DELETE FROM reparacao;
DELETE FROM proprietario_carro;
DELETE FROM localidade;

ALTER TABLE armazem AUTO_INCREMENT = 1;
ALTER TABLE carro AUTO_INCREMENT = 1;
ALTER TABLE cliente AUTO_INCREMENT = 1;
ALTER TABLE peca AUTO_INCREMENT = 1;
ALTER TABLE especialidade AUTO_INCREMENT = 1;
ALTER TABLE funcionario AUTO_INCREMENT = 1;
ALTER TABLE reparacao AUTO_INCREMENT = 1;
ALTER TABLE modelo AUTO_INCREMENT = 1;
ALTER TABLE marca AUTO_INCREMENT = 1;
ALTER TABLE localidade AUTO_INCREMENT = 1;

-- a.
SELECT * FROM peca WHERE custo_unitario < 10 AND codigo = 98;

-- b.
SELECT carro.matricula FROM carro INNER JOIN reparacao ON carro.id_carro = reparacao.id_carro WHERE date_fim BETWEEN '01-09-2010' AND '30-09-2010' ;

-- c.
SELECT cliente.nome, carro.id_carro, peca.id_peca, peca.custo_unitario FROM cliente INNER JOIN proprietario_carro ON cliente.id_cliente = proprietario_carro.id_cliente INNER JOIN carro ON proprietario_carro.id_carro = carro.id_carro INNER JOIN reparacao ON carro.id_carro = reparacao.id_carro INNER JOIN pecas_utilizadas ON reparacao.id_carro = pecas_utilizadas.id_carro INNER JOIN peca ON pecas_utilizadas.id_peca = peca.id_peca WHERE custo_unitario > 10 ORDER BY custo_unitario DESC;

-- d.
SELECT cliente.nome FROM cliente INNER JOIN proprietario_carro ON cliente.id_cliente = proprietario_carro.id_cliente WHERE proprietario_carro.id_cliente != proprietario_carro.id_owner;

-- e.
SELECT SUM(id_reparacao) FROM reparacao, carro WHERE reparacao.id_reparacao = carro.id_carro;

-- f.
SELECT id_reparacao, TIMESTAMPDIFF(DAY,data_inicio,date_fim) AS number_of_days FROM reparacao;

-- g.
SELECT AVG(custo_unitario) AS media, SUM(quantidade_disponivel * custo_unitario) AS soma, MIN(custo_unitario) AS minimo, MAX(custo_unitario) AS maximo FROM peca;

-- h.


-- i.
SELECT reparacao.id_reparacao, SUM(quantidade * (SELECT custo_unitario FROM peca INNER JOIN pecas_utilizadas ON peca.id_peca = pecas_utilizadas.id_peca)) AS preço_total_por_reparação FROM pecas_utilizadas, reparacao WHERE reparacao.id_carro = pecas_utilizadas.id_carro GROUP BY id_reparacao;

-- j.

-- k.

-- l.

-- m.

-- n.
SELECT * FROM funcionario INNER JOIN proprietario_carro ON proprietario_carro.id_cliente WHERE proprietario_carro.id_cliente != proprietario_carro.id_owner;
-- o.
SELECT * FROM localidade WHERE localidade.id_localidade OR 	

-- p.


-- q.

-- r.

-- s.

-- t.
	
-- u.

-- v.

-- x.






