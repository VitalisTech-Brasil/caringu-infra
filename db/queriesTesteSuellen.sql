INSERT INTO vitalis.alunos_treinos_exercicios 
(aluno_treino_id, exercicio_id, carga, repeticoes, series, descanso, observacoes_personalizadas)
VALUES
(8, 2, 15.0, 12, 3, 60, 'Desenvolvimento com halteres - foco na forma'),
(6, 3, 8.0, 15, 3, 45, 'Elevação lateral - controle excêntrico'),
(6, 4, 12.0, 12, 3, 60, 'Rosca direta - pegada supinada'),
(6, 5, 10.0, 15, 3, 45, 'Tríceps testa - amplitude completa');


INSERT INTO alunos_treinos (aluno_id, treino_id, data_inicio, status)
VALUES
(8, 6, '2025-05-26', 'ATIVO'), -- Superior
(8, 7, '2025-05-28', 'ATIVO'), -- Inferior
(8, 8, '2025-05-30', 'ATIVO'); -- Costas


-- JUNHO 2025 - Suellen Lima
INSERT INTO vitalis.sessao_treinos 
(alunos_treinos_id, data_horario_previsto, data_horario_inicio, data_horario_fim, status)
VALUES
-- Semana 1
(6, '2025-05-26 08:00:00', '2025-05-26 08:00:00', '2025-05-26 09:00:00', 'REALIZADO'), -- Superior
(7, '2025-05-28 08:00:00', '2025-05-28 08:00:00', '2025-05-28 09:15:00', 'REALIZADO'), -- Inferior
(8, '2025-05-30 08:00:00', '2025-05-30 08:00:00', '2025-05-30 09:00:00', 'REALIZADO'), -- Costas

-- Semana 2
(6, '2025-06-02 08:00:00', '2025-06-02 08:00:00', '2025-06-02 09:00:00', 'REALIZADO'),
(7, '2025-06-04 08:00:00', '2025-06-04 08:00:00', '2025-06-04 09:15:00', 'REALIZADO'),
(8, '2025-06-06 08:00:00', '2025-06-06 08:00:00', '2025-06-06 09:00:00', 'REALIZADO'),

-- Semana 3
(6, '2025-06-09 08:00:00', '2025-06-09 08:00:00', '2025-06-09 09:00:00', 'REALIZADO'),
(7, '2025-06-11 08:00:00', '2025-06-11 08:00:00', '2025-06-11 09:15:00', 'REALIZADO'),
(8, '2025-06-13 08:00:00', '2025-06-13 08:00:00', '2025-06-13 09:00:00', 'REALIZADO'),

-- Semana 4
(6, '2025-06-16 08:00:00', '2025-06-16 08:00:00', '2025-06-16 09:00:00', 'REALIZADO'),
(7, '2025-06-18 08:00:00', '2025-06-18 08:00:00', '2025-06-18 09:15:00', 'REALIZADO'),
(8, '2025-06-20 08:00:00', '2025-06-20 08:00:00', '2025-06-20 09:00:00', 'REALIZADO'),

-- Semana 5
(6, '2025-06-23 08:00:00', '2025-06-23 08:00:00', '2025-06-23 09:00:00', 'REALIZADO'),
(7, '2025-06-25 08:00:00', '2025-06-25 08:00:00', '2025-06-25 09:15:00', 'REALIZADO'),
(8, '2025-06-27 08:00:00', '2025-06-27 08:00:00', '2025-06-27 09:00:00', 'REALIZADO'),

-- Semana 6
(6, '2025-06-30 08:00:00', '2025-06-30 08:00:00', '2025-06-30 09:00:00', 'REALIZADO');  -- Superior

-- SUPERIOR (treino_exercicio_id = 30)
INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
(6, 29, 10, 12, 3, 60, 10, 12, 3),
(18, 29, 12, 12, 3, 60, 12, 12, 3),
(21, 29, 12, 12, 3, 60, 12, 12, 3),
(24, 29, 14, 12, 3, 60, 14, 12, 3),
(27, 29, 15, 12, 3, 60, 15, 12, 3),
(30, 29, 15, 12, 3, 60, 15, 12, 3);

