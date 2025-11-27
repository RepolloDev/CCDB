CREATE OR REPLACE FUNCTION fn_generar_matricula()
RETURNS TRIGGER AS $$
DECLARE
    ultimo_numero INT;
BEGIN
    IF NEW.matricula IS NULL OR NEW.matricula = '' THEN
        -- Tomar el máximo número existente en las matrículas actuales
        SELECT COALESCE(MAX(SUBSTRING(matricula FROM 6)::INT), 39)  -- empieza en 39 si no hay registros
        INTO ultimo_numero
        FROM participante;

        -- Asignar nueva matrícula
        NEW.matricula := 'PART-' || LPAD((ultimo_numero + 1)::text, 6, '0');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trgMatriculaAutomatica
BEFORE INSERT ON participante
FOR EACH ROW
EXECUTE FUNCTION fn_generar_matricula();


CREATE OR REPLACE FUNCTION sp_crear_participante(
    p_nombre TEXT,
    p_paterno TEXT,
    p_materno TEXT,
    p_ci TEXT,
    p_celular TEXT,
    p_genero TEXT,
    p_fn DATE,
    p_zona TEXT,
    p_calle TEXT,
    p_nro TEXT,
    p_estado TEXT DEFAULT 'activo',
    p_id_tutor INT DEFAULT NULL
)
RETURNS INT AS $$
DECLARE
    v_id_persona INT;
    v_id_participante INT;
BEGIN
    -- Buscar persona por CI
    SELECT id_persona INTO v_id_persona
    FROM persona
    WHERE ci = p_ci;

    IF FOUND THEN
        -- Actualizar persona existente
        UPDATE persona
        SET nombre = p_nombre,
            paterno = p_paterno,
            materno = COALESCE(p_materno,''),
            celular = COALESCE(p_celular,''),
            genero = COALESCE(p_genero,''),
            f_nacimiento = p_fn,
            zona = COALESCE(p_zona,''),
            calle = COALESCE(p_calle,''),
            nro = COALESCE(p_nro,''),
            f_edicion = now()
        WHERE id_persona = v_id_persona;
    ELSE
        -- Crear nueva persona
        INSERT INTO persona(nombre, paterno, materno, ci, celular, genero, f_nacimiento, zona, calle, nro)
        VALUES (p_nombre, p_paterno, COALESCE(p_materno,''), p_ci, COALESCE(p_celular,''), COALESCE(p_genero,''), p_fn, COALESCE(p_zona,''), COALESCE(p_calle,''), COALESCE(p_nro,''))
        RETURNING id_persona INTO v_id_persona;
    END IF;

    -- Buscar participante
    SELECT id_participante INTO v_id_participante
    FROM participante
    WHERE id_persona = v_id_persona;

    IF FOUND THEN
        -- Actualizar participante
        UPDATE participante
        SET estado = p_estado,
            id_tutor = p_id_tutor
        WHERE id_participante = v_id_participante;
    ELSE
        -- Crear participante
        INSERT INTO participante(id_persona, estado, id_tutor)
        VALUES (v_id_persona, p_estado, p_id_tutor)
        RETURNING id_participante INTO v_id_participante;
    END IF;

    RETURN v_id_participante;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fnCrearVoluntario(
    p_nombre TEXT,
    p_paterno TEXT,
    p_materno TEXT,
    p_ci TEXT,
    p_celular TEXT,
    p_genero TEXT,
    p_fn DATE,
    p_zona TEXT,
    p_calle TEXT,
    p_nro TEXT,
    p_correo TEXT DEFAULT '',
    p_id_nvl_edu INT DEFAULT NULL
)
RETURNS INT AS $$
DECLARE
    v_id_persona INT;
    v_id_voluntario INT;
BEGIN
    -- Buscar persona por CI
    SELECT id_persona INTO v_id_persona
    FROM persona
    WHERE ci = p_ci;

    IF FOUND THEN
        -- Actualizar persona existente
        UPDATE persona
        SET nombre = p_nombre,
            paterno = p_paterno,
            materno = COALESCE(p_materno,''),
            celular = COALESCE(p_celular,''),
            genero = COALESCE(p_genero,''),
            f_nacimiento = p_fn,
            zona = COALESCE(p_zona,''),
            calle = COALESCE(p_calle,''),
            nro = COALESCE(p_nro,''),
            f_edicion = now()
        WHERE id_persona = v_id_persona;
    ELSE
        -- Crear nueva persona
        INSERT INTO persona(nombre, paterno, materno, ci, celular, genero, f_nacimiento, zona, calle, nro)
        VALUES (p_nombre, p_paterno, COALESCE(p_materno,''), p_ci, COALESCE(p_celular,''), COALESCE(p_genero,''), p_fn, COALESCE(p_zona,''), COALESCE(p_calle,''), COALESCE(p_nro,''))
        RETURNING id_persona INTO v_id_persona;
    END IF;

    -- Buscar voluntario
    SELECT id_voluntario INTO v_id_voluntario
    FROM voluntario
    WHERE id_persona = v_id_persona;

    IF FOUND THEN
        -- Actualizar voluntario existente
        UPDATE voluntario
        SET correo = COALESCE(p_correo,''),
            id_nvl_edu = p_id_nvl_edu
        WHERE id_voluntario = v_id_voluntario;
    ELSE
        -- Crear voluntario
        INSERT INTO voluntario(id_persona, correo, id_nvl_edu)
        VALUES (v_id_persona, COALESCE(p_correo,''), p_id_nvl_edu)
        RETURNING id_voluntario INTO v_id_voluntario;
    END IF;

    RETURN v_id_voluntario;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fnCrearTutor(
    p_nombre TEXT,
    p_paterno TEXT,
    p_materno TEXT,
    p_ci TEXT,
    p_genero TEXT,
    p_f_nacimiento DATE,
    p_parentesco TEXT DEFAULT ''
)
RETURNS INT AS $$
DECLARE
    v_id_persona INT;
    v_id_tutor INT;
BEGIN
    -- Crear persona
    INSERT INTO persona(nombre, paterno, materno, ci, genero, f_nacimiento)
    VALUES (p_nombre, p_paterno, COALESCE(p_materno,''), p_ci, COALESCE(p_genero,''), p_f_nacimiento)
    RETURNING id_persona INTO v_id_persona;

    -- Crear tutor
    INSERT INTO tutor(id_persona, parentesco)
    VALUES (v_id_persona, COALESCE(p_parentesco,''))
    RETURNING id_tutor INTO v_id_tutor;

    RETURN v_id_tutor;
END;
$$ LANGUAGE plpgsql;
