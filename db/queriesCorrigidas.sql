-- Query 1: Buscar exercícios e treinos por personal

SELECT DISTINCT
    e.nome AS nome_exercicio,
    e.id AS exercicio_id,
    t.id AS treino_id,
    t.nome AS nomeTreino,
    t.grau_dificuldade AS grauDificuldade,
    t.origem AS origemTreinoExercicio,
    t.favorito
FROM alunos_treinos_exercicios ate
JOIN exercicios e ON e.id = ate.exercicios_id
JOIN treinos t ON t.id = ate.treinos_id
WHERE t.personal_id = :personalId;

select * from alunos_treinos_exercicios where treinos_id = 5;

-- Query 2: Buscar exercícios de treinos específicos de um aluno
SELECT DISTINCT
    e.nome AS nome_exercicio,
    e.id AS exercicio_id,
    t.id AS treino_id,
    t.nome AS nomeTreino,
    t.grau_dificuldade AS grauDificuldade,
    t.origem AS origemTreinoExercicio,
    t.favorito
FROM alunos_treinos_exercicios ate
JOIN exercicios e ON e.id = ate.exercicios_id
JOIN treinos t ON t.id = ate.treinos_id
JOIN alunos_treinos at_rel ON at_rel.id = ate.alunos_treinos_id
JOIN alunos a ON a.id = at_rel.alunos_id
WHERE a.id = :alunoId;

-- Query 3: Lista exercícios por treino específico de um aluno
SELECT 
    MIN(ate.id) AS id_treino_exercicio,
    MIN(ate.exercicio_id) AS exercicio_id,
    e.nome AS nome_exercicio,
    t.nome AS nome_treino
FROM alunos_treinos_exercicios ate
JOIN exercicios e ON e.id = ate.exercicios_id
JOIN treinos t ON t.id = ate.treinos_id
JOIN alunos_treinos at_rel ON at_rel.id = ate.alunos_treinos_id
JOIN alunos a ON a.id = at_rel.alunos_id
WHERE t.id = :treinoId
  AND a.id = :alunoId
GROUP BY e.nome, t.nome;

-- Query 4: Detalhes completos de treino para edição
SELECT 
    t.nome AS nomeTreino,
    t.descricao AS descricaoTreino,
    t.personal_id,
    ate.id AS idTreinoExercicio,
    ate.treinos_id,
    ate.exercicio_id,
    ate.carga,
    ate.repeticoes,
    ate.series,
    ate.descanso,
    ate.data_modificacao AS dataHoraCriacao,
    ate.data_modificacao AS dataHoraModificacao,
    t.origem AS origemTreinoExercicio,
    t.favorito AS favoritoTreino,
    t.grau_dificuldade,
    e.nome AS nomeExercicio,
    e.grupo_muscular AS grupoMuscular,
    e.url_video AS urlVideo,
    e.observacoes,
    e.favorito AS favoritoExercicio,
    e.origem AS origemExercicio
FROM treinos t
JOIN alunos_treinos_exercicios ate ON t.id = ate.treinos_id
JOIN exercicios e ON e.id = ate.exercicios_id
WHERE t.personal_id = :personalId 
  AND t.id = :treinoId;
  
  
-- Query 5: Detalhes do aluno com contagem de treinos
SELECT 
    a.id,
    a.peso,
    a.altura,
    p.nome,
    p.email,
    p.celular,
    p.url_foto_perfil AS urlFotoPerfil,
    a.nivel_experiencia AS nivelExperiencia,
    a.nivel_atividade AS nivelAtividade,
    pl.nome AS nome_plano,
    pl.periodo,
    pl.quantidade_aulas AS quantidadeAulas,
    pc.data_fim AS dataFim,
    at_rel.id AS alunos_treinos_id,
    -- Contagem de treinos da semana atual
    COUNT(DISTINCT CASE 
        WHEN st.status = 'REALIZADO' 
        AND YEARWEEK(st.data_horario_inicio, 1) = YEARWEEK(CURDATE(), 1)
        THEN st.id 
    END) AS treinos_semana,
    -- Contagem total de treinos realizados
    COUNT(DISTINCT CASE 
        WHEN st.status = 'REALIZADO' 
        THEN st.id 
    END) AS treinos_total,
    ana.id AS anamnese_id,
    ana.objetivo_treino AS objetivoTreino,
    ana.lesao,
    ana.lesao_descricao AS lesaoDescricao,
    ana.frequencia_treino AS frequenciaTreino,
    ana.experiencia,
    ana.experiencia_descricao AS experienciaDescricao,
    ana.desconforto,
    ana.desconforto_descricao AS desconfortoDescricao,
    ana.fumante,
    ana.proteses,
    ana.proteses_descricao AS protesesDescricao,
    ana.doenca_metabolica AS doencaMetabolica,
    ana.doenca_metabolica_descricao AS doencaMetabolicaDescricao,
    ana.deficiencia,
    ana.deficiencia_descricao AS deficienciaDescricao
