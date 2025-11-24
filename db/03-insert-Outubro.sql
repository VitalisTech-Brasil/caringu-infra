-- ========================================
-- AULAS DE OUTUBRO (REALIZADAS até 19/10)
-- IDs: 9-19 (11 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1
(2, '2025-11-01 08:00:00', '2025-11-01 09:00:00', 'REALIZADO'),
(2, '2025-11-03 08:00:00', '2025-11-03 09:00:00', 'REALIZADO'),
(2, '2025-11-05 08:00:00', '2025-11-05 09:00:00', 'REALIZADO'),
(2, '2025-11-07 08:00:00', '2025-11-07 09:00:00', 'REALIZADO'),
-- Semana 2
(2, '2025-11-08 08:00:00', '2025-11-08 09:00:00', 'REALIZADO'),
(2, '2025-11-10 08:00:00', '2025-11-10 09:00:00', 'REALIZADO'),
(2, '2025-11-12 08:00:00', '2025-11-12 09:00:00', 'REALIZADO'),
(2, '2025-11-14 08:00:00', '2025-11-14 09:00:00', 'REALIZADO'),
-- Semana 3 (até dia 19)
(2, '2025-11-15 08:00:00', '2025-11-15 09:00:00', 'REALIZADO'),
(2, '2025-11-17 08:00:00', '2025-11-17 09:00:00', 'REALIZADO'),
(2, '2025-11-19 08:00:00', '2025-11-19 09:00:00', 'REALIZADO');

-- ========================================
-- AULAS DE OUTUBRO (AGENDADAS a partir de 22/10)
-- IDs: 20-23 (4 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
(2, '2025-11-22 08:00:00', '2025-11-22 09:00:00', 'REALIZADO'),
(2, '2025-11-24 08:00:00', '2025-11-24 09:00:00', 'AGENDADO'),
(2, '2025-11-26 08:00:00', '2025-11-26 09:00:00', 'AGENDADO'),
(2, '2025-11-28 08:00:00', '2025-11-28 09:00:00', 'AGENDADO');

-- ========================================
-- AULAS DE NOVEMBRO (AGENDADAS)
-- IDs: 24-31 (8 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1 de Novembro
(2, '2025-12-02 08:00:00', '2025-12-02 09:00:00', 'AGENDADO'),
(2, '2025-12-04 08:00:00', '2025-12-04 09:00:00', 'AGENDADO'),
(2, '2025-12-06 08:00:00', '2025-12-06 09:00:00', 'AGENDADO'),
(2, '2025-12-08 08:00:00', '2025-12-08 09:00:00', 'AGENDADO'),
-- Semana 2 de Novembro
(2, '2025-12-09 08:00:00', '2025-12-09 09:00:00', 'AGENDADO'),
(2, '2025-12-11 08:00:00', '2025-12-11 09:00:00', 'AGENDADO'),
(2, '2025-12-13 08:00:00', '2025-12-13 09:00:00', 'AGENDADO'),
(2, '2025-12-15 08:00:00', '2025-12-15 09:00:00', 'AGENDADO');

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
(1001, 9, 1, 1, 50.00,  8, 4, 90, 'Controlar respiração na execução'),
(1002, 9, 2, 2, 18.00, 10, 4, 60, 'Manter core estável durante todo exercício'),
(1003, 9, 3, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(1004, 9, 4, 4, 10.00, 12, 3, 45, 'Manter postura durante o exercício'),

(1005,10, 5, 1, 50.00,  8, 4, 90, 'Controlar respiração na execução'),
(1006,10, 6, 2, 18.00, 10, 4, 60, 'Manter core estável durante todo exercício'),
(1007,10, 7, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(1008,10, 8, 4, 12.00, 12, 3, 60, 'Foco na contração muscular'),

(1009,11,  9, 1, 50.00,  8, 4, 90, 'Controlar respiração na execução'),
(1010,11, 10, 2, 18.00, 10, 4, 60, 'Manter core estável durante todo exercício'),
(1011,11, 11, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(1012,11, 12, 4, 10.00, 12, 3, 45, 'Controlar respiração durante o movimento'),

(1013,12, 13, 1, 50.00,  8, 4, 90, 'Controlar respiração na execução'),
(1014,12, 14, 2, 18.00, 10, 4, 60, 'Manter core estável durante todo exercício'),
(1015,12, 15, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(1016,12, 16, 4, 12.00, 12, 3, 60, 'Executar movimento com amplitude adequada'),
(1017,12, 17, 5, 12.00, 12, 3, 45, 'Manter ritmo constante na execução'),

-- Semana 2 (Aulas 13-16) - +10%
(1018, 13, 18, 1, 55.00,  8, 4, 90, 'Manter core estável durante todo exercício'),
(1019, 13, 19, 2, 19.80, 10, 4, 60, 'Focar na contração durante fase concêntrica'),
(1020, 13, 20, 3, 13.20, 12, 3, 60, 'Alinhar joelho com ponta do pé'),
(1021, 13, 21, 4, 14.50, 10, 1, 90, 'Controlar velocidade do movimento'),
(1022, 13, 22, 5, 12.50, 10, 1, 90, 'Manter ritmo constante nas repetições'),

(1023, 14, 23, 1, 55.00,  8, 4, 90, 'Pressionar escápulas contra o banco'),
(1024, 14, 24, 2, 19.80, 10, 4, 60, 'Manter cotovelos levemente flexionados'),
(1025, 14, 25, 3, 13.20, 12, 3, 60, 'Focar no equilíbrio durante execução'),
(1026, 14, 26, 4, 14.75,  8, 1, 90, 'Respirar de forma controlada'),
(1027, 14, 27, 5, 14.50, 10, 1, 90, 'Evitar compensações na lombar'),

(1028, 15, 28, 1, 55.00,  8, 4, 90, 'Concentrar na contração peitoral'),
(1029, 15, 29, 2, 19.80, 10, 4, 60, 'Manter postura neutra da coluna'),
(1030, 15, 30, 3, 13.20, 12, 3, 60, 'Controlar fase excêntrica do movimento'),
(1031, 15, 31, 4, 14.50, 10, 1, 90, 'Ativar musculatura do core'),
(1032, 15, 32, 5, 18.50, 12, 1, 90, 'Manter quadril estável durante série'),
(1033, 15, 33, 6,  4.50, 10, 1, 90, 'Respiração sincronizada com movimento'),

(1034, 16, 34, 1, 55.00,  8, 4, 90, 'Foco na amplitude completa do movimento'),
(1035, 16, 35, 2, 19.80, 10, 4, 60, 'Manter tensão constante no músculo'),
(1036, 16, 36, 3, 13.20, 12, 3, 60, 'Estabilizar joelho durante execução'),
(1037, 16, 37, 4, 14.50, 10, 1, 90, 'Contrair abdômen durante todo exercício'),

-- Semana 3 (Aulas 17-19) - +20%
(1038, 17, 38, 1, 60.00,  8, 4, 90, 'Manter cotovelos alinhados ao tronco'),
(1039, 17, 39, 2, 21.60, 10, 4, 60, 'Executar movimento sem impulso'),
(1040, 17, 40, 3, 14.40, 12, 3, 60, 'Manter joelhos estáveis na execução'),
(1041, 17, 41, 4, 10.00, 12, 3, 60, 'Manter controle na execução do movimento'),

(1042, 18, 42, 1, 60.00,  8, 4, 90, 'Estabilizar ombros durante exercício'),
(1043, 18, 43, 2, 21.60, 10, 4, 60, 'Focar na fase excêntrica do movimento'),
(1044, 18, 44, 3, 14.40, 12, 3, 60, 'Manter alinhamento do quadril'),
(1045, 18, 45, 4, 12.00, 12, 3, 45, 'Foco na técnica do exercício'),

(1046, 19, 46, 1, 60.00,  8, 4, 90, 'Contrair peitoral no ponto máximo'),
(1047, 19, 47, 2, 21.60, 10, 4, 60, 'Manter braços alinhados ao executar'),
(1048, 19, 48, 3, 14.40, 12, 3, 60, 'Distribuir peso igualmente nas pernas'),
(1049, 19, 49, 4, 10.00, 12, 3, 60, 'Respiração controlada durante as séries'),

-- Semana 4 AGENDADA (Aulas 20-23) - +30%
(1050, 20, 50, 1, 65.00,  8, 4, 90, 'Manter cotovelos alinhados durante o movimento'),
(1051, 20, 51, 2, 23.40, 10, 4, 60, 'Focar na contração do peitoral'),
(1052, 20, 52, 3, 15.60, 12, 3, 60, 'Atenção ao alinhamento do joelho'),
(1053, 20, 53, 4,  6.50,  6, 1, 90, 'Controlar respiração na execução'),

(1054, 21, 1, 1, 65.00,  8, 4, 90, 'Evitar arquear as costas durante o exercício'),
(1055, 21, 2, 2, 23.40, 10, 4, 60, 'Movimento controlado e sem momentum'),
(1056, 21, 3, 3, 15.60, 12, 3, 60, 'Manter tronco estável durante execução'),
(1057, 21, 4, 4,  6.50,  6, 1, 90, 'Foco na região abdominal durante contração'),

(1058, 22, 5, 1, 65.00,  8, 4, 90, 'Respiração sincronizada com o movimento'),
(1059, 22, 6, 2, 23.40, 10, 4, 60, 'Amplitude completa do movimento'),
(1060, 22, 7, 3, 15.60, 12, 3, 60, 'Manter quadril alinhado durante exercício'),
(1061, 22, 8, 4,  6.50,  6, 1, 90, 'Contrair abdômen durante todo movimento'),

(1062, 23,  9, 1, 65.00,  8, 4, 90, 'Pressionar escápulas contra o banco'),
(1063, 23, 10, 2, 23.40, 10, 4, 60, 'Manter tensão constante no peitoral'),
(1064, 23, 11, 3, 15.60, 12, 3, 60, 'Descer até 90 graus no joelho'),
(1065, 23, 12, 4,  6.50,  6, 1, 90, 'Evitar elevação do quadril'),

-- Novembro (Aulas 24-31) - repetindo padrão: S1 (24-27 base), S2 (28-31 +10%)
(1066, 24, 13, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(1067, 24, 14, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(1068, 24, 15, 3, 12.00, 12, 3, 60, 'Amplitude completa do movimento'),
(1069, 24, 16, 4, 12.00, 12, 3, 45, 'Manter alinhamento postural'),
(1070, 24, 17, 5, 10.50, 12, 1, 90, 'Controlar respiração na execução'),

(1071, 25, 18, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(1072, 25, 19, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(1073, 25, 20, 3, 12.00, 12, 3, 60, 'Amplitude completa do movimento'),
(1074, 25, 21, 4, 10.00, 12, 3, 60, 'Executar movimento controlado'),
(1075, 25, 22, 5, 10.50, 12, 1, 90, 'Controlar respiração na execução'),

(1076, 26, 23, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(1077, 26, 24, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(1078, 26, 25, 3, 12.00, 12, 3, 60, 'Amplitude completa do movimento'),
(1079, 26, 26, 4, 10.50, 12, 1, 90, 'Controlar respiração na execução'),
(1080, 26, 27, 5, 10.50, 12, 1, 90, 'Controlar respiração na execução'),

(1081, 27, 28, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(1082, 27, 29, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(1083, 27, 30, 3, 12.00, 12, 3, 60, 'Amplitude completa do movimento'),
(1084, 27, 31, 4, 10.50, 12, 1, 90, 'Controlar respiração na execução'),
(1085, 27, 32, 4, 10.50, 12, 1, 90, 'Melhorar a postura ao executar o exercício'),
(1086, 27, 33, 4, 10.50, 12, 1, 90, 'Aumentar a respiração durante o exercício'),

-- Semana 2 de Novembro (+10%) (28-31)
(1087, 28, 34, 1, 55.00,  8, 4, 90, 'Ir até o final da amplitude'),
(1088, 28, 35, 2, 19.80, 10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1089, 28, 36, 3, 13.20, 12, 3, 60, 'Nov S2: Afundo +10%'),
(1090, 28, 37, 4, 14.00,  8, 1, 90, 'Nov S2: Abdominal +10%'),

(1091, 29, 38, 1, 55.00,  8, 4, 90, 'Ir até o final da amplitude'),
(1092, 29, 39, 2, 19.80, 10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1093, 29, 40, 3, 13.20, 12, 3, 60, 'Nov S2: Afundo +10%'),
(1094, 29, 41, 4, 10.00,  8, 1, 90, 'Nov S2: Abdominal +10%'),

(1095, 30, 42, 1, 55.00,  8, 4, 90, 'Ir até o final da amplitude'),
(1096, 30, 43, 2, 19.80, 10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1097, 30, 44, 3, 13.20, 12, 3, 60, 'Nov S2: Afundo +10%'),
(1098, 30, 45, 4, 11.00,  8, 1, 90, 'Nov S2: Abdominal +10%'),

(1099, 31, 46, 1, 55.00,  8, 4, 90, 'Ir até o final da amplitude'),
(1100, 31, 47, 2, 19.80, 10, 4, 60, 'Nov S2: Crucifixo +10%'),
(1101, 31, 48, 3, 13.20, 12, 3, 60, 'Nov S2: Afundo +10%'),
(1102, 31, 49, 4, 11.50,  8, 1, 90, 'Nov S2: Abdominal +10%');

-- EXECUCOES_EXERCICIOS (CARLA)
-- Só para as aulas realizadas até 19/10 (aulas 9..19).
-- Cada execução referencia o id do registro inserido em aulas_treinos_exercicios (1001..1044).

INSERT INTO vitalis.execucoes_exercicios
(id, aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado, finalizado) VALUES
-- Aula 9 (1001..1004)
(2001, 1001, 50.00,  8, 4, 90, TRUE),
(2002, 1002, 18.00, 10, 4, 60, TRUE),
(2003, 1003, 12.00, 12, 3, 60, TRUE),
(2004, 1004, 10.00, 12, 3, 45, TRUE),

-- Aula 10
(2005, 1005, 50.00,  8, 4, 90, TRUE),
(2006, 1006, 18.00, 10, 4, 60, TRUE),
(2007, 1007, 12.00, 12, 3, 60, TRUE),
(2008, 1008, 12.00, 12, 3, 60, TRUE),

-- Aula 11
(2009, 1009, 50.00,  8, 4, 90, TRUE),
(2010, 1010, 18.00, 10, 4, 60, TRUE),
(2011, 1011, 12.00, 12, 3, 60, TRUE),
(2012, 1012, 10.00, 12, 3, 45, TRUE),

-- Aula 12
(2013, 1013, 50.00,  8, 4, 90, TRUE),
(2014, 1014, 18.00, 10, 4, 60, TRUE),
(2015, 1015, 12.00, 12, 3, 60, TRUE),
(2016, 1016, 12.00, 12, 3, 60, TRUE),
(2017, 1017, 55.00,  8, 4, 90, TRUE),

-- Aula 13 (semana2 +10%)
(2018, 1018, 19.80, 10, 4, 60, TRUE),
(2019, 1019, 13.20, 12, 3, 60, TRUE),
(2020, 1020, 12.50, 10, 3, 90, TRUE),
(2021, 1021, 55.00,  8, 4, 90, TRUE),
(2022, 1022, 19.80, 10, 4, 60, TRUE),

-- Aula 14
(2023, 1023, 13.20, 12, 3, 60, TRUE),
(2024, 1024, 12.50, 10, 3, 90, TRUE),
(2025, 1025, 55.00,  8, 4, 90, TRUE),
(2026, 1026, 19.80, 10, 4, 60, TRUE),
(2027, 1027, 13.20, 12, 3, 60, TRUE),

-- Aula 15
(2028, 1028,  7.50, 10, 3, 90, TRUE),
(2029, 1029, 55.00,  8, 4, 90, TRUE),
(2030, 1030, 19.80, 10, 4, 60, TRUE),
(2031, 1031, 13.20, 12, 3, 60, TRUE),
(2032, 1032,  7.50, 10, 3, 90, TRUE),
(2033, 1033, 60.00,  8, 4, 90, TRUE),

-- Aula 16
(2034, 1034, 21.60,10, 4, 60, TRUE),
(2035, 1035, 14.40,12, 3, 60, TRUE),
(2036, 1036, 7.50, 12, 1, 90, TRUE),
(2037, 1037, 60.00, 8, 4, 90, TRUE),

-- Aula 17 (semana3 +20%)
(2038, 1038, 21.60, 10, 4, 60, TRUE),
(2039, 1039, 14.40, 12, 3, 60, TRUE),
(2040, 1040,  7.50, 12, 1, 90, TRUE),
(2041, 1041, 60.00,  8, 4, 90, TRUE),

-- Aula 18
(2042, 1042, 21.60, 10, 4, 60, TRUE),
(2043, 1043, 14.40, 12, 3, 60, TRUE),
(2044, 1044, 14.40, 12, 3, 60, TRUE),
(2045, 1045,  7.50, 12, 1, 90, TRUE),

-- Aula 19
(2046, 1046, 21.60, 10, 4, 60, TRUE),
(2047, 1047, 14.40, 12, 3, 60, TRUE),
(2048, 1048, 14.40, 12, 3, 60, TRUE),
(2049, 1049, 60.00, 12, 1, 60, TRUE),

-- Aula 20
(2050, 1050, 65.00, 10, 4, 60, TRUE),
(2051, 1051, 23.40, 12, 3, 60, TRUE),
(2052, 1052, 15.60, 12, 3, 60, TRUE),
(2053, 1053,  7.50, 12, 1, 90, TRUE),

-- Aula 21
(2054, 1054, 65.00, 10, 4, 60, TRUE),
(2055, 1055, 23.40, 12, 3, 60, TRUE),
(2056, 1056, 15.60, 12, 3, 60, TRUE),
(2057, 1057,  7.50, 12, 1, 90, TRUE),

-- Aula 22
(2058, 1058, 65.00, 10, 4, 60, TRUE),
(2059, 1059, 23.40, 12, 3, 60, TRUE),
(2060, 1060, 15.60, 12, 3, 60, TRUE),
(2061, 1061,  7.50, 12, 1, 90, TRUE),

-- Aula 23
(2062, 1062, 70.00, 10, 4, 60, TRUE),
(2063, 1063, 25.20, 12, 3, 60, TRUE),
(2064, 1064, 16.80, 12, 3, 60, TRUE),
(2065, 1065,  7.50, 12, 1, 90, TRUE),

-- Aula 24
(2066, 1066, 70.00, 10, 4, 60, TRUE),
(2067, 1067, 25.20, 12, 3, 60, TRUE),
(2068, 1068, 16.80, 12, 3, 60, TRUE),
(2069, 1069,  7.50, 30, 1, 90, TRUE),
(2070, 1070, 70.00, 10, 4, 60, TRUE),

-- Aula 25
(2071, 1071, 25.20, 12, 3, 60, TRUE),
(2072, 1072, 16.80, 12, 3, 60, TRUE),
(2073, 1073,  7.50, 30, 1, 90, TRUE),
(2074, 1074, 75.00, 10, 4, 60, TRUE),
(2075, 1075, 27.00, 12, 3, 60, TRUE),

-- Aula 26
(2076, 1076, 18.00, 12, 3, 60, TRUE),
(2077, 1077,  7.50, 30, 1, 90, TRUE),
(2078, 1078, 75.00, 10, 4, 60, TRUE),
(2079, 1079, 27.00, 12, 3, 60, TRUE),
(2080, 1080, 18.00, 12, 3, 60, TRUE),

-- Aula 27
(2081, 1081,  7.50, 30, 1, 90, TRUE),
(2082, 1082, 80.00, 10, 4, 60, TRUE),
(2083, 1083, 28.80, 12, 3, 60, TRUE),
(2084, 1084, 19.20, 12, 3, 60, TRUE),
(2085, 1085,  7.50, 30, 1, 90, TRUE),
(2086, 1086, 80.00, 10, 4, 60, TRUE),

-- Aula 28
(2087, 1087, 28.80, 12, 3, 60, TRUE),
(2088, 1088, 19.20, 12, 3, 60, TRUE),
(2089, 1089,  7.50, 30, 1, 90, TRUE),
(2090, 1090, 85.00, 10, 4, 60, TRUE),

-- Aula 29
(2091, 1091, 30.60, 12, 3, 60, TRUE),
(2092, 1092, 20.40, 12, 3, 60, TRUE),
(2093, 1093,  7.50, 30, 1, 90, TRUE),
(2094, 1094, 85.00, 10, 4, 60, TRUE),

-- Aula 30
(2095, 1095, 30.60, 12, 3, 60, TRUE),
(2096, 1096, 20.40, 12, 3, 60, TRUE),
(2097, 1097,  7.50, 30, 1, 90, TRUE),
(2098, 1098, 90.00, 10, 4, 60, TRUE),

-- Aula 31
(2099, 1099, 32.40, 12, 3, 60, TRUE),
(2100, 1100, 21.60, 12, 3, 60, TRUE),
(2101, 1101,  7.50, 30, 1, 90, TRUE),
(2102, 1102, 90.00, 10, 4, 60, TRUE);

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
(4, '2025-11-01 10:00:00', '2025-11-01 11:30:00', 'REALIZADO'),
(4, '2025-11-03 10:00:00', '2025-11-03 11:30:00', 'REALIZADO'),
(4, '2025-11-05 10:00:00', '2025-11-05 11:30:00', 'REALIZADO'),
(4, '2025-11-07 10:00:00', '2025-11-07 11:30:00', 'REALIZADO'),
-- Semana 2
(4, '2025-11-08 10:00:00', '2025-11-08 11:30:00', 'REALIZADO'),
(4, '2025-11-10 10:00:00', '2025-11-10 11:30:00', 'REALIZADO'),
(4, '2025-11-12 10:00:00', '2025-11-12 11:30:00', 'REALIZADO'),
(4, '2025-11-14 10:00:00', '2025-11-14 11:30:00', 'REALIZADO'),
-- Semana 3 (até dia 19)
(4, '2025-11-15 10:00:00', '2025-11-15 11:30:00', 'REALIZADO'),
(4, '2025-11-17 10:00:00', '2025-11-17 11:30:00', 'REALIZADO'),
(4, '2025-11-19 10:00:00', '2025-11-19 11:30:00', 'REALIZADO');

-- ========================================
-- AULAS DE OUTUBRO (AGENDADAS a partir de 22/10)
-- IDs: 43-46 (4 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
(4, '2025-11-22 10:00:00', '2025-11-22 11:30:00', 'REALIZADO'),
(4, '2025-11-24 10:00:00', '2025-11-24 11:30:00', 'AGENDADO'),
(4, '2025-11-26 10:00:00', '2025-11-26 11:30:00', 'AGENDADO'),
(4, '2025-11-28 10:00:00', '2025-11-28 11:30:00', 'AGENDADO');

-- ========================================
-- AULAS DE NOVEMBRO (AGENDADAS)
-- IDs: 47-54 (8 aulas)
-- ========================================
INSERT INTO vitalis.aulas (planos_contratados_id, data_horario_inicio, data_horario_fim, status) VALUES
-- Semana 1 de Novembro
(4, '2025-12-02 10:00:00', '2025-12-02 11:30:00', 'AGENDADO'),
(4, '2025-12-04 10:00:00', '2025-12-04 11:30:00', 'AGENDADO'),
(4, '2025-12-06 10:00:00', '2025-12-06 11:30:00', 'AGENDADO'),
(4, '2025-12-08 10:00:00', '2025-12-08 11:30:00', 'AGENDADO'),
-- Semana 2 de Novembro
(4, '2025-12-09 10:00:00', '2025-12-09 11:30:00', 'AGENDADO'),
(4, '2025-12-11 10:00:00', '2025-12-11 11:30:00', 'AGENDADO'),
(4, '2025-12-13 10:00:00', '2025-12-13 11:30:00', 'AGENDADO'),
(4, '2025-12-15 10:00:00', '2025-12-15 11:30:00', 'AGENDADO');
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
(3001, 32, 1, 1, 50.00,  8, 4, 90, 'Manter core estável durante todo exercício'),
(3002, 32, 2, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(3003, 32, 3, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(3004, 32, 4, 4, 10.00, 12, 3, 45, 'Manter postura durante o exercício'),

(3005, 33, 5, 1, 50.00,  8, 4, 90, 'Manter core estável durante todo exercício'),
(3006, 33, 6, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(3007, 33, 7, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(3008, 33, 8, 4, 12.00, 12, 3, 60, 'Foco na contração muscular'),

(3009, 34,  9, 1, 50.00,  8, 4, 90, 'Manter core estável durante todo exercício'),
(3010, 34, 10, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(3011, 34, 11, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(3012, 34, 12, 4, 10.00, 12, 3, 45, 'Controlar respiração durante o movimento'),

(3013, 35, 13, 1, 50.00,  8, 4, 90, 'Manter core estável durante todo exercício'),
(3014, 35, 14, 2, 18.00, 10, 4, 60, 'Ir até o final da amplitude'),
(3015, 35, 15, 3, 12.00, 12, 3, 60, 'Controlar velocidade do movimento'),
(3016, 35, 16, 4, 12.00, 12, 3, 60, 'Executar movimento com amplitude adequada'),
(3017, 35, 17, 5, 12.00, 12, 3, 45, 'Manter ritmo constante na execução'),

-- Semana 2 (Aulas 36-39) - +10%
(3018, 36, 18, 1, 55.00,  8, 4, 90, 'Manter core estável durante todo exercício'),
(3019, 36, 19, 2, 19.80, 10, 4, 60, 'Focar na contração durante fase concêntrica'),
(3020, 36, 20, 3, 13.20, 12, 3, 60, 'Alinhar joelho com ponta do pé'),
(3021, 36, 21, 4, 14.50, 10, 1, 90, 'Controlar velocidade do movimento'),
(3022, 36, 22, 5, 12.50, 10, 1, 90, 'Manter ritmo constante nas repetições'),

(3023, 37, 23, 1, 55.00,  8, 4, 90, 'Pressionar escápulas contra o banco'),
(3024, 37, 24, 2, 19.80, 10, 4, 60, 'Manter cotovelos levemente flexionados'),
(3025, 37, 25, 3, 13.20, 12, 3, 60, 'Focar no equilíbrio durante execução'),
(3026, 37, 26, 4, 14.75,  8, 1, 90, 'Respirar de forma controlada'),
(3027, 37, 27, 5, 14.50, 10, 1, 90, 'Evitar compensações na lombar'),

(3029, 38, 29, 2, 19.80, 10, 4, 60, 'Concentrar na contração peitoral'),
(3028, 38, 28, 1, 55.00,  8, 4, 90, 'Manter postura neutra da coluna'),
(3030, 38, 30, 3, 13.20, 12, 3, 60, 'Controlar fase excêntrica do movimento'),
(3031, 38, 31, 4, 14.50, 10, 1, 90, 'Ativar musculatura do core'),
(3032, 38, 32, 5, 18.50, 12, 1, 90, 'Manter quadril estável durante série'),
(3033, 38, 33, 6,  4.50, 10, 1, 90, 'Respiração sincronizada com movimento'),

(3034, 39, 34, 1, 55.00,  8, 4, 90, 'Foco na amplitude completa do movimento'),
(3035, 39, 35, 2, 19.80, 10, 4, 60, 'Manter tensão constante no músculo'),
(3036, 39, 36, 3, 13.20, 12, 3, 60, 'Estabilizar joelho durante execução'),
(3037, 39, 37, 4, 14.50, 10, 1, 90, 'Contrair abdômen durante todo exercício'),

-- Semana 3 (Aulas 40-42) - +20%
(3038, 40, 38, 1, 60.00,  8, 4, 90, 'Manter cotovelos alinhados ao tronco'),
(3039, 40, 39, 2, 21.60, 10, 4, 60, 'Executar movimento sem impulso'),
(3040, 40, 40, 3, 14.40, 12, 3, 60, 'Manter joelhos estáveis na execução'),
(3041, 40, 41, 4, 10.00, 12, 3, 60, 'Manter controle na execução do movimento'),

(3042, 41, 42, 1, 60.00,  8, 4, 90, 'Estabilizar ombros durante exercício'),
(3043, 41, 43, 2, 21.60, 10, 4, 60, 'Focar na fase excêntrica do movimento'),
(3044, 41, 44, 3, 14.40, 12, 3, 60, 'Manter alinhamento do quadril'),
(3045, 41, 45, 4, 12.00, 12, 3, 45, 'Foco na técnica do exercício'),

(3046, 42, 46, 1, 60.00,  8, 4, 90, 'Contrair peitoral no ponto máximo'),
(3047, 42, 47, 2, 21.60, 10, 4, 60, 'Manter braços alinhados ao executar'),
(3048, 42, 48, 3, 14.40, 12, 3, 60, 'Distribuir peso igualmente nas pernas'),
(3049, 42, 49, 4, 10.00, 12, 3, 60, 'Respiração controlada durante as séries'),

-- Semana 4 AGENDADA (Aulas 43-46) - +30%
(3050, 43, 50, 1, 65.00,  8, 4, 90, 'Manter cotovelos alinhados durante o movimento'),
(3051, 43, 51, 2, 23.40, 10, 4, 60, 'Focar na contração do peitoral'),
(3052, 43, 52, 3, 15.60, 12, 3, 60, 'Atenção ao alinhamento do joelho'),
(3053, 43, 53, 4,  6.50,  6, 1, 90, 'Controlar respiração na execução'),

(3054, 44, 1, 1, 65.00,  8, 4, 90, 'Evitar arquear as costas durante o exercício'),
(3055, 44, 2, 2, 23.40, 10, 4, 60, 'Movimento controlado e sem momentum'),
(3056, 44, 3, 3, 15.60, 12, 3, 60, 'Manter tronco estável durante execução'),
(3057, 44, 4, 4,  6.50,  6, 1, 90, 'Foco na região abdominal durante contração'),

(3058, 45, 5, 1, 65.00,  8, 4, 90, 'Respiração sincronizada com o movimento'),
(3059, 45, 6, 2, 23.40, 10, 4, 60, 'Amplitude completa do movimento'),
(3060, 45, 7, 3, 15.60, 12, 3, 60, 'Manter quadril alinhado durante exercício'),
(3061, 45, 8, 4,  6.50,  6, 1, 90, 'Contrair abdômen durante todo movimento'),

(3062, 46,  9, 1, 65.00,  8, 4, 90, 'Pressionar escápulas contra o banco'),
(3063, 46, 10, 2, 23.40, 10, 4, 60, 'Manter tensão constante no peitoral'),
(3064, 46, 11, 3, 15.60, 12, 3, 60, 'Descer até 90 graus no joelho'),
(3065, 46, 12, 4,  6.50,  6, 1, 90, 'Evitar elevação do quadril'),

-- Novembro (Aulas 47-50)
(3066, 47, 13, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3067, 47, 14, 2, 18.00, 10, 4, 60, 'Executar movimento controlado'),
(3068, 47, 15, 3, 12.00, 12, 3, 60, 'Treinar com foco na técnica correta'),
(3069, 47, 16, 4, 12.00, 12, 3, 45, 'Manter alinhamento postural'),
(3070, 47, 17, 5, 10.50, 12, 1, 90, 'Executar movimento controlado'),

(3071, 48, 18, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3072, 48, 19, 2, 18.00, 10, 4, 60, 'Executar movimento controlado'),
(3073, 48, 20, 3, 12.00, 12, 3, 60, 'Treinar com foco na técnica correta'),
(3074, 48, 21, 4, 10.00, 12, 3, 60, 'Executar movimento controlado'),
(3075, 48, 22, 5, 10.50, 12, 1, 90, 'Manter ritmo constante na execução'),

(3076, 49, 23, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3077, 49, 24, 2, 18.00, 10, 4, 60, 'Executar movimento controlado'),
(3078, 49, 25, 3, 12.00, 12, 3, 60, 'Treinar com foco na técnica correta'),
(3079, 49, 26, 4, 10.50, 12, 1, 90, 'Manter ritmo constante na execução'),
(3080, 49, 27, 5, 10.50, 12, 1, 90, 'Manter ritmo constante na execução'),

(3081, 50, 28, 1, 50.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3082, 50, 29, 2, 18.00, 10, 4, 60, 'Executar movimento controlado'),
(3083, 50, 30, 3, 12.00, 12, 3, 60, 'Treinar com foco na técnica correta'),
(3084, 50, 31, 4, 10.50, 12, 1, 90, 'Manter ritmo constante na execução'),
(3085, 50, 32, 4, 10.50, 12, 1, 90, 'Melhorar a postura ao executar o exercício'),
(3086, 50, 33, 4, 10.50, 12, 1, 90, 'Aumentar a respiração durante o exercício'),

-- Semana 2 de Novembro (+10%) (51-54)
(3087, 51, 34, 1, 55.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3088, 51, 35, 2, 19.80, 10, 4, 60, 'Manter ritmo constante na execução'),
(3089, 51, 36, 3, 13.20, 12, 3, 60, 'Ir até a falha muscular controlada'),
(3090, 51, 37, 4, 14.00,  8, 1, 90, 'Executar movimento controlado'),

(3091, 52, 38, 1, 55.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3092, 52, 39, 2, 19.80, 10, 4, 60, 'Manter ritmo constante na execução'),
(3093, 52, 40, 3, 13.20, 12, 3, 60, 'Ir até a falha muscular controlada'),
(3094, 52, 41, 4, 10.00,  8, 1, 90, 'Executar movimento controlado'),

(3095, 53, 42, 1, 55.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3096, 53, 43, 2, 19.80, 10, 4, 60, 'Manter ritmo constante na execução'),
(3097, 53, 44, 3, 13.20, 12, 3, 60, 'Ir até a falha muscular controlada'),
(3098, 53, 45, 4, 11.00,  8, 1, 90, 'Executar movimento controlado'),

(3099, 54, 46, 1, 55.00,  8, 4, 90, 'Melhorar a postura ao executar o exercício'),
(3100, 54, 47, 2, 19.80, 10, 4, 60, 'Manter ritmo constante na execução'),
(3101, 54, 48, 3, 13.20, 12, 3, 60, 'Esteira final leve'),
(3102, 54, 49, 4, 11.50,  8, 1, 90, 'Executar movimento controlado');

-- EXECUCOES_EXERCICIOS (ALEX)
-- Para aulas realizadas até 19/10 (32..42). Referenciando ids 3001..3044
INSERT INTO vitalis.execucoes_exercicios
(id, aulas_treinos_exercicios_id, carga_executada, repeticoes_executadas, series_executadas, descanso_executado, finalizado) VALUES
-- Aula 32 (3001..3004)
(4001, 3001, 50.00, 8, 4, 90, TRUE),
(4002, 3002, 18.00, 10, 4, 60, TRUE),
(4003, 3003, 12.00, 12, 3, 60, TRUE),
(4004, 3004, 08.50, 15, 1, 0, TRUE),

-- ========= até aqui ta certo =========

-- Aula 33
(4005, 3005, 50.00,  8, 4, 90, TRUE),
(4006, 3006, 18.00, 10, 4, 60, TRUE),
(4007, 3007, 12.00, 12, 3, 60, TRUE),
(4008, 3008, 12.00, 12, 3, 60, TRUE),

-- Aula 34
(4009, 3009, 50.00,  8, 4, 90, TRUE),
(4010, 3010, 18.00, 10, 4, 60, TRUE),
(4011, 3011, 12.00, 12, 3, 60, TRUE),
(4012, 3012, 10.00, 12, 3, 45, TRUE),

-- Aula 35
(4013, 3013, 50.00,  8, 4, 90, TRUE),
(4014, 3014, 18.00, 10, 4, 60, TRUE),
(4015, 3015, 12.00, 12, 3, 60, TRUE),
(4016, 3016, 12.00, 12, 3, 60, TRUE),
(4017, 3017, 55.00,  8, 4, 90, TRUE),

-- Aula 36 (semana2 +10%)
(4018, 3018, 19.80, 10, 4, 60, TRUE),
(4019, 3019, 13.20, 12, 3, 60, TRUE),
(4020, 3020, 12.50, 10, 3, 90, TRUE),
(4021, 3021, 55.00,  8, 4, 90, TRUE),
(4022, 3022, 19.80, 10, 4, 60, TRUE),

-- Aula 37
(4023, 3023, 13.20, 12, 3, 60, TRUE),
(4024, 3024, 12.50, 10, 3, 90, TRUE),
(4025, 3025, 55.00,  8, 4, 90, TRUE),
(4026, 3026, 19.80, 10, 4, 60, TRUE),
(4027, 3027, 13.20, 12, 3, 60, TRUE),

-- Aula 38
(4028, 3028,  7.50, 10, 3, 90, TRUE),
(4029, 3029, 55.00,  8, 4, 90, TRUE),
(4030, 3030, 19.80, 10, 4, 60, TRUE),
(4031, 3031, 13.20, 12, 3, 60, TRUE),
(4032, 3032,  7.50, 10, 3, 90, TRUE),
(4033, 3033, 60.00,  8, 4, 90, TRUE),

-- Aula 39
(4034, 3034, 21.60,10, 4, 60, TRUE),
(4035, 3035, 14.40,12, 3, 60, TRUE),
(4036, 3036, 7.50, 12, 1, 90, TRUE),
(4037, 3037, 60.00, 8, 4, 90, TRUE),

-- Aula 40 (semana3 +20%)
(4038, 3038, 21.60, 10, 4, 60, TRUE),
(4039, 3039, 14.40, 12, 3, 60, TRUE),
(4040, 3040,  7.50, 12, 1, 90, TRUE),
(4041, 3041, 60.00,  8, 4, 90, TRUE),

-- Aula 41
(4042, 3042, 21.60, 10, 4, 60, TRUE),
(4043, 3043, 14.40, 12, 3, 60, TRUE),
(4044, 3044, 14.40, 12, 3, 60, TRUE),
(4045, 3045,  7.50, 12, 1, 90, TRUE),

-- Aula 42
(4046, 3046, 21.60, 10, 4, 60, TRUE),
(4047, 3047, 14.40, 12, 3, 60, TRUE),
(4048, 3048, 14.40, 12, 3, 60, TRUE),
(4049, 3049, 60.00, 12, 1, 60, TRUE),

-- Aula 43
(4050, 3050, 65.00, 10, 4, 60, TRUE),
(4051, 3051, 23.40, 12, 3, 60, TRUE),
(4052, 3052, 15.60, 12, 3, 60, TRUE),
(4053, 3053,  7.50, 12, 1, 90, TRUE),

-- Aula 44
(3054, 3054, 65.00, 10, 4, 60, TRUE),
(3055, 3055, 23.40, 12, 3, 60, TRUE),
(3056, 3056, 15.60, 12, 3, 60, TRUE),
(3057, 3057,  7.50, 12, 1, 90, TRUE),

-- Aula 45
(4058, 3058, 65.00, 10, 4, 60, TRUE),
(4059, 3059, 23.40, 12, 3, 60, TRUE),
(4060, 3060, 15.60, 12, 3, 60, TRUE),
(4061, 3061,  7.50, 12, 1, 90, TRUE),

-- Aula 46
(4062, 3062, 70.00, 10, 4, 60, TRUE),
(4063, 3063, 25.20, 12, 3, 60, TRUE),
(4064, 3064, 16.80, 12, 3, 60, TRUE),
(4065, 3065,  7.50, 12, 1, 90, TRUE),

-- Aula 47
(4066, 3066, 70.00, 10, 4, 60, TRUE),
(4067, 3067, 25.20, 12, 3, 60, TRUE),
(4068, 3068, 16.80, 12, 3, 60, TRUE),
(4069, 3069,  7.50, 30, 1, 90, TRUE),
(4070, 3070, 70.00, 10, 4, 60, TRUE),

-- Aula 48
(4071, 3071, 25.20, 12, 3, 60, TRUE),
(4072, 3072, 16.80, 12, 3, 60, TRUE),
(4073, 3073,  7.50, 30, 1, 90, TRUE),
(4074, 3074, 75.00, 10, 4, 60, TRUE),
(4075, 3075, 27.00, 12, 3, 60, TRUE),

-- Aula 49
(4076, 3076, 18.00, 12, 3, 60, TRUE),
(4077, 3077,  7.50, 30, 1, 90, TRUE),
(4078, 3078, 75.00, 10, 4, 60, TRUE),
(4079, 3079, 27.00, 12, 3, 60, TRUE),
(4080, 3080, 18.00, 12, 3, 60, TRUE),

-- Aula 50
(4081, 3081,  7.50, 30, 1, 90, TRUE),
(4082, 3082, 80.00, 10, 4, 60, TRUE),
(4083, 3083, 28.80, 12, 3, 60, TRUE),
(4084, 3084, 19.20, 12, 3, 60, TRUE),
(4085, 3085,  7.50, 30, 1, 90, TRUE),
(4086, 3086, 80.00, 10, 4, 60, TRUE),

-- Aula 51
(4087, 3087, 28.80, 12, 3, 60, TRUE),
(4088, 3088, 19.20, 12, 3, 60, TRUE),
(4089, 3089,  7.50, 30, 1, 90, TRUE),
(4090, 3090, 85.00, 10, 4, 60, TRUE),

-- Aula 52
(4091, 3091, 30.60, 12, 3, 60, TRUE),
(4092, 3092, 20.40, 12, 3, 60, TRUE),
(4093, 3093,  7.50, 30, 1, 90, TRUE),
(4094, 3094, 85.00, 10, 4, 60, TRUE),

-- Aula 53
(4095, 3095, 30.60, 12, 3, 60, TRUE),
(4096, 3096, 20.40, 12, 3, 60, TRUE),
(4097, 3097,  7.50, 30, 1, 90, TRUE),
(4098, 3098, 90.00, 10, 4, 60, TRUE),

-- Aula 54
(4099, 3099, 32.40, 12, 3, 60, TRUE),
(4100, 3100, 21.60, 12, 3, 60, TRUE),
(4101, 3101,  7.50, 30, 1, 90, TRUE),
(4102, 3102, 90.00, 10, 4, 60, TRUE);

-- ========================================
-- TABELA: feedbacks (Carla e Alex - Outubro)
-- ========================================
INSERT INTO vitalis.feedbacks 
(aulas_id, pessoas_id, descricao, data_criacao, tipo_autor, intensidade) VALUES

-- Carla (aluna id/pessoa 6) - Semana 1
(9, 6, 'Me senti bem mais confiante nos exercícios de hoje.', '2025-11-01 09:10:00', 'ALUNO', 'MODERADO'),
(9, 5, 'Carla executou todos os exercícios com boa técnica.', '2025-11-01 09:15:00', 'PERSONAL', 'LEVE'),
(10, 6, 'Um pouco cansada, mas percebi melhora no condicionamento.', '2025-11-03 09:10:00', 'ALUNO', 'LEVE'),

-- Carla - Semana 1 (continuação)
(11, 6, 'Consegui completar todas as séries sem dor nas articulações.', '2025-11-05 09:05:00', 'ALUNO', 'LEVE'),
(12, 5, 'Boa resposta ao aumento de carga; seguir progredindo gradualmente.', '2025-11-07 09:20:00', 'PERSONAL', 'MODERADO'),

-- Carla - Semana 2
(13, 6, 'Treino bem intenso, senti bastante as pernas.', '2025-11-08 09:10:00', 'ALUNO', 'INTENSA'),
(14, 6, 'Consegui concluir o treino mesmo com cansaço acumulado.', '2025-11-10 09:05:00', 'ALUNO', 'MODERADO'),
(15, 5, 'Boa evolução no core; estabilidade melhor que na semana passada.', '2025-11-12 09:20:00', 'PERSONAL', 'MODERADO'),

-- Carla - Semana 3
(17, 6, 'Treino pesado, mas saí muito satisfeita com o resultado.', '2025-11-15 09:10:00', 'ALUNO', 'MUITO_INTENSA'),
(18, 6, 'Senti o cardio mais fluido, com menos pausas.', '2025-11-17 09:05:00', 'ALUNO', 'MODERADO'),
(19, 5, 'Ótima entrega da Carla; próxima fase será focada em manutenção.', '2025-11-19 09:20:00', 'PERSONAL', 'LEVE'),

-- Carla - Aula 20 (semana 4 já realizada)
(20, 6, 'Retorno depois de alguns dias de descanso foi muito bom.', '2025-11-22 09:10:00', 'ALUNO', 'LEVE'),

-- Alex Nagano (aluno id/pessoa 7) - Semana 1
(32, 7, 'Treino longo, mas consegui acompanhar bem o ritmo.', '2025-11-01 11:40:00', 'ALUNO', 'MODERADO'),
(32, 5, 'Boa disposição do Alex na primeira aula do ciclo.', '2025-11-01 11:45:00', 'PERSONAL', 'LEVE'),
(33, 7, 'Senti mais fadiga nos últimos exercícios, mas completei o treino.', '2025-11-03 11:40:00', 'ALUNO', 'INTENSA'),
(34, 7, 'Consegui manter a técnica mesmo com aumento de carga.', '2025-11-05 11:35:00', 'ALUNO', 'MODERADO'),

-- Alex - Semana 1 (continuação)
(35, 5, 'Boa adaptação ao volume de treino; seguir monitorando recuperação.', '2025-11-07 11:50:00', 'PERSONAL', 'MODERADO'),

-- Alex - Semana 2
(36, 7, 'Treino exigente, mas senti evolução na resistência.', '2025-11-08 11:40:00', 'ALUNO', 'INTENSA'),
(37, 7, 'Os exercícios de core estavam mais desafiadores hoje.', '2025-11-10 11:35:00', 'ALUNO', 'MODERADO'),
(38, 5, 'Alex manteve boa postura na maior parte dos exercícios.', '2025-11-12 11:50:00', 'PERSONAL', 'LEVE'),

-- Alex - Semana 3
(40, 7, 'Treino forte, saí bastante cansado, mas satisfeito.', '2025-11-15 11:45:00', 'ALUNO', 'MUITO_INTENSA'),
(41, 7, 'Senti melhora no controle da respiração durante o cardio.', '2025-11-17 11:40:00', 'ALUNO', 'MODERADO'),
(42, 5, 'Boa evolução técnica; próxima etapa será foco em performance.', '2025-11-19 11:55:00', 'PERSONAL', 'MODERADO'),

-- Alex - Aula 43 (semana 4 já realizada)
(43, 7, 'Primeira aula da semana 4 foi puxada, mas muito produtiva.', '2025-11-22 11:40:00', 'ALUNO', 'INTENSA'),
(43, 5, 'Carga alta com boa execução; reforçar alongamentos pós-treino.', '2025-11-22 11:50:00', 'PERSONAL', 'MODERADO');
