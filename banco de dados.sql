CREATE TABLE IF NOT EXISTS banco(
	numero INTEGER NOT NULL,
	nome  VARCHAR (50) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,  -- Ver se o banco etá ativo 
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Salvar a data 
	PRIMARY KEY (numero) -- Chave Primaria 
);

CREATE TABLE IF NOT EXISTS agencia(
	banco_numero INTEGER NOT NULL, 
	numero INTEGER NOT NULL,
	nome VARCHAR(80),
	ativo BOOLEAN NOT NULL DEFAULT TRUE,  -- Ver se o banco etá ativo 
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Salvar a data 
	PRIMARY KEY(banco_numero,numero),
	FOREIGN KEY(banco_numero) REFERENCES banco (numero) --Cahve Estrangeira
);

CREATE TABLE cliente(
	numero BIGSERIAL PRIMARY KEY, -- Criando Chave Primaria
	nome VARCHAR(120) NOT NULL,
	email VARCHAR(250) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,  -- Ver se o banco etá ativo 
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP -- Salvar a data 
);

CREATE TABLE conta_corrente(
	banco_numero INTEGER NOT NULL, 
	agencia_numero INTEGER NOT NULL,
	numero BIGINT NOT NULL,
	digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,  -- Ver se o banco etá ativo 
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Salvar a data 
	Primary Key (banco_numero,agencia_numero,numero,digito,cliente_numero), --Criando Chave Primaria
	FOREIGN KEY (banco_numero,agencia_numero) REFERENCES agencia (banco_numero,numero), -- Criando Chave Estrangeira
	FOREIGN KEY (cliente_numero) REFERENCES cliente(numero)
);

CREATE TABLE tipo_trasancao(
	id SMALLSERIAL PRIMARY KEY, -- Criando Chave PRimaria
	nome VARCHAR(50) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,  -- Ver se o banco etá ativo 
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP -- Salvar a data 
);

CREATE TABLE cliente_transacoes(
	id BIGSERIAL PRIMARY KEY, -- Criando Chave Primaria
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	conta_corrente_numero BIGINT NOT NULL,
	conta_corrente_digito SMALlINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	tipo_trasancao_id SMALLINT NOT NULL,
	valor NUMERIC(15,2) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Salvar a data 
	FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente(banco_numero,agencia_numero,numero,digito,cliente_numero)

);
