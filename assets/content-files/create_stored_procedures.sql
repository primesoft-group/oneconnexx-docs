/****** Object:  StoredProcedure [dbo].[AlertDelete]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Deletes the alert with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[AlertDelete]
	@AlertId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM
		Alert
	WHERE
		Id = @AlertId
END

GO
/****** Object:  StoredProcedure [dbo].[AlertGetAll]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Returns a list of all alerts.
-- =============================================
CREATE PROCEDURE [dbo].[AlertGetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Alert].[Id], [InterfaceId], [Interface].[Name] As [InterfaceName], [Endpoint], [Recipient], [Subject], [Body], [IsHtml], [Enabled]
	FROM
		[Alert]
	LEFT JOIN
		[Interface]
	ON
		[Alert].[InterfaceId] = [Interface].[Id]
END

GO
/****** Object:  StoredProcedure [dbo].[AlertGetById]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Returns a list of all alerts.
-- =============================================
CREATE PROCEDURE [dbo].[AlertGetById]
	@AlertId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		Id, InterfaceId, [Endpoint], Recipient, [Subject], Body, IsHtml, [Enabled]
	FROM
		Alert
	WHERE
		Id = @AlertId
END

GO
/****** Object:  StoredProcedure [dbo].[AlertInsert]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Inserts a new alert and return its id.
-- =============================================
CREATE PROCEDURE [dbo].[AlertInsert]
	@InterfaceId INT,
	@Endpoint NVARCHAR(255),
	@Recipient NVARCHAR(255),
	@Subject NVARCHAR(255),
	@Body NVARCHAR(MAX),
	@IsHtml BIT,
	@Enabled BIT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Alert
		(InterfaceId, [Endpoint], Recipient, [Subject], Body, IsHtml, [Enabled])
	VALUES
		(@InterfaceId, @Endpoint, @Recipient, @Subject, @Body, @IsHtml, @Enabled)

	SELECT CAST(SCOPE_IDENTITY() AS INT)
END

GO
/****** Object:  StoredProcedure [dbo].[AlertUpdate]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Inserts a new alert and return its id.
-- =============================================
CREATE PROCEDURE [dbo].[AlertUpdate]
	@AlertId INT,
	@InterfaceId INT,
	@Endpoint NVARCHAR(255),
	@Recipient NVARCHAR(255),
	@Subject NVARCHAR(255),
	@Body NVARCHAR(MAX),
	@IsHtml BIT,
	@Enabled BIT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		Alert
	SET
		InterfaceId = @InterfaceId, [Endpoint] = @Endpoint,
		Recipient = @Recipient, [Subject] = @Subject,
		Body = @Body, IsHtml = @IsHtml, [Enabled] = @Enabled
	WHERE
		Id = @AlertId
END

GO
/****** Object:  StoredProcedure [dbo].[InstanceDelete]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Delete an instance.
-- ==================================================================================
CREATE PROCEDURE [dbo].[InstanceDelete]
	@InstanceId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM Instance WHERE Id = @InstanceId
END

GO
/****** Object:  StoredProcedure [dbo].[InstanceGet]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Returns a list of all instances that belong to the given installation.
-- If @InstallationId = NULL, instances of all installations are returned.
-- If @UnassignedOnly = 1 only instances not assigned to an interface are returned.
-- ==================================================================================
CREATE PROCEDURE [dbo].[InstanceGet]
	@InstallationId UNIQUEIDENTIFIER,
	@UnassignedOnly BIT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		Id, Name, AddIn, AddInType
	FROM
		Instance
	WHERE
		((@InstallationId IS NULL) OR (InstallationId = @InstallationId)) AND
		((@UnassignedOnly = 0) OR (InterfaceId IS NULL))
	ORDER BY
		Name
END

GO
/****** Object:  StoredProcedure [dbo].[InstanceUpdateOrInsert]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Update an instance or create a new one.
-- ===========================================================================
CREATE PROCEDURE [dbo].[InstanceUpdateOrInsert]
	@InstanceId UNIQUEIDENTIFIER,
	@Name NVARCHAR(255),				-- NULL = do not change
	@AddInName NVARCHAR(255),			-- NULL = do not change
	@AddInType NCHAR(1),				-- NULL = do not change
	@InterfaceId INT,					-- NULL = do not change
	@InstallationId UNIQUEIDENTIFIER	-- only for insert
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	IF (EXISTS (SELECT 1 FROM Instance WHERE Id = @InstanceId))
	BEGIN
		-- update existing instance
		UPDATE
			Instance
		SET
			Name = ISNULL(@Name, Name),
			AddIn = ISNULL(@AddInName, AddIn),
			AddInType = ISNULL(@AddInType, AddInType),
			InterfaceId = NULLIF(ISNULL(@InterfaceId, InterfaceId), 0)
		WHERE
			Id = @InstanceId
	END ELSE BEGIN
		-- insert a new instance
		INSERT INTO Instance VALUES (@InstanceId, @Name, @AddInName, @AddInType, NULL, @InstallationId)
	END

	COMMIT TRAN
END

GO
/****** Object:  StoredProcedure [dbo].[InterfaceDelete]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Delete an interface. Assigned instances are unassigned.
-- ===========================================================================
CREATE PROCEDURE [dbo].[InterfaceDelete]
	@InterfaceId INT
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN

	UPDATE Instance SET InterfaceId = NULL WHERE InterfaceId = @InterfaceId

	DELETE FROM Interface WHERE Id = @InterfaceId

	COMMIT TRAN
END

GO
/****** Object:  StoredProcedure [dbo].[InterfaceGetAll]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Returns a list of all interfaces.
-- ==============================================================================
CREATE PROCEDURE [dbo].[InterfaceGetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		Id As InterfaceId,
		Name As InterfaceName
	FROM
		Interface
END

GO
/****** Object:  StoredProcedure [dbo].[InterfaceGetById]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Returns the interfaces with the given id.
-- ==============================================================================
CREATE PROCEDURE [dbo].[InterfaceGetById]
	@InterfaceId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		Id As InterfaceId,
		Name As InterfaceName
	FROM
		Interface
	WHERE
		Id = @InterfaceId
END

GO
/****** Object:  StoredProcedure [dbo].[InterfaceGetWithInstances]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Returns a list of all interfaces and the instances that are assigned to them.
-- ==============================================================================
CREATE PROCEDURE [dbo].[InterfaceGetWithInstances]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		A.Id AS InterfaceId,
		A.Name AS InterfaceName,
		B.Id AS InstanceId,
		B.Name AS InstanceName,
		B.AddInType AS AddInType
	FROM
		Interface A
	LEFT OUTER JOIN
		Instance B ON B.InterfaceId = A.Id
	ORDER BY
		A.Name, A.Id, B.Name
END

GO
/****** Object:  StoredProcedure [dbo].[InterfaceInsert]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Create a new interface and return its id.
-- ===========================================================================
CREATE PROCEDURE [dbo].[InterfaceInsert]
	@Name NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Interface
		(Name)
	VALUES
		(@Name)

	SELECT CAST(SCOPE_IDENTITY() AS INT)
END

GO
/****** Object:  StoredProcedure [dbo].[InterfaceUpdate]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Update the name of an interface.
-- ===========================================================================
CREATE PROCEDURE [dbo].[InterfaceUpdate]
	@InterfaceId INT,
	@Name NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		Interface
	SET
		Name = @Name
	WHERE
		Id = @InterfaceId
END

GO
/****** Object:  StoredProcedure [dbo].[MailQueueCheckIfInsert]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Check whether one or more alerts are configured for the given interface/endpoint.
-- If yes, one or more entries are inserted into the MailQueue table.
-- ==================================================================================
CREATE PROCEDURE [dbo].[MailQueueCheckIfInsert]
	@InterfaceId INT,
	@Endpoint NVARCHAR(255),
	@Message NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @InterfaceName NVARCHAR(255)
	SELECT @InterfaceName = Name FROM Interface WHERE Id = @InterfaceId

	INSERT INTO MailQueue (Recipient, [Subject], Body, IsHtml)
	SELECT
		Recipient,
		REPLACE(REPLACE(REPLACE([Subject], '{message}', @Message), '{interface}', @InterfaceName), '{endpoint}', ISNULL(@Endpoint, '')),
		REPLACE(REPLACE(REPLACE(Body, '{message}', @Message), '{interface}', @InterfaceName), '{endpoint}', ISNULL(@Endpoint, '')),
		IsHtml
	FROM
	(
		SELECT Id, InterfaceId, [Endpoint], Recipient, [Subject], Body, IsHtml,
		RANK() OVER (ORDER BY 
			CASE
				--Priority 3 (lowest): Wildcard in Interface and Endpoint
				WHEN (InterfaceId IS NULL) AND ([Endpoint] = '*') THEN 3
				--Priority 2: Wildcard in Interface or Endpoint
				WHEN (InterfaceId IS NULL) OR ([Endpoint] = '*') THEN 2
				--Priority 1: (highest) Interface and Endpoint specified
				ELSE 1
			END
		) AS [Rank]
		FROM
			Alert
		WHERE
			([Enabled] = 1) AND
			(InterfaceId IS NULL OR InterfaceId = @InterfaceId) AND
			([Endpoint] = '*' OR ISNULL([Endpoint], '') =  @Endpoint)
	) X
	WHERE (X.[Rank] = 1)

END

GO
/****** Object:  StoredProcedure [dbo].[MailQueueDelete]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Deletes the mail with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[MailQueueDelete]
	@MailQueueId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM
		MailQueue
	WHERE
		Id = @MailQueueId
END

GO
/****** Object:  StoredProcedure [dbo].[MailQueueGetAll]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Returns a list of all mails.
-- =============================================
CREATE PROCEDURE [dbo].[MailQueueGetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		Id, Recipient, [Subject], Body, IsHtml
	FROM
		MailQueue
END

GO
/****** Object:  StoredProcedure [dbo].[RuleCheck]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===========================================================================
-- Checks the rule and insert a failed transaction if a timeout is detected.
-- ===========================================================================
CREATE PROCEDURE [dbo].[RuleCheck]
	@RuleId INT,
	@Now DATETIME
AS
BEGIN
	DECLARE @RuleName VARCHAR(255)
	DECLARE @InterfaceId INT
	DECLARE @Endpoint VARCHAR(255)
	DECLARE @LastAlert DATETIME
	DECLARE @RepeatAfter INT

	SET NOCOUNT ON;
	
	-- get rule if it is violated
	SELECT
		@RuleName =  R.Name,
		@InterfaceId = R.InterfaceId,
		@Endpoint = ISNULL(R.[Endpoint], ''),
		@LastAlert = R.LastAlert,
		@RepeatAfter = R.RepeatAfter
	FROM
		[Rule] R
	INNER JOIN
		Interface I ON I.Id = R.InterfaceId
	WHERE
		(R.Id = @RuleId) AND
		(R.[Enabled] = 1) AND
		(
			(
				(R.LimitMode = 0 /* Min. */) AND 
				(R.TransactionCount >
					(SELECT COUNT(*) FROM [Transaction] T WHERE
						(T.Success = 1) AND
						(R.InterfaceId = T.InterfaceId) AND
						(ISNULL(R.[Endpoint], '') = T.[Endpoint]) AND
						(T.[TimeStamp] >= DATEADD(hh, -R.[Timeout], @Now))))
			) OR (
				(R.LimitMode = 1 /* Max. */) AND
				(R.TransactionCount <
					(SELECT COUNT(*) FROM [Transaction] T WHERE
					(T.Success = 1) AND
					(R.InterfaceId = T.InterfaceId) AND
					(ISNULL(R.[Endpoint], '') = T.[Endpoint]) AND
					(T.[TimeStamp] >= DATEADD(hh, -R.[Timeout], @Now))))
			)
		)

	IF ((@RuleName IS NOT NULL) AND
		(@lastAlert IS NULL OR DATEDIFF(hh, @lastAlert, @Now) >= @repeatAfter))
	BEGIN
		-- rule is violated, add transaction
		EXEC TransactionInsert NULL, @InterfaceId, @Endpoint, 0, @RuleName

		--update rule with the current time as the LastAlert-time
		UPDATE [Rule] SET LastAlert = @Now WHERE Id = @RuleId
	END

	SELECT @RuleName AS RuleName
