-- ========================================
-- AULAS DE OUTUBRO (REALIZADAS até 19/10)
-- IDs: 9-19 (11 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1
(2, '2025-10-01 08:00:00', '2025-10-01 09:00:00', 'REALIZADO'),
(2, '2025-10-03 08:00:00', '2025-10-03 09:00:00', 'REALIZADO'),
(2, '2025-10-05 08:00:00', '2025-10-05 09:00:00', 'REALIZADO'),
(2, '2025-10-07 08:00:00', '2025-10-07 09:00:00', 'REALIZADO'),
-- Semana 2
(2, '2025-10-08 08:00:00', '2025-10-08 09:00:00', 'REALIZADO'),
(2, '2025-10-10 08:00:00', '2025-10-10 09:00:00', 'REALIZADO'),
(2, '2025-10-12 08:00:00', '2025-10-12 09:00:00', 'REALIZADO'),
(2, '2025-10-14 08:00:00', '2025-10-14 09:00:00', 'REALIZADO'),
-- Semana 3 (até dia 19)
(2, '2025-10-15 08:00:00', '2025-10-15 09:00:00', 'REALIZADO'),
(2, '2025-10-17 08:00:00', '2025-10-17 09:00:00', 'REALIZADO'),
(2, '2025-10-19 08:00:00', '2025-10-19 09:00:00', 'REALIZADO');

-- ========================================
-- AULAS DE OUTUBRO (AGENDADAS a partir de 22/10)
-- IDs: 20-23 (4 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
(2, '2025-10-22 08:00:00', '2025-10-22 09:00:00', 'AGENDADO'),
(2, '2025-10-24 08:00:00', '2025-10-24 09:00:00', 'AGENDADO'),
(2, '2025-10-26 08:00:00', '2025-10-26 09:00:00', 'AGENDADO'),
(2, '2025-10-28 08:00:00', '2025-10-28 09:00:00', 'AGENDADO');

-- ========================================
-- AULAS DE NOVEMBRO (AGENDADAS)
-- IDs: 24-31 (8 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1 de Novembro
(2, '2025-11-02 08:00:00', '2025-11-02 09:00:00', 'AGENDADO'),
(2, '2025-11-04 08:00:00', '2025-11-04 09:00:00', 'AGENDADO'),
(2, '2025-11-06 08:00:00', '2025-11-06 09:00:00', 'AGENDADO'),
(2, '2025-11-08 08:00:00', '2025-11-08 09:00:00', 'AGENDADO'),
-- Semana 2 de Novembro
(2, '2025-11-09 08:00:00', '2025-11-09 09:00:00', 'AGENDADO'),
(2, '2025-11-11 08:00:00', '2025-11-11 09:00:00', 'AGENDADO'),
(2, '2025-11-13 08:00:00', '2025-11-13 09:00:00', 'AGENDADO'),
(2, '2025-11-15 08:00:00', '2025-11-15 09:00:00', 'AGENDADO');

-- ========================================
-- AULAS_TREINOS_EXERCICIOS DE OUTUBRO REALIZADAS (Aulas IDs 9 a 19)
-- Exercícios com progressão de carga
-- ========================================

-- SEMANA 1: Carga Base (Aulas 9-12)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(9, 9, 1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(10, 10, 1, 18.00, 10, 4, 60, 'Out S1: Crucifixo Base'),
(11, 30, 1, 12.00, 12, 3, 60, 'Out S1: Afundo Base'),
(12, 46, 1, 15.00, 300, 1, 0, 'Out S1: Abdominal Base');

-- SEMANA 2: Progressão +10% (Aulas 13-16)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(13, 9, 1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(14, 10, 1, 19.80, 10, 4, 60, 'Out S2: Crucifixo +10%'),
(15, 30, 1, 13.20, 12, 3, 60, 'Out S2: Afundo +10%'),
(16, 46, 1, 15.00, 330, 1, 0, 'Out S2: Abdominal +10%');

-- SEMANA 3 (até 19/10): Progressão +20% (Aulas 17-19)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(17, 9, 1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(18, 10, 1, 21.60, 10, 4, 60, 'Out S3: Crucifixo +20%'),
(19, 30, 1, 14.40, 12, 3, 60, 'Out S3: Afundo +20%');

-- ========================================
-- AULAS_TREINOS_EXERCICIOS DE OUTUBRO AGENDADAS (Aulas IDs 20 a 23)
-- SEMANA 4: Progressão +30%
-- ========================================
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(20, 9, 1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(21, 10, 1, 23.40, 10, 4, 60, 'Out S4: Crucifixo +30%'),
(22, 30, 1, 15.60, 12, 3, 60, 'Out S4: Afundo +30%'),
(23, 46, 1, 15.00, 390, 1, 0, 'Out S4: Abdominal +30%');

-- ========================================
-- AULAS_TREINOS_EXERCICIOS DE NOVEMBRO (AGENDADAS)
-- Aulas IDs: 24-31
-- ========================================

-- SEMANA 1 de NOVEMBRO: Carga Base (Aulas 24-27)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(24, 9, 1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(25, 10, 1, 18.00, 10, 4, 60, 'Nov S1: Crucifixo Base'),
(26, 30, 1, 12.00, 12, 3, 60, 'Nov S1: Afundo Base'),
(27, 46, 1, 15.00, 300, 1, 0, 'Nov S1: Abdominal Base');

-- SEMANA 2 de NOVEMBRO: Progressão +10% (Aulas 28-31)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(28, 9, 1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(29, 10, 1, 19.80, 10, 4, 60, 'Nov S2: Crucifixo +10%'),
(30, 30, 1, 13.20, 12, 3, 60, 'Nov S2: Afundo +10%'),
(31, 46, 1, 15.00, 330, 1, 0, 'Nov S2: Abdominal +10%');

-- ========================================
-- EXECUÇÕES DE EXERCÍCIOS DE OUTUBRO (Apenas as REALIZADAS até 19/10)
-- 11 aulas realizadas = 11 execuções (IDs 25-35)
-- ========================================

INSERT INTO vitalis.execucoes_exercicios 
(aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado, finalizado) VALUES
-- SEMANA 1 (Aulas 9-12)
(25, 50.00, 8, 4, 90, TRUE),    -- AULA 9 (ID 25): Supino Pesado 50kg
(26, 18.00, 10, 4, 60, TRUE),   -- AULA 10 (ID 26): Crucifixo 18kg
(27, 12.00, 12, 3, 60, TRUE),   -- AULA 11 (ID 27): Afundo 12kg
(28, 15.00, 300, 1, 0, TRUE),    -- AULA 12 (ID 28): Abdominal 300 reps
-- SEMANA 2 (Aulas 13-16)
(29, 55.00, 8, 4, 90, TRUE),    -- AULA 13 (ID 29): Supino Pesado 55kg
(30, 19.80, 10, 4, 60, TRUE),   -- AULA 14 (ID 30): Crucifixo 19.8kg
(31, 13.20, 12, 3, 60, TRUE),   -- AULA 15 (ID 31): Afundo 13.2kg
(32, 15.00, 330, 1, 0, TRUE),    -- AULA 16 (ID 32): Abdominal 330 reps
-- SEMANA 3 (Aulas 17-19)
(33, 60.00, 8, 4, 90, TRUE),    -- AULA 17 (ID 33): Supino Pesado 60kg
(34, 21.60, 10, 4, 60, TRUE),   -- AULA 18 (ID 34): Crucifixo 21.6kg
(35, 14.40, 12, 3, 60, TRUE);   -- AULA 19 (ID 35): Afundo 14.4kg
-- Nota: Aulas 20-23 de outubro (agendadas, IDs 36-39) não têm execuções
-- Nota: Aulas 24-31 de novembro (agendadas, IDs 40-47) não têm execuções

-- ========================================
-- AULAS do Alex Nagano
-- ========================================

-- ========================================
-- AULAS DE OUTUBRO (REALIZADAS até 19/10)
-- IDs: 32-42 (11 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1
(4, '2025-10-01 10:00:00', '2025-10-01 11:30:00', 'REALIZADO'),
(4, '2025-10-03 10:00:00', '2025-10-03 11:30:00', 'REALIZADO'),
(4, '2025-10-05 10:00:00', '2025-10-05 11:30:00', 'REALIZADO'),
(4, '2025-10-07 10:00:00', '2025-10-07 11:30:00', 'REALIZADO'),
-- Semana 2
(4, '2025-10-08 10:00:00', '2025-10-08 11:30:00', 'REALIZADO'),
(4, '2025-10-10 10:00:00', '2025-10-10 11:30:00', 'REALIZADO'),
(4, '2025-10-12 10:00:00', '2025-10-12 11:30:00', 'REALIZADO'),
(4, '2025-10-14 10:00:00', '2025-10-14 11:30:00', 'REALIZADO'),
-- Semana 3 (até dia 19)
(4, '2025-10-15 10:00:00', '2025-10-15 11:30:00', 'REALIZADO'),
(4, '2025-10-17 10:00:00', '2025-10-17 11:30:00', 'REALIZADO'),
(4, '2025-10-19 10:00:00', '2025-10-19 11:30:00', 'REALIZADO');

-- ========================================
-- AULAS DE OUTUBRO (AGENDADAS a partir de 22/10)
-- IDs: 43-46 (4 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
(4, '2025-10-22 10:00:00', '2025-10-22 11:30:00', 'AGENDADO'),
(4, '2025-10-24 10:00:00', '2025-10-24 11:30:00', 'AGENDADO'),
(4, '2025-10-26 10:00:00', '2025-10-26 11:30:00', 'AGENDADO'),
(4, '2025-10-28 10:00:00', '2025-10-28 11:30:00', 'AGENDADO');

-- ========================================
-- AULAS DE NOVEMBRO (AGENDADAS)
-- IDs: 47-54 (8 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1 de Novembro
(4, '2025-11-02 10:00:00', '2025-11-02 11:30:00', 'AGENDADO'),
(4, '2025-11-04 10:00:00', '2025-11-04 11:30:00', 'AGENDADO'),
(4, '2025-11-06 10:00:00', '2025-11-06 11:30:00', 'AGENDADO'),
(4, '2025-11-08 10:00:00', '2025-11-08 11:30:00', 'AGENDADO'),
-- Semana 2 de Novembro
(4, '2025-11-09 10:00:00', '2025-11-09 11:30:00', 'AGENDADO'),
(4, '2025-11-11 10:00:00', '2025-11-11 11:30:00', 'AGENDADO'),
(4, '2025-11-13 10:00:00', '2025-11-13 11:30:00', 'AGENDADO'),
(4, '2025-11-15 10:00:00', '2025-11-15 11:30:00', 'AGENDADO');

-- ========================================
-- AULAS_TREINOS_EXERCICIOS DE OUTUBRO REALIZADAS (Aulas IDs 32 a 42)
-- Exercícios com progressão de carga
-- ========================================

-- SEMANA 1: Carga Base (Aulas 32-35)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(32, 9, 1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(33, 10, 1, 18.00, 10, 4, 60, 'Out S1: Crucifixo Base'),
(34, 30, 1, 12.00, 12, 3, 60, 'Out S1: Afundo Base'),
(35, 46, 1, 15.00, 15, 1, 0, 'Out S1: Abdominal Base');

-- SEMANA 2: Progressão +10% (Aulas 36-39)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(36, 9, 1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(37, 10, 1, 19.80, 10, 4, 60, 'Out S2: Crucifixo +10%'),
(38, 30, 1, 13.20, 12, 3, 60, 'Out S2: Afundo +10%'),
(39, 46, 1, 15.00, 15, 1, 0, 'Out S2: Abdominal +10%');

-- SEMANA 3 (até 19/10): Progressão +20% (Aulas 40-42)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(40, 9, 1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(41, 10, 1, 21.60, 10, 4, 60, 'Out S3: Crucifixo +20%'),
(42, 30, 1, 14.40, 12, 3, 60, 'Out S3: Afundo +20%');

-- ========================================
-- AULAS_TREINOS_EXERCICIOS DE OUTUBRO AGENDADAS (Aulas IDs 43 a 46)
-- SEMANA 4: Progressão +30%
-- ========================================
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(43, 9, 1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(44, 10, 1, 23.40, 10, 4, 60, 'Out S4: Crucifixo +30%'),
(45, 30, 1, 15.60, 12, 3, 60, 'Out S4: Afundo +30%'),
(46, 46, 1, 15.00, 15, 1, 0, 'Out S4: Abdominal +30%');

-- ========================================
-- AULAS_TREINOS_EXERCICIOS DE NOVEMBRO (AGENDADAS)
-- Aulas IDs: 24-31
-- ========================================

-- SEMANA 1 de NOVEMBRO: Carga Base (Aulas 47-50)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(47, 9, 1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(48, 10, 1, 18.00, 10, 4, 60, 'Nov S1: Crucifixo Base'),
(49, 30, 1, 12.00, 12, 3, 60, 'Nov S1: Afundo Base'),
(50, 46, 1, 15.00, 15, 1, 0, 'Nov S1: Abdominal Base');

-- SEMANA 2 de NOVEMBRO: Progressão +10% (Aulas 51-54)
INSERT INTO vitalis.aulas_treinos_exercicios
(aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
(51, 9, 1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(52, 10, 1, 19.80, 10, 4, 60, 'Nov S2: Crucifixo +10%'),
(53, 30, 1, 13.20, 12, 3, 60, 'Nov S2: Afundo +10%'),
(54, 46, 1, 15.00, 15, 1, 0, 'Nov S2: Abdominal +10%');

-- ========================================
-- EXECUÇÕES DE EXERCÍCIOS DE OUTUBRO (Apenas as REALIZADAS até 19/10)
-- 11 aulas realizadas = 11 execuções (IDs 25-35)
-- ========================================

INSERT INTO vitalis.execucoes_exercicios 
(aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado, finalizado) VALUES
-- SEMANA 1 (Aulas 32-35)
(48, 50.00, 8, 4, 90, TRUE),    -- AULA 32 (ID 48): Supino Pesado 50kg
(49, 18.00, 10, 4, 60, TRUE),   -- AULA 33 (ID 49): Crucifixo 18kg
(50, 12.00, 12, 3, 60, TRUE),   -- AULA 34 (ID 50): Afundo 12kg
(51, 15.00, 15, 1, 0, TRUE),    -- AULA 35 (ID 51): Abdominal 300 reps
-- SEMANA 2 (Aulas 36-39)
(52, 55.00, 8, 4, 90, TRUE),    -- AULA 36 (ID 52): Supino Pesado 55kg
(53, 19.80, 10, 4, 60, TRUE),   -- AULA 37 (ID 53): Crucifixo 19.8kg
(54, 13.20, 12, 3, 60, TRUE),   -- AULA 38 (ID 54): Afundo 13.2kg
(55, 15.00, 15, 1, 0, TRUE),    -- AULA 39 (ID 55): Abdominal 330 reps
-- SEMANA 3 (Aulas 40-42)
(56, 60.00, 8, 4, 90, TRUE),    -- AULA 40 (ID 56): Supino Pesado 60kg
(57, 21.60, 10, 4, 60, TRUE),   -- AULA 41 (ID 57): Crucifixo 21.6kg
(58, 14.40, 12, 3, 60, TRUE);   -- AULA 42 (ID 58): Afundo 14.4kg
-- Nota: Aulas 43-46 de outubro (agendadas, IDs 59-62) não têm execuções
-- Nota: Aulas 47-54 de novembro (agendadas, IDs 63-70) não têm execuções