-- INFERIOR (treino_exercicio_id = 31)
INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
(16, 31, 30, 15, 4, 90, 30, 15, 4),
(19, 31, 32, 15, 4, 90, 32, 15, 4),
(22, 31, 35, 12, 4, 90, 35, 12, 4),
(25, 31, 35, 12, 4, 90, 35, 12, 4),
(28, 31, 37, 12, 4, 90, 37, 12, 4);

-- COSTAS (treino_exercicio_id = 34)
INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
(17, 34, 20, 12, 4, 75, 20, 12, 4),
(20, 34, 22, 12, 4, 75, 22, 12, 4),
(23, 34, 25, 12, 4, 75, 25, 12, 4),
(26, 34, 25, 12, 4, 75, 25, 12, 4),
(29, 34, 28, 12, 4, 75, 28, 12, 4);


-- =====================================================
-- SELECTS PARA TESTES DA SUELLEN
-- =====================================================


SELECT a.id, p.nome FROM vitalis.alunos a 
JOIN vitalis.pessoas p ON a.id = p.id 
WHERE a.id = 8;

SELECT at.id as aluno_treino_id, at.aluno_id, at.treino_id, at.data_inicio, at.status 
FROM vitalis.alunos_treinos at 
WHERE at.aluno_id = 8;

SELECT ate.id as ate_id, ate.aluno_treino_id, ate.exercicio_id, e.nome as exercicio_nome, ate.carga
FROM vitalis.alunos_treinos_exercicios ate
JOIN vitalis.alunos_treinos at ON ate.aluno_treino_id = at.id
JOIN vitalis.exercicios e ON ate.exercicio_id = e.id
WHERE at.aluno_id = 8;

SELECT st.id as sessao_id, st.alunos_treinos_id, st.data_horario_inicio
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 8;

SELECT 
    ex.sessao_treino_id, 
    ex.treino_exercicio_id, 
    ex.carga_executada, 
    st.data_horario_inicio
FROM vitalis.execucoes_exercicios ex
JOIN vitalis.sessao_treinos st ON ex.sessao_treino_id = st.id
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 8;

-- =====================================================
-- Select do aluno x para verificar a progressão de carga pelo treino_exercicio_id
-- =====================================================

SELECT 
    p.nome AS aluno_nome,
    st.data_horario_inicio AS data_treino,
    ex.carga_executada AS carga_kg,
    ex.treino_exercicio_id
FROM vitalis.execucoes_exercicios ex 
JOIN vitalis.sessao_treinos st 
    ON ex.sessao_treino_id = st.id 
JOIN vitalis.alunos_treinos at 
    ON st.alunos_treinos_id = at.id 
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id 
JOIN vitalis.pessoas p 
    ON a.id = p.id 
WHERE a.id = 8   
ORDER BY st.data_horario_inicio;

-- =====================================================
-- Select de um exercicio especifico para ver a progressão de carga
-- =====================================================

SELECT 
    p.nome AS aluna,
    e.nome AS exercicio,
    t.nome AS treino,
    st.data_horario_inicio AS data_treino,
    
    ee.carga_planejada,
    ee.carga_executada,
    ee.repeticoes_executadas,
    ee.series_executadas

FROM vitalis.execucoes_exercicios ee
JOIN vitalis.treinos_exercicios te ON ee.treino_exercicio_id = te.id
JOIN vitalis.exercicios e ON te.exercicio_id = e.id
JOIN vitalis.treinos t ON te.treino_id = t.id
JOIN vitalis.sessao_treinos st ON ee.sessao_treino_id = st.id
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
JOIN vitalis.pessoas p ON a.id = p.id

WHERE p.id = 8         
  AND e.id = 15        
ORDER BY st.data_horario_inicio ASC;

-- =====================================================
-- Select geral para ver todos os treinos com os exercicios da Suellen
-- =====================================================

SELECT 
    at.id AS aluno_treino_id,
    t.nome AS treino_nome,
    e.nome AS exercicio,
    te.carga,
    te.repeticoes,
    te.series,
    te.descanso,
    te.grau_dificuldade
