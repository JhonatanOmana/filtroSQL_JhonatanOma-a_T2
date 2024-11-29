-- 1 Encuentra el profesor que ha impartido más asignaturas en el último año académico.

select p.nombre from profesor p
inner join asignatura a on p.id_profesor 
order by nombre asc limit 1;

-- 2 Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.

select distinct d.nombre as departamentos_mayor_numero_asignaturas from departamento d 
inner join profesor p on d.id_departamento =  p.id_departamento
left join asignatura a on p.id_departamento = a.id_profesor
limit 5;

-- 3 Obtén el total de alumnos y docentes por departamento.

select count(id_alumno), count(id_profesor) 
from alumno,profesor
where profesor.id_departamento;

-- 4 Calcula el número total de alumnos matriculados en asignaturas de un género específico 
-- en un semestre determinado.

select count(id_alumno) as total_alumnos,a.sexo from alumno a 
where sexo = 'H';

-- 5 Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.

select distinct a.nombre,asig.nombre,asig.id_grado 
from alumno a inner join asignatura asig 
where id_grado = '7';

-- 6 Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.

select distinct g.nombre from grado g
inner join asignatura a on g.id_grado
order by nombre asc limit 3;

-- 7 Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.

select distinct p.nombre from profesor p 
inner join asignatura a on p.id_profesor 
order by nombre desc limit 5; 

-- 8 Calcula el promedio de edad de los alumnos al momento de su primera matrícula.




-- 9 Encuentra los cinco profesores que han impartido más clases de un mismo grado.

select distinct p.nombre from profesor p 
inner join asignatura a on p.id_profesor 
order by nombre asc limit 5; 

-- 10 Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.

select distinct a.nombre 
as alumnos_cursado_10_asignaturas_ultimo_año 
from alumno a 
inner join alumno_se_matricula_asignatura asig 
on a.id_alumno = asig.id_alumno; 

-- 11 Calcula el promedio de créditos de las asignaturas por grado.

select avg(creditos)
as promedio_créditos_asignaturas_grado,a.id_grado 
from asignatura a
where id_grado = 7;

select avg(creditos)
as promedio_créditos_asignaturas_grado,a.id_grado 
from asignatura a
where id_grado = 4;

-- 12 Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.


select distinct a.nombre,a.cuatrimestre,ce.anyo_inicio as horas from asignatura a
inner join alumno_se_matricula_asignatura asm on asm.id_alumno
inner join curso_escolar ce on asm.id_curso_escolar = ce.id_curso_escolar
where a.cuatrimestre = 2
order by a.nombre asc limit 5;


-- 13 Muestra los alumnos que han cursado más asignaturas de un género específico.

select count(id_alumno) as total_alumnos,a.sexo,count(id_asignatura) as asignaturas 
from alumno a,asignatura asig 
where sexo = 'H';

-- 14 Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.



-- 15 Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.

select distinct count(id_asignatura),a.nombre from asignatura a
where a.cuatrimestre = 2
group by nombre;

-- 16 Calcula el total de asignaturas impartidas por cada profesor en el último semestre.

select distinct count(id_asignatura) as total_asignatura ,p.nombre from asignatura a
right join profesor p on a.id_profesor = p.id_profesor 
group by p.nombre;

-- 17 Encuentra al alumno con la matrícula más reciente.

select distinct a.nombre from alumno a
inner join alumno_se_matricula_asignatura asm on a.id_alumno = asm.id_alumno
inner join curso_escolar ce on asm.id_curso_escolar = ce.id_curso_escolar;

select * from curso_escolar;

-- 18 Lista los cinco grados con mayor número de alumnos matriculados durante los últimos tres meses.

select distinct g.nombre from grado g 
left join asignatura a on g.id_grado = a.id_grado
group by g.nombre limit 5;

-- 19 Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.

select distinct * from asignatura a 
inner join alumno_se_matricula_asignatura asm on a.id_asignatura = asm.id_asignatura
left join alumno al on asm.id_alumno = al.id_alumno
where a.cuatrimestre = 2
order by a.id_asignatura asc ;


select count(id_asignatura) as cantidad_asignaturas from asignatura where cuatrimestre = 2 ;

-- 20 Lista los profesores que no han impartido clases en el último año académico.

select p.nombre,p.id_departamento as Lista_profesores_no_impartido_clases_último_año_académico  from profesor p
where id_departamento is null ;


