




CREATE TABLE nomes_usuario (
                nome_usuario VARCHAR(35) NOT NULL,
                CONSTRAINT nomes_usuario_pk PRIMARY KEY (nome_usuario)
);
COMMENT ON TABLE nomes_usuario IS 'Registra os nomes de usuários existentes no sistema, tanto para pessoas jurídicas (associações) quando para pessoas físicas (clientes).';
COMMENT ON COLUMN nomes_usuario.nome_usuario IS 'Registra o nome de usuário único para cada cliente ou associação. Usado como chave primária da tabela.';


CREATE TABLE tipo_lixo (
                id_tipo CHAR(3) NOT NULL,
                nome VARCHAR(15) NOT NULL,
                CONSTRAINT tipo_lixo_pk PRIMARY KEY (id_tipo)
);
COMMENT ON TABLE tipo_lixo IS 'Registra os múltiplos tipos de lixo que o projeto se propõe em coletar.';
COMMENT ON COLUMN tipo_lixo.id_tipo IS 'Registra a id referente ao tipo de lixo. Usado como chave primaria da tabela.';
COMMENT ON COLUMN tipo_lixo.nome IS 'Registra a denominação dada para o tipo de lixo.';


CREATE TABLE endereco_pj (
                id_endereco INTEGER NOT NULL,
                numero INTEGER NOT NULL,
                logradouro VARCHAR(75) NOT NULL,
                uf CHAR(2) NOT NULL,
                pais VARCHAR(25) NOT NULL,
                complemento VARCHAR(50),
                cep CHAR(8) NOT NULL,
                CONSTRAINT endereco_pj_pk PRIMARY KEY (id_endereco)
);
COMMENT ON TABLE endereco_pj IS 'Registra um endereço de uma associação para cada id (pk).';
COMMENT ON COLUMN endereco_pj.id_endereco IS 'Registra uma ID para o ENDERECO DA ASSOCIAÇÃO ou da afiliada. Usado como chave primaria da tabela.';
COMMENT ON COLUMN endereco_pj.numero IS 'Registra o número do ENDERECO DA ASSOCIAÇÃO ou afiliadas.';
COMMENT ON COLUMN endereco_pj.logradouro IS 'Registra o LOGRADOURO do ENDERECO PRIMARIO do cliente.';
COMMENT ON COLUMN endereco_pj.uf IS 'Resgistra em que ESTADO esta localizado ENDERECO da empresa.';
COMMENT ON COLUMN endereco_pj.pais IS 'Resgistra em que PAIS esta localizado o ENDERECO DA ASSOCIAÇÃO ou da afiliada.';
COMMENT ON COLUMN endereco_pj.complemento IS 'Registra o complemento para a identificação do ENDEREÇO DA EMPRESA ou da afiliada.';
COMMENT ON COLUMN endereco_pj.cep IS 'Registra o CEP do ENDERECO DA ASSOCIAÇÃO ou afiliada.';


CREATE TABLE endereco_pf (
                id_endereco INTEGER NOT NULL,
                logradouro VARCHAR(75) NOT NULL,
                uf CHAR(2) NOT NULL,
                pais VARCHAR(25) NOT NULL,
                numero INTEGER NOT NULL,
                cep CHAR(8) NOT NULL,
                complemento VARCHAR(50),
                CONSTRAINT endereco_pf_pk PRIMARY KEY (id_endereco)
);
COMMENT ON TABLE endereco_pf IS 'Registra um endereço de um cliente para cada id (pk).';
COMMENT ON COLUMN endereco_pf.id_endereco IS 'Registra uma ID para cada um dos endereços registrados pelo cliente. Usado como chave primária da tabela.';
COMMENT ON COLUMN endereco_pf.logradouro IS 'Registra o LOGRADOURO do endereço registrado pelo cliente.';
COMMENT ON COLUMN endereco_pf.uf IS 'Resgistra em que ESTADO está localizado o endereço registrado pelo cliente.';
COMMENT ON COLUMN endereco_pf.pais IS 'Resgistra em que PAÍS esta localizado o endereço registrado pelo cliente.';
COMMENT ON COLUMN endereco_pf.numero IS 'Registra o NÚMERO da propriedade em que se encontra o endereço registrado pelo cliente.';
COMMENT ON COLUMN endereco_pf.cep IS 'Registra o CEP do endereço registrado pelo cliente.';
COMMENT ON COLUMN endereco_pf.complemento IS 'Registra o complemento para a identificação do endereço registrado pelo cliente.';


