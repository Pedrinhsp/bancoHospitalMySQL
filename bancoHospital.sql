CREATE SCHEMA IF NOT EXISTS hospital;
USE hospital;
CREATE TABLE medicos (crm INT NOT NULL AUTO_INCREMENT,
 nome VARCHAR(50) NOT NULL,
 cpf VARCHAR(11) NOT NULL UNIQUE,
 idade SMALLINT NOT NULL,
 especializacao VARCHAR(20) NOT NULL,
 PRIMARY KEY (crm)); 

INSERT INTO medicos(nome, cpf, idade, especializacao) VALUES('Otavio', '12345678910', 38, 'Neurologista'),
 ('Nakamura', '23145678910', 31, 'Pediatra'),
 ('Carolina', '23166378910', 42, 'Cardiologista'),
 ('Sergio', '23145994910', 45, 'Fisioterapeuta'),
 ('Camila', '32837519322', 40, 'Ortopedista');

CREATE TABLE pacientes (idPaciente INT NOT NULL AUTO_INCREMENT,
 nome VARCHAR(50) NOT NULL,
 idade SMALLINT NOT NULL,
 cpf VARCHAR(11) NOT NULL UNIQUE,
 doenca VARCHAR(30) NOT NULL,
 PRIMARY KEY (idPaciente));

 INSERT INTO pacientes(nome, cpf, idade, doenca) VALUES('Matheus', '12365478910', 22, 'Esquizofrenia'),
 ('Paulo', '32145678910', 33, 'Tuberculose'),
 ('Andreza', '44345678910', 60, 'Retardo Mental'),
 ('Michelle', '22244378910', 30, 'Osso Quebrado'),
 ('Marcela', '21456888810', 28, 'HIV');

CREATE TABLE medicamentos(num_remedio INT NOT NULL AUTO_INCREMENT,
 nome VARCHAR(50) NOT NULL,
 efeito VARCHAR(40) NOT NULL,
 quantidade INT NOT NULL,
 PRIMARY KEY (num_remedio));

INSERT INTO medicamentos(nome, efeito, quantidade) VALUES ('Dipirona','Anestésico', 50),
('Paracetamol','Anestésico', 60),
('Ibuprofeno','Desinflamatório', 90),
('Dorflex','Dores musculares', 80),
('Laxante','Alivio Estomacal', 18);

CREATE TABLE consulta (num_consult INT NOT NULL AUTO_INCREMENT,
data_consulta DATE NOT NULL,
hora_consulta TIME NOT NULL,
valor_consulta NUMERIC(9,2) NOT NULL,
fk_pacientes_idPaciente INT NOT NULL,
fk_medicos_crm INT NOT NULL,
FOREIGN KEY (fk_pacientes_idPaciente) REFERENCES pacientes(idPaciente),
FOREIGN KEY (fk_medicos_crm) REFERENCES medicos(crm),
PRIMARY KEY(num_consult));

INSERT INTO consulta(data_consulta, hora_consulta,valor_consulta, fk_pacientes_idPaciente, fk_medicos_crm) VALUES('2021/06/22', '13:45:00',155, 5, 1),
('2021/03/29', '13:30:00',155, 4, 2),
('2021/04/12', '14:20:00',155, 3, 5),
('2021/05/02', '15:30:00',155, 2, 4),
('2021/12/09', '16:30:00',155, 1, 3);

CREATE TABLE recepcao (num_recep INT NOT NULL AUTO_INCREMENT, nome_recep VARCHAR(30) NOT NULL, PRIMARY KEY(num_recep));
INSERT INTO recepcao(nome_recep) VALUES ('Carla'),('Maria'),('Livia'),('Jorge'),('Raquel');

CREATE TABLE triagem (fk_recepcao_num_recep INT NOT NULL,
fk_pacientes_idPaciente INT NOT NULL,
FOREIGN KEY (fk_recepcao_num_recep) REFERENCES recepcao(num_recep),
FOREIGN KEY(fk_pacientes_idPaciente) REFERENCES pacientes(idPaciente));

INSERT INTO triagem(fk_recepcao_num_recep, fk_pacientes_idPaciente) VALUES (1, 1),(2, 2),(3, 3),(4, 4),(5, 5);


CREATE TABLE receita(consumoPaci SMALLINT NOT NULL,
    fk_Medicamentos_num_remedio INT NOT NULL,
    fk_Medicos_crm INT NOT NULL,
    fk_pacientes_idPaciente INT NOT NULL,
    FOREIGN KEY (fk_Medicamentos_num_remedio) REFERENCES medicamentos(num_remedio),
    FOREIGN KEY (fk_Medicos_crm) REFERENCES medicos(crm),
    FOREIGN KEY (fk_pacientes_idPaciente) REFERENCES pacientes(idPaciente));

INSERT INTO receita(fk_Medicamentos_num_remedio, fk_Medicos_crm, consumoPaci) VALUES (1, 1,3,1),(2, 2, 4,2),(3, 3, 5,3),(4, 4, 6,4),(5, 5, 7, 5);
