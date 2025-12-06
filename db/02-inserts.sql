-- Pessoas para personal_trainers (IDs: 1 a 5)
INSERT INTO vitalis.pessoas (nome, email, senha, celular, url_foto_perfil, data_nascimento, genero, perfil_completo ) VALUES
('Lucas Andrade', 'lucas.andrade@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11998765432', '6bbe52f9-d56c-48d3-bfdc-8691ac040a9e-1761507577568.png', '1990-03-15', 'HOMEM_CISGENERO', true),
('Mariana Silva', 'mariana.silva@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '21998887766', '8d15801c-a912-45c6-b684-c3886be1e117-1761513676597.png', '1988-07-22', 'MULHER_CISGENERO', true),
('João Pereira', 'joao.pereira@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31999990000', '7ae978a1-a3fe-4117-a759-e0dd33df5717-1761513715924.png', '1995-11-05', 'HOMEM_TRANSGENERO', true),
('Ana Costa', 'ana.costa@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '21991234567', 'da2e33a1-0a90-4b88-947b-6036666a94b6-1761513750076.png', '1992-05-18', 'MULHER_TRANSGENERO', true),

-- INSERT COM JWT (ID: 5)
('Monica Luiz Borges Moreno', 'monica@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11997654321', 'dc7851dd-d7cd-410f-a1ba-4440446c65c4-1761507342320.png', '1999-12-25', 'MULHER_CISGENERO', true),

-- Pessoas para alunos (IDs: 6 a 10)
('Suellen Lima', 'suellen@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', NULL, '3e146be8-947e-4057-827f-376d0f9cd23c-1761513023243.png', '1997-09-12', 'MULHER_TRANSGENERO', true),
('Alex Nagano', 'alex.nagano@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11999887766', '7c474380-6068-4e13-8b93-33c8ce08bb57-1762038689694.png', '2000-12-01', 'NAO_BINARIO', true),
('Carla Mendes', 'carla.mendes@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '11994455667', '441ffd16-fed6-48f8-b76e-46c282d55713-1761512959626.png', '1985-02-10', 'MULHER_TRANSGENERO', true),
('Diego Santos', 'diego.santos@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '21998877665', 'f1ea42f3-b7b4-437e-be1c-c7e76878a501-1761513091401.png', NULL, 'HOMEM_TRANSGENERO', true),
('Luna Martins', 'luna.martins@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766544', '9fdb9e2d-aec8-4e7d-810c-218363edc86b-1761513334546.png', '1993-04-25', 'HOMEM_CISGENERO', true),
('Marcos Martins', 'marcos@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766513', '46898760-5dc0-4e98-b64d-c3cd65267c80-1761513560594.png', '1993-04-25', 'HOMEM_CISGENERO', true),
('Flavio Martins', 'flavio@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766514', 'https://flavio.jpg', '1993-04-25', 'HOMEM_CISGENERO', true),
('Otavio Martins', 'otavio@gmail.com', '$2a$10$pn9w6oGeHHfo8WBghLvKvuw.ed5GMYuLw0Tpy0XKPHI5lQTv2HdP.', '31997766515', 'https://otavio.jpg', '1993-04-25', 'HOMEM_CISGENERO', true);

INSERT INTO personal_trainers (id, cref, experiencia) VALUES
(1, 'CREF123456-SP', 15),
(2, 'CREF654321-SP', 5),
(3, 'CREF987654-RJ', 10),
(4, 'CREF112233-SP', 25),
(5, '123456-G/SP', 16);

INSERT INTO vitalis.alunos (id, peso, altura, nivel_atividade, nivel_experiencia) VALUES
(6, 75.50, 1.75, 'MODERADAMENTE_ATIVO', 'INTERMEDIARIO'),
(7, 65.20, 1.68, 'LEVEMENTE_ATIVO', 'INICIANTE'),
(8, 82.00, 1.80, 'MUITO_ATIVO', 'AVANCADO'),
(9, 90.30, 1.85, 'SEDENTARIO', 'INICIANTE'),
(10, 70.00, 1.65, 'EXTREMAMENTE_ATIVO', 'INTERMEDIARIO'),
(11, 78.90, 1.76, 'MODERADAMENTE_ATIVO', 'INTERMEDIARIO');

INSERT INTO vitalis.exercicios (personal_id, nome, grupo_muscular, url_video, observacoes, favorito, origem) VALUES
-- Peitoral
(5, 'Supino Inclinado', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2023/09/barbell-incline-bench-press.gif', 'Ajustar banco entre 30° e 45°', FALSE, 'PERSONAL'),
(5, 'Crucifixo com Halteres', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2020/06/dumbbell-incline-fly.gif', 'Manter braços semiflexionados e controlar o movimento', TRUE, 'PERSONAL'),
(5, 'Flexões de Braço', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2018/09/pushup.gif', 'Não deixar o quadril cair durante o movimento', FALSE, 'PERSONAL'),
(5, 'Peck Deck', 'PEITORAL', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/03/Supino-Inclinado-com-Halteres.gif?resize=500%2C500&ssl=1', 'Evitar bater os braços no final do movimento', FALSE, 'PERSONAL'),

(NULL, 'Supino', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2023/09/barbell-incline-bench-press.gif', 'Ajustar banco entre 30° e 45°', FALSE, 'BIBLIOTECA'),
(NULL, 'Crucifixo', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2020/06/dumbbell-incline-fly.gif', 'Manter braços semiflexionados e controlar o movimento', TRUE, 'BIBLIOTECA'),
(NULL, 'Flexões', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2018/09/pushup.gif', 'Não deixar o quadril cair durante o movimento', FALSE, 'BIBLIOTECA'),
(NULL, 'Peck Deck', 'PEITORAL', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/03/Supino-Inclinado-com-Halteres.gif?resize=500%2C500&ssl=1', 'Evitar bater os braços no final do movimento', FALSE, 'BIBLIOTECA'),

-- Costas
(5, 'Barra', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-barra-fixa-pegada-aberta-palma-para-frente-chinup.gif', 'Evitar balanço do corpo e manter a escápula ativada', FALSE, 'PERSONAL'),
(5, 'Remada', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/09/remada-sentado-com-cabos-e-triangulo-para-costas.gif', 'Manter coluna neutra e puxar com os cotovelos', TRUE, 'PERSONAL'),
(5, 'Puxada Alta', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-puxada-aberta-com-barra-no-pulley.gif', 'Puxar até a altura do queixo sem inclinar o tronco para trás', FALSE, 'PERSONAL'),

-- Pernas
(5, 'Afundo', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/pernas-afundo-tradicional-sem-pesos-1.gif', 'Joelho da frente não deve ultrapassar a ponta do pé', FALSE, 'PERSONAL'),
(NULL, 'Afundo Tradicional', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/pernas-afundo-tradicional-sem-pesos-1.gif', 'Joelho da frente não deve ultrapassar a ponta do pé', FALSE, 'BIBLIOTECA'),

(5, 'Stiff com Halteres', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/09/levantamento-terra-deadlift-stiff-com-halteres-1.gif', 'Manter leve flexão nos joelhos e costas retas', TRUE, 'PERSONAL'),
(5, 'Leg Press', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/pernas-leg-press-45-tradicional.gif', 'Não estender totalmente os joelhos na subida', FALSE, 'PERSONAL'),

-- Ombro
(5, 'Elevação Lateral', 'OMBRO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-elevacao-lateral-de-ombros-com-halteres.gif', 'Elevar os braços até a linha dos ombros, sem impulso', TRUE, 'PERSONAL'),
(5, 'Desenvolvimento Arnold', 'OMBRO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-desenvolvimento-arnold-para-ombros.gif', 'Evitar estender totalmente os cotovelos no topo', FALSE, 'PERSONAL'),
(5, 'Elevação Frontal', 'OMBRO', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/04/Elevacao-frontal-com-dois-bracos-com-halteres.gif?resize=550%2C550&ssl=1', 'Levantar até a altura dos ombros com controle', FALSE, 'PERSONAL'),

-- Braço
(5, 'Rosca direta', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2022/09/rosca-biceps-direta-com-halteres.gif', 'Evitar balançar o corpo; manter os cotovelos fixos', TRUE, 'PERSONAL'),
(5, 'Tríceps banco', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/triceps-no-banco.gif', 'Não deixar os ombros subirem durante a descida', FALSE, 'PERSONAL'),
(5, 'Rosca martelo', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/rosca-biceps-martelo-com-halteres.gif', 'Manter os cotovelos fixos ao lado do corpo', FALSE, 'PERSONAL'),
(NULL, 'Rosca com halteres', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/rosca-biceps-martelo-com-halteres.gif', 'Manter os cotovelos fixos ao lado do corpo', FALSE, 'BIBLIOTECA'),

-- Core
(5, 'Prancha', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2014/12/prancha-frontal-tradicional-com-bracos-esticados.gif', 'Manter abdômen contraído e quadril na linha da coluna', FALSE, 'PERSONAL'),
(NULL, 'Prancha Frontal', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2014/12/prancha-frontal-tradicional-com-bracos-esticados.gif', 'Manter abdômen contraído e quadril na linha da coluna', FALSE, 'BIBLIOTECA'),

(5, 'Abdominal', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/abdominal.gif', 'Evitar forçar o pescoço; foco no abdômen', FALSE, 'PERSONAL'),
(5, 'Bicicleta no ar', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/abdominal-bicicleta-no-ar.gif', 'Rotação do tronco com pernas em movimento controlado', TRUE, 'PERSONAL'),
(5, 'Prancha lateral', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/prancha-lateral.gif', 'Alinhar o corpo e evitar que o quadril caia', FALSE, 'PERSONAL'),
(5, 'Elevação de pernas', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/abdominal-no-chao-com-elevacao-de-pernas-esticadas.gif', 'Evitar tirar a lombar do chão', FALSE, 'PERSONAL'),

(5, 'Abdominal Tesoura', 'CORE', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/abdominal-tesoura.gif', 'Executar com respiração controlada e sem pressa', TRUE, 'PERSONAL'),
(NULL, 'Abdominal', 'CORE', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/abdominal-tesoura.gif', 'Executar com respiração controlada e sem pressa', TRUE, 'BIBLIOTECA'),

-- Cardio
(5, 'Esteira', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/corrida-na-esteira-inclinada-1.gif', 'Postura ereta, respiração controlada', FALSE, 'PERSONAL'),
(NULL, 'Esteira Inclinada', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/corrida-na-esteira-inclinada-1.gif', 'Postura ereta, respiração controlada', FALSE, 'BIBLIOTECA'),

(5, 'Bicicleta', 'CARDIO', 'https://example.com/burpee', 'Manter cadência constante e postura correta', TRUE, 'PERSONAL'),
(5, 'Corda', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/01/26121301-Jump-Rope-male_Cardio_360-logo.gif', 'Pulos baixos e ritmo regular para evitar fadiga precoce', FALSE, 'PERSONAL'),
(5, 'Escada', 'CARDIO', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/walking-on-stepmill.gif', 'Manter postura firme e não apoiar o peso nos braços', FALSE, 'PERSONAL'),

(5, 'Burpee', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/burpee.gif', 'Controlar a lombar ao descer e manter ritmo constante', FALSE, 'PERSONAL'),
(NULL, 'Burpee Acelerado', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/burpee.gif', 'Controlar a lombar ao descer e manter ritmo constante', FALSE, 'BIBLIOTECA'),

(5, 'Polichinelo', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/polichinelos.gif', 'Manter respiração contínua e braços sincronizados com pernas', FALSE, 'PERSONAL'),
(NULL, 'Polichinelo com Respiração Contínua ', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/polichinelos.gif', 'Manter respiração contínua e braços sincronizados com pernas', FALSE, 'BIBLIOTECA');

-- ========================================
-- TABELA: treinos
-- ========================================
INSERT INTO vitalis.treinos (nome, descricao, favorito, personal_id, origem, grau_dificuldade) VALUES

-- PERSONAIS (11 treinos)
('Peito Avançado', 'Hipertrofia do peitoral com barra', TRUE, 5, 'PERSONAL', 'AVANCADO'),
('Peito e Braço Avançado', 'Hipertrofia máxima do peitoral e bíceps/tríceps', FALSE, 5, 'PERSONAL', 'AVANCADO'),
('Pernas e Core Intermediário', 'Força nas pernas com estabilização abdominal', FALSE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Costas e Ombro Intermediário', 'Foco em dorsais e estabilidade do ombro', TRUE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Cardio e Core Funcional', 'Alta intensidade para queima calórica e abdômen', FALSE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Full Body Iniciante', 'Treino geral para iniciantes com todos os grupos', TRUE, 5, 'PERSONAL', 'INICIANTE'),
('Peito e Costas Intermediário', 'Empurrar e puxar para equilíbrio muscular', FALSE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Pernas Avançado', 'Foco em força máxima e hipertrofia de inferiores', FALSE, 5, 'PERSONAL', 'AVANCADO'),
('Braço e Ombro Iniciante', 'Força básica para braços e estabilidade do ombro', TRUE, 5, 'PERSONAL', 'INICIANTE'),
('Cardio Intenso', 'Circuito cardiovascular para condicionamento', FALSE, 5, 'PERSONAL', 'AVANCADO'),
('Core Avançado', 'Abdômen e lombar com exercícios de alto desafio', TRUE, 5, 'PERSONAL', 'AVANCADO'),

-- BIBLIOTECA (2 treinos globais)
('Treino Funcional Básico', 'Treino leve com exercícios multiarticulares', FALSE, NULL, 'BIBLIOTECA', 'INICIANTE'),
('Treino Completo Academia', 'Rotina equilibrada para todos os grupos musculares', FALSE, NULL, 'BIBLIOTECA', 'INTERMEDIARIO');

-- ========================================
-- TABELA: treinos_exercicios
-- ========================================
INSERT INTO vitalis.treinos_exercicios 
(treinos_id, exercicios_id, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES

-- Treino 1: Peito Avançado
(1, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(1, 2, 12, 12, 4, 60, NULL),
(1, 3, 1, 20, 3, 45, 'Foco em resistência'),
(1, 4, 35, 10, 3, 60, NULL),

-- Treino 2: Peito e Braço Avançado
(2, 5, 50, 10, 4, 90, 'Ajustar técnica'),
(2, 6, 12, 12, 4, 60, NULL),
(2, 7, 1, 20, 3, 45, 'Foco em resistência'),
(2, 8, 35, 10, 3, 60, NULL),

-- Treino 3: Pernas e Core Intermediário
(3, 1, 60, 8, 4, 90, 'Supino pesado, foco em hipertrofia'),
(3, 2, 18, 10, 4, 60, NULL),
(3, 17, 25, 8, 4, 60, NULL),
(3, 18, 20, 12, 4, 60, 'Controlar descida'),

-- Treino 4: Costas e Ombro Intermediário
(4, 13, 20, 12, 3, 60, NULL),
(4, 15, 100, 10, 4, 90, 'Não travar joelhos'),
(4, 14, 24, 10, 3, 60, NULL),
(4, 21, 0, 30, 3, 45, 'Segurar posição correta'),
(4, 23, 0, 20, 3, 45, NULL),

-- Treino 5: Cardio e Core Funcional
(5, 9, 0, 10, 4, 90, 'Amplitudes completas'),
(5, 10, 40, 12, 3, 60, NULL),
(5, 11, 45, 10, 4, 90, NULL),
(5, 16, 10, 12, 3, 60, 'Subir controlado'),
(5, 17, 20, 10, 3, 60, NULL),

-- Treino 6: Full Body Iniciante
(6, 27, 0, 60, 3, 30, 'Ritmo moderado'),
(6, 29, 0, 40, 3, 30, NULL),
(6, 31, 0, 12, 3, 45, NULL),
(6, 19, 0, 20, 3, 30, 'Ativar abdômen'),
(6, 22, 0, 20, 3, 45, NULL),

-- Treino 7: Peito e Costas Intermediário
(7, 1, 30, 12, 3, 60, NULL),
(7, 9, 0, 8, 3, 60, 'Execução assistida'),
(7, 13, 12, 12, 3, 60, NULL),
(7, 17, 6, 12, 3, 45, NULL),
(7, 19, 0, 20, 3, 45, NULL),
(7, 21, 0, 30, 3, 45, 'Manter quadril alinhado'),

-- Treino 8: Pernas Avançado
(8, 1, 50, 10, 4, 90, NULL),
(8, 3, 0, 20, 3, 60, NULL),
(8, 10, 40, 12, 4, 60, NULL),
(8, 11, 45, 10, 3, 90, 'Controle no movimento'),

-- Treino 9: Braço e Ombro Iniciante
(9, 15, 120, 8, 5, 90, 'Máxima força'),
(9, 14, 30, 10, 4, 90, NULL),
(9, 13, 25, 12, 4, 60, NULL),
(9, 23, 0, 15, 4, 45, 'Evitar tirar lombar do chão'),

-- Treino 10: Cardio Intenso
(10, 17, 8, 12, 3, 60, NULL),
(10, 18, 12, 12, 3, 60, NULL),
(10, 16, 6, 12, 3, 45, NULL),
(10, 17, 6, 12, 3, 45, 'Controle total do movimento'),

-- Treino 11: Core Avançado
(11, 25, 12, 300, 1, 45, 'Corrida contínua'),
(11, 26, 12, 10, 3, 45, 'RPM moderado'),
(11, 32, 8, 20, 3, 30, 'Explosão máxima'),
(11, 23, 8, 15, 3, 45, 'Manter postura'),

-- Treino 12: Treino Funcional Básico
(12, 24, 8, 15, 4, 45, NULL),
(12, 23, 12, 20, 4, 45, NULL),
(12, 22, 8, 20, 4, 45, NULL),
(12, 31, 12, 15, 4, 45, 'Evitar compensar com lombar');

INSERT INTO vitalis.planos (personal_trainers_id, nome, periodo, quantidade_aulas, valor_aulas) VALUES
(1, 'Plano Básico', 'MENSAL', 8, 60.00),
(2, 'Plano Avulso', 'AVULSO', 1, 80.00),
(3, 'Plano Intensivo', 'SEMESTRAL', 48, 50.00),
(4, 'Reabilitação', 'MENSAL', 4, 70.00),
(5, 'Mensal Fit', 'MENSAL', 8, 65.00),
(5, 'Power', 'SEMESTRAL', 48, 50.00),
(5, 'Avulso Especial', 'AVULSO', 1, 85.00);

INSERT INTO vitalis.planos_contratados (planos_id, alunos_id, status, data_contratacao, data_fim) VALUES
-- Aluno 6
(5, 6, 'INATIVO', '2025-05-01', '2025-06-01'),
(6, 6, 'ATIVO', '2025-06-01', '2025-12-01'),

-- Aluno 7
(5, 7, 'INATIVO', '2025-01-01', '2025-02-01'),
(6, 7, 'ATIVO', '2025-06-01', '2025-12-01'),

-- Aluno 8
(5, 8, 'INATIVO', '2025-02-01', '2025-07-31'),
(6, 8, 'ATIVO', '2025-06-01', '2025-12-01'),

-- Aluno 9
(4, 9, 'INATIVO', '2025-03-01', '2025-04-01'),
(5, 9, 'INATIVO', '2025-04-01', '2025-05-01'),
(6, 9, 'ATIVO', '2025-06-01', '2025-12-01'),

-- Aluno 10
(7, 10, 'INATIVO', '2025-02-01', '2025-02-02'),
(6, 10, 'INATIVO', '2025-06-01', '2025-12-01');

-- ========================================
-- TABELA: aulas
-- ========================================
INSERT INTO vitalis.aulas
(planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES

-- Aluno 6 (plano_contratado id 1 - inativo (dia 05-01 até 06-01))
-- Primeira semana do mês de Maio
(1, '2025-05-05 08:00:00', '2025-05-05 09:00:00', 'REALIZADO'),
(1, '2025-05-07 08:00:00', '2025-05-07 09:00:00', 'REALIZADO'),
(1, '2025-05-09 08:00:00', '2025-05-09 09:00:00', 'REALIZADO'),

-- Aluno 6 (plano_contratado id 2 - ativo)
(2, '2025-06-10 08:00:00', '2025-06-10 09:00:00', 'REALIZADO'),
(2, '2025-07-10 08:00:00', '2025-07-10 09:00:00', 'REALIZADO'),
(2, '2025-08-10 08:00:00', '2025-08-10 09:00:00', 'REALIZADO'),
(2, '2025-09-08 09:00:00', '2025-09-08 10:30:00', 'REALIZADO'),
(2, '2025-09-10 08:00:00', '2025-09-10 09:00:00', 'REALIZADO');

-- ========================================
-- TABELA: aulas_treinos_exercicios (colocar novos inserts aqui)
-- ========================================
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES

-- Sessão 1
(1, 1, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(1, 2, 2, 12, 12, 4, 60, NULL),
(1, 3, 3, 1, 20, 3, 45, 'Foco em resistência'),
(1, 4, 4, 35, 10, 3, 60, NULL),

-- Sessão 2
(2, 5, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(2, 6, 2, 12, 12, 4, 60, NULL),
(2, 7, 3, 1, 20, 3, 45, 'Foco em resistência'),
(2, 8, 4, 35, 10, 3, 60, NULL),

-- Sessão 3
(3, 9, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(3, 10, 2, 12, 12, 4, 60, NULL),
(3, 11, 3, 1, 20, 3, 45, 'Foco em resistência'),
(3, 12, 4, 35, 10, 3, 60, NULL),

-- Sessão 4
(4, 13, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(4, 14, 2, 12, 12, 4, 60, NULL),
(4, 15, 3, 1, 20, 3, 45, 'Foco em resistência'),
(4, 16, 4, 35, 10, 3, 60, NULL),
(4, 17, 5, 35, 10, 3, 60, NULL),

-- Sessão 5
(5, 18, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(5, 19, 2, 12, 12, 4, 60, NULL),
(5, 20, 3, 1, 20, 3, 45, 'Foco em resistência'),
(5, 21, 4, 35, 10, 3, 60, NULL),

-- Sessão 6
(6, 23, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(6, 24, 2, 12, 12, 4, 60, NULL),
(6, 25, 3, 1, 20, 3, 45, 'Foco em resistência'),
(6, 26, 4, 35, 10, 3, 60, NULL);

-- ========================================
-- TABELA: execucoes_exercicios
-- ========================================
INSERT INTO vitalis.execucoes_exercicios 
(aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado) VALUES

-- Sessão 1
(1, 45.00, 8, 4, 90),
(2, 10.00, 10, 4, 60),
(3, 1.00, 15, 3, 120),
(4, 30.00, 10, 3, 60),

-- Sessão 2
(5, 47.50, 9, 4, 90),
(6, 12.00, 12, 4, 60),
(7, 1.25, 18, 3, 45),
(8, 32.50, 10, 3, 60),

-- Sessão 3
(9, 48.50, 10, 4, 90),
(10, 15.00, 12, 4, 60),
(11, 1.50, 18, 3, 45),
(12, 33.50, 10, 3, 60),

-- Sessão 4
(13, 49.50, 9, 4, 90),
(14, 17.00, 12, 4, 60),
(15, 1.75, 18, 3, 45),
(16, 36.50, 10, 3, 60),

-- Sessão 5
(17, 47.50, 9, 4, 90),
(18, 14.00, 12, 4, 60),
(19, 1.50, 18, 3, 45),
(20, 37.50, 10, 3, 60),

-- Sessão 6
(21, 50.50, 12, 7, 88),
(22, 15.00, 14, 6, 56),
(23, 1.75, 24, 4, 64),
(24, 34.40, 15, 5, 68);

-- ========================================
-- TABELA: feedbacks
-- ========================================
INSERT INTO vitalis.feedbacks 
(aulas_id, pessoas_id, descricao, data_criacao, tipo_autor, intensidade) VALUES

-- Sessão 1
(1, 6, 'Me senti muito bem após os exercícios!', '2025-04-01 10:00:00', 'ALUNO', 'MODERADO'),
(1, 1, 'Parabéns pelo empenho!', '2025-04-01 10:05:00', 'PERSONAL', 'MODERADO'),

-- Sessão 2
(2, 7, 'Achei a carga pesada no agachamento.', '2025-04-02 11:00:00', 'ALUNO', 'INTENSA'),
(2, 2, 'Vamos ajustar a carga.', '2025-04-02 11:10:00', 'PERSONAL', 'INTENSA');

INSERT INTO vitalis.feedbacks 
(aulas_id, pessoas_id, descricao, data_criacao, tipo_autor, intensidade) VALUES

-- Sessão 3
(3, 6, 'Treino puxado, mas consegui manter o ritmo até o fim.', '2025-05-09 09:30:00', 'ALUNO', 'MODERADO'),
(3, 5, 'Boa evolução na resistência, ajustar apenas postura em alguns exercícios.', '2025-05-09 09:40:00', 'PERSONAL', 'LEVE'),

-- Sessão 4
(4, 6, 'Voltei mais disposta depois da troca de plano.', '2025-06-10 09:15:00', 'ALUNO', 'LEVE'),
(4, 5, 'Adaptação ao novo plano foi tranquila; próxima sessão será mais intensa.', '2025-06-10 09:25:00', 'PERSONAL', 'LEVE'),

-- Sessão 5
(5, 6, 'Percebi melhora na execução dos exercícios de perna.', '2025-07-10 09:05:00', 'ALUNO', 'LEVE'),

-- Sessão 6
(6, 6, 'Treino bem cansativo, mas saí satisfeita com o resultado.', '2025-08-10 09:10:00', 'ALUNO', 'INTENSA'),
(6, 5, 'Carga elevada com boa técnica; importante manter alongamento depois.', '2025-08-10 09:20:00', 'PERSONAL', 'MODERADO'),

-- Sessão 7
(7, 6, 'Senti o cardio mais pesado hoje.', '2025-09-08 11:15:00', 'ALUNO', 'INTENSA'),

-- Sessão 8
(8, 6, 'Senti menos dor nas articulações em relação às últimas semanas.', '2025-09-10 09:20:00', 'ALUNO', 'LEVE'),
(8, 5, 'Boa adaptação às cargas, vamos progredir o volume nas próximas aulas.', '2025-09-10 09:30:00', 'PERSONAL', 'MODERADO');

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

INSERT INTO personal_trainers_especialidades 
VALUES 
-- Personal 1: Musculação, Treinamento Funcional
(1, 1), 
(1, 2),
-- Personal 2: Musculação, Emagrecimento
(2, 1), 
(2, 5),
-- Personal 3: Condicionamento Físico ≈ Treinamento de Core + Saúde Metabólica?
(3, 4), 
(3, 16),
-- Personal 4: Condicionamento Físico, Treinamento para Idosos
(4, 4), 
(4, 16),
-- Personal 5: Reabilitação e Alongamento ≈ Reabilitação + Mobilidade
(5, 11), 
(5, 12);

INSERT INTO notificacoes (pessoas_id, tipo, titulo, visualizada, data_criacao)
VALUES
(2, 'PAGAMENTO_REALIZADO', 'Pagamento Confirmado', FALSE, CURRENT_TIMESTAMP),
(3, 'PLANO_PROXIMO_VENCIMENTO', 'Plano Próximo Vencimento', FALSE, CURRENT_TIMESTAMP);


-- INSERTs para personal trainer
INSERT INTO preferencias_notificacao (pessoas_id, tipo, ativada)
VALUES 
(1, 'FEEDBACK_TREINO', TRUE),
(1, 'PAGAMENTO_REALIZADO', TRUE),
(1, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (1, 'NOVA_FOTO_PROGRESSO', TRUE),
(1, 'TREINO_PROXIMO_VENCIMENTO', FALSE),
(1, 'PAGAMENTO_CANCELADO', FALSE),
(1, 'AULAS_PENDENTES', FALSE),

(2, 'FEEDBACK_TREINO', FALSE),
(2, 'PAGAMENTO_REALIZADO', TRUE),
(2, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (2, 'NOVA_FOTO_PROGRESSO', FALSE),
(2, 'TREINO_PROXIMO_VENCIMENTO', FALSE),
(2, 'PAGAMENTO_CANCELADO', FALSE),
(2, 'AULAS_PENDENTES', FALSE),

(3, 'FEEDBACK_TREINO', FALSE),
(3, 'PAGAMENTO_REALIZADO', TRUE),
(3, 'PLANO_PROXIMO_VENCIMENTO', FALSE),
-- (3, 'NOVA_FOTO_PROGRESSO', TRUE),
(3, 'TREINO_PROXIMO_VENCIMENTO', FALSE),
(3, 'PAGAMENTO_CANCELADO', FALSE),
(3, 'AULAS_PENDENTES', FALSE),

(4, 'FEEDBACK_TREINO', FALSE),
(4, 'PAGAMENTO_REALIZADO', TRUE),
(4, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (4, 'NOVA_FOTO_PROGRESSO', FALSE),
(4, 'TREINO_PROXIMO_VENCIMENTO', TRUE),
(4, 'PAGAMENTO_CANCELADO', TRUE),
(4, 'AULAS_PENDENTES', TRUE),

(5, 'FEEDBACK_TREINO', TRUE),
(5, 'PAGAMENTO_REALIZADO', TRUE),
(5, 'PLANO_PROXIMO_VENCIMENTO', TRUE),
-- (5, 'NOVA_FOTO_PROGRESSO', TRUE),
(5, 'TREINO_PROXIMO_VENCIMENTO', TRUE),
(5, 'PAGAMENTO_CANCELADO', TRUE),
(5, 'AULAS_PENDENTES', TRUE);

-- INSERTs para alunos
INSERT INTO preferencias_notificacao (pessoas_id, tipo, ativada)
VALUES 
(6, 'PAGAMENTO_CANCELADO', TRUE),
(6, 'AULAS_PENDENTES', TRUE),

(7, 'PAGAMENTO_CANCELADO', TRUE),
(7, 'AULAS_PENDENTES', TRUE),

(8, 'PAGAMENTO_CANCELADO', TRUE),
(8, 'AULAS_PENDENTES', TRUE),

(9, 'PAGAMENTO_CANCELADO', TRUE),
(9, 'AULAS_PENDENTES', TRUE),

(10, 'PAGAMENTO_CANCELADO', TRUE),
(10, 'AULAS_PENDENTES', TRUE),

(11, 'PAGAMENTO_CANCELADO', TRUE),
(11, 'AULAS_PENDENTES', TRUE);

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

INSERT INTO vitalis.cidades (nome) VALUES
('São Paulo'),
('Campinas'),
('Santos'),
('Sorocaba'),
('São José dos Campos');

INSERT INTO vitalis.bairros (nome, cidades_id) VALUES
('Vila Madalena', 1),
('Cambuí', 2),
('Gonzaga', 3),
('Parque Campolim', 4),
('Jardim Aquarius', 5);

INSERT INTO vitalis.personal_trainers_bairros (personal_trainers_id, bairro_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5);

INSERT INTO vitalis.evolucao_corporal (
  tipo, url_foto_shape, data_envio, periodo_avaliacao, alunos_id
) VALUES

-- Aluno 6 (Suellen)
('FRONTAL', '4bbd6390-b3c3-4838-9dd2-993e00afec1f-1765042313430.jpg', '2025-04-02 09:00:00', 1, 6),
('FRONTAL', '4292e78b-6868-41d4-aa4f-14dbb99ee136-1765042400207.jpeg', '2025-06-02 09:00:00', 1, 6),

('PERFIL_ESQUERDO', '94aec084-2ea7-492b-8297-2bf078396f9f-1765042348101.jpg', '2025-04-02 09:10:00', 1, 6),
('PERFIL_ESQUERDO', 'c80c2ae0-ee80-4173-960a-2fd54b995f57-1765042424093.jpg', '2025-06-02 09:10:00', 1, 6),

('PERFIL_DIREITO', 'cf1729a7-0b7f-426f-a1a8-8418cc7125d1-1765042485502.jpg', '2025-04-02 09:15:00', 1, 6),
('PERFIL_DIREITO', '7a89df17-d0c5-449f-9c5e-216645c7771d-1765042532074.jpg', '2025-06-02 09:10:00', 1, 6),

('COSTAS', '2f427642-0a74-4b07-b35a-df167229c052-1765042608135.jpg', '2025-04-02 09:25:00', 1, 6),
('COSTAS', '9d3d784b-e718-460c-807f-9a7e5ea87a99-1765042643042.jpg', '2025-06-02 09:15:00', 1, 6),

-- Aluno 7 (Alex)
('FRONTAL', 'dc36c033-edc8-473c-a7e4-81775333bc28-1765037703632.jpg', '2025-04-02 09:00:00', 1, 7),
('FRONTAL', 'd3a9ea48-970a-4dfb-9b14-de192b635787-1765037883352.jpg', '2025-06-02 09:00:00', 1, 7),

('PERFIL_ESQUERDO', '859e09e7-e2e3-441f-a320-6c7c55054a86-1765038088644.jpg', '2025-04-02 09:10:00', 1, 7),

('PERFIL_DIREITO', 'c978ca1d-65cc-4fdc-9f49-d846d405b779-1765038152794.jpg', '2025-04-02 09:15:00', 1, 7),
('PERFIL_DIREITO', 'f39bf4c8-d41b-4a4c-ac5a-200a0b0146ea-1765038261000.jpg', '2025-06-02 09:10:00', 1, 7),

('COSTAS', '4287b947-a441-4443-926d-8766a31d818e-1765038208315.jpg', '2025-04-02 09:25:00', 1, 7),
('COSTAS', 'a684ed82-1ff3-43ac-a8a8-69ffacf7d09e-1765038309884.jpg', '2025-06-02 09:15:00', 1, 7),

-- Aluno 8
('FRONTAL', 'https://img.com/aluno8-frontal.jpg', '2025-04-03 07:30:00', 2, 8),
('COSTAS', 'https://img.com/aluno8-costas.jpg', '2025-06-03 07:30:00', 2, 8),
('PERFIL_ESQUERDO', 'https://img.com/aluno8-esquerdo.jpg', '2025-08-03 07:30:00', 2, 8),
('PERFIL_DIREITO', 'https://img.com/aluno8-direito.jpg', '2025-10-03 07:30:00', 2, 8),
('PERFIL_DIREITO', 'https://img.com/aluno8-direito.jpg', '2025-12-03 07:30:00', 2, 8),

-- Aluno 9
('FRONTAL', 'https://img.com/aluno9-frontal.jpg', '2025-04-04 10:00:00', 1, 9),

-- Aluno 10
('PERFIL_ESQUERDO', 'https://img.com/aluno10-perfil.jpg', '2025-04-05 06:30:00', 3, 10);

INSERT INTO vitalis.avaliacoes_personal_trainers (aluno_id, personal_trainer_id, nota, comentario, data_avaliacao) VALUES
(6, 5, 5.0, 'Atendimento excepcional; resultados acima do esperado.', '2025-01-12 10:23:45'),
(7, 5, 5.0, 'Acompanhamento motivador e consistente — recomendo.', '2025-02-05 15:10:12'),
(8, 5, 5.0, 'Foco na técnica e na evolução; muito satisfeito com o progresso.', '2025-03-20 08:55:30'),
(9, 5, 4.5, 'Treinos muito bons; pequenos ajustes melhorariam o conforto.', '2025-03-25 19:40:00'),
(10, 5, 4.0, 'Boa orientação e treinos eficazes; senti evolução consistente.', '2025-04-18 12:00:00'),
(11, 5, 4.5, 'Profissional competente e dedicado; atendimento de alto nível.', '2025-04-30 09:15:00'),
(6, 1, 3.0, 'Didática razoável; poderia haver mais acompanhamento na execução.', '2025-05-10 18:22:31'),
(7, 1, 5.0, 'Excelente profissional: atenção aos detalhes e muita motivação.', '2025-05-22 07:42:10'),
(8, 1, 4.5, 'Pontual e profissional; treinos bem personalizados.', '2025-06-02 16:20:00'),
(9, 1, 3.0, 'Bom profissional, mas horários pouco compatíveis com minha rotina.', '2025-06-15 20:33:21'),
(10, 1, 4.0, 'Treinos exigentes e eficientes; experiência positiva no geral.', '2025-07-01 11:50:00'),
(11, 1, 1.5, 'Atendimento insatisfatório; esperava mais suporte técnico.', '2025-07-09 13:05:45'),
(6, 2, 2.0, 'Disponibilidade boa, porém faltou planejamento nos treinos.', '2025-08-03 17:18:00'),
(7, 2, 4.5, 'Metodologia eficaz; progresso visível ao longo das sessões.', '2025-08-20 09:00:00'),
(8, 2, 2.5, 'Resultados aquém do esperado; comunicação e estrutura podem melhorar.', '2025-09-10 14:45:00'),

(6, 4, 5.0, 'Treino impecável, com planejamento claro e motivador.', '2025-01-12 10:23:45'),
(7, 4, 3.5, 'Acompanhamento adequado; recomendaria mais variação de exercícios.', '2025-02-05 15:10:12'),
(8, 4, 5.0, 'Excelente atenção à postura e técnica; grande evolução percebida.', '2025-03-20 08:55:30'),
(9, 4, 2.5, 'Treino pesado para meu nível; faltou adaptação individual.', '2025-03-25 19:40:00'),
(10, 4, 4.0, 'Comunicação clara e treinos bem estruturados; obtive bons resultados.', '2025-04-18 12:00:00'),
(11, 4, 4.5, 'Atendimento dedicado e orientações precisas; satisfeito com o progresso.', '2025-04-30 09:15:00'),
(6, 3, 3.0, 'Explicações claras, mas faltou correção na execução de alguns exercícios.', '2025-05-10 18:22:31'),
(7, 3, 1.0, 'Experiência muito negativa; não atendeu às minhas expectativas.', '2025-05-22 07:42:10'),
(8, 3, 1.5, 'Atendimento insuficiente e pouco acompanhamento técnico.', '2025-06-02 16:20:00'),
(9, 3, 3.5, 'Técnica boa; horários e adaptabilidade poderiam melhorar.', '2025-06-15 20:33:21'),
(10, 3, 4.0, 'Treinos desafiadores e eficientes; percebi progresso consistente.', '2025-07-01 11:50:00'),
(11, 5, 4.5, 'Precisa melhorar o foco em alongamentos, mas é um bom profissional.', '2025-07-09 13:05:45'),
(6, 1, 4.0, 'Disponível e atencioso; ajustes nos treinos foram úteis.', '2025-08-03 17:18:00'),
(7, 3, 4.5, 'Metodologia bem estruturada e progressão adequada aos objetivos.', '2025-08-20 09:00:00'),
(8, 2, 1.0, 'Atendimento ruim; não observei evolução desejada.', '2025-09-10 14:45:00');
