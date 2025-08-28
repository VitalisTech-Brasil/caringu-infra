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
-- (1, 'FEEDBACK_TREINO', 'Feedback de Treino', FALSE, CURRENT_TIMESTAMP),
(2, 'PAGAMENTO_REALIZADO', 'Pagamento Confirmado', FALSE, CURRENT_TIMESTAMP),
(3, 'PLANO_PROXIMO_VENCIMENTO', 'Plano Próximo Vencimento', FALSE, CURRENT_TIMESTAMP);
-- (4, 'NOVA_FOTO_PROGRESSO', 'Nova Foto de Progresso', TRUE, CURRENT_TIMESTAMP),
-- (5, 'TREINO_PROXIMO_VENCIMENTO', 'O treino Core Explosivo do aluno Alex Rocha vencerá em breve (15/06/2025)', FALSE, CURRENT_TIMESTAMP);
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

INSERT INTO vitalis.exercicios (personal_id, nome, grupo_muscular, url_video, observacoes, favorito, origem) VALUES
-- Peitoral
(1, 'Supino Inclinado', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2023/09/barbell-incline-bench-press.gif', 'Ajustar banco entre 30° e 45°', FALSE, 'BIBLIOTECA'),
(1, 'Crucifixo com Halteres', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2020/06/dumbbell-incline-fly.gif', 'Manter braços semiflexionados e controlar o movimento', TRUE, 'BIBLIOTECA'),
(1, 'Flexões de Braço', 'PEITORAL', 'https://www.hipertrofia.org/blog/wp-content/uploads/2018/09/pushup.gif', 'Não deixar o quadril cair durante o movimento', FALSE, 'BIBLIOTECA'),
(1, 'Peck Deck', 'PEITORAL', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/03/Supino-Inclinado-com-Halteres.gif?resize=500%2C500&ssl=1', 'Evitar bater os braços no final do movimento', FALSE, 'PERSONAL'),

-- Costas
(2, 'Barra', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-barra-fixa-pegada-aberta-palma-para-frente-chinup.gif', 'Evitar balanço do corpo e manter a escápula ativada', FALSE, 'PERSONAL'),
(2, 'Remada', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/09/remada-sentado-com-cabos-e-triangulo-para-costas.gif', 'Manter coluna neutra e puxar com os cotovelos', TRUE, 'PERSONAL'),
(2, 'Puxada Alta', 'COSTAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-puxada-aberta-com-barra-no-pulley.gif', 'Puxar até a altura do queixo sem inclinar o tronco para trás', FALSE, 'PERSONAL'),

-- Pernas
(1, 'Afundo', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/pernas-afundo-tradicional-sem-pesos-1.gif', 'Joelho da frente não deve ultrapassar a ponta do pé', FALSE, 'BIBLIOTECA'),
(1, 'Stiff com Halteres', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/09/levantamento-terra-deadlift-stiff-com-halteres-1.gif', 'Manter leve flexão nos joelhos e costas retas', TRUE, 'BIBLIOTECA'),
(1, 'Leg Press', 'PERNAS', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/pernas-leg-press-45-tradicional.gif', 'Não estender totalmente os joelhos na subida', FALSE, 'BIBLIOTECA'),

-- Ombro
(3, 'Elevação Lateral', 'OMBRO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-elevacao-lateral-de-ombros-com-halteres.gif', 'Elevar os braços até a linha dos ombros, sem impulso', TRUE, 'PERSONAL'),
(3, 'Desenvolvimento Arnold', 'OMBRO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-desenvolvimento-arnold-para-ombros.gif', 'Evitar estender totalmente os cotovelos no topo', FALSE, 'PERSONAL'),
(1, 'Elevação Frontal', 'OMBRO', 'https://i0.wp.com/omelhortreino.com.br/wp-content/uploads/2025/04/Elevacao-frontal-com-dois-bracos-com-halteres.gif?resize=550%2C550&ssl=1', 'Levantar até a altura dos ombros com controle', FALSE, 'BIBLIOTECA'),

-- Braço
(4, 'Rosca direta', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2022/09/rosca-biceps-direta-com-halteres.gif', 'Evitar balançar o corpo; manter os cotovelos fixos', TRUE, 'PERSONAL'),
(4, 'Tríceps banco', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/triceps-no-banco.gif', 'Não deixar os ombros subirem durante a descida', FALSE, 'PERSONAL'),
(4, 'Rosca martelo', 'BRACO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/rosca-biceps-martelo-com-halteres.gif', 'Manter os cotovelos fixos ao lado do corpo', FALSE, 'PERSONAL'),

-- Core
(1, 'Prancha', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2014/12/prancha-frontal-tradicional-com-bracos-esticados.gif', 'Manter abdômen contraído e quadril na linha da coluna', FALSE, 'BIBLIOTECA'),
(1, 'Abdominal', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/abdominal.gif', 'Evitar forçar o pescoço; foco no abdômen', FALSE, 'BIBLIOTECA'),
(1, 'Bicicleta no ar', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/abdominal-bicicleta-no-ar.gif', 'Rotação do tronco com pernas em movimento controlado', TRUE, 'BIBLIOTECA'),
(1, 'Prancha lateral', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/prancha-lateral.gif', 'Alinhar o corpo e evitar que o quadril caia', FALSE, 'BIBLIOTECA'),
(1, 'Elevação de pernas', 'CORE', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/abdominal-no-chao-com-elevacao-de-pernas-esticadas.gif', 'Evitar tirar a lombar do chão', FALSE, 'BIBLIOTECA'),
(1, 'Abdominal Tesoura', 'CORE', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/abdominal-tesoura.gif', 'Executar com respiração controlada e sem pressa', TRUE, 'BIBLIOTECA'),

-- Cardio
(1, 'Esteira', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/corrida-na-esteira-inclinada-1.gif', 'Postura ereta, respiração controlada', FALSE, 'BIBLIOTECA'),
(1, 'Bicicleta', 'CARDIO', 'https://example.com/burpee', 'Manter cadência constante e postura correta', TRUE, 'BIBLIOTECA'),
(1, 'Corda', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/01/26121301-Jump-Rope-male_Cardio_360-logo.gif', 'Pulos baixos e ritmo regular para evitar fadiga precoce', FALSE, 'BIBLIOTECA'),
(1, 'Escada', 'CARDIO', 'https://www.hipertrofia.org/blog/wp-content/uploads/2024/09/walking-on-stepmill.gif', 'Manter postura firme e não apoiar o peso nos braços', FALSE, 'BIBLIOTECA'),
(1, 'Burpee', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/burpee.gif', 'Controlar a lombar ao descer e manter ritmo constante', FALSE, 'BIBLIOTECA'),
(1, 'Polichinelo', 'CARDIO', 'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/polichinelos.gif', 'Manter respiração contínua e braços sincronizados com pernas', FALSE, 'BIBLIOTECA');

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

INSERT INTO vitalis.alunos_treinos (aluno_id, data_inicio, status) VALUES
(6, '2025-07-31', 'ATIVO'),
(7, '2025-07-31', 'ATIVO'),
(8, '2025-07-31', 'ATIVO'),
(9, '2025-07-31', 'ATIVO'),
(10, '2025-07-31', 'ATIVO');

-- ========================================
-- TABELA: sessao_treinos
-- ========================================
INSERT INTO vitalis.sessao_treinos (alunos_treinos_id, data_horario_previsto, data_horario_inicio, data_horario_fim, status, observacao) VALUES
(1, '2025-06-11 08:00:00', '2025-06-11 08:00:00', '2025-06-11 09:00:00', 'REALIZADO', 'Boa execução'),
(1, '2025-08-26 09:00:00', NULL, NULL, 'AGENDADO', NULL),
(2, '2025-06-08 12:00:00', '2025-06-08 12:00:00', '2025-06-08 13:30:00', 'REALIZADO', NULL),
(3, '2025-06-15 08:00:00', '2025-06-15 08:00:00', '2025-06-15 09:45:00', 'REALIZADO', NULL),
(4, '2025-06-14 08:00:00', '2025-06-14 08:00:00', '2025-06-14 09:00:00', 'REALIZADO', NULL);

INSERT INTO vitalis.feedbacks (
  titulo, descricao, data_criacao, alunos_treinos_id
) VALUES
('Ótimo treino', 'Me senti muito bem após os exercícios!', '2025-04-01 10:00:00', 1),
('Dificuldade com carga', 'Achei a carga pesada no agachamento.', '2025-04-02 11:00:00', 2),
('Foco no core', 'Preciso de mais exercícios para o core.', '2025-04-03 08:30:00', 3),
('Treino leve', 'Foi um treino bem tranquilo, gostei.', '2025-04-04 10:30:00', 4),
('Muito intenso', 'Suei bastante, foi puxado.', '2025-04-05 07:30:00', 5);

INSERT INTO vitalis.comentarios (
  feedbacks_id, pessoas_id, descricao, tipo_autor, intensidade
) VALUES
(1, 1, 'Parabéns pelo empenho!', 'PERSONAL', 'MODERADO'),
(2, 2, 'Vamos ajustar a carga.', 'PERSONAL', 'INTENSA'),
(3, 8, 'Senti que foi fraco, quero mais.', 'ALUNO', 'LEVE'),
(4, 4, 'Bom trabalho, siga assim.', 'PERSONAL', 'MODERADO'),
(5, 10, 'Realmente cansativo, mas ótimo.', 'ALUNO', 'MUITO_INTENSA');

INSERT INTO vitalis.evolucao_corporal (
  id, tipo, url_foto_shape, data_envio, periodo_avaliacao, alunos_id
) VALUES
(1, 'FRONTAL', 'https://img.com/aluno6-frontal.jpg', '2025-04-01 08:00:00', 1, 6),
(2, 'PERFIL_DIREITO', 'https://img.com/aluno7-perfil.jpg', '2025-04-02 09:00:00', 1, 7),
(3, 'COSTAS', 'https://img.com/aluno8-costas.jpg', '2025-04-03 07:30:00', 2, 8),
(4, 'FRONTAL', 'https://img.com/aluno9-frontal.jpg', '2025-04-04 10:00:00', 1, 9),
(5, 'PERFIL_ESQUERDO', 'https://img.com/aluno10-perfil.jpg', '2025-04-05 06:30:00', 3, 10);

-- ========================================
-- TABELA: treinos
-- ========================================
INSERT INTO vitalis.treinos (nome, descricao, favorito, personal_id, origem, grau_dificuldade) VALUES
('Peito Avançado', 'Hipertrofia do peitoral com barra', FALSE, 1, 'PERSONAL', 'AVANCADO'),
('Pernas Intermediário', 'Força e resistência nas pernas', FALSE, 2, 'BIBLIOTECA', 'INTERMEDIARIO'),
('Ombro Iniciante', 'Mobilidade e força básica', TRUE, 3, 'BIBLIOTECA', 'INICIANTE'),
('Cardio Funcional', 'Gasto calórico intenso com circuitos', TRUE, 4, 'BIBLIOTECA', 'INTERMEDIARIO'),
('Core e Estabilização', 'Foco em abdômen e lombar', TRUE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Peito Funcional', 'Treino de resistência com foco funcional', TRUE, 1, 'PERSONAL', 'INTERMEDIARIO'),
('Posterior Reforçado', 'Ênfase em posterior e glúteo', TRUE, 2, 'BIBLIOTECA', 'INTERMEDIARIO'),
('Ombros Ativos', 'Melhora da estabilidade do ombro', TRUE, 3, 'BIBLIOTECA', 'INICIANTE'),
('Cardio HIIT', 'Treino em alta intensidade intervalada', FALSE, 4, 'PERSONAL', 'INTERMEDIARIO'),
('Core Explosivo', 'Abdômen com movimentos rápidos', FALSE, 5, 'BIBLIOTECA', 'INTERMEDIARIO'),
('Treino Funcional Total', 'Ativação do corpo todo com ênfase em agilidade', TRUE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Abdômen Definido', 'Sequência intensa para definição abdominal', FALSE, 5, 'PERSONAL', 'AVANCADO'),
('Mobilidade Articular', 'Rotina para melhorar amplitude de movimento', FALSE, 5, 'BIBLIOTECA', 'INICIANTE'),
('Resistência Corporal', 'Exercícios com peso corporal e longa duração', TRUE, 5, 'PERSONAL', 'INTERMEDIARIO'),
('Full Body Avançado', 'Treino completo com alta intensidade', FALSE, 5, 'PERSONAL', 'AVANCADO'),
('Upper Avançado', 'Treino completo com alta intensidade da parte superior', FALSE, 5, 'BIBLIOTECA', 'AVANCADO');

-- ========================================
-- TABELA: alunos_treinos_exercicios
-- ========================================
-- Exemplo: ligando aluno_treino_id com os exercícios de cada treino
INSERT INTO vitalis.alunos_treinos_exercicios (aluno_treino_id, exercicio_id, treinos_id, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
-- Treino 1 (Peito Avançado)
(1, 6, 1, 50, 10, 4, 90, 'Ajustar técnica'),
(1, 7, 1, 12, 12, 4, 60, NULL),
(1, 8, 1, 1, 20, 3, 45, 'Foco em resistência'),
(1, 9, 1, 35, 10, 3, 60, NULL),

-- Treino 2 (Pernas Intermediário)
(2, 10, 2, 30, 10, 3, 60, NULL),
(2, 11, 2, 25, 10, 3, 45, NULL),
(2, 12, 2, 80, 12, 4, 90, NULL),

-- Treino 3 (Ombro Iniciante)
(3, 13, 3, 6, 15, 3, 30, NULL),
(3, 14, 3, 8, 12, 3, 45, NULL),
(3, 15, 3, 6, 12, 3, 45, NULL),

-- Treino 4 (Cardio Funcional)
(4, 16, 4, 10, 60, 3, 20, NULL),
(4, 17, 4, 15, 15, 3, 30, NULL),
(4, 18, 4, 20, 60, 3, 20, NULL),
(4, 19, 4, 10, 40, 3, 30, NULL);

-- ========================================
-- TABELA: execucoes_exercicios (execução real dos exercícios)
-- ========================================
INSERT INTO vitalis.execucoes_exercicios (sessao_treino_id, alunos_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado) VALUES
-- Sessão 1 (Carla Mendes, Peito Avançado)
(1, 1, 45.00, 8, 4, 90),
(1, 2, 10.00, 10, 4, 60),
(1, 3, 1.00, 15, 3, 45),
(1, 4, 30.00, 10, 3, 60),

-- Sessão 2 (Alex Nagano, Peito Avançado)
(2, 1, 47.50, 9, 4, 90),
(2, 2, 12.00, 12, 4, 60),
(2, 3, 1.00, 18, 3, 45),
(2, 4, 32.50, 10, 3, 60),

-- Sessão 3 (Suellen Lima, Pernas Intermediário)
(3, 5, 25.00, 12, 3, 60),
(3, 6, 25.00, 10, 3, 45),
(3, 7, 70.00, 12, 4, 90),

-- Sessão 4 (Diego Santos, Ombro Iniciante)
(4, 8, 6.00, 15, 3, 30),
(4, 9, 8.00, 12, 3, 45),
(4, 10, 6.00, 12, 3, 45);