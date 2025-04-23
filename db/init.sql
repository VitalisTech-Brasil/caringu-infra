DROP DATABASE IF EXISTS `vitalis`;
CREATE DATABASE IF NOT EXISTS `vitalis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `vitalis`;

-- -----------------------------------------------------
-- Table `vitalis`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(60) NOT NULL,
  `celular` VARCHAR(11) NULL DEFAULT NULL,
  `url_foto_perfil` TEXT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `genero` ENUM('MASCULINO', 'FEMININO', 'NAO_BINARIO', 'OUTRO', 'PREFIRO_NAO_INFORMAR') NOT NULL,
  `data_cadastro` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
-- AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Pessoas para personal_trainers (IDs: 1 a 5)
INSERT INTO vitalis.pessoas (nome, email, senha, celular, url_foto_perfil, data_nascimento, genero ) VALUES
('Lucas Andrade', 'lucas.andrade@example.com', 'senha1234', '11987654321', 'https://img.com/lucas.jpg', '1990-03-15', 'MASCULINO'),
('Mariana Silva', 'mariana.silva@example.com', 'senha5678', '21988887777', 'https://img.com/mariana.jpg', '1988-07-22', 'FEMININO'),
('João Pereira', 'joao.pereira@example.com', 'joao3210', '31999990000', NULL, '1995-11-05', 'MASCULINO'),
('Ana Costa', 'ana.costa@example.com', 'anaana123', '21912345678', 'https://img.com/ana.jpg', '1992-05-18', 'FEMININO'),
('Rafael Torres', 'rafael.torres@example.com', 'torres777', NULL, NULL, '1998-08-30', 'MASCULINO'),

-- Pessoas para alunos (IDs: 6 a 10)
('Carla Mendes', 'carla.mendes@example.com', 'mendes456', '11944556677', 'https://img.com/carla.jpg', '1985-02-10', 'FEMININO'),
('Alex Rocha', 'alex.rocha@example.com', 'alxr0cha', '11999887766', NULL, '2000-12-01', 'NAO_BINARIO'),
('Bianca Lima', 'bianca.lima@example.com', 'b1ancaL', NULL, 'https://img.com/bianca.jpg', '1997-09-12', 'FEMININO'),
('Diego Santos', 'diego.santos@example.com', 'diegosenha', '21988776655', 'https://img.com/diego.jpg', NULL, 'PREFIRO_NAO_INFORMAR'),
('Luna Martins', 'luna.martins@example.com', 'martins123', '31977665544', NULL, '1993-04-25', 'OUTRO');




-- -----------------------------------------------------
-- Table `vitalis`.`personal_trainers`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS vitalis.personal_trainers (
  id INT NOT NULL,
  cref VARCHAR(20) NOT NULL,
  especialidade JSON NOT NULL,
  experiencia INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_personal_trainers_pessoas FOREIGN KEY (id) REFERENCES vitalis.pessoas (id) ON DELETE CASCADE
);

INSERT INTO vitalis.personal_trainers (id, cref, especialidade, experiencia) VALUES
(1, 'CREF123456-SP', '["Musculação", "Treinamento Funcional"]', 15),
(2, 'CREF654321-SP', '["Musculação", "Emagrecimento"]', 5),
(3, 'CREF987654-RJ', '["Condicionamento Físico", "Treinamento para Idosos"]', 10),
(4, 'CREF112233-SP', '["Condicionamento Físico", "Treinamento para Idosos"]', 25),
(5, 'CREF445566-MG', '["Condicionamento Físico", "Treinamento para Idosos", "Reabilitação e Alongamento"]', 6);
-- -----------------------------------------------------
-- Table `vitalis`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.alunos (
  id INT NOT NULL,
  peso DECIMAL(5,2) NULL,
  altura DECIMAL(3,2) NULL,
  nivel_atividade ENUM("SEDENTARIO", "LEVEMENTE_ATIVO", "MODERADAMENTE_ATIVO", "MUITO_ATIVO", "EXTREMAMENTE_ATIVO") NOT NULL,
  nivel_experiencia ENUM('INICIANTE', 'INTERMEDIARIO', 'AVANCADO') NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT alunos_ibfk_1 FOREIGN KEY (id) REFERENCES vitalis.pessoas (id) ON DELETE CASCADE
);

INSERT INTO vitalis.alunos (id, peso, altura, nivel_atividade, nivel_experiencia) VALUES
(6, 75.50, 1.75, 'MODERADAMENTE_ATIVO', 'INTERMEDIARIO'),
(7, 65.20, 1.68, 'LEVEMENTE_ATIVO', 'INICIANTE'),
(8, 82.00, 1.80, 'MUITO_ATIVO', 'AVANCADO'),
(9, 90.30, 1.85, 'SEDENTARIO', 'INICIANTE'),
(10, 70.00, 1.65, 'EXTREMAMENTE_ATIVO', 'INTERMEDIARIO');

-- -----------------------------------------------------
-- Table `vitalis`.`exercicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.exercicios (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  grupo_muscular ENUM('PEITORAL', 'COSTAS', 'PERNAS', 'OMBRO', 'BRACO', 'CORE', 'CARDIO') NOT NULL,
  url_video TEXT NOT NULL,
  observacoes TEXT NULL,
  favorito BOOLEAN NULL DEFAULT FALSE,
  origem ENUM('BIBLIOTECA', 'PERSONAL') NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO vitalis.exercicios (nome, grupo_muscular, url_video, observacoes, favorito, origem) VALUES
-- Peitoral
('Supino Inclinado', 'PEITORAL', 'https://example.com/supino-inclinado', NULL, FALSE, 'BIBLIOTECA'),
('Crucifixo com Halteres', 'PEITORAL', 'https://example.com/crucifixo', 'Executar com controle', TRUE, 'BIBLIOTECA'),
('Flexões de Braço', 'PEITORAL', 'https://example.com/flexoes', 'Evitar descer demais', FALSE, 'BIBLIOTECA'),
('Peck Deck', 'PEITORAL', 'https://example.com/peck-deck', NULL, FALSE, 'PERSONAL'),

-- Pernas
('Afundo', 'PERNAS', 'https://example.com/afundo', 'Manter joelho alinhado', FALSE, 'BIBLIOTECA'),
('Stiff com Halteres', 'PERNAS', 'https://example.com/stiff', 'Manter costas retas', TRUE, 'BIBLIOTECA'),
('Leg Press', 'PERNAS', 'https://example.com/leg-press', NULL, FALSE, 'BIBLIOTECA'),

-- Ombro
('Elevação Lateral', 'Ombro', 'https://example.com/elevacao-lateral', NULL, TRUE, 'PERSONAL'),
('Desenvolvimento Arnold', 'Ombro', 'https://example.com/arnold', 'Evitar estender totalmente', FALSE, 'PERSONAL'),
('Elevação Frontal', 'Ombro', 'https://example.com/elevacao-frontal', NULL, FALSE, 'BIBLIOTECA'),

-- Core
('Abdominal Bicicleta', 'Core', 'https://example.com/abdominal-bicicleta', NULL, FALSE, 'BIBLIOTECA'),
('Elevação de Pernas', 'Core', 'https://example.com/elevacao-pernas', NULL, FALSE, 'BIBLIOTECA'),
('Abdominal Infra', 'Core', 'https://example.com/infra', NULL, TRUE, 'Biblioteca'),
('Abdominal Bicicleta', 'Core', 'https://example.com/abdominal-bicicleta', NULL, FALSE, 'BIBLIOTECA'), 
('Elevação de Pernas', 'Core', 'https://example.com/elevacao-pernas', NULL, FALSE, 'BIBLIOTECA'),
('Abdominal Infra', 'Core', 'https://example.com/infra', NULL, TRUE, 'Biblioteca'),

-- Cardio
('Polichinelo', 'Cardio', 'https://example.com/polichinelo', NULL, FALSE, 'BIBLIOTECA'),
('Burpee', 'Cardio', 'https://example.com/burpee', 'Explosão ao subir', TRUE, 'BIBLIOTECA'),
('Corrida Estacionária', 'Cardio', 'https://example.com/corrida', NULL, FALSE, 'BIBLIOTECA'),
('Mountain Climbers', 'Cardio', 'https://example.com/mountain', NULL, FALSE, 'BIBLIOTECA'),
('Corrida Estacionária', 'Cardio', 'https://example.com/corrida', NULL, FALSE, 'BIBLIOTECA'), 
('Mountain Climbers', 'Cardio', 'https://example.com/mountain', NULL, FALSE, 'BIBLIOTECA');


-- -----------------------------------------------------
-- Table `vitalis`.`treinos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`treinos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `personal_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `personal_id` (`personal_id` ASC) VISIBLE,
  CONSTRAINT `treinos_ibfk_1`
    FOREIGN KEY (`personal_id`)
    REFERENCES `vitalis`.`personal_trainers` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
-- AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO vitalis.treinos (nome, descricao, personal_id) VALUES
('Treino de Peito Avançado', 'Hipertrofia do peitoral com barra', 1),
('Treino de Pernas Intermediário', 'Força e resistência nas pernas', 2),
('Treino de Ombro Iniciante', 'Mobilidade e força básica', 3),
('Cardio Funcional', 'Gasto calórico intenso com circuitos', 4),
('Core e Estabilização', 'Foco em abdômen e lombar', 5),
('Peito Funcional', 'Treino de resistência com foco funcional', 1),
('Posterior Reforçado', 'Ênfase em posterior e glúteo', 2),
('Ombros Ativos', 'Melhora da estabilidade do ombro', 3),
('Cardio HIIT', 'Treino em alta intensidade intervalada', 4),
('Core Explosivo', 'Abdômen com movimentos rápidos', 5);

-- -----------------------------------------------------
-- Table `vitalis`.`treinos_exercicios`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS vitalis.treinos_exercicios (
  id INT NOT NULL AUTO_INCREMENT,
  treino_id INT NOT NULL,
  exercicio_id INT NOT NULL,
  carga DECIMAL(5,2) NOT NULL,
  repeticoes INT NOT NULL,
  series INT NOT NULL,
  descanso INT NOT NULL COMMENT 'Descanso em segundos',
  data_hora_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_hora_modificacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  favorito BOOLEAN NULL DEFAULT FALSE,
  grau_dificuldade ENUM("INICIANTE", "INTERMEDIARIO", "AVANCADO") NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX treino_id (treino_id ASC, exercicio_id ASC),
  INDEX exercicio_id (exercicio_id ASC),
  CONSTRAINT treinos_exercicios_ibfk_1 FOREIGN KEY (treino_id) REFERENCES vitalis.treinos (id) ON DELETE CASCADE,
  CONSTRAINT treinos_exercicios_ibfk_2 FOREIGN KEY (exercicio_id) REFERENCES vitalis.exercicios (id) ON DELETE CASCADE
);


-- Treino 1 (Peitoral)
INSERT INTO vitalis.treinos_exercicios (treino_id, exercicio_id, carga, repeticoes, series, descanso, favorito, grau_dificuldade) VALUES
(1, 6, 50, 10, 4, 90, FALSE, 'AVANCADO'),
(1, 7, 12, 12, 4, 60, FALSE, 'AVANCADO'),
(1, 8, 0, 20, 3, 45, FALSE, 'AVANCADO'),
(1, 9, 35, 10, 3, 60, FALSE, 'AVANCADO'),

-- Treino 2 (Pernas)
(2, 10, 30, 10, 3, 60, FALSE, 'INTERMEDIARIO'),
(2, 11, 25, 10, 3, 45, FALSE, 'INTERMEDIARIO'),
(2, 12, 80, 12, 4, 90, FALSE, 'INTERMEDIARIO'),

-- Treino 3 (Ombro)
(3, 13, 6, 15, 3, 30, FALSE, 'INICIANTE'),
(3, 14, 8, 12, 3, 45, FALSE, 'INICIANTE'),
(3, 15, 6, 12, 3, 45, FALSE, 'INICIANTE'),

-- Treino 4 (Cardio)
(4, 16, 0, 60, 3, 20, FALSE, 'INTERMEDIARIO'),
(4, 17, 0, 15, 3, 30, FALSE, 'INTERMEDIARIO'),
(4, 18, 0, 60, 3, 20, FALSE, 'INTERMEDIARIO'),
(4, 19, 0, 40, 3, 30, FALSE, 'INTERMEDIARIO'),

-- Treino 5 (Core)
(5, 20, 0, 20, 3, 20, FALSE, 'INTERMEDIARIO'),
(5, 21, 0, 15, 3, 30, FALSE, 'INTERMEDIARIO'),
(5, 22, 0, 20, 3, 30, FALSE, 'INTERMEDIARIO'),

-- Treino 6 a 10 (novos treinos de cada personal)
(6, 6, 50, 10, 4, 60, FALSE, 'INTERMEDIARIO'),
(6, 7, 14, 10, 3, 60, FALSE, 'INTERMEDIARIO'),
(6, 8, 0, 20, 3, 45, FALSE, 'INTERMEDIARIO'),
(6, 9, 30, 10, 3, 60, FALSE, 'INTERMEDIARIO'),
(6, 1, 60, 10, 4, 90, FALSE, 'INTERMEDIARIO'),

(7, 2, 70, 12, 3, 60, FALSE, 'INTERMEDIARIO'),
(7, 10, 35, 10, 3, 45, FALSE, 'INTERMEDIARIO'),
(7, 11, 20, 12, 4, 60, FALSE, 'INTERMEDIARIO'),
(7, 12, 90, 10, 3, 75, FALSE, 'INTERMEDIARIO'),
(7, 3, 40, 15, 3, 45, FALSE, 'INTERMEDIARIO'),

(8, 13, 10, 12, 3, 45, FALSE, 'INICIANTE'),
(8, 14, 12, 12, 3, 45, FALSE, 'INICIANTE'),
(8, 4, 15, 12, 3, 60, FALSE, 'INICIANTE'),
(8, 15, 10, 15, 3, 45, FALSE, 'INICIANTE'),
(8, 1, 40, 10, 3, 60, FALSE, 'INICIANTE'),

(9, 16, 0, 60, 3, 30, FALSE, 'INTERMEDIARIO'),
(9, 17, 0, 15, 3, 30, FALSE, 'INTERMEDIARIO'),
(9, 18, 0, 50, 3, 30, FALSE, 'INTERMEDIARIO'),
(9, 19, 0, 40, 3, 30, FALSE, 'INTERMEDIARIO'),
(9, 2, 50, 10, 3, 60, FALSE, 'INTERMEDIARIO'),

(10, 20, 0, 20, 3, 20, FALSE, 'INTERMEDIARIO'),
(10, 21, 0, 20, 3, 20, FALSE, 'INTERMEDIARIO'),
(10, 5, 0, 30, 4, 30, FALSE, 'INTERMEDIARIO'),
(10, 22, 0, 20, 3, 20, FALSE, 'INTERMEDIARIO'),
(10, 4, 10, 15, 3, 60, FALSE, 'INTERMEDIARIO');
-- -----------------------------------------------------
-- Table `vitalis`.`anamnese`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS vitalis.anamnese (
  id INT NOT NULL,
  alunos_id INT NOT NULL,
  objetivo_treino TEXT NOT NULL,
  lesao BOOLEAN NOT NULL,
  lesao_descricao TEXT NULL,
  frequencia_treino ENUM('1', '2', '3', '4', '5', '6', '7') NOT NULL,
  experiencia BOOLEAN NOT NULL,
  experiencia_descricao TEXT NULL,
  desconforto BOOLEAN NOT NULL,
  desconforto_descricao TEXT NULL,
  fumante BOOLEAN NOT NULL,
  proteses BOOLEAN NOT NULL,
  proteses_descricao TEXT NULL,
  doenca_metabolica BOOLEAN NOT NULL,
  doenca_metabolica_descricao TEXT NULL,
  deficiencia BOOLEAN NOT NULL,
  deficiencia_descricao TEXT NULL,
  PRIMARY KEY (id),
  INDEX fk_anamnese_alunos1_idx (alunos_id ASC),
  CONSTRAINT fk_anamnese_alunos1 FOREIGN KEY (alunos_id) REFERENCES vitalis.alunos (id)
);

INSERT INTO vitalis.anamnese (
  id, alunos_id, objetivo_treino, lesao, lesao_descricao, frequencia_treino,
  experiencia, experiencia_descricao, desconforto, desconforto_descricao,
  fumante, proteses, proteses_descricao, doenca_metabolica, doenca_metabolica_descricao,
  deficiencia, deficiencia_descricao
) VALUES
(1, 6, 'Perder peso e ganhar resistência.', FALSE, NULL, '3', TRUE, 'Musculação recreativa.', FALSE, NULL, FALSE, FALSE, NULL, FALSE, NULL, FALSE, NULL),
(2, 7, 'Ganhar massa muscular.', TRUE, 'Lesão no ombro direito.', '4', FALSE, NULL, TRUE, 'Desconforto nos joelhos.', TRUE, FALSE, NULL, FALSE, NULL, FALSE, NULL),
(3, 8, 'Melhorar performance em corridas.', FALSE, NULL, '5', TRUE, 'Participou de treinos intensivos.', FALSE, NULL, FALSE, FALSE, NULL, FALSE, NULL, FALSE, NULL),
(4, 9, 'Reabilitação física.', TRUE, 'Hérnia de disco.', '2', FALSE, NULL, TRUE, 'Desconforto lombar.', TRUE, TRUE, 'Prótese no joelho esquerdo.', TRUE, 'Diabetes tipo 2', FALSE, NULL),
(5, 10, 'Condicionamento geral.', FALSE, NULL, '5', TRUE, 'Fazia funcional com personal.', FALSE, NULL, FALSE, FALSE, NULL, FALSE, NULL, FALSE, NULL);


-- -----------------------------------------------------
-- Table `vitalis`.`alunos_treinos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`alunos_treinos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alunos_id` INT NOT NULL,
  `treinos_exercicios_id` INT NOT NULL,
  `data_horario_inicio` DATETIME NOT NULL,
  `data_horario_fim` DATETIME NULL DEFAULT NULL COMMENT 'Data de término do treino',
  `dias_semana` JSON NULL,
  `periodo_avaliacao` INT NOT NULL COMMENT 'Período em meses',
  `data_vencimento` DATE NOT NULL COMMENT 'Data do vencimento de um treino',
  PRIMARY KEY (`id`, `alunos_id`, `treinos_exercicios_id`),
  INDEX `aluno_id` (`alunos_id` ASC) VISIBLE,
  INDEX `fk_alunos_treinos_treinos_exercicios1_idx` (`treinos_exercicios_id` ASC) VISIBLE,
  CONSTRAINT `alunos_treinos_ibfk_1`
    FOREIGN KEY (`alunos_id`)
    REFERENCES `vitalis`.`alunos` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_alunos_treinos_treinos_exercicios1`
    FOREIGN KEY (`treinos_exercicios_id`)
    REFERENCES `vitalis`.`treinos_exercicios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
-- AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO vitalis.alunos_treinos (
  alunos_id, treinos_exercicios_id, data_horario_inicio, data_horario_fim, dias_semana, periodo_avaliacao, data_vencimento
) VALUES
(6, 1, '2025-04-01 08:00:00', '2025-04-01 09:00:00', '["Segunda", "Quarta", "Sexta"]', 1, "2025-06-01"),
(7, 2, '2025-04-02 09:00:00', '2025-04-02 10:00:00', '["Terça", "Quinta"]', 1, "2025-06-01"),
(8, 3, '2025-04-03 07:30:00', '2025-04-03 08:15:00', '["Segunda", "Quarta", "Sábado"]', 2, "2025-06-01"),
(9, 4, '2025-04-04 10:00:00', NULL, '["Segunda"]', 1, "2025-06-01"),
(10, 5, '2025-04-05 06:30:00', '2025-04-05 07:15:00', '["Todos"]', 3, "2025-06-01");


-- -----------------------------------------------------
-- Table `vitalis`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`estados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- EXEMPLO ATÉ PEGAR DA API
INSERT INTO vitalis.estados (nome) VALUES
('São Paulo'),
('Rio de Janeiro'),
('Minas Gerais'),
('Bahia'),
('Paraná');


-- -----------------------------------------------------
-- Table `vitalis`.`cidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`cidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `estados_id` INT NOT NULL,
  PRIMARY KEY (`id`, `estados_id`),
  INDEX `fk_cidades_estados1_idx` (`estados_id` ASC) VISIBLE,
  CONSTRAINT `fk_cidades_estados1`
    FOREIGN KEY (`estados_id`)
    REFERENCES `vitalis`.`estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- EXEMPLO ATÉ PEGAR DA API
INSERT INTO vitalis.cidades (nome, estados_id) VALUES
('São Paulo', 1),
('Campinas', 1),
('Rio de Janeiro', 2),
('Belo Horizonte', 3),
('Curitiba', 5);


-- -----------------------------------------------------
-- Table `vitalis`.`bairros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`bairros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cidades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bairros_cidades1_idx` (`cidades_id` ASC) VISIBLE,
  CONSTRAINT `fk_bairros_cidades1`
    FOREIGN KEY (`cidades_id`)
    REFERENCES `vitalis`.`cidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- EXEMPLO ATÉ PEGAR DA API
INSERT INTO vitalis.bairros (nome, cidades_id) VALUES
('Vila Mariana', 1),
('Centro', 2),
('Copacabana', 3),
('Savassi', 4),
('Batel', 5);


-- -----------------------------------------------------
-- Table `vitalis`.`personal_trainers_bairros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`personal_trainers_bairros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `personal_trainers_id` INT NOT NULL,
  `estados_id` INT NOT NULL,
  PRIMARY KEY (`id`, `personal_trainers_id`, `estados_id`),
  INDEX `fk_pessoas_bairros_personal_trainers1_idx` (`personal_trainers_id` ASC) VISIBLE,
  INDEX `fk_personal_trainers_bairros_estados1_idx` (`estados_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoas_bairros_personal_trainers1`
    FOREIGN KEY (`personal_trainers_id`)
    REFERENCES `vitalis`.`personal_trainers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_trainers_bairros_estados1`
    FOREIGN KEY (`estados_id`)
    REFERENCES `vitalis`.`estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO vitalis.personal_trainers_bairros (personal_trainers_id, estados_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5);


-- -----------------------------------------------------
-- Table `vitalis`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`planos` (
  `alunos_id` INT NOT NULL,
  `personal_trainers_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `status` ENUM('ATIVO', 'PENDENTE', 'INATIVO') NOT NULL,
  `periodo` ENUM('MENSAL', 'SEMESTRAL', 'AVULSO') NOT NULL,
  `quantidade_aulas` INT NOT NULL,
  `valor_aulas` DECIMAL(6,2) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`alunos_id`, `personal_trainers_id`),
  INDEX `fk_alunos_has_personal_trainers_personal_trainers1_idx` (`personal_trainers_id` ASC) VISIBLE,
  INDEX `fk_alunos_has_personal_trainers_alunos1_idx` (`alunos_id` ASC) VISIBLE,
  CONSTRAINT `fk_alunos_has_personal_trainers_alunos1`
    FOREIGN KEY (`alunos_id`)
    REFERENCES `vitalis`.`alunos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alunos_has_personal_trainers_personal_trainers1`
    FOREIGN KEY (`personal_trainers_id`)
    REFERENCES `vitalis`.`personal_trainers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO vitalis.planos (
  alunos_id, personal_trainers_id, nome, status, periodo, quantidade_aulas, valor_aulas, data_inicio, data_fim
) VALUES
(6, 1, 'Plano Básico', 'ATIVO', 'MENSAL', 8, 60.00, '2025-04-01', '2025-04-30'),
(7, 2, 'Plano Avulso', 'PENDENTE', 'AVULSO', 1, 80.00, '2025-04-03', NULL),
(8, 3, 'Plano Intensivo', 'ATIVO', 'SEMESTRAL', 48, 50.00, '2025-01-01', '2025-06-30'),
(9, 4, 'Reabilitação', 'INATIVO', 'MENSAL', 4, 70.00, '2025-03-01', '2025-03-31'),
(10, 5, 'Plano Premium', 'ATIVO', 'MENSAL', 12, 75.00, '2025-04-01', '2025-04-30');


-- -----------------------------------------------------
-- Table `vitalis`.`feedbacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`feedbacks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `descricao` TEXT NULL,
  `data_criacao` DATETIME NULL,
  `alunos_treinos_id` INT NOT NULL,
  `alunos_treinos_alunos_id` INT NOT NULL,
  `alunos_treinos_treinos_exercicios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_feedbacks_alunos_treinos1_idx` (`alunos_treinos_id` ASC, `alunos_treinos_alunos_id` ASC, `alunos_treinos_treinos_exercicios_id` ASC) VISIBLE,
  UNIQUE INDEX `alunos_treinos_id_UNIQUE` (`alunos_treinos_id` ASC) VISIBLE,
  CONSTRAINT `fk_feedbacks_alunos_treinos1`
    FOREIGN KEY (`alunos_treinos_id` , `alunos_treinos_alunos_id` , `alunos_treinos_treinos_exercicios_id`)
    REFERENCES `vitalis`.`alunos_treinos` (`id` , `alunos_id` , `treinos_exercicios_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO vitalis.feedbacks (
  titulo, descricao, data_criacao, alunos_treinos_id, alunos_treinos_alunos_id, alunos_treinos_treinos_exercicios_id
) VALUES
('Ótimo treino', 'Me senti muito bem após os exercícios!', '2025-04-01 10:00:00', 1, 6, 1),
('Dificuldade com carga', 'Achei a carga pesada no agachamento.', '2025-04-02 11:00:00', 2, 7, 2),
('Foco no core', 'Preciso de mais exercícios para o core.', '2025-04-03 08:30:00', 3, 8, 3),
('Treino leve', 'Foi um treino bem tranquilo, gostei.', '2025-04-04 10:30:00', 4, 9, 4),
('Muito intenso', 'Suei bastante, foi puxado.', '2025-04-05 07:30:00', 5, 10, 5);


-- -----------------------------------------------------
-- Table `vitalis`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `feedbacks_id` INT NOT NULL,
  `pessoas_id` INT NOT NULL,
  `descricao` TEXT NOT NULL,
  `data_criacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_autor` ENUM('PERSONAL', 'ALUNO') NOT NULL,
  `intensidade` ENUM('MUITO_LEVE', 'LEVE', 'MODERADO', 'INTENSA', 'MUITO_INTENSA') NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comentarios_topicos1_idx` (`feedbacks_id` ASC) VISIBLE,
  INDEX `fk_comentarios_pessoas1_idx` (`pessoas_id` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_topicos1`
    FOREIGN KEY (`feedbacks_id`)
    REFERENCES `vitalis`.`feedbacks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_pessoas1`
    FOREIGN KEY (`pessoas_id`)
    REFERENCES `vitalis`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO vitalis.comentarios (
  feedbacks_id, pessoas_id, descricao, tipo_autor, intensidade
) VALUES
(1, 1, 'Parabéns pelo empenho!', 'PERSONAL', 'MODERADO'),
(2, 2, 'Vamos ajustar a carga.', 'PERSONAL', 'INTENSA'),
(3, 8, 'Senti que foi fraco, quero mais.', 'ALUNO', 'LEVE'),
(4, 4, 'Bom trabalho, siga assim.', 'PERSONAL', 'MODERADO'),
(5, 10, 'Realmente cansativo, mas ótimo.', 'ALUNO', 'MUITO_INTENSA');

-- -----------------------------------------------------
-- Table `vitalis`.`evolucao_corporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`evolucao_corporal` (
  `id` INT NOT NULL,
  `tipo` ENUM("FRONTAL", "PERFIL_DIREITO", "PERFIL_ESQUERDO", "COSTAS") NOT NULL,
  `url_foto_shape` TEXT NULL,
  `data_envio` DATETIME NULL,
  `periodo_avaliacao` INT NOT NULL,
  `alunos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_evolucao_corporal_alunos1_idx` (`alunos_id` ASC) VISIBLE,
  CONSTRAINT `fk_evolucao_corporal_alunos1`
    FOREIGN KEY (`alunos_id`)
    REFERENCES `vitalis`.`alunos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO vitalis.evolucao_corporal (
  id, tipo, url_foto_shape, data_envio, periodo_avaliacao, alunos_id
) VALUES
(1, 'FRONTAL', 'https://img.com/aluno6-frontal.jpg', '2025-04-01 08:00:00', 1, 6),
(2, 'PERFIL_DIREITO', 'https://img.com/aluno7-perfil.jpg', '2025-04-02 09:00:00', 1, 7),
(3, 'COSTAS', 'https://img.com/aluno8-costas.jpg', '2025-04-03 07:30:00', 2, 8),
(4, 'FRONTAL', 'https://img.com/aluno9-frontal.jpg', '2025-04-04 10:00:00', 1, 9),
(5, 'PERFIL_ESQUERDO', 'https://img.com/aluno10-perfil.jpg', '2025-04-05 06:30:00', 3, 10);