FROM alunos_treinos at
JOIN treinos t ON at.treino_id = t.id
JOIN treinos_exercicios te ON te.treino_id = t.id
JOIN exercicios e ON e.id = te.exercicio_id
WHERE at.aluno_id = 8
ORDER BY at.id, t.nome, e.nome;

-- =====================================================
-- Select para ver todos os treinos ativos e finalizados
-- =====================================================

SELECT 
    at.id AS aluno_treino_id,
    t.id AS treino_id,
    t.nome AS treino_nome,
    at.data_inicio,
    at.data_fim,
    at.status
FROM alunos_treinos at
JOIN treinos t ON at.treino_id = t.id
WHERE at.aluno_id = 8
ORDER BY at.data_inicio;

-- =====================================================
-- Select dos treinos que a Suellen possui
-- =====================================================

SELECT 
    at.id AS aluno_treino_id,
    t.nome AS treino_nome,
    at.data_inicio,
    at.data_fim,
    at.status
FROM alunos_treinos at
JOIN treinos t ON at.treino_id = t.id
WHERE at.aluno_id = 8
  AND at.status = 'ATIVO'
ORDER BY at.data_inicio DESC;

-- =====================================================
-- Exercicios de um treino
-- =====================================================
SELECT 
    at.id AS aluno_treino_id,
    t.id AS treino_id,
    t.nome AS treino_nome,
    e.id AS exercicio_id,
    e.nome AS exercicio_nome,
    te.carga,
    te.repeticoes,
    te.series,
    te.descanso,
    te.grau_dificuldade
FROM alunos_treinos at
JOIN treinos t 
    ON at.treino_id = t.id
JOIN treinos_exercicios te 
    ON te.treino_id = t.id
JOIN exercicios e 
    ON e.id = te.exercicio_id
WHERE at.id = (
    SELECT at2.id
    FROM sessao_treinos st
    JOIN alunos_treinos at2 
        ON at2.id = st.alunos_treinos_id
    WHERE at2.aluno_id = 8
    ORDER BY st.data_horario_inicio DESC
    LIMIT 1
)
ORDER BY e.nome;


-- =====================================================
-- SELECT: RELATÓRIO DETALHADO DOS ALUNOS E OS EXERCICIOS REALIZADOS
-- =====================================================

SELECT 
    a.id AS aluno_id,
    pa.nome AS aluno_nome,
    pt.id AS personal_id,
    pp.nome AS personal_nome,
    st.data_horario_inicio,
    st.data_horario_fim,
    e.nome AS exercicio,
    ex.carga_planejada,
    ex.repeticoes_planejadas,
    ex.series_planejadas,
    ex.carga_executada,
    ex.repeticoes_executadas,
    ex.series_executadas,
    ROUND((ex.carga_executada / NULLIF(ex.carga_planejada, 0)) * 100, 2) AS performance_carga_percent,
    ROUND((ex.repeticoes_executadas / NULLIF(ex.repeticoes_planejadas, 0)) * 100, 2) AS performance_repeticoes_percent
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas pa ON a.id = pa.id
JOIN treinos t ON at.treino_id = t.id
JOIN personal_trainers pt ON t.personal_id = pt.id
JOIN pessoas pp ON pt.id = pp.id
LEFT JOIN execucoes_exercicios ex ON st.id = ex.sessao_treino_id
LEFT JOIN treinos_exercicios te ON ex.treino_exercicio_id = te.id  
LEFT JOIN exercicios e ON te.exercicio_id = e.id                   
WHERE DATE(st.data_horario_inicio) IN ('2025-08-19', '2025-08-20')
ORDER BY st.data_horario_inicio, aluno_nome, exercicio;


-- =====================================================
-- SELECT: RELATÓRIO POR ALUNO E PERFORMANCE DE CARGA POR DIA, CASO A GENTE PRECISE DAR UM FEEDBACK PARA SABER COMO OS ALUNOS ESTÃO PERFORMANDO
-- =====================================================