FROM planos_contratados pc
JOIN planos pl ON pl.id = pc.planos_id
JOIN personal_trainers pt ON pt.id = pl.personal_trainers_id
JOIN alunos a ON a.id = pc.alunos_id
JOIN pessoas p ON p.id = a.id
LEFT JOIN anamnese ana ON ana.alunos_id = a.id
LEFT JOIN alunos_treinos at_rel ON at_rel.alunos_id = a.id
LEFT JOIN sessao_treinos st ON st.alunos_treinos_id = at_rel.id
WHERE pt.id = :personalId
  AND pc.status = 'ATIVO'
  AND pc.data_contratacao = (
    SELECT MAX(p2.data_contratacao)
    FROM planos_contratados p2
    WHERE p2.alunos_id = pc.alunos_id 
    AND p2.status = 'ATIVO'
  )
GROUP BY 
    a.id, p.nome, p.celular, p.url_foto_perfil, a.nivel_experiencia,
    pl.nome, pl.periodo, pl.quantidade_aulas, pc.data_fim,
    at_rel.id, ana.id, ana.objetivo_treino, ana.lesao, ana.lesao_descricao,
    ana.frequencia_treino, ana.experiencia, ana.experiencia_descricao,
    ana.desconforto, ana.desconforto_descricao, ana.fumante, ana.proteses,
    ana.proteses_descricao, ana.doenca_metabolica, ana.doenca_metabolica_descricao,
    ana.deficiencia, ana.deficiencia_descricao;
    
-- Query 6: Notificações de treinos próximos ao vencimento
SELECT DISTINCT
    pt.id AS personal_id,
    p_personal.nome AS nome_personal,
    a.id AS aluno_id,
    p_aluno.nome AS nome_aluno,
    'Treino próximo ao vencimento' AS nome_treino,
    n.titulo,
    at_rel.data_vencimento AS dataVencimento,
    n.data_criacao AS dataCriacao,
    n.visualizada
FROM alunos_treinos at_rel
JOIN alunos a ON a.id = at_rel.alunos_id
JOIN pessoas p_aluno ON p_aluno.id = a.id
JOIN planos_contratados pc ON pc.alunos_id = a.id
JOIN planos pl ON pl.id = pc.planos_id
JOIN personal_trainers pt ON pt.id = pl.personal_trainers_id
JOIN pessoas p_personal ON p_personal.id = pt.id
LEFT JOIN notificacoes n ON n.pessoas_id = p_aluno.id 
    AND n.tipo = 'TREINO_PROXIMO_VENCIMENTO'
WHERE at_rel.data_vencimento BETWEEN CURDATE() AND :dataLimite
  AND n.titulo IS NULL
  AND pc.status = 'ATIVO';
  
-- Query 8: Notificações de treinos próximos ao vencimento por personal específico
SELECT DISTINCT
    pt.id AS personal_id,
    p_personal.nome AS nome_personal,
    a.id AS aluno_id,
    p_aluno.nome AS nome_aluno,
    'Treino próximo ao vencimento' AS nome_treino,
    n.titulo,
    at_rel.data_vencimento AS dataVencimento,
    n.data_criacao AS dataCriacao,
    n.visualizada
FROM alunos_treinos at_rel
JOIN alunos a ON a.id = at_rel.aluno_id
JOIN pessoas p_aluno ON p_aluno.id = a.id
JOIN planos_contratados pc ON pc.alunos_id = a.id
JOIN planos pl ON pl.id = pc.planos_id
JOIN personal_trainers pt ON pt.id = pl.personal_trainers_id
JOIN pessoas p_personal ON p_personal.id = pt.id
LEFT JOIN notificacoes n ON n.pessoas_id = p_aluno.id 
    AND n.tipo = 'TREINO_PROXIMO_VENCIMENTO'
WHERE at_rel.data_vencimento BETWEEN CURDATE() AND :dataLimite
  AND n.titulo IS NULL
  AND pt.id = :personalId
  AND pc.status = 'ATIVO';
  
  -- Query 9: Horários de início dos treinos da semana atual
SELECT DATE_FORMAT(st.data_horario_inicio, '%Y-%m-%d %H:%i') AS horario_inicio
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 7 -- :alunoId
  AND YEARWEEK(st.data_horario_inicio, 1) = YEARWEEK(CURDATE(), 1)
  AND st.status = 'REALIZADO'
ORDER BY st.data_horario_inicio;

-- Query 10: Horários de fim dos treinos da semana atual  
SELECT DATE_FORMAT(st.data_horario_fim, '%Y-%m-%d %H:%i') AS horario_fim
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 7 -- :alunoId
  AND YEARWEEK(st.data_horario_inicio, 1) = YEARWEEK(CURDATE(), 1)
  AND st.status = 'REALIZADO'
ORDER BY st.data_horario_inicio;


