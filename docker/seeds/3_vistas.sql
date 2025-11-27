CREATE OR REPLACE VIEW participantes_publico
AS
	SELECT p.id_participante, pe.nombre ||' '||pe.paterno||' '||pe.materno AS nombre_completo, pe.ci, p.matricula, p.estado, COALESCE(tx.datos_tutor,'Sin tutor') AS datos_tutor
	FROM participante p
	JOIN persona pe ON pe.id_persona = p.id_persona
	LEFT JOIN (	SELECT t.id_tutor, p.nombre||' '||p.paterno||' '||p.materno||' ('||t.parentesco||')' as datos_tutor
			FROM tutor t
			JOIN persona p ON p.id_persona = t.id_persona) tx ON tx.id_tutor = p.id_tutor
	ORDER BY p.id_participante;

create or replace view curso_taller_publico as
select
    ct.id_curtal,
    a.cod_actividad,
    a.nombre as nombre_actividad,
    ct.enlace,
    coalesce(to_char(per.f_inicio, 'DD/MM/YYYY') || ' - ' || to_char(per.f_fin, 'DD/MM/YYYY'), 'Sin periodo') as periodo,
    coalesce(h.dia || ' ' || h.turno || ' (' || to_char(h.h_inicio, 'HH24:MI') || '-' || to_char(h.h_fin, 'HH24:MI') || ')', 'Sin horario') as horario,
    coalesce(s.nombre, 'Sin salón') as salon,
    coalesce(p.nombre || ' ' || p.paterno || ' ' || p.materno, 'Sin voluntario') as nombre_voluntario
from curso_taller ct
join actividad a on a.id_actividad = ct.id_actividad
left join periodo per on per.id_periodo = a.id_periodo
left join horario h on h.id_horario = a.id_horario
left join salon s on s.id_salon = a.id_salon
left join voluntario v on v.id_voluntario = ct.id_voluntario
left join persona p on p.id_persona = v.id_persona
order by ct.id_curtal;

CREATE OR REPLACE VIEW tutores_publico
AS
	SELECT t.id_tutor,
		p.nombre||' '||p.paterno||' '||p.materno AS nombre_completo,
		t.parentesco
	FROM tutor t
	JOIN persona p ON p.id_persona = t.id_persona
	ORDER BY t.id_tutor;

CREATE OR REPLACE VIEW voluntarios_publico
AS
	SELECT v.id_voluntario,
		p.nombre||' '||p.paterno||' '||p.materno AS nombre_completo,
		v.correo,
		COALESCE(ne.tipo, 'Sin nivel') AS tipo
	FROM voluntario v
	JOIN persona p ON p.id_persona = v.id_persona
	LEFT JOIN nivel_educacion ne ON ne.id_nvl_edu = v.id_nvl_edu
	ORDER BY v.id_voluntario;


CREATE OR REPLACE VIEW inscripciones_publico
AS
	SELECT pct.id_psct, 
		   a.cod_actividad, 
		   a.nombre as nombre_actividad,
		   pa.matricula,
		   p.nombre||' '||p.paterno||' '||p.materno AS nombre_participante
	FROM participante_seregistra_curso_taller pct
	JOIN curso_taller ct ON ct.id_curtal = pct.id_curtal
	JOIN actividad a ON a.id_actividad = ct.id_actividad
	JOIN participante pa ON pa.id_participante = pct.id_participante
	JOIN persona p ON p.id_persona = pa.id_persona
	ORDER BY pct.id_psct;

CREATE OR REPLACE VIEW aportes_publico
AS
	SELECT 	a.id_aporte,a.monto_total, a.descripcion, a.f_creacion, a.f_edicion,
    p.nombre||' '||p.paterno::text ||' '||p.materno AS nombre_completo
   	FROM aporte a
	JOIN participante pa ON pa.id_participante = a.id_participante
	JOIN persona p ON p.id_persona = pa.id_persona;

CREATE OR REPLACE VIEW aportes_publico
AS
	SELECT 	a.id_aporte,a.monto_total, a.descripcion, a.f_creacion, a.f_edicion,
    p.nombre||' '||p.paterno::text||' '||p.materno AS nombre_completo
   	FROM aporte a
	JOIN participante pa ON pa.id_participante = a.id_participante
	JOIN persona p ON p.id_persona = pa.id_persona;


