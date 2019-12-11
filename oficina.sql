use mind_oficina;


DROP TABLE IF EXISTS modeloCarro_peca;
DROP TABLE IF EXISTS modelo;
DROP TABLE IF EXISTS funcionario_horasDeTrabalho;
DROP TABLE IF EXISTS reparacao;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS especialidade;
DROP TABLE IF EXISTS proprietario_carro;
DROP TABLE IF EXISTS pecas_utilizadas;
DROP TABLE IF EXISTS peca;
DROP TABLE IF EXISTS armazem;
DROP TABLE IF EXISTS carro;
DROP TABLE IF EXISTS marca;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS localidade;



CREATE TABLE carro  (
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
    id_marca INTEGER UNSIGNED,
    PRIMARY KEY (id_modelo)
);

CREATE TABLE peca(
    id_peca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(50),
    designacao VARCHAR(50),
    custo_unitario INTEGER,
    quantidade_disponivel INTEGER,
    id_armazem INTEGER UNSIGNED,
    PRIMARY KEY (id_peca)
);

CREATE TABLE armazem(
    id_armazem INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_armazem)
);

CREATE TABLE pecas_utilizadas(
    id_carro INTEGER UNSIGNED,
    id_peca INTEGER UNSIGNED,
    quantidade INTEGER 
);

ALTER TABLE pecas_utilizadas ADD CONSTRAINT PK_pecas_utilizadas PRIMARY KEY (id_carro, id_peca);

CREATE TABLE reparacao(
    id_reparacao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    id_carro INTEGER UNSIGNED,
    data_inicio DATE,
    date_fim DATE,
    id_funcionario INTEGER UNSIGNED,
    horas_funcionario INTEGER,
    PRIMARY KEY (id_reparacao)
);

CREATE TABLE funcionario_horasDeTrabalho(
    id_reparacao INTEGER UNSIGNED,
    id_funcionario INTEGER UNSIGNED,
    horas INTEGER
);
ALTER TABLE funcionario_horasDeTrabalho ADD CONSTRAINT PK_funcionario_horasDeTrabalho PRIMARY KEY (id_reparacao, id_funcionario);

CREATE TABLE funcionario(
    id_funcionario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    telefone INTEGER,
    morada VARCHAR(50),
    id_especialidade INTEGER UNSIGNED,
    id_localidade INTEGER UNSIGNED,
    PRIMARY KEY (id_funcionario,id_localidade)
);

CREATE TABLE especialidade(
    id_especialidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    custo INTEGER,
    PRIMARY KEY (id_especialidade)
);

CREATE TABLE modeloCarro_peca(
    id_modelo INTEGER UNSIGNED NOT NULL,
    id_peca INTEGER UNSIGNED  NOT NULL
);

ALTER TABLE modeloCarro_peca ADD CONSTRAINT PK_modeloCarro_peca PRIMARY KEY (id_modelo, id_peca);

CREATE TABLE cliente(
    id_cliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    telefone INTEGER,
    morada VARCHAR(50),
    id_localidade INTEGER UNSIGNED,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE proprietario_carro(
    id_carro INTEGER UNSIGNED,
    id_cliente INTEGER UNSIGNED,
    id_owner INTEGER UNSIGNED,
    PRIMARY KEY (id_carro,id_cliente)
);

CREATE TABLE localidade(
	id_localidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50),
	PRIMARY KEY (id_localidade)
);


ALTER TABLE proprietario_carro ADD CONSTRAINT FK_idCliente_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE proprietario_carro ADD CONSTRAINT FK_idCarro_carro FOREIGN KEY (id_carro) REFERENCES carro(id_carro);

ALTER TABLE proprietario_carro ADD CONSTRAINT FK_idOwner_cliente FOREIGN KEY (id_owner) REFERENCES cliente(id_cliente);


ALTER TABLE carro ADD CONSTRAINT FK_idMarca_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca);


ALTER TABLE modelo ADD CONSTRAINT FK_modeloIdMarca_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca);

ALTER TABLE modeloCarro_peca ADD CONSTRAINT FK_idModelo_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo);

ALTER TABLE modeloCarro_peca ADD CONSTRAINT FK_idPeca_peca FOREIGN KEY (id_peca) REFERENCES peca(id_peca);

ALTER TABLE peca ADD CONSTRAINT FK_idArmazem_armazem FOREIGN KEY (id_armazem) REFERENCES armazem(id_armazem);


ALTER TABLE pecas_utilizadas ADD CONSTRAINT FK_pecasUtilizadasIdCarro_carro FOREIGN KEY (id_carro) REFERENCES carro(id_carro);

ALTER TABLE pecas_utilizadas ADD CONSTRAINT FK_pecasUtilizadasidPeca_peca FOREIGN KEY (id_peca) REFERENCES peca(id_peca);


ALTER TABLE reparacao ADD CONSTRAINT FK_idCarro_PecasUtilizadas FOREIGN KEY (id_carro) REFERENCES pecas_utilizadas(id_carro);

ALTER TABLE reparacao ADD CONSTRAINT FK_reparacaoIdFuncionario_idFuncionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);


ALTER TABLE funcionario_horasDeTrabalho ADD CONSTRAINT FK_idReparacao_reparacao FOREIGN KEY (id_reparacao) REFERENCES reparacao(id_reparacao);

ALTER TABLE funcionario_horasDeTrabalho ADD CONSTRAINT FK_idfuncionario_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);

ALTER TABLE funcionario ADD CONSTRAINT FK_idEspecialidade_especialidade FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade);

ALTER TABLE funcionario ADD CONSTRAINT FK_idLocalidade_localidade FOREIGN KEY (id_localidade) REFERENCES localidade(id_localidade);