END


GO
/****** Object:  StoredProcedure [dbo].[RuleDelete]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Deletes the rule with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[RuleDelete]
	@RuleId INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM
		[Rule]
	WHERE
		Id = @RuleId
END

GO
/****** Object:  StoredProcedure [dbo].[RuleGetAll]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Returns a list of all rules.
-- =============================================
CREATE PROCEDURE [dbo].[RuleGetAll]
	@EnabledOnly BIT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		R.Id, R.Name, InterfaceId, I.Name AS InterfaceName, [Endpoint], [Timeout], LastAlert, RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount
	FROM
		[Rule] R
	INNER JOIN
		Interface I ON R.InterfaceId = I.Id
	WHERE
		(@EnabledOnly = 0) OR ([Enabled] = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[RuleGetById]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Returns the rule with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[RuleGetById]
	@RuleId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		Id, Name, InterfaceId, [Endpoint], [Timeout], LastAlert, RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount
	FROM
		[Rule]
	WHERE
		Id = @RuleId
END

GO
/****** Object:  StoredProcedure [dbo].[RuleGetDue]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================================
-- Returns a list of all enabled rules that need to be checked between @LastQuery and now.
-- ========================================================================================
CREATE PROCEDURE [dbo].[RuleGetDue]
	@LastQuery DATETIME,
	@Now DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LastQueryTime TIME = CONVERT(TIME, @LastQuery)

	SELECT
		R.Id, R.Name, InterfaceId, I.Name AS InterfaceName, [Endpoint], [Timeout], LastAlert, RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount
	FROM
		[Rule] R
	INNER JOIN
		Interface I ON R.InterfaceId = I.Id
	WHERE
		([Enabled] = 1) AND
		(ExecutionTime > @LastQueryTime) AND 
		(ExecutionTime < CONVERT(TIME, @Now))
END

GO
/****** Object:  StoredProcedure [dbo].[RuleInsert]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Inserts a new rule and return its id.
-- =============================================
CREATE PROCEDURE [dbo].[RuleInsert]
	@Name NVARCHAR(255),
	@InterfaceId INT,
	@Endpoint NVARCHAR(255),
	@Timeout INT,
	@RepeatAfter INT,
	@Enabled BIT,
	@ExecutionTime TIME(7),
	@LimitMode INT,
	@TransactionCount INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Rule]
		(Name, InterfaceId, [Endpoint], [Timeout], RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount)
	VALUES
		(@Name, @InterfaceId, @Endpoint, @Timeout, @RepeatAfter, @Enabled, @ExecutionTime, @LimitMode, @TransactionCount)

	SELECT CAST(SCOPE_IDENTITY() AS INT)
END

GO
/****** Object:  StoredProcedure [dbo].[RuleUpdate]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Update the rule with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[RuleUpdate]
	@RuleId INT,
	@Name NVARCHAR(255),
	@InterfaceId INT,
	@Endpoint NVARCHAR(255),
	@Timeout INT,
	@RepeatAfter INT,
	@Enabled BIT,
	@ExecutionTime TIME(7),
	@LimitMode INT,
	@TransactionCount INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		[Rule]
	SET
		Name = @Name, InterfaceId = @InterfaceId, [Endpoint] = @Endpoint,
		[Timeout] = @Timeout, RepeatAfter = @RepeatAfter, [Enabled] = @Enabled,
		ExecutionTime = @ExecutionTime, LimitMode = @LimitMode, TransactionCount = @TransactionCount
	WHERE
		Id = @RuleId
END

GO
/****** Object:  StoredProcedure [dbo].[TransactionDelete]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Delete a transaction.
-- ===========================================================================
CREATE PROCEDURE [dbo].[TransactionDelete]
	@InterfaceId INT,
	@Endpoint NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM TransactionCache WHERE (InterfaceId = @InterfaceId) AND ([Endpoint] = @Endpoint)
END

GO
/****** Object:  StoredProcedure [dbo].[TransactionGetHistoryFromInterfaceEndpoint]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Returns the 20 last Transactions From a Interface/Endpoint combination
-- =============================================
CREATE PROCEDURE [dbo].[TransactionGetHistoryFromInterfaceEndpoint]
	@InterfaceId int,
	@Endpoint varchar(255),
	@TimeStamp DateTime
AS
BEGIN	
	SET NOCOUNT ON;
	SELECT TOP(20) [Timestamp], InterfaceId, [Endpoint], Success, [Message] FROM [Transaction]
	WHERE InterfaceId = @InterfaceId
	AND Endpoint =  @Endpoint
	AND Timestamp <  @TimeStamp
	ORDER BY Timestamp DESC
	
END

GO
/****** Object:  StoredProcedure [dbo].[TransactionGetOverview]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================================================
-- Returns the monitoring overview:
-- For each interface/endpoint combination the last transaction is returned.
-- ==================================================================================
CREATE PROCEDURE [dbo].[TransactionGetOverview]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Timestamp], InterfaceId, I.Name AS InterfaceName, [Endpoint], Success, [Message]
	FROM
		TransactionCache T
	INNER JOIN
		Interface I ON I.Id = T.InterfaceId
	ORDER BY
		I.Name, [Endpoint]
END

GO
/****** Object:  StoredProcedure [dbo].[TransactionInsert]    Script Date: 08.02.2017 08:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Insert a new transaction into the Transaction and TransactionCache tables.
-- If the transaction failed, check whether an alert must be sent.
-- ===========================================================================
CREATE PROCEDURE [dbo].[TransactionInsert]
	@InstanceId UNIQUEIDENTIFIER,	-- either @InstanceId...
	@InterfaceId INT,				-- ...or @InterfaceId must be specified!
	@Endpoint NVARCHAR(255),
	@Success BIT,
	@Message NVARCHAR(255),
	@Now DATETIME
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @InstanceName NVARCHAR(255)
	IF (@InterfaceId IS NULL)
	BEGIN
		SELECT @InterfaceId = InterfaceId, @InstanceName = Name FROM Instance WHERE Id = @InstanceId
	END

	IF (@InterfaceId IS NOT NULL)
	BEGIN
		-- insert/update result of latest interface/endpoint transaction in table TransactionCache
		MERGE TransactionCache AS T
		USING (
			SELECT
				@InterfaceId AS InterfaceId,
				@Endpoint AS [Endpoint],
				@Success AS Success,
				@Message AS [Message]
		) AS S
		ON (T.InterfaceId = S.InterfaceId) AND (T.[Endpoint] = S.[Endpoint])
		WHEN MATCHED THEN
			UPDATE SET T.Success = @Success, T.[Message] = @Message, T.[Timestamp] = @Now
		WHEN NOT MATCHED THEN
			INSERT (InterfaceId, [Endpoint], Success, [Message], [Timestamp]) VALUES (S.InterfaceId, S.[Endpoint], S.Success, S.[Message], @Now);

		-- check whether an alert is configured and an entry in MailQueue should be made
		IF (@Success = 0)
		BEGIN
			EXEC MailQueueCheckIfInsert @InterfaceId, @Endpoint, @Message
		END

		-- insert transaction history in table Transaction
		INSERT INTO [Transaction]
			([Timestamp], InterfaceId, [Endpoint], Success, [Message], InstanceName )
		VALUES
			(@Now, @InterfaceId, @Endpoint, @Success, @Message, @InstanceName)

		SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
	END ELSE BEGIN
		SELECT CAST(NULL AS BIGINT)
	END
END

GO
