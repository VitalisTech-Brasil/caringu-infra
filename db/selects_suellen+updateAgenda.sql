-- SELECT: Dados básicos da aluna
SELECT a.id, p.nome 
FROM vitalis.alunos a 
JOIN vitalis.pessoas p ON a.id = p.id 
WHERE a.id = 8;

-- SELECT: Treinos da aluna
SELECT at.id as aluno_treino_id, at.aluno_id, at.data_inicio, at.status 
FROM vitalis.alunos_treinos at 
WHERE at.aluno_id = 8;

-- SELECT: Exercícios dos treinos da aluna
SELECT 
    ate.id as ate_id, 
    ate.aluno_treino_id, 
    ate.exercicio_id, 
    e.nome as exercicio_nome, 
    ate.carga,
    ate.repeticoes,
    ate.series,
    ate.descanso
FROM vitalis.alunos_treinos_exercicios ate
JOIN vitalis.alunos_treinos at ON ate.aluno_treino_id = at.id
JOIN vitalis.exercicios e ON ate.exercicio_id = e.id
WHERE at.aluno_id = 8;

-- SELECT: Sessões de treino
SELECT st.id as sessao_id, st.alunos_treinos_id, st.data_horario_inicio, st.status
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 8;

-- SELECT: Execuções dos exercícios
SELECT 
    ex.sessao_treino_id, 
    ex.alunos_treinos_exercicios_id, 
    ex.carga_executada, 
    ex.repeticoes_executadas,
    ex.series_executadas,
    st.data_horario_inicio
FROM vitalis.execucoes_exercicios ex
JOIN vitalis.sessao_treinos st ON ex.sessao_treino_id = st.id
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 8
ORDER BY st.data_horario_inicio;

-- SELECT: Progressão de carga por exercício
SELECT 
    p.nome AS aluno_nome,
    e.nome AS exercicio_nome,
    st.data_horario_inicio AS data_treino,
    ate.carga AS carga_planejada,
    ex.carga_executada,
    ate.repeticoes AS repeticoes_planejadas,
    ex.repeticoes_executadas
FROM vitalis.execucoes_exercicios ex 
JOIN vitalis.sessao_treinos st ON ex.sessao_treino_id = st.id 
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id 
JOIN vitalis.alunos_treinos_exercicios ate ON ex.alunos_treinos_exercicios_id = ate.id
JOIN vitalis.exercicios e ON ate.exercicio_id = e.id
JOIN vitalis.alunos a ON at.aluno_id = a.id 
JOIN vitalis.pessoas p ON a.id = p.id 
WHERE a.id = 8   
ORDER BY e.nome, st.data_horario_inicio;

-- SELECT: Relatório completo de performance
SELECT 
    p.nome AS aluno_nome,
    e.nome AS exercicio_nome,
    DATE(st.data_horario_inicio) as data_treino,
    TIMESTAMPDIFF(MINUTE, st.data_horario_inicio, st.data_horario_fim) as duracao_minutos,
    ate.carga AS carga_planejada,
    ex.carga_executada,
    ate.repeticoes AS repeticoes_planejadas,
    ex.repeticoes_executadas,
    ate.series AS series_planejadas,
    ex.series_executadas,
    ROUND((ex.carga_executada / NULLIF(ate.carga, 0)) * 100, 1) AS performance_carga_percent,
    ROUND((ex.repeticoes_executadas / NULLIF(ate.repeticoes, 0)) * 100, 1) AS performance_repeticoes_percent
FROM vitalis.execucoes_exercicios ex
JOIN vitalis.sessao_treinos st ON ex.sessao_treino_id = st.id
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos_treinos_exercicios ate ON ex.alunos_treinos_exercicios_id = ate.id
JOIN vitalis.exercicios e ON ate.exercicio_id = e.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
JOIN vitalis.pessoas p ON a.id = p.id
WHERE a.id = 8
ORDER BY st.data_horario_inicio, e.nome;

-- SELECT: Histórico completo de aulas
SELECT 
    p.nome AS aluna_nome,
    st.status,
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
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
JOIN vitalis.pessoas p ON a.id = p.id
WHERE a.id = 8 ;

-- SELECT: Resumo estatístico das aulas
SELECT 
    COUNT(*) as total_aulas,
    SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) as aulas_realizadas,
    SUM(CASE WHEN st.status = 'AGENDADO' THEN 1 ELSE 0 END) as aulas_agendadas,
    SUM(CASE WHEN st.status = 'CANCELADO' THEN 1 ELSE 0 END) as aulas_canceladas,
    SUM(CASE WHEN st.status = 'REAGENDADO' THEN 1 ELSE 0 END) as aulas_reagendadas,
    ROUND(
        (SUM(CASE WHEN st.status = 'REALIZADO' THEN 1 ELSE 0 END) * 100.0 / 
         NULLIF(COUNT(*), 0)), 1
    ) as percentual_aderencia
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN vitalis.alunos a ON at.aluno_id = a.id
WHERE a.id = 8;

-- REAGENDAMENTO

UPDATE vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
SET st.data_horario_inicio = '2025-07-08 10:00:00',
    st.data_horario_fim = '2025-07-08 11:00:00',
    st.status = 'REAGENDADO'
WHERE at.aluno_id = 8 
  AND at.id = 7
  AND st.status = 'AGENDADO';

SELECT st.id, st.status 
FROM vitalis.sessao_treinos st
JOIN vitalis.alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 8 AND at.id = 7  AND st.status = 'REAGENDADO';