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
	JOIN nivel_educacion ne ON ne.id_nvl_edu = v.id_nvl_edu