CREATE TABLE pessoa_fisica (
                cpf CHAR(11) NOT NULL,
                nome_usuario VARCHAR(35) NOT NULL,
                celular CHAR(15),
                nome VARCHAR(35) NOT NULL,
                sobrenome VARCHAR(75) NOT NULL,
                senha VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                CONSTRAINT pessoa_fisica_pk PRIMARY KEY (cpf)
);
COMMENT ON TABLE pessoa_fisica IS 'Registra as informações pessoais de um cliente PESSOA FÍSICA.';
COMMENT ON COLUMN pessoa_fisica.cpf IS 'Registra o CPF do cliente. Usado como chave primaria da tabela.';
COMMENT ON COLUMN pessoa_fisica.nome_usuario IS 'Registra um nome de usuário escolhido para identificação do cliente (pessoa física). Usada como chave estrageira para criar uma relação com a tabela nome_usuario.';
COMMENT ON COLUMN pessoa_fisica.celular IS 'Registra o número de celular do cliente.';
COMMENT ON COLUMN pessoa_fisica.nome IS 'Registra o nome do cliente.';
COMMENT ON COLUMN pessoa_fisica.sobrenome IS 'Registra o sobrenome do cliente.';
COMMENT ON COLUMN pessoa_fisica.senha IS 'Registra a senha de acesso do cliente no sistema.';
COMMENT ON COLUMN pessoa_fisica.email IS 'Registra o e-mail do cliente.';


CREATE TABLE pessoa_fisica_enderecos (
                id_endereco INTEGER NOT NULL,
                id_cliente CHAR(11) NOT NULL,
                CONSTRAINT pessoa_fisica_enderecos_pk PRIMARY KEY (id_endereco, id_cliente)
);
COMMENT ON TABLE pessoa_fisica_enderecos IS 'Tabela intermediária para relação N:N entre pessoa_fisica e endereço_pf. Guarda múltiplos endereços para uma pessoa física.';
COMMENT ON COLUMN pessoa_fisica_enderecos.id_endereco IS 'Registra uma ID para um endereço registrado pelo cliente. Usado como chave primaria estrangeira (relação com a tabela endereço_pf).';
COMMENT ON COLUMN pessoa_fisica_enderecos.id_cliente IS 'Registra o CPF do cliente. Usado como chave primaria estrangeira (relação com a tabela pessoa_fisica).';


CREATE TABLE pessoa_juridica (
                cnpj INTEGER NOT NULL,
                nome_usuario VARCHAR(35) NOT NULL,
                nome VARCHAR(75) NOT NULL,
                telefone CHAR(15),
                email VARCHAR(50) NOT NULL,
                nome_gerente VARCHAR(50),
                senha VARCHAR(50) NOT NULL,
                CONSTRAINT pessoa_juridica_pk PRIMARY KEY (cnpj)
);
COMMENT ON TABLE pessoa_juridica IS 'Resgistra as informações de uma EMPRESA ASSOCIADA.';
COMMENT ON COLUMN pessoa_juridica.cnpj IS 'Registra o CNPJ de certa empresa. Usado como chave primaria da tabela.';
COMMENT ON COLUMN pessoa_juridica.nome_usuario IS 'Registra um nome de usuário escolhido para identificação da associação. Usada como chave estrageira para criar uma relação com a tabela nome_usuario.';
COMMENT ON COLUMN pessoa_juridica.nome IS 'Registra o nome da empresa.';
COMMENT ON COLUMN pessoa_juridica.telefone IS 'Registra o número do telefone da empresa.';
COMMENT ON COLUMN pessoa_juridica.email IS 'Registra o e-mail da empresa.';
COMMENT ON COLUMN pessoa_juridica.nome_gerente IS 'Registra o nome do gerente responsável por esse trabalho na empresa.';
COMMENT ON COLUMN pessoa_juridica.senha IS 'Registra a senha de acesso da empresa no sistema.';


CREATE TABLE tipo_lixo_trabalhado (
                id_tipo CHAR(3) NOT NULL,
                cnpj INTEGER NOT NULL,
                CONSTRAINT tipo_lixo_trabalhado_pk PRIMARY KEY (id_tipo, cnpj)
);
COMMENT ON TABLE tipo_lixo_trabalhado IS 'Registra os múltiplos tipos de lixo que uma empresa coleta, dentre serviços disponibilizados pelo sistema.';
COMMENT ON COLUMN tipo_lixo_trabalhado.id_tipo IS 'Registra a id referente ao tipo de lixo. Usado como chave primaria estrangeira (fazendo relação com a tabela tipo_lixo).';
COMMENT ON COLUMN tipo_lixo_trabalhado.cnpj IS 'Registra o CNPJ de certa empresa. Usado como chave primaria estrangeira (relação com a tabela pessoa_juridica).';


CREATE TABLE agendamento (
                id_agendamento INTEGER NOT NULL,
                horario TIME NOT NULL,
                data_coleta DATE NOT NULL,
                forma_coleta VARCHAR(25) NOT NULL,
                id_endereco INTEGER NOT NULL,
                id_associacao INTEGER NOT NULL,
                id_cliente CHAR(11) NOT NULL,
                CONSTRAINT agendamento_pk PRIMARY KEY (id_agendamento)
);
COMMENT ON TABLE agendamento IS 'Registra dados do agendamento que a empresa/cliente realizar.';
COMMENT ON COLUMN agendamento.id_agendamento IS 'Registra um codigo único para um agendamento. Usado como chave primaria da tabela.';
COMMENT ON COLUMN agendamento.horario IS 'Horario em que a entrega deve ser realizada.';
COMMENT ON COLUMN agendamento.data_coleta IS 'Registra a data em que a coleta deve ser realizada.';
COMMENT ON COLUMN agendamento.forma_coleta IS 'Registra a forma que o lixo deve ser coletado.';
COMMENT ON COLUMN agendamento.id_endereco IS 'Registra o número do endereço do cliente, aonde será realizada a coleta - segundo selecionado por ele. Usada como chave estrageira para criar uma relação com a endereco_pf.';
COMMENT ON COLUMN agendamento.id_associacao IS 'Registra o CNPJ da associação que realizará a coleta. Usada como chave estrageira para criar uma relação com a pessoa_juridica.';
COMMENT ON COLUMN agendamento.id_cliente IS 'Registra o CPF do cliente que solicitou o agendamento. Usada como chave estrageira para criar uma relação com a tabela pessoa_fisica.';


