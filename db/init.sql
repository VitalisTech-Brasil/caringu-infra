/*!40101 SET NAMES utf8mb4 */;

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
  `senha` VARCHAR(255) NOT NULL,
  `celular` VARCHAR(11) NULL DEFAULT NULL,
  `url_foto_perfil` TEXT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `genero` ENUM('HOMEM_CISGENERO', 'HOMEM_TRANSGENERO', 'MULHER_CISGENERO', 'MULHER_TRANSGENERO', 'NAO_BINARIO') NOT NULL,
  `data_cadastro` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Pessoas para personal_trainers (IDs: 1 a 5)
INSERT INTO vitalis.pessoas (nome, email, senha, celular, url_foto_perfil, data_nascimento, genero ) VALUES
('Lucas Andrade', 'lucas.andrade@gmail.com', 'senha1234', '11998765432', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/personal-trainers/Lucas Andrade.png', '1990-03-15', 'HOMEM_CISGENERO'),
('Mariana Silva', 'mariana.silva@gmail.com', 'senha5678', '21998887766', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/personal-trainers/Mariana Silva.png', '1988-07-22', 'MULHER_CISGENERO'),
('João Pereira', 'joao.pereira@gmail.com', 'joao3210', '31999990000', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/personal-trainers/João Pereira.png', '1995-11-05', 'HOMEM_TRANSGENERO'),
('Ana Costa', 'ana.costa@gmail.com', 'anaana123', '21991234567', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/personal-trainers/Ana Costa.png', '1992-05-18', 'MULHER_TRANSGENERO'),

-- INSERT COM JWT (ID: 5)
('Ricardo Gomes da Silva', 'ricardo@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11997654321', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/ricardo.png', '1999-12-25', 'HOMEM_CISGENERO'),

-- Pessoas para alunos (IDs: 6 a 10)
('Carla Mendes', 'carla.mendes@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11994455667', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/carla.png', '1985-02-10', 'MULHER_TRANSGENERO'),
('Alex Nagano', 'alex.nagano@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11999887766', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/Nagano/nagano.png', '2000-12-01', 'NAO_BINARIO'),
('Suellen Lima', 'suellen.lima@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', NULL, 'https://storagevitalis.blob.core.windows.net/fotos-perfil/suellen/suel.png', '1997-09-12', 'MULHER_TRANSGENERO'),
('Diego Santos', 'diego.santos@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '21998877665', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/diego.png', NULL, 'HOMEM_TRANSGENERO'),
('Luna Martins', 'luna.martins@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766544', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/luna.jpg', '1993-04-25', 'HOMEM_CISGENERO'),
('Marcos Martins', 'marcos@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766513', 'https://storagevitalis.blob.core.windows.net/fotos-perfil/marcos (aluno).png', '1993-04-25', 'HOMEM_CISGENERO'),
('Flavio Martins', 'flavio@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766514', 'https://flavio.jpg', '1993-04-25', 'HOMEM_CISGENERO'),
('Otavio Martins', 'otavio@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766515', 'https://otavio.jpg', '1993-04-25', 'HOMEM_CISGENERO');




-- -----------------------------------------------------
-- Table `vitalis`.`personal_trainers`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS personal_trainers (
  id INT NOT NULL,
  cref VARCHAR(20) NOT NULL,
  experiencia INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_personal_trainers_pessoas FOREIGN KEY (id) 
    REFERENCES pessoas (id) ON DELETE CASCADE
);

INSERT INTO personal_trainers (id, cref, experiencia) VALUES
(1, 'CREF123456-SP', 15),
(2, 'CREF654321-SP', 5),
(3, 'CREF987654-RJ', 10),
(4, 'CREF112233-SP', 25),
(5, '123456-G/SP', 16);
-- -----------------------------------------------------
-- Table `vitalis`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.alunos (
  id INT NOT NULL,
  peso DECIMAL(5,2) NULL,
  altura DECIMAL(3,2) NULL,
  nivel_atividade ENUM("SEDENTARIO", "LEVEMENTE_ATIVO", "MODERADAMENTE_ATIVO", "MUITO_ATIVO", "EXTREMAMENTE_ATIVO") NULL,
  nivel_experiencia ENUM('INICIANTE', 'INTERMEDIARIO', 'AVANCADO') NULL,
  PRIMARY KEY (id),
  CONSTRAINT alunos_ibfk_1 FOREIGN KEY (id) REFERENCES vitalis.pessoas (id) ON DELETE CASCADE
);

INSERT INTO vitalis.alunos (id, peso, altura, nivel_atividade, nivel_experiencia) VALUES
(6, 75.50, 1.75, 'MODERADAMENTE_ATIVO', 'INTERMEDIARIO'),
(7, 65.20, 1.68, 'LEVEMENTE_ATIVO', 'INICIANTE'),
(8, 82.00, 1.80, 'MUITO_ATIVO', 'AVANCADO'),
(9, 90.30, 1.85, 'SEDENTARIO', 'INICIANTE'),
(10, 70.00, 1.65, 'EXTREMAMENTE_ATIVO', 'INTERMEDIARIO'),
(11, 78.90, 1.76, 'MODERADAMENTE_ATIVO', 'INTERMEDIARIO');
-- -----------------------------------------------------
-- Table `vitalis`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS especialidades (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO especialidades (nome)
VALUES
("Musculação"),
("Treinamento Funcional"),
("HIIT (Treino Intervalado de Alta Intensidade)"),
("Treinamento de Core"),
("Treinamento para Emagrecimento"),
("Corrida e Caminhada"),
("Ciclismo Indoor (Spinning)"),
("Treinamento Esportivo"),
("Treinamento para Atletas de Alto Rendimento"),
("Pilates"),
("Alongamento e Mobilidade"),
("Reabilitação e Prevenção de Lesões"),
("Hipertrofia Muscular"),
("Modelagem Corporal"),
("Treinamento para Pessoas com Deficiência"),
("Treinamento para Idosos"),
("Treinamento Pré e Pós-Parto"),
("Treinamento para Saúde Metabólica");

-- -----------------------------------------------------
-- Table `vitalis`.`personal_trainer_especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS personal_trainers_especialidades (
    personal_trainers_id INT NOT NULL,
    especialidades_id INT NOT NULL,
    PRIMARY KEY (personal_trainers_id, especialidades_id),
    FOREIGN KEY (personal_trainers_id) REFERENCES personal_trainers(id) ON DELETE CASCADE,
    FOREIGN KEY (especialidades_id) REFERENCES especialidades(id) ON DELETE CASCADE
);

-- Personal 1: Musculação, Treinamento Funcional
INSERT INTO personal_trainers_especialidades VALUES (1, 1), (1, 2);

-- Personal 2: Musculação, Emagrecimento
INSERT INTO personal_trainers_especialidades VALUES (2, 1), (2, 5);

-- Personal 3: Condicionamento Físico ≈ Treinamento de Core + Saúde Metabólica?
INSERT INTO personal_trainers_especialidades VALUES (3, 4), (3, 16);

-- Personal 4: Condicionamento Físico, Treinamento para Idosos
INSERT INTO personal_trainers_especialidades VALUES (4, 4), (4, 16);

-- Personal 5: Reabilitação e Alongamento ≈ Reabilitação + Mobilidade
INSERT INTO personal_trainers_especialidades VALUES (5, 11), (5, 12);

-- -----------------------------------------------------
-- Table `vitalis`.`notificacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notificacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoas_id INT NULL,
    tipo ENUM(
        'FEEDBACK_TREINO',
        'PAGAMENTO_REALIZADO',
        'PLANO_PROXIMO_VENCIMENTO',
        'NOVA_FOTO_PROGRESSO',
        'TREINO_PROXIMO_VENCIMENTO'
    ) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    visualizada BOOLEAN DEFAULT FALSE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_notificacao_usuario FOREIGN KEY (pessoas_id)
        REFERENCES pessoas(id)
        ON DELETE CASCADE
);

INSERT INTO notificacoes (pessoas_id, tipo, titulo, visualizada, data_criacao)
VALUES 
-- (1, 'FEEDBACK_TREINO', 'Feedback de Treino', FALSE, CURRENT_TIMESTAMP),
(2, 'PAGAMENTO_REALIZADO', 'Pagamento Confirmado', FALSE, CURRENT_TIMESTAMP),
(3, 'PLANO_PROXIMO_VENCIMENTO', 'Plano Próximo Vencimento', FALSE, CURRENT_TIMESTAMP);
-- (4, 'NOVA_FOTO_PROGRESSO', 'Nova Foto de Progresso', TRUE, CURRENT_TIMESTAMP),
-- (5, 'TREINO_PROXIMO_VENCIMENTO', 'O treino Core Explosivo do aluno Alex Rocha vencerá em breve (15/06/2025)', FALSE, CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Table `vitalis`.`preferencias_notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS preferencias_notificacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoas_id INT NULL,
    tipo ENUM(
        'FEEDBACK_TREINO',
        'PAGAMENTO_REALIZADO',
        'PLANO_PROXIMO_VENCIMENTO',
        'NOVA_FOTO_PROGRESSO',
        'TREINO_PROXIMO_VENCIMENTO'
    ) NOT NULL,
    ativada BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_preferencia_usuario FOREIGN KEY (pessoas_id)
        REFERENCES pessoas(id)
        ON DELETE CASCADE,

    CONSTRAINT uk_usuario_tipo UNIQUE (pessoas_id, tipo)
);

INSERT INTO preferencias_notificacao (pessoas_id, tipo, ativada)
VALUES 
-- (1, 'FEEDBACK_TREINO', TRUE),
(1, 'PAGAMENTO_REALIZADO', TRUE),
(1, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (1, 'NOVA_FOTO_PROGRESSO', TRUE),
(1, 'TREINO_PROXIMO_VENCIMENTO', FALSE),

-- (2, 'FEEDBACK_TREINO', FALSE),
(2, 'PAGAMENTO_REALIZADO', TRUE),
(2, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (2, 'NOVA_FOTO_PROGRESSO', FALSE),
(2, 'TREINO_PROXIMO_VENCIMENTO', FALSE),

-- (3, 'FEEDBACK_TREINO', FALSE),
(3, 'PAGAMENTO_REALIZADO', TRUE),
(3, 'PLANO_PROXIMO_VENCIMENTO', FALSE),
-- (3, 'NOVA_FOTO_PROGRESSO', TRUE),
(3, 'TREINO_PROXIMO_VENCIMENTO', FALSE),

-- (4, 'FEEDBACK_TREINO', FALSE),
(4, 'PAGAMENTO_REALIZADO', TRUE),
(4, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (4, 'NOVA_FOTO_PROGRESSO', FALSE),
(4, 'TREINO_PROXIMO_VENCIMENTO', TRUE),

-- (5, 'FEEDBACK_TREINO', TRUE),
(5, 'PAGAMENTO_REALIZADO', TRUE),
(5, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (5, 'NOVA_FOTO_PROGRESSO', TRUE),
(5, 'TREINO_PROXIMO_VENCIMENTO', TRUE);

-- -----------------------------------------------------
-- Table `vitalis`.`exercicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.exercicios (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  grupo_muscular ENUM('PEITORAL', 'COSTAS', 'PERNAS', 'OMBRO', 'BRACO', 'CORE', 'CARDIO') NOT NULL,
  url_video TEXT NULL,
  observacoes TEXT NULL,
  favorito BOOLEAN NULL DEFAULT FALSE,
  origem ENUM('BIBLIOTECA', 'PERSONAL') NOT NULL DEFAULT 'PERSONAL',
  PRIMARY KEY (id)
);

INSERT INTO vitalis.exercicios (nome, grupo_muscular, url_video, observacoes, favorito, origem) VALUES
-- Peitoral
('Supino Inclinado', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2023/09/barbell-incline-bench-press.gif', 'Ajustar banco entre 30° e 45°', FALSE, 'BIBLIOTECA'),
('Crucifixo com Halteres', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2020/06/dumbbell-incline-fly.gif', 'Manter braços semiflexionados e controlar o movimento', TRUE, 'BIBLIOTECA'),
('Flexões de Braço', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2018/09/pushup.gif', 'Não deixar o quadril cair durante o movimento', FALSE, 'BIBLIOTECA'),
('Peck Deck', 'PEITORAL', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/03/Supino-Inclinado-com-Halteres.gif?resize=500%2C500&ssl=1', 'Evitar bater os braços no final do movimento', FALSE, 'PERSONAL'),

-- Costas
('Barra', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-barra-fixa-pegada-aberta-palma-para-frente-chinup.gif', 'Evitar balanço do corpo e manter a escápula ativada', FALSE, 'PERSONAL'),
('Remada', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/09/remada-sentado-com-cabos-e-triangulo-para-costas.gif', 'Manter coluna neutra e puxar com os cotovelos', TRUE, 'PERSONAL'),
('Puxada Alta', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-puxada-aberta-com-barra-no-pulley.gif', 'Puxar até a altura do queixo sem inclinar o tronco para trás', FALSE, 'PERSONAL'),

-- Pernas
('Afundo', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/pernas-afundo-tradicional-sem-pesos-1.gif', 'Joelho da frente não deve ultrapassar a ponta do pé', FALSE, 'BIBLIOTECA'),
('Stiff com Halteres', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/09/levantamento-terra-deadlift-stiff-com-halteres-1.gif', 'Manter leve flexão nos joelhos e costas retas', TRUE, 'BIBLIOTECA'),
('Leg Press', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/pernas-leg-press-45-tradicional.gif', 'Não estender totalmente os joelhos na subida', FALSE, 'BIBLIOTECA'),

-- Ombro
('Elevação Lateral', 'OMBRO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-elevacao-lateral-de-ombros-com-halteres.gif', 'Elevar os braços até a linha dos ombros, sem impulso', TRUE, 'PERSONAL'),
('Desenvolvimento Arnold', 'OMBRO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-desenvolvimento-arnold-para-ombros.gif', 'Evitar estender totalmente os cotovelos no topo', FALSE, 'PERSONAL'),
('Elevação Frontal', 'OMBRO', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/04/Elevacao-frontal-com-dois-bracos-com-halteres.gif?resize=550%2C550&ssl=1', 'Levantar até a altura dos ombros com controle', FALSE, 'BIBLIOTECA'),

-- Braco
('Rosca direta', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2022/09/rosca-biceps-direta-com-halteres.gif', 'Evitar balançar o corpo; manter os cotovelos fixos', TRUE, 'PERSONAL'),
('Tríceps banco', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/triceps-no-banco.gif', 'Não deixar os ombros subirem durante a descida', FALSE, 'PERSONAL'),
('Rosca martelo', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/rosca-biceps-martelo-com-halteres.gif', 'Manter os cotovelos fixos ao lado do corpo', FALSE, 'PERSONAL'),

-- Core
('Prancha', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2014/12/prancha-frontal-tradicional-com-bracos-esticados.gif', 'Manter abdômen contraído e quadril na linha da coluna', FALSE, 'BIBLIOTECA'),
('Abdominal', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/abdominal.gif', 'Evitar forçar o pescoço; foco no abdômen', FALSE, 'BIBLIOTECA'),
('Bicicleta no ar', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/abdominal-bicicleta-no-ar.gif', 'Rotação do tronco com pernas em movimento controlado', TRUE, 'BIBLIOTECA'),
('Prancha lateral', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/prancha-lateral.gif', 'Alinhar o corpo e evitar que o quadril caia', FALSE, 'BIBLIOTECA'), 
('Elevação de pernas', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/abdominal-no-chao-com-elevacao-de-pernas-esticadas.gif', 'Evitar tirar a lombar do chão', FALSE, 'BIBLIOTECA'),
('Abdominal Tesoura', 'CORE', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/abdominal-tesoura.gif', 'Executar com respiração controlada e sem pressa', TRUE, 'BIBLIOTECA'),

-- Cardio
('Esteira', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/corrida-na-esteira-inclinada-1.gif', 'Postura ereta, respiração controlada', FALSE, 'BIBLIOTECA'),
('Bicicleta', 'CARDIO', 'https://example.com/burpee', 'Manter cadência constante e postura correta', TRUE, 'BIBLIOTECA'),
('Corda', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/01/26121301-Jump-Rope-male_Cardio_360-logo.gif', 'Pulos baixos e ritmo regular para evitar fadiga precoce', FALSE, 'BIBLIOTECA'),
('Escada', 'CARDIO', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/walking-on-stepmill.gif', 'Manter postura firme e não apoiar o peso nos braços', FALSE, 'BIBLIOTECA'),
('Burpee', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/burpee.gif', 'Controlar a lombar ao descer e manter ritmo constante', FALSE, 'BIBLIOTECA'), 
('Polichinelo', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/polichinelos.gif', 'Manter respiração contínua e braços sincronizados com pernas', FALSE, 'BIBLIOTECA');


-- -----------------------------------------------------
-- Table `vitalis`.`treinos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`treinos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `favorito` BOOLEAN NULL DEFAULT FALSE,
  `personal_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `personal_id` (`personal_id` ASC) VISIBLE,
  CONSTRAINT `treinos_ibfk_1`
    FOREIGN KEY (`personal_id`)
    REFERENCES `vitalis`.`personal_trainers` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO vitalis.treinos (nome, descricao, favorito, personal_id) VALUES
('Peito Avançado', 'Hipertrofia do peitoral com barra', FALSE, 1),
('Pernas Intermediário', 'Força e resistência nas pernas', FALSE, 2),
('Ombro Iniciante', 'Mobilidade e força básica', TRUE, 3),
('Cardio Funcional', 'Gasto calórico intenso com circuitos', TRUE, 4),
('Core e Estabilização', 'Foco em abdômen e lombar', TRUE, 5),
('Peito Funcional', 'Treino de resistência com foco funcional', TRUE, 1),
('Posterior Reforçado', 'Ênfase em posterior e glúteo', TRUE, 2),
('Ombros Ativos', 'Melhora da estabilidade do ombro', TRUE, 3),
('Cardio HIIT', 'Treino em alta intensidade intervalada', FALSE, 4),
('Core Explosivo', 'Abdômen com movimentos rápidos', FALSE, 5),
('Treino Funcional Total', 'Ativação do corpo todo com ênfase em agilidade', TRUE, 5),
('Abdômen Definido', 'Sequência intensa para definição abdominal', FALSE, 5),
('Mobilidade Articular', 'Rotina para melhorar amplitude de movimento', FALSE, 5),
('Resistência Corporal', 'Exercícios com peso corporal e longa duração', TRUE, 5),
('Full Body Avançado', 'Treino completo com alta intensidade', FALSE, 5),
('Upper Avançado', 'Treino completo com alta intensidade da parte superior', FALSE, 5);

-- -----------------------------------------------------
-- Table `vitalis`.`treinos_exercicios`
-- -----------------------------------------------------g

CREATE TABLE IF NOT EXISTS vitalis.treinos_exercicios (
  id INT NOT NULL AUTO_INCREMENT,
  treino_id INT,
  exercicio_id INT,
  carga DECIMAL(5,2) NOT NULL,
  repeticoes INT NOT NULL,
  series INT NOT NULL,
  descanso INT NOT NULL COMMENT 'Descanso em segundos',
  data_hora_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_hora_modificacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  origem ENUM('BIBLIOTECA', 'PERSONAL') NOT NULL DEFAULT 'PERSONAL',
  grau_dificuldade ENUM("INICIANTE", "INTERMEDIARIO", "AVANCADO") NOT NULL,
  
  PRIMARY KEY (id),
  -- REMOVIDO: UNIQUE INDEX (treino_id, exercicio_id) 
  INDEX treino_id (treino_id ASC),
  INDEX exercicio_id (exercicio_id ASC),
  CONSTRAINT treinos_exercicios_ibfk_1 FOREIGN KEY (treino_id) 
    REFERENCES vitalis.treinos (id) ON DELETE CASCADE,
  CONSTRAINT treinos_exercicios_ibfk_2 FOREIGN KEY (exercicio_id) 
    REFERENCES vitalis.exercicios (id) ON DELETE CASCADE
);
-- Treino 1 (Peitoral)
INSERT INTO vitalis.treinos_exercicios (treino_id, exercicio_id, carga, repeticoes, series, descanso, origem, grau_dificuldade) VALUES
(1, 6, 50, 10, 4, 90, 'PERSONAL', 'AVANCADO'),
(1, 7, 12, 12, 4, 60, 'BIBLIOTECA', 'AVANCADO'),
(1, 8, 1, 20, 3, 45, 'PERSONAL', 'AVANCADO'),
(1, 9, 35, 10, 3, 60, 'BIBLIOTECA', 'AVANCADO'),

-- Treino 2 (Pernas)
(2, 10, 30, 10, 3, 60, 'PERSONAL', 'INTERMEDIARIO'),
(2, 11, 25, 10, 3, 45, 'BIBLIOTECA', 'INTERMEDIARIO'),
(2, 12, 80, 12, 4, 90, 'PERSONAL', 'INTERMEDIARIO'),

-- Treino 3 (Ombro)
(3, 13, 6, 15, 3, 30, 'PERSONAL', 'INICIANTE'),
(3, 14, 8, 12, 3, 45, 'BIBLIOTECA', 'INICIANTE'),
(3, 15, 6, 12, 3, 45, 'BIBLIOTECA', 'INICIANTE'),

-- Treino 4 (Cardio)
(4, 16, 10, 60, 3, 20, 'BIBLIOTECA', 'INTERMEDIARIO'),
(4, 17, 15, 15, 3, 30, 'BIBLIOTECA', 'INTERMEDIARIO'),
(4, 18, 20, 60, 3, 20, 'PERSONAL', 'INTERMEDIARIO'),
(4, 19, 10, 40, 3, 30, 'PERSONAL', 'INTERMEDIARIO'),

-- Treino 5 (Core)
(5, 20, 10, 20, 3, 20, 'PERSONAL', 'INTERMEDIARIO'),
(5, 21, 10, 15, 3, 30, 'PERSONAL', 'INTERMEDIARIO'),
(5, 22, 10, 20, 3, 30, 'BIBLIOTECA', 'INTERMEDIARIO'),

-- Treino 6 a 10 (novos treinos de cada personal)
(6, 6, 50, 10, 4, 60, 'BIBLIOTECA', 'INTERMEDIARIO'),
(6, 7, 14, 10, 3, 60, 'BIBLIOTECA', 'INTERMEDIARIO'),
(6, 8, 10, 20, 3, 45, 'BIBLIOTECA', 'INTERMEDIARIO'),
(6, 9, 30, 10, 3, 60, 'BIBLIOTECA', 'INTERMEDIARIO'),
(6, 1, 60, 10, 4, 90, 'PERSONAL', 'INTERMEDIARIO'),

(7, 2, 70, 12, 3, 60, 'PERSONAL', 'INTERMEDIARIO'),
(7, 10, 35, 10, 3, 45, 'BIBLIOTECA', 'INTERMEDIARIO'),
(7, 11, 20, 12, 4, 60, 'PERSONAL', 'INTERMEDIARIO'),
(7, 12, 90, 10, 3, 75, 'PERSONAL', 'INTERMEDIARIO'),
(7, 3, 40, 15, 3, 45, 'PERSONAL', 'INTERMEDIARIO'),

(8, 13, 10, 12, 3, 45, 'PERSONAL', 'INICIANTE'),
(8, 14, 12, 12, 3, 45, 'PERSONAL', 'INICIANTE'),
(8, 4, 15, 12, 3, 60, 'BIBLIOTECA', 'INICIANTE'),
(8, 15, 10, 15, 3, 45, 'PERSONAL', 'INICIANTE'),
(8, 1, 40, 10, 3, 60, 'BIBLIOTECA', 'INICIANTE'),

(9, 16, 10, 60, 3, 30, 'BIBLIOTECA', 'INTERMEDIARIO'),
(9, 17, 10, 15, 3, 30, 'PERSONAL', 'INTERMEDIARIO'),
(9, 18, 10, 50, 3, 30, 'PERSONAL', 'INTERMEDIARIO'),
(9, 19, 10, 40, 3, 30, 'BIBLIOTECA', 'INTERMEDIARIO'),
(9, 2, 50, 10, 3, 60, 'PERSONAL', 'INTERMEDIARIO'),

(10, 20, 10, 20, 3, 20, 'PERSONAL', 'INTERMEDIARIO'),
(10, 21, 10, 20, 3, 20, 'BIBLIOTECA', 'INTERMEDIARIO'),
(10, 5, 10, 30, 4, 30, 'BIBLIOTECA', 'INTERMEDIARIO'),
(10, 22, 10, 20, 3, 20, 'BIBLIOTECA', 'INTERMEDIARIO'),
(10, 4, 10, 15, 3, 60, 'PERSONAL', 'INTERMEDIARIO'),

(11, 6, 40, 10, 4, 60, 'PERSONAL', 'INICIANTE'),
(12, 6, 50, 10, 4, 60, 'PERSONAL', 'INTERMEDIARIO'),
(13, 6, 60, 10, 4, 60, 'PERSONAL', 'AVANCADO'),
(14, 7, 40, 10, 4, 60, 'PERSONAL', 'INICIANTE'),
(15, 7, 50, 10, 4, 60, 'PERSONAL', 'INTERMEDIARIO'),
(16, 7, 60, 10, 4, 60, 'PERSONAL', 'AVANCADO');

-- -----------------------------------------------------
-- Table `vitalis`.`alunos_treinos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`alunos_treinos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `aluno_id` INT NOT NULL,
  `treino_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NULL,
  `status` ENUM('ATIVO', 'PAUSADO', 'FINALIZADO') NOT NULL DEFAULT 'ATIVO',
  PRIMARY KEY (`id`),
  INDEX `fk_aluno_idx` (`aluno_id` ASC) VISIBLE,
  INDEX `fk_treino_idx` (`treino_id` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_treinos_aluno`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `vitalis`.`alunos` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_aluno_treinos_treino`
    FOREIGN KEY (`treino_id`)
    REFERENCES `vitalis`.`treinos` (`id`)
    ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Dados de exemplo para alunos_treinos
INSERT INTO vitalis.alunos_treinos (aluno_id, treino_id, data_inicio, status) VALUES
(6, 1, '2025-07-31', 'ATIVO'),  -- João com Treino Força Iniciante
(7, 1, '2025-07-31', 'ATIVO'),  -- Maria com Treino Força Iniciante
(8, 2, '2025-07-31', 'ATIVO'),  -- Outro aluno com outro treino
(9, 3, '2025-07-31', 'ATIVO');  -- Mais um exemplo


-- -----------------------------------------------------
-- Table `vitalis`.`anamnese`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS vitalis.anamnese (
  id INT NOT NULL AUTO_INCREMENT,
  alunos_id INT NOT NULL UNIQUE,
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
  alunos_id, objetivo_treino, lesao, lesao_descricao, frequencia_treino,
  experiencia, experiencia_descricao, desconforto, desconforto_descricao,
  fumante, proteses, proteses_descricao, doenca_metabolica, doenca_metabolica_descricao,
  deficiencia, deficiencia_descricao
) VALUES
(6, 'Perder peso e ganhar resistência.', FALSE, NULL, '3', TRUE, 'Musculação recreativa.', FALSE, NULL, FALSE, FALSE, NULL, FALSE, NULL, FALSE, NULL),
(7, 'Ganhar massa muscular.', TRUE, 'Lesão no ombro direito.', '4', FALSE, NULL, TRUE, 'Desconforto nos joelhos.', TRUE, FALSE, NULL, FALSE, NULL, FALSE, NULL),
-- (8, 'Melhorar performance em corridas.', FALSE, NULL, '5', TRUE, 'Participou de treinos intensivos.', FALSE, NULL, FALSE, FALSE, NULL, FALSE, NULL, FALSE, NULL),
-- (9, 'Reabilitação física.', TRUE, 'Hérnia de disco.', '2', FALSE, NULL, TRUE, 'Desconforto lombar.', TRUE, TRUE, 'Prótese no joelho esquerdo.', TRUE, 'Diabetes tipo 2', FALSE, NULL),
(10, 'Condicionamento geral.', FALSE, NULL, '5', TRUE, 'Fazia funcional com personal.', FALSE, NULL, FALSE, FALSE, NULL, FALSE, NULL, FALSE, NULL);

-- Os dados desta tabela foram movidos para a estrutura correta de alunos_treinos definida anteriormente


CREATE TABLE IF NOT EXISTS `vitalis`.`treinos_finalizados` (
  id INT NOT NULL AUTO_INCREMENT,
  data_horario_inicio DATETIME NOT NULL,
  data_horario_fim DATETIME NULL DEFAULT NULL COMMENT 'Data de término do treino',
  alunos_treinos_id INT,

  PRIMARY KEY (id),
  CONSTRAINT `alunos_treinos_finalizados_ibfk_1` 
  FOREIGN KEY (`alunos_treinos_id`) 
  REFERENCES `vitalis`.`alunos_treinos` (`id`)
);

INSERT INTO vitalis.alunos_treinos (aluno_id, treino_id, data_inicio, status) VALUES
(6, 1, '2025-06-01', 'FINALIZADO'),  -- ID 1
(7, 1, '2025-06-02', 'FINALIZADO'),  -- ID 2
(8, 2, '2025-06-03', 'FINALIZADO'),  -- ID 3
(9, 3, '2025-06-04', 'FINALIZADO');  -- ID 4

INSERT INTO vitalis.treinos_finalizados (data_horario_inicio, data_horario_fim, alunos_treinos_id) VALUES
('2025-06-11 08:00:00', '2025-06-11 09:00:00', 1),
('2025-06-08 12:00:00', '2025-06-08 13:30:00', 2),
('2025-06-15 08:00:00', '2025-06-15 09:45:00', 3),
('2025-06-14 08:00:00', '2025-06-14 09:00:00', 4),
('2025-06-10 10:00:00', '2025-06-10 11:00:00', 1),
('2025-06-21 08:00:00', '2025-06-21 09:00:00', 2),
('2025-06-23 08:00:00', '2025-06-23 09:00:00', 3),
('2025-06-01 07:30:00', '2025-06-01 08:15:00', 4),
('2025-06-11 08:00:00', '2025-06-11 09:00:00', 1),
('2025-06-08 12:00:00', '2025-06-08 13:30:00', 2);

-- -----------------------------------------------------
-- Table `vitalis`.`planos`
-- Tabela de planos criados pelo personal trainer (modelos de plano)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.planos (
  id INT NOT NULL AUTO_INCREMENT,
  personal_trainers_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  periodo ENUM('MENSAL', 'SEMESTRAL', 'AVULSO') NOT NULL,
  quantidade_aulas INT NOT NULL,
  valor_aulas DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (personal_trainers_id)
    REFERENCES vitalis.personal_trainers(id)
    ON DELETE CASCADE
);

INSERT INTO vitalis.planos (personal_trainers_id, nome, periodo, quantidade_aulas, valor_aulas) VALUES
(1, 'Plano Básico', 'MENSAL', 8, 60.00),
(2, 'Plano Avulso', 'AVULSO', 1, 80.00),
(3, 'Plano Intensivo', 'SEMESTRAL', 48, 50.00),
(4, 'Reabilitação', 'MENSAL', 4, 70.00),
(5, 'Mensal Fit', 'MENSAL', 8, 65.00),
(5, 'Power', 'SEMESTRAL', 48, 50.00),
(5, 'Avulso Especial', 'AVULSO', 1, 85.00);

-- -----------------------------------------------------
-- Table `vitalis`.`planos`
-- Tabela de planos contratados pelos alunos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.planos_contratados (
  id INT NOT NULL AUTO_INCREMENT,
  planos_id INT NOT NULL,
  alunos_id INT NOT NULL,
  status ENUM('ATIVO', 'PENDENTE', 'INATIVO', 'EM_PROCESSO', 'CANCELADO') NOT NULL,
  data_contratacao DATE NULL,
  data_fim DATE NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (planos_id)
    REFERENCES vitalis.planos(id)
    ON DELETE CASCADE,
  FOREIGN KEY (alunos_id)
    REFERENCES vitalis.alunos(id)
    ON DELETE CASCADE
);

INSERT INTO vitalis.planos_contratados (planos_id, alunos_id, status, data_contratacao, data_fim) VALUES
-- Aluno 6
(1, 6, 'ATIVO', '2025-03-01', '2025-04-01'),
(5, 6, 'ATIVO', '2025-05-01', '2025-06-15'),

-- Aluno 7
(3, 7, 'ATIVO', '2025-01-01', '2025-04-30'),
(5, 7, 'ATIVO', '2025-05-01', '2025-06-01'),
(2, 7, 'PENDENTE', '2025-06-02', NULL), -- começa depois do último plano

-- Aluno 8
(3, 8, 'ATIVO', '2025-01-01', '2025-04-30'),
(5, 8, 'ATIVO', '2025-05-01', '2025-06-01'),

-- Aluno 9
(5, 9, 'ATIVO', '2025-05-01', '2025-05-31'),
(5, 9, 'PENDENTE', '2025-06-01', '2025-07-01'), -- começa quando o anterior termina
(4, 9, 'INATIVO', '2025-03-01', '2025-04-01'), -- histórico, sem conflito

-- Aluno 10
(5, 10, 'ATIVO', '2025-07-01', '2025-08-01'),
(7, 10, 'INATIVO', '2025-04-01', '2025-04-02'); -- histórico, sem conflito

-- -----------------------------------------------------
-- Table `vitalis`.`cidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.cidades (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

-- EXEMPLO ATÉ PEGAR DA API
INSERT INTO vitalis.cidades (nome) VALUES
('São Paulo'),
('Campinas'),
('Santos'),
('Sorocaba'),
('São José dos Campos');


-- -----------------------------------------------------
-- Table `vitalis`.`bairros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.bairros (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cidades_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_bairros_cidades1_idx (cidades_id ASC) VISIBLE,
  CONSTRAINT fk_bairros_cidades1
    FOREIGN KEY (cidades_id)
    REFERENCES vitalis.cidades (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- EXEMPLO ATÉ PEGAR DA API
INSERT INTO vitalis.bairros (nome, cidades_id) VALUES
('Vila Madalena', 1),
('Cambuí', 2),
('Gonzaga', 3),
('Parque Campolim', 4),
('Jardim Aquarius', 5);


-- -----------------------------------------------------
-- Table `vitalis`.`personal_trainers_bairros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vitalis.personal_trainers_bairros (
  id INT NOT NULL AUTO_INCREMENT,
  personal_trainers_id INT NULL,
  bairro_id INT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_personal_bairro (personal_trainers_id, bairro_id),
  CONSTRAINT fk_ptb_personal FOREIGN KEY (personal_trainers_id)
    REFERENCES vitalis.personal_trainers (id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ptb_bairro FOREIGN KEY (bairro_id)
    REFERENCES vitalis.bairros (id)
    ON DELETE CASCADE
) ENGINE = InnoDB;

INSERT INTO vitalis.personal_trainers_bairros (personal_trainers_id, bairro_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5);

-- -----------------------------------------------------
-- Table `vitalis`.`feedbacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`feedbacks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `descricao` TEXT NULL,
  `data_criacao` DATETIME NULL,
  `alunos_treinos_id` INT,
  PRIMARY KEY (`id`),
  INDEX `fk_feedbacks_alunos_treinos1_idx` (`alunos_treinos_id` ASC),
  CONSTRAINT `fk_feedbacks_alunos_treinos1`
    FOREIGN KEY (`alunos_treinos_id`)
    REFERENCES `vitalis`.`alunos_treinos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO vitalis.feedbacks (
  titulo, descricao, data_criacao, alunos_treinos_id
) VALUES
('Ótimo treino', 'Me senti muito bem após os exercícios!', '2025-04-01 10:00:00', 1),
('Dificuldade com carga', 'Achei a carga pesada no agachamento.', '2025-04-02 11:00:00', 2),
('Foco no core', 'Preciso de mais exercícios para o core.', '2025-04-03 08:30:00', 3),
('Treino leve', 'Foi um treino bem tranquilo, gostei.', '2025-04-04 10:30:00', 4),
('Muito intenso', 'Suei bastante, foi puxado.', '2025-04-05 07:30:00', 5);


-- -----------------------------------------------------
-- Table `vitalis`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vitalis`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `feedbacks_id` INT,
  `pessoas_id` INT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM("FRONTAL", "PERFIL_DIREITO", "PERFIL_ESQUERDO", "COSTAS") NOT NULL,
  `url_foto_shape` TEXT NULL,
  `data_envio` DATETIME NULL,
  `periodo_avaliacao` INT NOT NULL,
  `alunos_id` INT,
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

CREATE TABLE IF NOT EXISTS esqueci_senha (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  token VARCHAR(255) NOT NULL,
  data_expiracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table `vitalis`.`execucao_exercicios`
-- -----------------------------------------------------
CREATE TABLE execucoes_exercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sessao_treino_id INT NOT NULL,
    treino_exercicio_id INT NOT NULL COMMENT 'Referência específica ao exercício do treino',
    
    -- Valores planejados (copiados do treino)
    carga_planejada DECIMAL(5,2),
    repeticoes_planejadas INT,
    series_planejadas INT,
    descanso_planejado INT,
    
    -- Valores executados
    carga_executada DECIMAL(5,2),
    repeticoes_executadas INT,
    series_executadas INT,
    
    FOREIGN KEY (sessao_treino_id) 
        REFERENCES treinos_finalizados(id) ON DELETE CASCADE,
    FOREIGN KEY (treino_exercicio_id) 
        REFERENCES treinos_exercicios(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table `vitalis`.`alunos_treinos_exercicios`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS vitalis.alunos_treinos_exercicios (
  id INT NOT NULL AUTO_INCREMENT,
  aluno_treino_id INT NOT NULL,
  exercicio_id INT NOT NULL COMMENT 'Referência direta ao exercício da biblioteca',
  carga DECIMAL(5,2) NOT NULL,
  repeticoes INT NOT NULL,
  series INT NOT NULL,
  descanso INT NOT NULL COMMENT 'Descanso em segundos',
  observacoes_personalizadas TEXT NULL,
  data_modificacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  PRIMARY KEY (id),
  INDEX fk_aluno_treino_idx (aluno_treino_id ASC),
  INDEX fk_exercicio_idx (exercicio_id ASC),
  
  CONSTRAINT fk_alunos_treinos_exercicios_aluno_treino
    FOREIGN KEY (aluno_treino_id)
    REFERENCES vitalis.alunos_treinos (id)
    ON DELETE CASCADE,
    
  CONSTRAINT fk_alunos_treinos_exercicios_exercicio
    FOREIGN KEY (exercicio_id)
    REFERENCES vitalis.exercicios (id)
    ON DELETE CASCADE
    
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- aaaaaaaa
-- -----------------------------------------------------

INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
-- ========== SESSÃO 1: Carla Mendes (11/06) - Treino Peito ==========
-- sessao_treino_id = 1 (primeira entrada dos treinos_finalizados)
-- Baseado no treino 1 (Peito Avançado) que tem exercícios: 6,7,8,9 = treino_exercicio_ids 1,2,3,4
(1, 1, 50.00, 10, 4, 90, 45.00, 8, 4),   -- Peck Deck (exercicio_id = 6)
(1, 2, 12.00, 12, 4, 60, 10.00, 10, 4),  -- Crucifixo com Halteres (exercicio_id = 7)
(1, 3, 1.00, 20, 3, 45, 1.00, 15, 3),    -- Flexões de Braço (exercicio_id = 8)
(1, 4, 35.00, 10, 3, 60, 30.00, 10, 3),  -- Peck Deck (exercicio_id = 9)

-- ========== SESSÃO 2: Alex Nagano (08/06) - Treino Peito ==========
-- sessao_treino_id = 2
(2, 1, 50.00, 10, 4, 90, 47.50, 9, 4),   -- Peck Deck - progredindo
(2, 2, 12.00, 12, 4, 60, 12.00, 12, 4),  -- Crucifixo - melhorou!
(2, 3, 1.00, 20, 3, 45, 1.00, 18, 3),    -- Flexões - quase lá
(2, 4, 35.00, 10, 3, 60, 32.50, 10, 3),  -- Peck Deck - diminuiu carga

-- ========== SESSÃO 3: Suellen Lima (15/06) - Treino Pernas ==========
-- sessao_treino_id = 3, aluno 8 faz treino 2 (Pernas) = treino_exercicio_ids 5,6,7
(3, 5, 30.00, 10, 3, 60, 25.00, 12, 3),  -- Afundo (exercicio_id = 10)
(3, 6, 25.00, 10, 3, 45, 25.00, 10, 3),  -- Stiff com Halteres (exercicio_id = 11)
(3, 7, 80.00, 12, 4, 90, 70.00, 12, 4),  -- Leg Press (exercicio_id = 12)

-- ========== SESSÃO 4: Diego Santos (14/06) - Treino Ombro ==========
-- sessao_treino_id = 4, aluno 9 faz treino 3 (Ombro) = treino_exercicio_ids 8,9,10
(4, 8, 6.00, 15, 3, 30, 6.00, 15, 3),    -- Elevação Lateral (exercicio_id = 13)
(4, 9, 8.00, 12, 3, 45, 8.00, 12, 3),    -- Desenvolvimento Arnold (exercicio_id = 14)
(4, 10, 6.00, 12, 3, 45, 6.00, 12, 3),   -- Elevação Frontal (exercicio_id = 15)

-- ========== SESSÃO 5: Carla Mendes (10/06) - Segunda sessão ==========
-- sessao_treino_id = 5
(5, 1, 50.00, 10, 4, 90, 50.00, 10, 4),  -- Peck Deck - perfeito!
(5, 2, 12.00, 12, 4, 60, 14.00, 12, 4),  -- Crucifixo - superou!
(5, 3, 1.00, 20, 3, 45, 1.00, 22, 3),    -- Flexões - excelente!
(5, 4, 35.00, 10, 3, 60, 35.00, 10, 3);  -- Peck Deck - certinho

INSERT INTO vitalis.treinos_finalizados (data_horario_inicio, data_horario_fim, alunos_treinos_id) VALUES
('2025-08-19 08:00:00', '2025-08-19 09:15:00', 1),  -- Carla Mendes
('2025-08-19 15:30:00', '2025-08-19 16:45:00', 2),  -- Alex Nagano  
('2025-08-20 07:00:00', '2025-08-20 08:30:00', 3),  -- Suellen Lima
('2025-08-20 18:00:00', '2025-08-20 19:00:00', 4);  -- Diego Santos

INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
-- Treino de 19/08 - Manhã (Carla) - sessao_treino_id = 11
(11, 2, 12.00, 12, 4, 60, 12.00, 12, 4),  -- Crucifixo com Halteres
(11, 3, 1.00, 20, 3, 45, 1.00, 18, 3),    -- Flexões de Braço
(11, 4, 35.00, 10, 3, 60, 35.00, 10, 3),  -- Peck Deck

-- Treino de 19/08 - Tarde (Alex) - sessao_treino_id = 12
(12, 2, 12.00, 12, 4, 60, 14.00, 12, 4),  -- Crucifixo - superou novamente!
(12, 3, 1.00, 20, 3, 45, 1.00, 22, 3),    -- Flexões - mantém excelência

-- Treino de 20/08 - Manhã (Suellen) - sessao_treino_id = 13
(13, 5, 30.00, 10, 3, 60, 28.00, 12, 3),  -- Afundo - evoluindo
(13, 6, 25.00, 10, 3, 45, 25.00, 10, 3),  -- Stiff - mantém forma

-- Treino de 20/08 - Tarde (Diego) - sessao_treino_id = 14
(14, 8, 6.00, 15, 3, 30, 6.00, 15, 3);    -- Elevação Lateral - consistente