SELECT 
    pa.nome AS aluno_nome,
    DATE(st.data_horario_inicio) as data_treino,
    pp.nome AS personal_nome,
    t.nome AS nome_treino,
    COUNT(ex.id) as total_exercicios,
    TIMESTAMPDIFF(MINUTE, st.data_horario_inicio, st.data_horario_fim) as duracao_minutos,
    ROUND(AVG(
        (ex.carga_executada / NULLIF(ex.carga_planejada, 0)) * 100
    ), 2) as performance_carga_media,
    ROUND(AVG(
        (ex.repeticoes_executadas / NULLIF(ex.repeticoes_planejadas, 0)) * 100
    ), 2) as performance_repeticoes_media,
    -- Classificação da performance
    CASE 
        WHEN AVG((ex.carga_executada / NULLIF(ex.carga_planejada, 0)) * 100) >= 100 
             AND AVG((ex.repeticoes_executadas / NULLIF(ex.repeticoes_planejadas, 0)) * 100) >= 100
        THEN 'EXCELENTE'
        WHEN AVG((ex.carga_executada / NULLIF(ex.carga_planejada, 0)) * 100) >= 90 
             AND AVG((ex.repeticoes_executadas / NULLIF(ex.repeticoes_planejadas, 0)) * 100) >= 90
        THEN 'MUITO BOM'
        WHEN AVG((ex.carga_executada / NULLIF(ex.carga_planejada, 0)) * 100) >= 80 
             AND AVG((ex.repeticoes_executadas / NULLIF(ex.repeticoes_planejadas, 0)) * 100) >= 80
        THEN 'BOM'
        ELSE 'PRECISA MELHORAR'
    END as classificacao_performance
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas pa ON a.id = pa.id
JOIN treinos t ON at.treino_id = t.id
JOIN personal_trainers pt ON t.personal_id = pt.id
JOIN pessoas pp ON pt.id = pp.id
LEFT JOIN execucoes_exercicios ex ON st.id = ex.sessao_treino_id
WHERE DATE(st.data_horario_inicio) IN ('2025-08-19', '2025-08-20')
GROUP BY st.id, pa.nome, DATE(st.data_horario_inicio), pp.nome, t.nome
ORDER BY data_treino, aluno_nome;


-- =====================================================
-- SELECT: RELATÓRIO POR ALUNO E PERFORMANCE DO TREINO E OS EXERCICIOS QUE FORAM FEITOS NO DIA
-- =====================================================

SELECT 
    per.nome AS personal,
    alu.nome AS aluno,
    t.nome AS treino,
    st.data_horario_inicio AS data_treino,
    e.nome AS exercicio,
    
    te.carga AS carga_planejada,
    ee.carga_executada,
    
    te.repeticoes AS reps_planejadas,
    ee.repeticoes_executadas,
    
    te.series AS series_planejadas,
    ee.series_executadas

FROM vitalis.execucoes_exercicios ee
JOIN vitalis.treinos_exercicios te 
    ON ee.treino_exercicio_id = te.id
JOIN vitalis.exercicios e 
    ON te.exercicio_id = e.id
JOIN vitalis.treinos t 
    ON te.treino_id = t.id
JOIN vitalis.personal_trainers pt 
    ON t.personal_id = pt.id
JOIN vitalis.pessoas per 
    ON pt.id = per.id
JOIN vitalis.sessao_treinos st 
    ON ee.sessao_treino_id = st.id
JOIN vitalis.alunos_treinos at 
    ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id
JOIN vitalis.pessoas alu 
    ON a.id = alu.id
WHERE pt.id = 2
ORDER BY alu.nome, st.data_horario_inicio, t.nome, e.nome;


-- =====================================================
-- Remarcar aula Suellen
-- =====================================================

-- Remarcar aula Suellen

INSERT INTO vitalis.sessao_treinos 
(alunos_treinos_id, data_horario_previsto, status)
VALUES
-- Semana 1
(6, '2025-07-02 08:00:00', 'AGENDADO'), 
(7, '2025-07-04 08:00:00', 'AGENDADO'), 
(8, '2025-07-07 08:00:00', 'AGENDADO'),

-- Semana 2
(6, '2025-07-09 08:00:00', 'AGENDADO'),
(7, '2025-07-11 08:00:00', 'AGENDADO'),
(8, '2025-07-14 08:00:00', 'AGENDADO'),

-- Semana 3
(6, '2025-07-16 08:00:00', 'AGENDADO'),
(7, '2025-07-18 08:00:00', 'AGENDADO'),
(8, '2025-07-21 08:00:00', 'AGENDADO'),

