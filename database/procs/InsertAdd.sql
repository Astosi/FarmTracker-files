ALTER PROC InsertAdd
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@PRICE money,
@CREATED_BY_UUID uniqueidentifier,
@CUID int
AS
BEGIN
	DECLARE @USER_ADD_LIMIT int 
	SELECT @USER_ADD_LIMIT = T.AdLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE UUID = @CREATED_BY_UUID

	DECLARE @USER_ADD_NUMBER int
	SELECT @USER_ADD_NUMBER = COUNT(A.AUID) FROM Adds AS A
	WHERE createdByUUID = @CREATED_BY_UUID AND deletedFlag != 1
	
	IF (@USER_ADD_NUMBER < @USER_ADD_LIMIT)
	BEGIN
		INSERT INTO Adds(name, description, createdByUUID, CUID, price)
		OUTPUT inserted.*
		VALUES(@NAME, @DESCRIPTION, @CREATED_BY_UUID, @CUID, @PRICE)
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM Adds
	END 

END