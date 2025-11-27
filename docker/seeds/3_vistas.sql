CREATE OR REPLACE VIEW participantes_publico
AS
	SELECT p.id_participante, pe.nombre ||' '||pe.paterno||' '||pe.materno AS nombre_completo, pe.ci, p.matricula, p.estado, COALESCE(tx.datos_tutor,'') AS datos_tutor
	FROM participante p
	JOIN persona pe ON pe.id_persona = p.id_persona
	LEFT JOIN (	SELECT t.id_tutor, p.nombre||' '||p.paterno||' '||p.materno||' ('||t.parentesco||')' as datos_tutor
			FROM tutor t
			JOIN persona p ON p.id_persona = t.id_persona) tx ON tx.id_tutor = p.id_tutor;

create or replace view curso_taller_publico as
select
    ct.id_curtal as Id,
    a.nombre as Nombre,
    p.nombre || ' ' || p.paterno || ' ' || p.materno as Voluntario,
    s.nombre as Salon
from curso_taller ct
join actividad a on a.id_actividad = ct.id_actividad
join salon s on s.id_salon = a.id_salon
join voluntario v on v.id_voluntario = ct.id_voluntario
join persona p on p.id_persona = v.id_persona;

CREATE OR REPLACE VIEW tutores_select
 AS
 SELECT t.id_tutor,
    (((p.nombre::text || ' '::text) || p.paterno::text) || ' '::text) || p.materno::text AS nombre_completo,
    t.parentesco
   FROM tutor t
     JOIN persona p ON p.id_persona = t.id_persona
  GROUP BY t.id_tutor, p.nombre, p.paterno, p.materno, t.parentesco
  ORDER BY ((((p.nombre::text || ' '::text) || p.paterno::text) || ' '::text) || p.materno::text);

CREATE OR REPLACE VIEW voluntarios_publico
AS
	SELECT 	v.id_voluntario,
			(((p.nombre::text || ' '::text) || p.paterno::text) || ' '::text) || p.materno::text AS nombre_completo,
	    	v.correo,
	    	ne.tipo
	FROM voluntario v
	JOIN persona p ON p.id_persona = v.id_persona
	JOIN nivel_educacion ne ON ne.id_nvl_edu = v.id_nvl_edu;


CREATE OR REPLACE VIEW inscripciones_publico
AS
	SELECT  a.cod_actividad, a.nombre, pa.matricula ,p.nombre||' '||p.paterno||' '||p.materno AS participante
	FROM participante_seregistra_curso_taller pct
	JOIN curso_taller ct ON ct.id_curtal = pct.id_curtal
	JOIN actividad a ON a.id_actividad = ct.id_actividad
	JOIN participante pa ON pa.id_participante = pct.id_participante
	JOIN persona p ON p.id_persona = pa.id_persona;

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


CREATE OR REPLACE VIEW asignaciones_publico
AS
	SELECT a.cod_actividad, a.nombre, p.nombre || ' ' || p.paterno || ' ' || p.materno as voluntario_asignado, ne.tipo
	FROM voluntario_participa_servicio vps
	JOIN servicio s ON s.id_servicio = vps.id_servicio
	JOIN actividad a ON a.id_actividad = s.id_actividad
	JOIN voluntario v ON v.id_voluntario = vps.id_voluntario
	JOIN persona p ON p.id_persona = v.id_persona
	JOIN nivel_educacion ne ON ne.id_nvl_edu = v.id_nvl_edu;


CREATE OR REPLACE VIEW servicios_publico
AS
	SELECT s.id_servicio, a.cod_actividad, a.nombre, s.tipo, s.estado
	FROM servicio s
	JOIN actividad a ON a.id_actividad = s.id_actividad;

create or replace view opt_participante_public as
select
    par.id_participante,
    per.nombre || ' ' || per.paterno || ' ' || per.materno as nombre_completo
from participante par
join persona per on per.id_persona = par.id_persona;



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
