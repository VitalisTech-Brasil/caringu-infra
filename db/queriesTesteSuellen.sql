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
INSERT INTO treinos_finalizados (id, alunos_treinos_id, data_horario_inicio, data_horario_fim)
VALUES
-- Semana 1
(39, 6, '2025-05-26 08:00:00', '2025-05-26 09:00:00'), -- Superior
(40, 7, '2025-05-28 08:00:00', '2025-05-28 09:15:00'), -- Inferior
(41, 8, '2025-05-30 08:00:00', '2025-05-30 09:00:00'), -- Costas
-- Semana 2
(42, 6, '2025-06-02 08:00:00', '2025-06-02 09:00:00'),
(43, 7, '2025-06-04 08:00:00', '2025-06-04 09:15:00'),
(44, 8, '2025-06-06 08:00:00', '2025-06-06 09:00:00'),
-- Semana 3
(45, 6, '2025-06-09 08:00:00', '2025-06-09 09:00:00'),
(46, 7, '2025-06-11 08:00:00', '2025-06-11 09:15:00'),
(47, 8, '2025-06-13 08:00:00', '2025-06-13 09:00:00'),
-- Semana 4
(48, 6, '2025-06-16 08:00:00', '2025-06-16 09:00:00'),
(49, 7, '2025-06-18 08:00:00', '2025-06-18 09:15:00'),
(50, 8, '2025-06-20 08:00:00', '2025-06-20 09:00:00'),
-- Semana 5
(51, 6, '2025-06-23 08:00:00', '2025-06-23 09:00:00'),
(52, 7, '2025-06-25 08:00:00', '2025-06-25 09:15:00'),
(53, 8, '2025-06-27 08:00:00', '2025-06-27 09:00:00'),
-- Semana 6
(54, 6, '2025-06-30 08:00:00', '2025-06-30 09:00:00'); -- Superior

-- SUPERIOR (treino_exercicio_id = 29)
INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
(39, 29, 10, 12, 3, 60, 10, 12, 3),
(42, 29, 12, 12, 3, 60, 12, 12, 3),
(45, 29, 12, 12, 3, 60, 12, 12, 3),
(48, 29, 14, 12, 3, 60, 14, 12, 3),
(51, 29, 15, 12, 3, 60, 15, 12, 3),
(54, 29, 15, 12, 3, 60, 15, 12, 3);

-- INFERIOR (treino_exercicio_id = 31)
INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
(40, 31, 30, 15, 4, 90, 30, 15, 4),
(43, 31, 32, 15, 4, 90, 32, 15, 4),
(46, 31, 35, 12, 4, 90, 35, 12, 4),
(49, 31, 35, 12, 4, 90, 35, 12, 4),
(52, 31, 37, 12, 4, 90, 37, 12, 4);

-- COSTAS (treino_exercicio_id = 34)
INSERT INTO execucoes_exercicios (
    sessao_treino_id, treino_exercicio_id,
    carga_planejada, repeticoes_planejadas, series_planejadas, descanso_planejado,
    carga_executada, repeticoes_executadas, series_executadas
) VALUES
(41, 34, 20, 12, 4, 75, 20, 12, 4),
(44, 34, 22, 12, 4, 75, 22, 12, 4),
(47, 34, 25, 12, 4, 75, 25, 12, 4),
(50, 34, 25, 12, 4, 75, 25, 12, 4),
(53, 34, 28, 12, 4, 75, 28, 12, 4);


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

SELECT tf.id as sessao_id, tf.alunos_treinos_id, tf.data_horario_inicio
FROM vitalis.treinos_finalizados tf
JOIN vitalis.alunos_treinos at ON tf.alunos_treinos_id = at.id
WHERE at.aluno_id = 8;

SELECT ex.sessao_treino_id, ex.treino_exercicio_id, ex.carga_executada, tf.data_horario_inicio
FROM vitalis.execucoes_exercicios ex
JOIN vitalis.treinos_finalizados tf ON ex.sessao_treino_id = tf.id
JOIN vitalis.alunos_treinos at ON tf.alunos_treinos_id = at.id
WHERE at.aluno_id = 8;

-- =====================================================
-- Select do aluno x para verificar a progressão de carga pelo treino_exercicio_id
-- =====================================================

SELECT 
    p.nome AS aluno_nome,
    tf.data_horario_inicio AS data_treino,
    ex.carga_executada AS carga_kg,
    ex.treino_exercicio_id
FROM vitalis.execucoes_exercicios ex 
JOIN vitalis.treinos_finalizados tf 
    ON ex.sessao_treino_id = tf.id 
JOIN vitalis.alunos_treinos at 
    ON tf.alunos_treinos_id = at.id 
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id 
JOIN vitalis.pessoas p 
    ON a.id = p.id 
WHERE a.id = 8   
ORDER BY tf.data_horario_inicio;

