-- Pregunta 1: Conocer el número de evaluaciones por curso

select curso_id_prog, Count(*) As Cantidad from test
group by curso_id_prog;

-- Pregunta 2: Conocer los cursos sin evaluaciones.

select distinct curso.programa from curso
full join test on curso.id_prog=test.curso_id_prog where test.curso_id_prog is null;

-- Pregunta 3: Determinar las evaluaciones con deficiencia. Una evaluación es deficiente:
-- a. Si no tiene preguntas.
-- b. Si hay preguntas con 2 ó menos alternativas
-- c. Si todas las alternativas son correctas o si todas las alternativas son incorrectas.

select test.nombre, count(test.nombre) from test 
full join preguntas on test.id_test=preguntas.test_id_test 
full join alternativas on preguntas.id_pre=alternativas.preguntas_id_pre
group by test.nombre having count(preguntas.id_pre)<=0 or count(alternativas.id_pre)<=0;

-- Pregunta 4: Determinar cuántos alumnos hay en cada curso.

SELECT curso.id_prog, count(id_alum) FROM alumnos, curso
WHERE alumnos.curso_id_prog=curso.id_prog
GROUP BY curso.id_prog;

-- Pregunta 5: Obtener el puntaje no normalizado de cada evaluación. El puntaje no
-- normalizado ha sido definido (requerimiento) como: P = buenas – malas/4. Si un alumno
-- no contesta en una pregunta exactamente lo mismo que se ha definido como correcto,
-- la pregunta cuenta como mala a menos que el alumno haya omitido.

SELECT sum(respuestas.puntaje)
FROM respuestas
GROUP BY respuestas.id_test;

-- Pregunta 6: Obtener el puntaje normalizado, o sea, de 1,0 a 7,0.

SELECT sum(respuestas.puntaje*4/1000) AS Nota
FROM respuestas;

-- Pregunta 7: Nombre de estudiantes de un curso determinado que aprueban una
-- evaluación determinada (donde la nota de aprobación mínima es un 4,0).

select alumnos.nombre from alumnos where(select sum(respuestas.puntaje*7/100)
from alumnos, curso, test, respuestas
where alumnos.curso_id_prog=curso.id_prog and 
curso.id_prog=test.curso_id_prog and
test.id_test=respuestas.id_test) >=4;

-- Pregunta 8: Nota promedio de los estudiantes de un curso determinado, para una
-- evaluación de terminada.

SELECT AVG(respuestas.puntaje*7/100) AS NOTA
FROM alumnos, curso, test, respuestas
WHERE alumnos.curso_id_prog=curso.id_prog
AND curso.id_prog=test.curso_id_prog
AND test.id_test=respuestas.id_test;









