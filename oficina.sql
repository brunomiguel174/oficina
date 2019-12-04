use oficina;

DROP TABLE IF EXISTS reparação;
DROP TABLE IF EXISTS marca;
DROP TABLE IF EXISTS modelo;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS carro;
DROP TABLE IF EXISTS pecas_utilizadas;
DROP TABLE IF EXISTS peca;
DROP TABLE IF EXISTS armazem;
DROP TABLE IF EXISTS especialidade;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS funcionario_horasDeTrabalho;
DROP TABLE IF EXISTS modeloCarro_peca;

CREATE TABLE carro (
    id_carro INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    matricula VARCHAR(20),
    id_modelo INTEGER  UNSIGNED,
    id_marca INTEGER UNSIGNED ,
    id_cliente INTEGER UNSIGNED ,
    PRIMARY KEY (id_carro)
);

CREATE TABLE marca(
    id_marca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50),
    PRIMARY KEY (id_marca)
);

CREATE TABLE modelo(
    id_modelo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(50),
    marca_id INTEGER UNSIGNED,
    PRIMARY KEY (id_modelo)
);

CREATE TABLE peca(
    id_peca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(50),
    designacao VARCHAR(50),
    custo_unitario INTEGER,
    quantidade_disponivel INTEGER,
    id_armazem INTEGER UNSIGNED
    PRIMARY KEY (id_peca)
);

CREATE TABLE armazem(
    id_armazem INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_armazem)
);

CREATE TABLE pecas_utilizadas(
    id_reparacao INTEGER UNSIGNED,
    id_peca INTEGER UNSIGNED,
    quantidade INTEGER,
);
ALTER TABLE pecas_utilizadas ADD CONSTRAINT PK_pecas_utilizadas PRIMARY KEY (id_reparacao, id_peca);

CREATE TABLE reparacao(
    id_reparacao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    id_carro INTEGER UNSIGNED,
    data_inicio DATE,
    date_fim DATE,
    id_funcionario INTEGER,
    horas_funcionario INTEGER,
    PRIMARY KEY (id_reparacao)
);

CREATE TABLE funcionario_horasDeTrabalho(
    id_reparacao INTEGER UNSIGNED,
    id_funcionario INTEGER UNSIGNED,
    horas INTEGER,
);
ALTER TABLE funcionario_horasDeTrabalho ADD CONSTRAINT PK_funcionario_horasDeTrabalho PRIMARY KEY (id_reparacao, id_funcionario);

CREATE TABLE funcionario(
    id_funcionario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    telefone INTEGER,
    morada VARCHAR(50),
    id_especialidade,
    PRIMARY key (id_funcionario)
);

CREATE TABLE especialidade(
    id_especialidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    custo INTEGER,
    PRIMARY KEY (id_especialidade)
);

CREATE TABLE modeloCarro_peca(
    id_modelo INTEGER UNSIGNED,
    id_peca INTEGER UNSIGNED,
);
ALTER TABLE modeloCarro_peca ADD CONSTRAINT PK_modeloCarro_peca PRIMARY KEY (id_modelo, id_peca);

CREATE TABLE cliente(
    id_cliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    telefone INTEGER,
    morada VARCHAR(50),
    PRIMARY KEY (id_cliente)
);

ALTER TABLE carro ADD CONSTRAINT FK_carro_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo);
ALTER TABLE carro ADD CONSTRAINT FK_carro_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca);
ALTER TABLE carro ADD CONSTRAINT FK_carro_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_especialidade FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade);
ALTER TABLE funcionario_horasDeTrabalho ADD CONSTRAINT FK_funcionariohorasDetrabalho_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);
ALTER TABLE funcionario_horasDeTrabalho ADD CONSTRAINT FK_funcionariohorasDetrabalho_reparacao FOREIGN KEY (id_reparacao) REFERENCES reparacao(id_reparacao);
ALTER TABLE reparacao ADD CONSTRAINT Fk_idFuncionario_funcionarioDeTrabalho FOREIGN KEY (id_funcionario) REFERENCES funcionario_horasDeTrabalho(id_funcionario);
ALTER TABLE pecas_utilizadas ADD CONSTRAINT FK_pecasUtilizadas_reparacao FOREIGN KEY (id_reparacao) REFERENCES reparacao(id_reparacao);
ALTER TABLE pecas_utilizadas ADD CONSTRAINT FK_idPeca_peca FOREIGN KEY (id_peca) REFERENCES peca(id_peca);
ALTER TABLE peca ADD CONSTRAINT FK_peca_armazem FOREIGN KEY (id_peca) REFERENCES armazem(id_armazem);
ALTER TABLE modeloCarro_peca ADD CONSTRAINT FK_modeloCarro_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo);
ALTER TABLE modeloCarro_peca ADD CONSTRAINT FK_idPeca_peca FOREIGN KEY (id_peca) REFERENCES peca(id_peca);