CREATE TABLE tipo_lixo_agendamento (
                id_tipo CHAR(3) NOT NULL,
                id_agendamento INTEGER NOT NULL,
                CONSTRAINT tipo_lixo_agendamento_pk PRIMARY KEY (id_tipo, id_agendamento)
);
COMMENT ON TABLE tipo_lixo_agendamento IS 'Registra os tipos de lixo que serão coletados em um agendamento.';
COMMENT ON COLUMN tipo_lixo_agendamento.id_tipo IS 'Registra a id referente ao tipo de lixo. Usado como chave primaria estrangeira (relação com a tabela tipo_lixo).';
COMMENT ON COLUMN tipo_lixo_agendamento.id_agendamento IS 'Registra um código unico para um agendamento. Usado como chave primaria estrangeira (relação com a tabela agendamento).';


CREATE TABLE pessoa_juridica_enderecos (
                id_endereco INTEGER NOT NULL,
                id_associacao INTEGER NOT NULL,
                CONSTRAINT pessoa_juridica_enderecos_pk PRIMARY KEY (id_endereco, id_associacao)
);
COMMENT ON TABLE pessoa_juridica_enderecos IS 'Tabela intermediária para relação N:N entre pessoa_juridica e endereço_pj. Guarda múltiplos endereços para uma associação.';
COMMENT ON COLUMN pessoa_juridica_enderecos.id_endereco IS 'Registra uma ID para o ENDERECO DA ASSOCIAÇÃO ou da afiliada. Usado como chave primaria estrangeira (relação com a tabela endereço_pj).';
COMMENT ON COLUMN pessoa_juridica_enderecos.id_associacao IS 'Registra o CNPJ de certa empresa. Usado como chave primaria estrangeira (relação com a tabela pessoa_juridica).';


ALTER TABLE pessoa_juridica ADD CONSTRAINT nomes_usuario_pessoa_juridica_fk
FOREIGN KEY (nome_usuario)
REFERENCES nomes_usuario (nome_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pessoa_fisica ADD CONSTRAINT nomes_usuario_pessoa_fisica_fk
FOREIGN KEY (nome_usuario)
REFERENCES nomes_usuario (nome_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tipo_lixo_agendamento ADD CONSTRAINT tipo_lixo_tipo_lixo_agendamento_fk
FOREIGN KEY (id_tipo)
REFERENCES tipo_lixo (id_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tipo_lixo_trabalhado ADD CONSTRAINT tipo_lixo_tipo_lixo_trabalhado_fk
FOREIGN KEY (id_tipo)
REFERENCES tipo_lixo (id_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pessoa_juridica_enderecos ADD CONSTRAINT endereco_pj_pessoa_juridica_enderecos_fk
FOREIGN KEY (id_endereco)
REFERENCES endereco_pj (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pessoa_fisica_enderecos ADD CONSTRAINT endereco_pf_pessoa_fisica_enderecos_fk
FOREIGN KEY (id_endereco)
REFERENCES endereco_pf (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE agendamento ADD CONSTRAINT endereco_pf_agendamento_fk
FOREIGN KEY (id_endereco)
REFERENCES endereco_pf (id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pessoa_fisica_enderecos ADD CONSTRAINT pessoa_fisica_pessoa_fisica_enderecos_fk
FOREIGN KEY (id_cliente)
REFERENCES pessoa_fisica (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE agendamento ADD CONSTRAINT pessoa_fisica_agendamento_fk1
FOREIGN KEY (id_cliente)
REFERENCES pessoa_fisica (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pessoa_juridica_enderecos ADD CONSTRAINT pessoa_juridica_pessoa_juridica_enderecos_fk
FOREIGN KEY (id_associacao)
REFERENCES pessoa_juridica (cnpj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE agendamento ADD CONSTRAINT pessoa_juridica_agendamento_fk1
FOREIGN KEY (id_associacao)
REFERENCES pessoa_juridica (cnpj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tipo_lixo_trabalhado ADD CONSTRAINT pessoa_juridica_tipo_lixo_trabalhado_fk
FOREIGN KEY (cnpj)
REFERENCES pessoa_juridica (cnpj)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tipo_lixo_agendamento ADD CONSTRAINT agendamento_tipo_lixo_agendamento_fk
FOREIGN KEY (id_agendamento)
REFERENCES agendamento (id_agendamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
