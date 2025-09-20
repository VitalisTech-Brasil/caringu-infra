INSERT INTO alunos_treinos (id, alunos_id, data_inicio, status)
VALUES
(6, 8, '2025-05-26', 'ATIVO'), -- Superior
(7, 8, '2025-05-28', 'ATIVO'), -- Inferior  
(8, 8, '2025-05-30', 'ATIVO'); -- Costas

-- =====================================================
-- INSERTS SUELLEN ALUNOS_TREINOS_EXERCICIOS
-- =====================================================

INSERT INTO vitalis.alunos_treinos_exercicios 
(alunos_treinos_id, exercicios_id, treinos_id, carga, repeticoes, series, descanso, observacoes_personalizadas, ic_model)
VALUES
-- TREINO SUPERIOR (aluno_treino_id = 6) - usando treino "Peito Funcional" (id = 6)
(6, 1, 6, 15.0, 12, 3, 60, 'Supino Inclinado - foco na forma', 0),        -- Supino Inclinado (Peitoral)
(6, 2, 6, 8.0, 15, 3, 45, 'Crucifixo - controle excêntrico', 0),          -- Crucifixo (Peitoral)
(6, 13, 6, 12.0, 12, 3, 60, 'Elevação lateral - movimento controlado', 0), -- Elevação Lateral (Ombro)
(6, 16, 6, 10.0, 15, 3, 45, 'Rosca direta - pegada supinada', 0),         -- Rosca direta (Braço)

-- TREINO INFERIOR (aluno_treino_id = 7) - usando treino "Posterior Reforçado" (id = 7)
(7, 10, 7, 30.0, 15, 4, 90, 'Afundo - descida controlada', 0),            -- Afundo (Pernas)
(7, 11, 7, 25.0, 12, 4, 75, 'Stiff - manter costas retas', 0),            -- Stiff (Pernas)
(7, 12, 7, 80.0, 12, 4, 120, 'Leg Press - amplitude completa', 0),         -- Leg Press (Pernas)

-- TREINO COSTAS (aluno_treino_id = 8) - usando treino existente de costas (id = 1, mas vamos usar id = 16 "Upper Avançado")
(8, 5, 16, 1.0, 8, 4, 120, 'Barra fixa - foco na técnica', 0),            -- Barra (Costas)
(8, 6, 16, 20.0, 12, 4, 75, 'Remada - pegada pronada', 0),                -- Remada (Costas)
(8, 7, 16, 45.0, 10, 4, 90, 'Puxada alta - até o queixo', 0);             -- Puxada Alta (Costas)

-- =====================================================
-- INSERTS SUELLEN SESSAO_TREINOS
-- =====================================================

INSERT INTO vitalis.sessao_treinos 
(alunos_treinos_id, data_horario_inicio, data_horario_fim, status)
VALUES
-- JUNHO 2025 - Suellen Lima
-- Semana 1
(6, '2025-05-26 08:00:00', '2025-05-26 09:00:00', 'REALIZADO'),
(7, '2025-05-28 08:00:00', '2025-05-28 09:15:00', 'REALIZADO'), 
(8, '2025-05-30 08:00:00', '2025-05-30 09:00:00', 'REALIZADO'), 

-- Semana 2
(6, '2025-06-02 08:00:00', '2025-06-02 09:00:00', 'REALIZADO'),
(7, '2025-06-04 08:00:00', '2025-06-04 09:15:00', 'REALIZADO'),
(8, '2025-06-06 08:00:00', '2025-06-06 09:00:00', 'REALIZADO'),

-- Semana 3
(6, '2025-06-09 08:00:00', '2025-06-09 09:00:00', 'REALIZADO'),
(7, '2025-06-11 08:00:00', '2025-06-11 09:15:00', 'REALIZADO'),
(8, '2025-06-13 08:00:00', '2025-06-13 09:00:00', 'REALIZADO'),

-- Semana 4
(6, '2025-06-16 08:00:00', '2025-06-16 09:00:00', 'REALIZADO'),
(7, '2025-06-18 08:00:00', '2025-06-18 09:15:00', 'REALIZADO'),
(8, '2025-06-20 08:00:00', '2025-06-20 09:00:00', 'REALIZADO'),

-- Semana 5
(6, '2025-06-23 08:00:00', '2025-06-23 09:00:00', 'REALIZADO'),
(7, '2025-06-25 08:00:00', '2025-06-25 09:15:00', 'REALIZADO'),
(8, '2025-06-27 08:00:00', '2025-06-27 09:00:00', 'REALIZADO'),

-- Semana 6
(6, '2025-06-30 08:00:00', '2025-06-30 09:00:00', 'REALIZADO');

-- =====================================================
-- INSERTS SUELLEN EXECUCOES_EXERCICIOS 
-- (Assumindo que os IDs de alunos_treinos_exercicios começam em 5)
-- =====================================================

INSERT INTO execucoes_exercicios (
    sessao_treino_id, alunos_treinos_exercicios_id,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
-- Sessões da primeira semana (IDs das sessões começam onde pararam + 1)
-- Assumindo sessao_treino_id a partir do 11
(11, 5, 15.0, 12, 3),  -- Supino Inclinado
(11, 6, 8.0, 15, 3),   -- Crucifixo
(11, 7, 12.0, 12, 3),  -- Elevação Lateral
(11, 8, 10.0, 15, 3),  -- Rosca direta

(12, 9, 30.0, 15, 4),  -- Afundo
(12, 10, 25.0, 12, 4), -- Stiff
(12, 11, 80.0, 12, 4), -- Leg Press

(13, 12, 1.0, 8, 4),   -- Barra
(13, 13, 20.0, 12, 4), -- Remada
(13, 14, 45.0, 10, 4), -- Puxada Alta

-- Sessões da segunda semana - progressão de carga
(14, 5, 16.0, 12, 3),  -- Supino - aumento carga
(14, 6, 8.0, 15, 3),
(14, 7, 12.0, 12, 3),
(14, 8, 10.0, 15, 3),

(15, 9, 32.0, 15, 4),  -- Afundo - aumento carga
(15, 10, 25.0, 12, 4),
(15, 11, 85.0, 12, 4), -- Leg Press - aumento carga

(16, 12, 1.0, 10, 4),  -- Barra - aumento reps
(16, 13, 22.0, 12, 4), -- Remada - aumento carga
(16, 14, 45.0, 12, 4), -- Puxada - aumento reps

-- Continue o padrão para as demais semanas...
-- Semana 3
(17, 5, 17.0, 12, 3),
(18, 9, 35.0, 12, 4),
(19, 12, 1.0, 12, 4),

-- Semana 4  
(20, 5, 18.0, 12, 3),
(21, 9, 35.0, 12, 4),
(22, 12, 1.0, 12, 4),

-- Semana 5
(23, 5, 18.0, 12, 3),
(24, 9, 37.0, 12, 4),
(25, 12, 1.0, 14, 4),

-- Semana 6
(26, 5, 19.0, 12, 3);

-- =====================================================
-- AGENDAMENTOS JULHO 2025
-- =====================================================

INSERT INTO vitalis.sessao_treinos 
(alunos_treinos_id, status)
VALUES
-- Julho 2025 - Agendamentos para Suellen
(6, 'AGENDADO'),
(7, 'AGENDADO'), 
(8, 'AGENDADO'),

(6, 'AGENDADO'),
(7, 'AGENDADO'),
(8, 'AGENDADO'),

(6, 'AGENDADO'),
(7, 'AGENDADO'),
(8, 'AGENDADO'),

(6, 'CANCELADO'),
(7, 'AGENDADO'),
(8, 'AGENDADO');