-- Semana 4
(6, '2025-07-23 08:00:00', 'AGENDADO'),
(7, '2025-07-25 08:00:00', 'AGENDADO'),
(8, '2025-07-28 08:00:00', 'AGENDADO');


-- Remarcação 1: Costas de 07/07 -> 08/07 às 10:00
UPDATE vitalis.sessao_treinos
SET data_horario_previsto = '2025-07-08 10:00:00',
status = 'REAGENDADO'
WHERE alunos_treinos_id = 8 AND data_horario_previsto = '2025-07-07 08:00:00';

-- Remarcação 2: Inferior de 18/07 -> 19/07 às 09:00
UPDATE vitalis.sessao_treinos
SET data_horario_previsto = '2025-07-19 09:00:00',
status = 'REAGENDADO'
WHERE alunos_treinos_id = 7 AND data_horario_previsto = '2025-07-18 08:00:00';



-- ============================================
-- SELECT DE TODAS AS AULAS DA SUELLEN  COM HISTORICO COMPLETO (REALIZADAS, AGENDADAS, CANCELADAS, REAGENDADAS)
-- ============================================

SELECT 
    p.nome AS aluna_nome,
    t.nome AS tipo_treino,
    st.status,
    DATE_FORMAT(st.data_horario_previsto, '%d/%m/%Y') AS data_aula,
    DATE_FORMAT(st.data_horario_previsto, '%H:%i') AS horario_previsto,
    DAYNAME(st.data_horario_previsto) AS dia_semana,
    -- Campos específicos para aulas realizadas
    CASE 
        WHEN st.data_horario_inicio IS NOT NULL 
        THEN DATE_FORMAT(st.data_horario_inicio, '%H:%i') 
        ELSE NULL 
    END AS horario_real_inicio,
    CASE 
        WHEN st.data_horario_fim IS NOT NULL 
        THEN DATE_FORMAT(st.data_horario_fim, '%H:%i') 
        ELSE NULL 
    END AS horario_real_fim,
    CASE 
        WHEN st.data_horario_inicio IS NOT NULL AND st.data_horario_fim IS NOT NULL 
        THEN TIMESTAMPDIFF(MINUTE, st.data_horario_inicio, st.data_horario_fim)
        ELSE NULL 
    END AS duracao_minutos
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at 
    ON st.alunos_treinos_id = at.id
JOIN vitalis.treinos t 
    ON at.treino_id = t.id
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id
JOIN vitalis.pessoas p 
    ON a.id = p.id
WHERE a.id = 8  
ORDER BY st.data_horario_previsto;

-- ============================================
-- SELECT COM RESUMO GERAL DAS AULAS DA SUELLEN
-- ============================================

SELECT 
    COUNT(*) as total_aulas,
    SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) as aulas_realizadas,
    SUM(CASE WHEN st.status = 'AGENDADO' THEN 1 ELSE 0 END) as aulas_agendadas,
    SUM(CASE WHEN st.status = 'CANCELADO' THEN 1 ELSE 0 END) as aulas_canceladas,
    SUM(CASE WHEN st.status = 'REAGENDADO' THEN 1 ELSE 0 END) as aulas_reagendadas,
    -- Percentual de aderência (realizadas / total não-agendadas)  
    ROUND(
        (SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(SUM(CASE WHEN st.status IN ('REALIZADO', 'CANCELADO') THEN 1 ELSE 0 END), 0)), 1
    ) as percentual_aderencia,
    -- Aulas com horário alterado
    SUM(CASE WHEN TIME(st.data_horario_previsto) != '08:00:00' THEN 1 ELSE 0 END) as aulas_horario_alterado
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
WHERE a.id = 8;

-- ============================================
-- SELECT DE AULAS POR TIPO DE TREINO
-- ============================================

