SELECT 
  pl.nome AS nome_plano,
  pl.periodo AS periodo_plano,
  pes_aluno.id AS id_aluno,
  pes_aluno.nome AS nome_aluno,
  a.nivel_experiencia AS nivel_experiencia,
  pes_aluno.celular,
  pes_aluno.url_foto_perfil,
  pes_personal.nome AS nome_personal,

  COUNT(tf.id) AS treinos_semana,
  at.id AS id_aluno_treino,

  GROUP_CONCAT(
    DISTINCT DATE_FORMAT(tf.data_horario_inicio, '%Y-%m-%d') 
    ORDER BY tf.data_horario_inicio 
    SEPARATOR ', '
  ) AS datas_treinos_semana,

  pc.data_fim AS data_vencimento_plano,
  pl.quantidade_aulas AS total_aulas_contratadas,

  ana.id AS id_anamnese,
  ana.objetivo_treino,
  ana.lesao,
  ana.lesao_descricao,
  ana.frequencia_treino,
  ana.experiencia,
  ana.experiencia_descricao,
  ana.desconforto,
  ana.desconforto_descricao,
  ana.fumante,
  ana.proteses,
  ana.proteses_descricao,
  ana.doenca_metabolica,
  ana.doenca_metabolica_descricao,
  ana.deficiencia,
  ana.deficiencia_descricao

FROM planos_contratados pc
JOIN (
  SELECT alunos_id, MAX(data_contratacao) AS data_contratacao
  FROM planos_contratados
  WHERE status = 'ATIVO'
  GROUP BY alunos_id
) ultimos_planos
  ON pc.alunos_id = ultimos_planos.alunos_id 
  AND pc.data_contratacao = ultimos_planos.data_contratacao
  AND pc.status = 'ATIVO'

JOIN planos pl ON pc.planos_id = pl.id
JOIN personal_trainers pt ON pl.personal_trainers_id = pt.id
JOIN pessoas pes_personal ON pt.id = pes_personal.id
JOIN alunos a ON pc.alunos_id = a.id
JOIN pessoas pes_aluno ON a.id = pes_aluno.id
LEFT JOIN anamnese ana ON ana.alunos_id = a.id
LEFT JOIN alunos_treinos at ON at.alunos_id = a.id
LEFT JOIN treinos_finalizados tf 
  ON tf.alunos_treinos_id = at.id
  AND YEARWEEK(tf.data_horario_inicio, 1) = YEARWEEK(CURDATE(), 1)

WHERE pt.id = 5

GROUP BY 
  pl.nome,
  pl.periodo,
  pes_aluno.id,
  pes_aluno.nome,
  pes_aluno.celular,
  pes_aluno.url_foto_perfil,
  pes_personal.nome,
  pc.data_fim,
  pl.quantidade_aulas,
  ana.id,
  at.id,
  ana.objetivo_treino,
  ana.lesao,
  ana.lesao_descricao,
  ana.frequencia_treino,
  ana.experiencia,
  ana.experiencia_descricao,
  ana.desconforto,
  ana.desconforto_descricao,
  ana.fumante,
  ana.proteses,
  ana.proteses_descricao,
  ana.doenca_metabolica,
  ana.doenca_metabolica_descricao,
  ana.deficiencia,
  ana.deficiencia_descricao

ORDER BY pc.data_fim, pes_aluno.nome;