-- Query 11: Todos os horários de início dos treinos do aluno
SELECT DATE_FORMAT(st.data_horario_inicio, '%Y-%m-%d %H:%i') AS horario_inicio
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 7 -- :alunoId
  AND st.status = 'REALIZADO'
ORDER BY st.data_horario_inicio;

-- Query 12: Todos os horários de fim dos treinos do aluno
SELECT DATE_FORMAT(st.data_horario_fim, '%Y-%m-%d %H:%i') AS horario_fim
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
WHERE at.aluno_id = 7 -- :alunoId
  AND st.status = 'REALIZADO'
ORDER BY st.data_horario_inicio;

-- Query 13: DTO de identificação de treinos finalizados por personal trainer
SELECT 
    st.id AS treinoId,
    st.data_horario_inicio AS dataHorarioInicio,
    st.data_horario_fim AS dataHorarioFim,
    p.id AS alunoId,
    p.nome AS nomeAluno,
    p.url_foto_perfil AS urlFotoPerfil,
    CASE 
        WHEN st.data_horario_fim IS NOT NULL THEN true 
        ELSE false 
    END AS finalizado
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas p ON a.id = p.id
JOIN planos_contratados pc ON pc.alunos_id = a.id
JOIN planos pl ON pc.planos_id = pl.id
WHERE pc.status = 'ATIVO'
  AND pl.personal_trainers_id = ?
  AND st.status = 'REALIZADO'
ORDER BY st.data_horario_inicio;

-- Query 14: Evolução de carga por exercício e aluno (Dashboard)
SELECT 
    a.id AS alunoId,
    p.nome AS nomeAluno,
    a.peso AS peso,
    a.altura AS altura,
    st.data_horario_inicio AS dataHorarioInicio,
    st.data_horario_fim AS dataHorarioFim,
    ee.carga_executada AS carga,
    ex.nome AS nomeExercicio
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN execucoes_exercicios ee ON st.id = ee.sessao_treino_id
JOIN alunos_treinos_exercicios ate ON ee.alunos_treinos_exercicios_id = ate.id
JOIN exercicios ex ON ate.exercicio_id = ex.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas p ON a.id = p.id
WHERE ex.id = ? 
  AND a.id = ? 
  AND st.status = 'REALIZADO'
ORDER BY p.nome, st.data_horario_inicio;

-- Query 15: Evolução de treino cumprido por mês/ano
SELECT 
    a.id AS alunoId,
    p.nome AS nomeAluno,
    ex.id AS exercicioId,
    ex.nome AS nomeExercicio,
    YEAR(st.data_horario_inicio) AS ano,
    MONTH(st.data_horario_inicio) AS mes,
    COUNT(st.id) AS quantidadeTreinos,
    an.frequencia_treino AS frequenciaTreino
FROM alunos a
JOIN pessoas p ON a.id = p.id
LEFT JOIN anamnese an ON an.alunos_id = a.id
JOIN alunos_treinos at ON at.aluno_id = a.id
JOIN alunos_treinos_exercicios ate ON ate.aluno_treino_id = at.id
JOIN exercicios ex ON ate.exercicio_id = ex.id
JOIN sessao_treinos st ON st.alunos_treinos_id = at.id
WHERE a.id = ?
  AND ex.id = ?
  AND st.status = 'REALIZADO'
GROUP BY 
    a.id, p.nome, ex.id, ex.nome, 
    YEAR(st.data_horario_inicio), MONTH(st.data_horario_inicio), 
    an.frequencia_treino
ORDER BY YEAR(st.data_horario_inicio), MONTH(st.data_horario_inicio);


-- Query 16: Horas treinadas por exercício, aluno e período
SELECT 
    a.id AS idAluno,
    p.nome AS nomeAluno,
    ex.id AS idExercicio,
    ex.nome AS nomeExercicio,
    YEAR(st.data_horario_inicio) AS ano,
    MONTH(st.data_horario_inicio) AS mes,
    YEARWEEK(st.data_horario_inicio, 1) AS anoSemana,
    ROUND(SUM(TIMESTAMPDIFF(MINUTE, st.data_horario_inicio, st.data_horario_fim)) / 60, 2) AS horasTreinadas
FROM sessao_treinos st
JOIN alunos_treinos at ON st.alunos_treinos_id = at.id
JOIN alunos_treinos_exercicios ate ON ate.aluno_treino_id = at.id
JOIN exercicios ex ON ate.exercicio_id = ex.id
JOIN alunos a ON at.aluno_id = a.id
JOIN pessoas p ON a.id = p.id
WHERE st.data_horario_inicio <= NOW()
  AND ex.id = ? 
  AND a.id = ? 
  AND st.status = 'REALIZADO'
GROUP BY 
    a.id, 
    ex.id, 
    YEAR(st.data_horario_inicio), 
    MONTH(st.data_horario_inicio), 
    YEARWEEK(st.data_horario_inicio, 1)
ORDER BY ano, mes, anoSemana;