SELECT 
    t.nome AS tipo_treino,
    COUNT(*) as total_aulas,
    SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) as realizadas,
    SUM(CASE WHEN st.status = 'AGENDADO' THEN 1 ELSE 0 END) as agendadas,
    SUM(CASE WHEN st.status = 'CANCELADO' THEN 1 ELSE 0 END) as canceladas,
    SUM(CASE WHEN st.status = 'REAGENDADO' THEN 1 ELSE 0 END) as reagendadas,
    -- Próxima aula agendada
    MIN(CASE WHEN st.status = 'AGENDADO' THEN st.data_horario_previsto ELSE NULL END) as proxima_aula,
    -- Aulas com horário não-padrão
    SUM(CASE WHEN TIME(st.data_horario_previsto) != '08:00:00' THEN 1 ELSE 0 END) as aulas_horario_diferente
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.treinos t ON at.treino_id = t.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
WHERE a.id = 8  -- Suellen Lima
GROUP BY t.id, t.nome
ORDER BY t.nome;

-- ============================================
-- Reagendamento aula Suellen
-- ============================================

INSERT INTO vitalis.sessao_treinos 
(alunos_treinos_id, data_horario_previsto, status)
VALUES
-- Semana 1
(6, '2025-07-02 08:00:00', 'AGENDADO'), 
(7, '2025-07-04 08:00:00', 'AGENDADO'), 
(8, '2025-07-07 08:00:00', 'AGENDADO'),

-- Semana 2
(6, '2025-07-09 08:00:00', 'AGENDADO'),
(7, '2025-07-11 08:00:00', 'AGENDADO'),
(8, '2025-07-14 08:00:00', 'AGENDADO'),

-- Semana 3
(6, '2025-07-16 08:00:00', 'AGENDADO'),
(7, '2025-07-18 08:00:00', 'AGENDADO'),
(8, '2025-07-21 08:00:00', 'AGENDADO'),

-- Semana 4
(6, '2025-07-23 08:00:00', 'AGENDADO'),
(7, '2025-07-25 08:00:00', 'AGENDADO'),
(8, '2025-07-28 08:00:00', 'AGENDADO');


-- Remarcação 1: Costas de 07/07 -> 08/07 às 10:00
UPDATE vitalis.sessao_treinos
SET data_horario_previsto = '2025-07-08 10:00:00',
status = 'REAGENDADO'
WHERE alunos_treinos_id = 8 AND data_horario_previsto = '2025-07-07 08:00:00';

-- Remarcação 2: Inferior de 18/07 -> 19/07 às 09:00
UPDATE vitalis.sessao_treinos
SET data_horario_previsto = '2025-07-19 09:00:00',
status = 'REAGENDADO'
WHERE alunos_treinos_id = 7 AND data_horario_previsto = '2025-07-18 08:00:00';

UPDATE vitalis.sessao_treinos
SET status = 'CANCELADO',
    observacao = 'Cancelado a pedido da aluna'
WHERE alunos_treinos_id = 7 
AND data_horario_previsto = '2025-07-04 08:00:00'
AND status = 'AGENDADO';

-- ============================================
-- SELECT DE TODAS AS AULAS DA SUELLEN  COM HISTORICO COMPLETO (REALIZADAS, AGENDADAS, CANCELADAS, REAGENDADAS)
-- ============================================

SELECT 
    p.nome AS aluna_nome,
    t.nome AS tipo_treino,
    st.status,
    DATE_FORMAT(st.data_horario_previsto, '%d/%m/%Y') AS data_aula,
    DATE_FORMAT(st.data_horario_previsto, '%H:%i') AS horario_previsto,
    DAYNAME(st.data_horario_previsto) AS dia_semana,
    -- Campos específicos para aulas realizadas
    CASE 
        WHEN st.data_horario_inicio IS NOT NULL 
        THEN DATE_FORMAT(st.data_horario_inicio, '%H:%i') 
        ELSE NULL 
    END AS horario_real_inicio,
    CASE 
        WHEN st.data_horario_fim IS NOT NULL 
        THEN DATE_FORMAT(st.data_horario_fim, '%H:%i') 
        ELSE NULL 
    END AS horario_real_fim,
    CASE 
        WHEN st.data_horario_inicio IS NOT NULL AND st.data_horario_fim IS NOT NULL 
        THEN TIMESTAMPDIFF(MINUTE, st.data_horario_inicio, st.data_horario_fim)
        ELSE NULL 
    END AS duracao_minutos
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at 
    ON st.alunos_treinos_id = at.id
