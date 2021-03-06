ALTER PROC InsertEntityCOPValue
@EUID uniqueidentifier,
@PUID int,
@VALUE nvarchar(max)
AS
BEGIN
	DECLARE @CUID_OF_ENTITY int
	SELECT @CUID_OF_ENTITY = E.CUID FROM entityOfFP AS E
	WHERE E.EUID = @EUID 

	DECLARE @PROPERTIES_OF_ENTITY table (PUID int, name nvarchar(50), TUID int, CUID int)
	INSERT INTO @PROPERTIES_OF_ENTITY 
	EXEC SelectPropertiesOfTheCategory @CUID_OF_ENTITY

	IF(EXISTS(SELECT * FROM @PROPERTIES_OF_ENTITY WHERE PUID = @PUID))
	BEGIN
		IF(NOT EXISTS(SELECT * FROM entityCOPValues WHERE EUID = @EUID AND PUID = @PUID))
		BEGIN
			INSERT INTO entityCOPValues(EUID, PUID, value)
			OUTPUT inserted.*
			VALUES(@EUID, @PUID, @VALUE)
		END
		ELSE
		BEGIN
			UPDATE entityCOPValues
			SET value = @VALUE
			OUTPUT inserted.*
			WHERE EUID = @EUID AND PUID = @PUID
		END
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM entityCOPValues
	END
END