create or replace view asignaciones_publico
as
    SELECT vps.id_vps, s.id_servicio, v.id_voluntario, a.cod_actividad, a.nombre,
                   p.nombre || ' ' || p.paterno || ' ' || p.materno as voluntario_asignado,
                   ne.tipo
            FROM voluntario_participa_servicio vps
            JOIN servicio s ON s.id_servicio = vps.id_servicio
            JOIN actividad a ON a.id_actividad = s.id_actividad
            JOIN voluntario v ON v.id_voluntario = vps.id_voluntario
            JOIN persona p ON p.id_persona = v.id_persona
            JOIN nivel_educacion ne ON ne.id_nvl_edu = v.id_nvl_edu
            ORDER BY a.cod_actividad

CREATE OR REPLACE VIEW servicios_publico
AS
	SELECT s.id_servicio, a.cod_actividad, a.nombre, s.tipo, s.estado
	FROM servicio s
	JOIN actividad a ON a.id_actividad = s.id_actividad
	ORDER BY s.id_servicio;

create or replace view opt_participante_public as
select
    par.id_participante,
    per.nombre || ' ' || per.paterno || ' ' || per.materno as nombre_completo
from participante par
join persona per on per.id_persona = par.id_persona;

create or replace view actividades_publico as
select
    a.id_actividad,
    a.cod_actividad,
    a.nombre,
    s.nombre as nombre_salon
from actividad a
join salon s on s.id_salon = a.id_salon
order by a.cod_actividad;

create or replace view periodos_publico as
select
    p.id_periodo,
    to_char(p.f_inicio, 'DD/MM/YYYY') as fecha_inicio,
    to_char(p.f_fin, 'DD/MM/YYYY') as fecha_fin,
    to_char(p.f_inicio, 'DD/MM/YYYY') || ' - ' || to_char(p.f_fin, 'DD/MM/YYYY') as periodo_completo
from periodo p
order by p.f_inicio desc;

create or replace view horarios_publico as
select
    h.id_horario,
    h.turno,
    h.dia,
    to_char(h.h_inicio, 'HH24:MI') as hora_inicio,
    to_char(h.h_fin, 'HH24:MI') as hora_fin,
    h.dia || ' ' || h.turno || ' (' || to_char(h.h_inicio, 'HH24:MI') || '-' || to_char(h.h_fin, 'HH24:MI') || ')' as horario_completo
from horario h
order by h.dia, h.h_inicio;

create or replace view salones_publico as
select
    s.id_salon,
    s.nombre,
    s.piso,
    s.capacidad,
    s.nombre || ' - Piso ' || s.piso || ' (Cap: ' || s.capacidad || ')' as salon_completo
from salon s
order by s.nombre;

create or replace view cursos_talleres_select as
select
    ct.id_curtal,
    a.cod_actividad,
    a.nombre,
    a.cod_actividad || ' - ' || a.nombre as curso_completo
from curso_taller ct
join actividad a on a.id_actividad = ct.id_actividad
order by a.cod_actividad;


CREATE OR REPLACE VIEW cantidad_voluntarios_mes
AS
	SELECT COUNT(*) AS cantidad_voluntarios_mes
	FROM voluntario v
	JOIN persona per ON v.id_persona = per.id_persona
	WHERE per.f_creacion >= date_trunc('month', CURRENT_DATE - interval '1 month')
	  AND per.f_creacion < date_trunc('month', CURRENT_DATE);


CREATE OR REPLACE VIEW cantidad_participantes_mes
AS
	SELECT COUNT(*) AS cantidad_participantes_mes
	FROM participante p
	JOIN persona per ON p.id_persona = per.id_persona
	WHERE per.f_creacion >= date_trunc('month', CURRENT_DATE - interval '1 month')
	  AND per.f_creacion < date_trunc('month', CURRENT_DATE);

CREATE OR REPLACE VIEW total_aportes_anio
AS
	SELECT COALESCE(SUM(monto_total), 0) AS total_aportes_anio_actual
	FROM aporte
	WHERE f_creacion >= date_trunc('year', CURRENT_DATE);

CREATE OR REPLACE VIEW cantidad_aportantes_anio
AS
	SELECT COUNT(DISTINCT id_participante) AS cantidad_aportantes_anio_actual
	FROM aporte
	WHERE f_creacion >= date_trunc('year', CURRENT_DATE);


CREATE OR REPLACE VIEW aportes_grafica
AS
	SELECT 
	    EXTRACT(YEAR FROM f_creacion) AS anio,
	    EXTRACT(MONTH FROM f_creacion) AS mes,
	    SUM(aporte.monto_total) AS total
	FROM aporte
	GROUP BY anio, mes
	ORDER BY anio, mes;