JOIN vitalis.treinos t 
    ON at.treino_id = t.id
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id
JOIN vitalis.pessoas p 
    ON a.id = p.id
WHERE a.id = 8  
ORDER BY st.data_horario_previsto;

-- ============================================
-- SELECT COM RESUMO GERAL DAS AULAS DA SUELLEN
-- ============================================

SELECT 
    COUNT(*) as total_aulas,
    SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) as aulas_realizadas,
    SUM(CASE WHEN st.status = 'AGENDADO' THEN 1 ELSE 0 END) as aulas_agendadas,
    SUM(CASE WHEN st.status = 'CANCELADO' THEN 1 ELSE 0 END) as aulas_canceladas,
    SUM(CASE WHEN st.status = 'REAGENDADO' THEN 1 ELSE 0 END) as aulas_reagendadas,
    -- Percentual de aderência (realizadas / total não-agendadas)  
    ROUND(
        (SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(SUM(CASE WHEN st.status IN ('REALIZADO', 'CANCELADO') THEN 1 ELSE 0 END), 0)), 1
    ) as percentual_aderencia,
    -- Aulas com horário alterado
    SUM(CASE WHEN TIME(st.data_horario_previsto) != '08:00:00' THEN 1 ELSE 0 END) as aulas_horario_alterado
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
WHERE a.id = 8;

-- ============================================
-- SELECT DE AULAS POR TIPO DE TREINO
-- ============================================

SELECT 
    t.nome AS tipo_treino,
    COUNT(*) as total_aulas,
    SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) as realizadas,
    SUM(CASE WHEN st.status = 'AGENDADO' THEN 1 ELSE 0 END) as agendadas,
    SUM(CASE WHEN st.status = 'CANCELADO' THEN 1 ELSE 0 END) as canceladas,
    SUM(CASE WHEN st.status = 'REAGENDADO' THEN 1 ELSE 0 END) as reagendadas,
    -- Próxima aula agendada
    MIN(CASE WHEN st.status = 'AGENDADO' THEN st.data_horario_previsto ELSE NULL END) as proxima_aula,
    -- Aulas com horário não-padrão
    SUM(CASE WHEN TIME(st.data_horario_previsto) != '08:00:00' THEN 1 ELSE 0 END) as aulas_horario_diferente
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.treinos t ON at.treino_id = t.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
WHERE a.id = 8 
GROUP BY t.id, t.nome
ORDER BY t.nome;

-- ============================================
-- SELECT APENAS PARA AULAS CANCELADAS
-- ============================================

SELECT 
    st.id,
    st.alunos_treinos_id,
    p.nome AS nome_aluno,
    st.data_horario_previsto,
    st.data_horario_inicio,
    st.data_horario_fim,
    st.status,
    st.observacao
FROM vitalis.sessao_treinos st
INNER JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
INNER JOIN vitalis.alunos a ON at.aluno_id = a.id
INNER JOIN vitalis.pessoas p ON a.id = p.id
WHERE st.status = 'CANCELADO' 
AND a.id = 8
ORDER BY st.data_horario_previsto;

SELECT * FROM vitalis.alunos WHERE id = 8;

SELECT 
    st.id,
    st.alunos_treinos_id,
    p.nome AS nome_aluno,
    st.data_horario_previsto,
    st.status
FROM vitalis.sessao_treinos st
INNER JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
INNER JOIN vitalis.alunos a ON at.aluno_id = a.id
INNER JOIN vitalis.pessoas p ON a.id = p.id
WHERE a.id = 8  
ORDER BY st.data_horario_previsto;


SELECT 
    st.id AS sessao_id,
    st.alunos_treinos_id,
    p.nome AS nome_aluno,
    t.nome AS nome_treino,
    st.data_horario_previsto,
    st.status,
    st.observacao
FROM vitalis.sessao_treinos st
INNER JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
INNER JOIN vitalis.alunos a ON at.aluno_id = a.id
INNER JOIN vitalis.pessoas p ON a.id = p.id
INNER JOIN vitalis.treinos t ON at.treino_id = t.id
WHERE st.status = 'CANCELADO' 
AND a.id = 8
ORDER BY st.data_horario_previsto DESC;
