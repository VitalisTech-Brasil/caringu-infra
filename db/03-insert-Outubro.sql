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
(2, '2025-10-22 08:00:00', '2025-10-22 09:00:00', 'REALIZADO'),
(2, '2025-10-24 08:00:00', '2025-10-24 09:00:00', 'REALIZADO'),
(2, '2025-10-26 08:00:00', '2025-10-26 09:00:00', 'REALIZADO'),
(2, '2025-10-28 08:00:00', '2025-10-28 09:00:00', 'REALIZADO');

-- ========================================
-- AULAS DE NOVEMBRO (AGENDADAS)
-- IDs: 24-31 (8 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1 de Novembro
(2, '2025-11-02 08:00:00', '2025-11-02 09:00:00', 'REALIZADO'),
(2, '2025-11-04 08:00:00', '2025-11-04 09:00:00', 'AGENDADO'),
(2, '2025-11-06 08:00:00', '2025-11-06 09:00:00', 'AGENDADO'),
(2, '2025-11-08 08:00:00', '2025-11-08 09:00:00', 'AGENDADO'),
-- Semana 2 de Novembro
(2, '2025-11-09 08:00:00', '2025-11-09 09:00:00', 'AGENDADO'),
(2, '2025-11-11 08:00:00', '2025-11-11 09:00:00', 'AGENDADO'),
(2, '2025-11-13 08:00:00', '2025-11-13 09:00:00', 'AGENDADO'),
(2, '2025-11-15 08:00:00', '2025-11-15 09:00:00', 'AGENDADO');

/* =========================
   CARLA (planos_contratados_id = 2)
   Aulas realizadas: 9..19  (semanas 1..3 realizadas)
   Aulas agendadas: 20..23 (semana 4 agendada)
   Novembro: 24..31 (agendadas)
   Cada aula terá 4 exercícios: 9,10,30,46
   ========================= */

-- AULAS_TREINOS_EXERCICIOS (CARLA)
INSERT INTO vitalis.aulas_treinos_exercicios
(id, aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
-- Semana 1 (Aulas 9-12) - carga base
(1001, 9,  9,  1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(1002, 9, 10,  2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(1003, 9, 30,  3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(1004, 9, 46,  4,  0.00,300,1,  0, 'Out S1: Abdominal Base'),

(1005,10,  9,  1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(1006,10, 10,  2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(1007,10, 30,  3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(1008,10, 46,  4,  0.00,300,1,  0, 'Out S1: Abdominal Base'),

(1009,11,  9,  1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(1010,11, 10,  2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(1011,11, 30,  3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(1012,11, 46,  4,  0.00,300,1,  0, 'Out S1: Abdominal Base'),

(1013,12,  9,  1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(1014,12, 10,  2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(1015,12, 30,  3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(1016,12, 46,  4,  0.00,300,1,  0, 'Out S1: Abdominal Base'),

-- Semana 2 (Aulas 13-16) - +10%
(1017,13,  9,  1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(1018,13, 10,  2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(1019,13, 30,  3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(1020,13, 46,  4,  0.00,330,1,  0, 'Out S2: Abdominal +10%'),

(1021,14,  9,  1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(1022,14, 10,  2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(1023,14, 30,  3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(1024,14, 46,  4,  0.00,330,1,  0, 'Out S2: Abdominal +10%'),

(1025,15,  9,  1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(1026,15, 10,  2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(1027,15, 30,  3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(1028,15, 46,  4,  0.00,330,1,  0, 'Out S2: Abdominal +10%'),

(1029,16,  9,  1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(1030,16, 10,  2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(1031,16, 30,  3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(1032,16, 46,  4,  0.00,330,1,  0, 'Out S2: Abdominal +10%'),

-- Semana 3 (Aulas 17-19) - +20%
(1033,17,  9,  1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(1034,17, 10,  2, 21.60,10, 4, 60, 'Out S3: Crucifixo +20%'),
(1035,17, 30,  3, 14.40,12, 3, 60, 'Out S3: Afundo +20%'),
(1036,17, 46,  4,  0.00,360,1,  0, 'Out S3: Abdominal +20%'),

(1037,18,  9,  1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(1038,18, 10,  2, 21.60,10, 4, 60, 'Out S3: Crucifixo +20%'),
(1039,18, 30,  3, 14.40,12, 3, 60, 'Out S3: Afundo +20%'),
(1040,18, 46,  4,  0.00,360,1,  0, 'Out S3: Abdominal +20%'),

(1041,19,  9,  1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(1042,19, 10,  2, 21.60,10, 4, 60, 'Out S3: Crucifixo +20%'),
(1043,19, 30,  3, 14.40,12, 3, 60, 'Out S3: Afundo +20%'),
(1044,19, 46,  4,  0.00,360,1,  0, 'Out S3: Abdominal +20%'),

-- Semana 4 AGENDADA (Aulas 20-23) - +30%
(1045,20,  9,  1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(1046,20, 10,  2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(1047,20, 30,  3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(1048,20, 46,  4,  0.00,390,1,  0, 'Out S4: Abdominal +30%'),

(1049,21,  9,  1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(1050,21, 10,  2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(1051,21, 30,  3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(1052,21, 46,  4,  0.00,390,1,  0, 'Out S4: Abdominal +30%'),

(1053,22,  9,  1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(1054,22, 10,  2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(1055,22, 30,  3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(1056,22, 46,  4,  0.00,390,1,  0, 'Out S4: Abdominal +30%'),

(1057,23,  9,  1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(1058,23, 10,  2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(1059,23, 30,  3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(1060,23, 46,  4,  0.00,390,1,  0, 'Out S4: Abdominal +30%'),

-- Novembro (Aulas 24-31) - repetindo padrão: S1 (24-27 base), S2 (28-31 +10%)
(1061,24,  9,  1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(1062,24, 10,  2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(1063,24, 30,  3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(1064,24, 46,  4,  0.00,300,1,  0, 'Nov S1: Abdominal Base'),

(1065,25,  9,  1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(1066,25, 10,  2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(1067,25, 30,  3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(1068,25, 46,  4,  0.00,300,1,  0, 'Nov S1: Abdominal Base'),

(1069,26,  9,  1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(1070,26, 10,  2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(1071,26, 30,  3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(1072,26, 46,  4,  0.00,300,1,  0, 'Nov S1: Abdominal Base'),

(1073,27,  9,  1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(1074,27, 10,  2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(1075,27, 30,  3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(1076,27, 46,  4,  0.00,300,1,  0, 'Nov S1: Abdominal Base'),

-- Semana 2 de Novembro (+10%) (28-31)
(1077,28,  9,  1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(1078,28, 10,  2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1079,28, 30,  3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(1080,28, 46,  4,  0.00,330,1,  0, 'Nov S2: Abdominal +10%'),

(1081,29,  9,  1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(1082,29, 10,  2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1083,29, 30,  3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(1084,29, 46,  4,  0.00,330,1,  0, 'Nov S2: Abdominal +10%'),

(1085,30,  9,  1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(1086,30, 10,  2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1087,30, 30,  3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(1088,30, 46,  4,  0.00,330,1,  0, 'Nov S2: Abdominal +10%'),

(1089,31,  9,  1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(1090,31, 10,  2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1091,31, 30,  3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(1092,31, 46,  4,  0.00,330,1,  0, 'Nov S2: Abdominal +10%');

-- EXECUCOES_EXERCICIOS (CARLA)
-- Só para as aulas realizadas até 19/10 (aulas 9..19).
-- Cada execução referencia o id do registro inserido em aulas_treinos_exercicios (1001..1044).
INSERT INTO vitalis.execucoes_exercicios
(id, aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado, finalizado) VALUES
-- Aula 9 (1001..1004)
(2001, 1001, 50.00, 8, 4, 90, TRUE),
(2002, 1002, 18.00,10, 4, 60, TRUE),
(2003, 1003, 12.00,12, 3, 60, TRUE),
(2004, 1004, 0.00,300,1,  0, TRUE),

-- Aula 10
(2005, 1005, 50.00, 8, 4, 90, TRUE),
(2006, 1006, 18.00,10, 4, 60, TRUE),
(2007, 1007, 12.00,12, 3, 60, TRUE),
(2008, 1008, 0.00,300,1,  0, TRUE),

-- Aula 11
(2009, 1009, 50.00, 8, 4, 90, TRUE),
(2010, 1010, 18.00,10, 4, 60, TRUE),
(2011, 1011, 12.00,12, 3, 60, TRUE),
(2012, 1012, 0.00,300,1,  0, TRUE),

-- Aula 12
(2013, 1013, 50.00, 8, 4, 90, TRUE),
(2014, 1014, 18.00,10, 4, 60, TRUE),
(2015, 1015, 12.00,12, 3, 60, TRUE),
(2016, 1016, 0.00,300,1,  0, TRUE),

-- Aula 13 (semana2 +10%)
(2017, 1017, 55.00, 8, 4, 90, TRUE),
(2018, 1018, 19.80,10, 4, 60, TRUE),
(2019, 1019, 13.20,12, 3, 60, TRUE),
(2020, 1020, 0.00,330,1,  0, TRUE),

-- Aula 14
(2021, 1021, 55.00, 8, 4, 90, TRUE),
(2022, 1022, 19.80,10, 4, 60, TRUE),
(2023, 1023, 13.20,12, 3, 60, TRUE),
(2024, 1024, 0.00,330,1,  0, TRUE),

-- Aula 15
(2025, 1025, 55.00, 8, 4, 90, TRUE),
(2026, 1026, 19.80,10, 4, 60, TRUE),
(2027, 1027, 13.20,12, 3, 60, TRUE),
(2028, 1028, 0.00,330,1,  0, TRUE),

-- Aula 16
(2029, 1029, 55.00, 8, 4, 90, TRUE),
(2030, 1030, 19.80,10, 4, 60, TRUE),
(2031, 1031, 13.20,12, 3, 60, TRUE),
(2032, 1032, 0.00,330,1,  0, TRUE),

-- Aula 17 (semana3 +20%)
(2033, 1033, 60.00, 8, 4, 90, TRUE),
(2034, 1034, 21.60,10, 4, 60, TRUE),
(2035, 1035, 14.40,12, 3, 60, TRUE),
(2036, 1036, 0.00,360,1,  0, TRUE),

-- Aula 18
(2037, 1037, 60.00, 8, 4, 90, TRUE),
(2038, 1038, 21.60,10, 4, 60, TRUE),
(2039, 1039, 14.40,12, 3, 60, TRUE),
(2040, 1040, 0.00,360,1,  0, TRUE),

-- Aula 19
(2041, 1041, 60.00, 8, 4, 90, TRUE),
(2042, 1042, 21.60,10, 4, 60, TRUE),
(2043, 1043, 14.40,12, 3, 60, TRUE),
(2044, 1044, 0.00,360,1,  0, TRUE);

-- FIM DOS DADOS DE OUTUBRO E NOVEMBRO PARA A CARLA
-- ========================================
-- ========================================

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
(4, '2025-10-22 10:00:00', '2025-10-22 11:30:00', 'REALIZADO'),
(4, '2025-10-24 10:00:00', '2025-10-24 11:30:00', 'REALIZADO'),
(4, '2025-10-26 10:00:00', '2025-10-26 11:30:00', 'REALIZADO'),
(4, '2025-10-28 10:00:00', '2025-10-28 11:30:00', 'REALIZADO');

-- ========================================
-- AULAS DE NOVEMBRO (AGENDADAS)
-- IDs: 47-54 (8 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1 de Novembro
(4, '2025-11-02 10:00:00', '2025-11-02 11:30:00', 'REALIZADO'),
(4, '2025-11-04 10:00:00', '2025-11-04 11:30:00', 'AGENDADO'),
(4, '2025-11-06 10:00:00', '2025-11-06 11:30:00', 'AGENDADO'),
(4, '2025-11-08 10:00:00', '2025-11-08 11:30:00', 'AGENDADO'),
-- Semana 2 de Novembro
(4, '2025-11-09 10:00:00', '2025-11-09 11:30:00', 'AGENDADO'),
(4, '2025-11-11 10:00:00', '2025-11-11 11:30:00', 'AGENDADO'),
(4, '2025-11-13 10:00:00', '2025-11-13 11:30:00', 'AGENDADO'),
(4, '2025-11-15 10:00:00', '2025-11-15 11:30:00', 'AGENDADO');
-- ========================================

-- =========================
-- ALEX NAGANO (planos_contratados_id = 4)
-- Mesma lógica aplicada: aulas 32..54 (reais até 19/10 -> 32..42)
-- Cada aula terá os 4 exercícios (9,10,30,46)
-- =========================

-- AULAS_TREINOS_EXERCICIOS (ALEX)
INSERT INTO vitalis.aulas_treinos_exercicios
(id, aulas_id, treinos_exercicios_id, ordem, carga, repeticoes, series, descanso, observacoes_personalizadas) VALUES
-- Semana 1 (Aulas 32-35) - base
(3001, 32,  9, 1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(3002, 32, 10, 2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(3003, 32, 30, 3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(3004, 32, 46, 4,  0.00,15, 1,  0, 'Out S1: Abdominal Base'), -- note: earlier for Alex you had 15 reps; keeping that

(3005, 33,  9, 1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(3006, 33, 10, 2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(3007, 33, 30, 3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(3008, 33, 46, 4,  0.00,15, 1,  0, 'Out S1: Abdominal Base'),

(3009, 34,  9, 1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(3010, 34, 10, 2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(3011, 34, 30, 3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(3012, 34, 46, 4,  0.00,15, 1,  0, 'Out S1: Abdominal Base'),

(3013, 35,  9, 1, 50.00, 8, 4, 90, 'Out S1: Supino Pesado Base'),
(3014, 35, 10, 2, 18.00,10, 4, 60, 'Out S1: Crucifixo Base'),
(3015, 35, 30, 3, 12.00,12, 3, 60, 'Out S1: Afundo Base'),
(3016, 35, 46, 4,  0.00,15, 1,  0, 'Out S1: Abdominal Base'),

-- Semana 2 (36-39) +10%
(3017, 36,  9, 1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(3018, 36, 10, 2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(3019, 36, 30, 3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(3020, 36, 46, 4,  0.00,15, 1,  0, 'Out S2: Abdominal +10%'),

(3021, 37,  9, 1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(3022, 37, 10, 2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(3023, 37, 30, 3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(3024, 37, 46, 4,  0.00,15, 1,  0, 'Out S2: Abdominal +10%'),

(3025, 38,  9, 1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(3026, 38, 10, 2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(3027, 38, 30, 3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(3028, 38, 46, 4,  0.00,15, 1,  0, 'Out S2: Abdominal +10%'),

(3029, 39,  9, 1, 55.00, 8, 4, 90, 'Out S2: Supino Pesado +10%'),
(3030, 39, 10, 2, 19.80,10, 4, 60, 'Out S2: Crucifixo +10%'),
(3031, 39, 30, 3, 13.20,12, 3, 60, 'Out S2: Afundo +10%'),
(3032, 39, 46, 4,  0.00,15, 1,  0, 'Out S2: Abdominal +10%'),

-- Semana 3 (40-42) +20%
(3033, 40,  9, 1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(3034, 40, 10, 2, 21.60,10, 4, 60, 'Out S3: Crucifixo +20%'),
(3035, 40, 30, 3, 14.40,12, 3, 60, 'Out S3: Afundo +20%'),
(3036, 40, 46, 4,  0.00,15, 1,  0, 'Out S3: Abdominal +20%'),

(3037, 41,  9, 1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(3038, 41, 10, 2, 21.60,10, 4, 60, 'Out S3: Crucifixo +20%'),
(3039, 41, 30, 3, 14.40,12, 3, 60, 'Out S3: Afundo +20%'),
(3040, 41, 46, 4,  0.00,15, 1,  0, 'Out S3: Abdominal +20%'),

(3041, 42,  9, 1, 60.00, 8, 4, 90, 'Out S3: Supino Pesado +20%'),
(3042, 42, 10, 2, 21.60,10, 4, 60, 'Out S3: Crucifixo +20%'),
(3043, 42, 30, 3, 14.40,12, 3, 60, 'Out S3: Afundo +20%'),
(3044, 42, 46, 4,  0.00,15, 1,  0, 'Out S3: Abdominal +20%'),

-- Semana 4 AGENDADA (43-46) +30%
(3045, 43,  9, 1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(3046, 43, 10, 2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(3047, 43, 30, 3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(3048, 43, 46, 4,  0.00,15, 1,  0, 'Out S4: Abdominal +30%'),

(3049, 44,  9, 1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(3050, 44, 10, 2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(3051, 44, 30, 3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(3052, 44, 46, 4,  0.00,15, 1,  0, 'Out S4: Abdominal +30%'),

(3053, 45,  9, 1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(3054, 45, 10, 2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(3055, 45, 30, 3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(3056, 45, 46, 4,  0.00,15, 1,  0, 'Out S4: Abdominal +30%'),

(3057, 46,  9, 1, 65.00, 8, 4, 90, 'Out S4: Supino Pesado +30%'),
(3058, 46, 10, 2, 23.40,10, 4, 60, 'Out S4: Crucifixo +30%'),
(3059, 46, 30, 3, 15.60,12, 3, 60, 'Out S4: Afundo +30%'),
(3060, 46, 46, 4,  0.00,15, 1,  0, 'Out S4: Abdominal +30%'),

-- Novembro (Aulas 47-54) - S1 base (47-50), S2 +10% (51-54)
(3061, 47,  9, 1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(3062, 47, 10, 2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(3063, 47, 30, 3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(3064, 47, 46, 4,  0.00,15, 1,  0, 'Nov S1: Abdominal Base'),

(3065, 48,  9, 1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(3066, 48, 10, 2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(3067, 48, 30, 3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(3068, 48, 46, 4,  0.00,15, 1,  0, 'Nov S1: Abdominal Base'),

(3069, 49,  9, 1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(3070, 49, 10, 2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(3071, 49, 30, 3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(3072, 49, 46, 4,  0.00,15, 1,  0, 'Nov S1: Abdominal Base'),

(3073, 50,  9, 1, 50.00, 8, 4, 90, 'Nov S1: Supino Pesado Base'),
(3074, 50, 10, 2, 18.00,10, 4, 60, 'Nov S1: Crucifixo Base'),
(3075, 50, 30, 3, 12.00,12, 3, 60, 'Nov S1: Afundo Base'),
(3076, 50, 46, 4,  0.00,15, 1,  0, 'Nov S1: Abdominal Base'),

(3077, 51,  9, 1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(3078, 51, 10, 2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(3079, 51, 30, 3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(3080, 51, 46, 4,  0.00,15, 1,  0, 'Nov S2: Abdominal +10%'),

(3081, 52,  9, 1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(3082, 52, 10, 2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(3083, 52, 30, 3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(3084, 52, 46, 4,  0.00,15, 1,  0, 'Nov S2: Abdominal +10%'),

(3085, 53,  9, 1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(3086, 53, 10, 2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(3087, 53, 30, 3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(3088, 53, 46, 4,  0.00,15, 1,  0, 'Nov S2: Abdominal +10%'),

(3089, 54,  9, 1, 55.00, 8, 4, 90, 'Nov S2: Supino Pesado +10%'),
(3090, 54, 10, 2, 19.80,10, 4, 60, 'Nov S2: Crucifixo +10%'),
(3091, 54, 30, 3, 13.20,12, 3, 60, 'Nov S2: Afundo +10%'),
(3092, 54, 46, 4,  0.00,15, 1,  0, 'Nov S2: Abdominal +10%');

-- EXECUCOES_EXERCICIOS (ALEX)
-- Para aulas realizadas até 19/10 (32..42). Referenciando ids 3001..3044
INSERT INTO vitalis.execucoes_exercicios
(id, aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado, finalizado) VALUES
-- Aula 32 (3001..3004)
(4001, 3001, 50.00, 8, 4, 90, TRUE),
(4002, 3002, 18.00, 10, 4, 60, TRUE),
(4003, 3003, 12.00, 12, 3, 60, TRUE),
(4004, 3004, 08.50, 15, 1, 0, TRUE),

-- Aula 33
(4005,3005,50.00,8,4,90,TRUE),
(4006,3006,18.00,10,4,60,TRUE),
(4007,3007,12.00,12,3,60,TRUE),
(4008,3008,08.50,15,1,0,TRUE),

-- Aula 34
(4009,3009,50.00,8,4,90,TRUE),
(4010,3010,18.00,10,4,60,TRUE),
(4011,3011,12.00,12,3,60,TRUE),
(4012,3012,08.50,15,1,0,TRUE),

-- Aula 35
(4013,3013,50.00,8,4,90,TRUE),
(4014,3014,18.00,10,4,60,TRUE),
(4015,3015,12.00,12,3,60,TRUE),
(4016,3016,08.50,15,1,0,TRUE),

-- Aula 36 (semana2 +10%)
(4017,3017,55.00,8,4,90,TRUE),
(4018,3018,19.80,10,4,60,TRUE),
(4019,3019,13.20,12,3,60,TRUE),
(4020,3020,08.50,15,1,0,TRUE),

-- Aula 37
(4021,3021,55.00,8,4,90,TRUE),
(4022,3022,19.80,10,4,60,TRUE),
(4023,3023,13.20,12,3,60,TRUE),
(4024,3024,08.50,15,1,0,TRUE),

-- Aula 38
(4025,3025,55.00,8,4,90,TRUE),
(4026,3026,19.80,10,4,60,TRUE),
(4027,3027,13.20,12,3,60,TRUE),
(4028,3028,08.50,15,1,0,TRUE),

-- Aula 39
(4029,3029,55.00,8,4,90,TRUE),
(4030,3030,19.80,10,4,60,TRUE),
(4031,3031,13.20,12,3,60,TRUE),
(4032,3032,08.50,15,1,0,TRUE),

-- Aula 40 (semana3 +20%)
(4033,3033,60.00,8,4,90,TRUE),
(4034,3034,21.60,10,4,60,TRUE),
(4035,3035,14.40,12,3,60,TRUE),
(4036,3036,08.50,15,1,0,TRUE),

-- Aula 41
(4037,3037,60.00,8,4,90,TRUE),
(4038,3038,21.60,10,4,60,TRUE),
(4039,3039,14.40,12,3,60,TRUE),
(4040,3040,08.50,15,1,0,TRUE),

-- Aula 42
(4041,3041,60.00,8,4,90,TRUE),
(4042,3042,21.60,10,4,60,TRUE),
(4043,3043,14.40,12,3,60,TRUE),
(4044,3044,08.50,15,1,0,TRUE);