-- =====================================================
-- Suellen x Triceps Banco
-- =====================================================

SELECT 
    p.nome AS aluna,
    e.nome AS exercicio,
    t.nome AS treino,
    tf.data_horario_inicio AS data_treino,
    
    ee.carga_planejada,
    ee.carga_executada,
    ee.repeticoes_executadas,
    ee.series_executadas

FROM vitalis.execucoes_exercicios ee
JOIN vitalis.treinos_exercicios te 
    ON ee.treino_exercicio_id = te.id
JOIN vitalis.exercicios e 
    ON te.exercicio_id = e.id
JOIN vitalis.treinos t 
    ON te.treino_id = t.id
JOIN vitalis.treinos_finalizados tf 
    ON ee.sessao_treino_id = tf.id
JOIN vitalis.alunos_treinos at 
    ON tf.alunos_treinos_id = at.id
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id
JOIN vitalis.pessoas p 
    ON a.id = p.id

WHERE p.id = 8         
  AND e.id = 15        
ORDER BY tf.data_horario_inicio ASC;

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
    FROM treinos_finalizados tf
    JOIN alunos_treinos at2 
        ON at2.id = tf.alunos_treinos_id
    WHERE at2.aluno_id = 8
    ORDER BY tf.data_horario_inicio DESC
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
    tf.data_horario_inicio,
    tf.data_horario_fim,
    e.nome AS exercicio,
    ex.carga_planejada,
    ex.repeticoes_planejadas,
    ex.series_planejadas,
    ex.carga_executada,
    ex.repeticoes_executadas,
    ex.series_executadas,
    ROUND(
        (ex.carga_executada / NULLIF(ex.carga_planejada, 0)) * 100, 2
    ) AS performance_carga_percent,
    ROUND(
        (ex.repeticoes_executadas / NULLIF(ex.repeticoes_planejadas, 0)) * 100, 2
    ) AS performance_repeticoes_percent
FROM treinos_finalizados tf
JOIN alunos_treinos at ON tf.alunos_treinos_id = at.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas pa ON a.id = pa.id
JOIN treinos t ON at.treino_id = t.id
JOIN personal_trainers pt ON t.personal_id = pt.id
JOIN pessoas pp ON pt.id = pp.id
LEFT JOIN execucoes_exercicios ex ON tf.id = ex.sessao_treino_id
LEFT JOIN treinos_exercicios te ON ex.treino_exercicio_id = te.id  
LEFT JOIN exercicios e ON te.exercicio_id = e.id                   
WHERE DATE(tf.data_horario_inicio) IN ('2025-08-19', '2025-08-20')
ORDER BY tf.data_horario_inicio, aluno_nome, exercicio;


-- =====================================================
-- SELECT: RELATÓRIO POR ALUNO E PERFORMANCE DE CARGA POR DIA, CASO A GENTE PRECISE DAR UM FEEDBACK PARA SABER COMO OS ALUNOS ESTÃO PERFORMANDO
-- =====================================================

SELECT 
    pa.nome AS aluno_nome,
    DATE(tf.data_horario_inicio) as data_treino,
    pp.nome AS personal_nome,
    t.nome AS nome_treino,
    COUNT(ex.id) as total_exercicios,
    TIMESTAMPDIFF(MINUTE, tf.data_horario_inicio, tf.data_horario_fim) as duracao_minutos,
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
FROM treinos_finalizados tf
JOIN alunos_treinos at ON tf.alunos_treinos_id = at.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas pa ON a.id = pa.id
JOIN treinos t ON at.treino_id = t.id
JOIN personal_trainers pt ON t.personal_id = pt.id
JOIN pessoas pp ON pt.id = pp.id
LEFT JOIN execucoes_exercicios ex ON tf.id = ex.sessao_treino_id
WHERE DATE(tf.data_horario_inicio) IN ('2025-08-19', '2025-08-20')
GROUP BY tf.id, pa.nome, DATE(tf.data_horario_inicio), pp.nome, t.nome
ORDER BY data_treino, aluno_nome;


-- =====================================================
-- SELECT: RELATÓRIO POR ALUNO E PERFORMANCE DO TREINO E OS EXERCICIOS QUE FORAM FEITOS NO DIA
-- =====================================================

SELECT 
    per.nome AS personal,
    alu.nome AS aluno,
    t.nome AS treino,
    tf.data_horario_inicio AS data_treino,
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
JOIN vitalis.treinos_finalizados tf 
    ON ee.sessao_treino_id = tf.id
JOIN vitalis.alunos_treinos at 
    ON tf.alunos_treinos_id = at.id
JOIN vitalis.alunos a 
    ON at.aluno_id = a.id
JOIN vitalis.pessoas alu 
    ON a.id = alu.id
WHERE pt.id = 2
ORDER BY alu.nome, tf.data_horario_inicio, t.nome, e.nome;


