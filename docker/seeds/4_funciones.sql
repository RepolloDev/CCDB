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