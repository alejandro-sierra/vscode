CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50), 
    nota FLOAT
);

DELIMITER //
DROP TRIGGER IF EXISTS triggerCheckNotaBeforeInsert //
CREATE TRIGGER triggerCheckNotaBeforeInsert
  BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
  -- NEW referencia al nuevo registro
  IF NEW.nota < 0 THEN
    set NEW.nota = 0;
  ELSEIF NEW.nota > 10 THEN
    set NEW.nota = 10;
  END IF;
END
//

DROP TRIGGER IF EXISTS triggerCheckNotaBeforeUpdate //
CREATE TRIGGER triggerCheckNotaBeforeUpdate
  BEFORE UPDATE ON alumnos FOR EACH ROW
BEGIN
  IF NEW.nota < 0 THEN
    set NEW.nota = 0;
  ELSEIF NEW.nota > 10 THEN
    set NEW.nota = 10;
  END IF;
END
//

DELIMITER ;
INSERT INTO alumnos VALUES (1, 'Ana', 'Sánchez', 'Pérez', -1);
INSERT INTO alumnos VALUES (2, 'Bruno', 'García', 'Morales', 12);
INSERT INTO alumnos VALUES (3, 'Carlos', 'Serrano', 'López', 8.5);

SELECT * FROM alumnos;

UPDATE alumnos SET nota = -4 WHERE id = 3;
UPDATE alumnos SET nota = 14 WHERE id = 3;
UPDATE alumnos SET nota = 9.5 WHERE id = 3;

SELECT * FROM alumnos;