SELECT UPPER('pamela');
SELECT TRIM('    pamela   ');
SELECT UPPER(TRIM('    pamela   '));
SELECT COUNT(*) FROM paciente;
SELECT 'hay '|| COUNT(*) || ' registros' AS contador_de_registros FROM paciente;