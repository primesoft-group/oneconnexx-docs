/****** Object:  StoredProcedure [dbo].[AlertDelete]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[AlertGetAll]    Script Date: 22.09.2017 15:45:19 ******/
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
		[Alert].[Id], [InterfaceId], [Interface].[Name] As [InterfaceName], [Endpoint], [Recipient], [Subject], [Body], [IsHtml], [Enabled], [OnlyAtRuleViolation]
	FROM
		[Alert]
	LEFT JOIN
		[Interface]
	ON
		[Alert].[InterfaceId] = [Interface].[Id]
END

GO
/****** Object:  StoredProcedure [dbo].[AlertGetById]    Script Date: 22.09.2017 15:45:19 ******/
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
		Id, InterfaceId, [Endpoint], Recipient, [Subject], Body, IsHtml, [Enabled], OnlyAtRuleViolation
	FROM
		Alert
	WHERE
		Id = @AlertId
END

GO
/****** Object:  StoredProcedure [dbo].[AlertInsert]    Script Date: 22.09.2017 15:45:19 ******/
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
	@Recipient NVARCHAR(511),
	@Subject NVARCHAR(255),
	@Body NVARCHAR(MAX),
	@IsHtml BIT,
	@Enabled BIT,
	@OnlyAtRuleViolation BIT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Alert
		(InterfaceId, [Endpoint], Recipient, [Subject], Body, IsHtml, [Enabled], OnlyAtRuleViolation)
	VALUES
		(@InterfaceId, @Endpoint, @Recipient, @Subject, @Body, @IsHtml, @Enabled, @OnlyAtRuleViolation)

	SELECT CAST(SCOPE_IDENTITY() AS INT)
END

GO
/****** Object:  StoredProcedure [dbo].[AlertUpdate]    Script Date: 22.09.2017 15:45:19 ******/
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
	@Recipient NVARCHAR(511),
	@Subject NVARCHAR(255),
	@Body NVARCHAR(MAX),
	@IsHtml BIT,
	@Enabled BIT,
	@OnlyAtRuleViolation BIT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		Alert
	SET
		InterfaceId = @InterfaceId, [Endpoint] = @Endpoint,
		Recipient = @Recipient, [Subject] = @Subject, Body = @Body, 
		IsHtml = @IsHtml, [Enabled] = @Enabled, OnlyAtRuleViolation = @OnlyAtRuleViolation
	WHERE
		Id = @AlertId
END

GO
/****** Object:  StoredProcedure [dbo].[InstanceDelete]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InstanceGet]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InstanceUpdateOrInsert]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InterfaceDelete]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InterfaceGetAll]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InterfaceGetById]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InterfaceGetWithInstances]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InterfaceInsert]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[InterfaceUpdate]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MailQueueCheckIfInsert]    Script Date: 22.09.2017 15:45:19 ******/
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
	@Message NVARCHAR(1023),
	@IsRuleViolation BIT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @InterfaceName NVARCHAR(255)
	SELECT @InterfaceName = Name FROM Interface WHERE Id = @InterfaceId

	INSERT INTO MailQueue (Recipient, [Subject], Body, IsHtml)
	SELECT
		Recipient,
		SUBSTRING(REPLACE(REPLACE(REPLACE([Subject], '{message}', @Message), '{interface}', @InterfaceName), '{endpoint}', ISNULL(@Endpoint, '')), 0, 255),
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
			(OnlyAtRuleViolation = 0 OR @IsRuleViolation = 1) AND
			(InterfaceId IS NULL OR InterfaceId = @InterfaceId) AND
			([Endpoint] = '*' OR ISNULL([Endpoint], '') =  @Endpoint)
	) X
	WHERE (X.[Rank] = 1)

END

GO
/****** Object:  StoredProcedure [dbo].[MailQueueDelete]    Script Date: 22.09.2017 15:45:19 ******/
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

	-- copy mail to history
	INSERT INTO MailHistory
		(Recipient, [Subject])
	SELECT
		Recipient, [Subject]
	FROM
		MailQueue
	WHERE
		Id = @MailQueueId

	-- delete from queue
	DELETE FROM
		MailQueue
	WHERE
		Id = @MailQueueId
END
select * from Alert
GO
/****** Object:  StoredProcedure [dbo].[MailQueueGetAll]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[RuleCheck]    Script Date: 22.09.2017 15:45:19 ******/
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

	-- return name of violated rule as first resultset
	SELECT @RuleName AS RuleName

	IF ((@RuleName IS NOT NULL) AND
		(@lastAlert IS NULL OR DATEDIFF(hh, @lastAlert, @Now) >= @repeatAfter))
	BEGIN
		-- rule is violated, add transaction
		-- (this selects the id of the inserted transaction as second result set!)
		EXEC TransactionInsert NULL, @InterfaceId, @Endpoint, 0, @RuleName, @Now

		--update rule with the current time as the LastAlert-time
		UPDATE [Rule] SET LastAlert = @Now WHERE Id = @RuleId
	END
END


GO
/****** Object:  StoredProcedure [dbo].[RuleDelete]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[RuleGetAll]    Script Date: 22.09.2017 15:45:19 ******/
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
		R.Id, R.Name, InterfaceId, I.Name AS InterfaceName, [Endpoint], [Timeout], LastAlert, RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount, 
		DaysOfWeek, DaysOfMonth
	FROM
		[Rule] R
	INNER JOIN
		Interface I ON R.InterfaceId = I.Id
	WHERE
		(@EnabledOnly = 0) OR ([Enabled] = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[RuleGetById]    Script Date: 22.09.2017 15:45:19 ******/
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
		Id, Name, InterfaceId, [Endpoint], [Timeout], LastAlert, RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount, DaysOfWeek, DaysOfMonth
	FROM
		[Rule]
	WHERE
		Id = @RuleId
END

GO
/****** Object:  StoredProcedure [dbo].[RuleGetDue]    Script Date: 22.09.2017 15:45:19 ******/
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
	DECLARE @DayOfMonth NVARCHAR(4) = ',' + CAST(DATEPART(DAY, GETDATE()) AS NVARCHAR) + ','
	DECLARE @Weekday INT = DATEPART(WEEKDAY, GETDATE())

	SELECT
		R.Id, R.Name, InterfaceId, I.Name AS InterfaceName, [Endpoint], [Timeout], LastAlert, RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount,
		DaysOfWeek, DaysOfMonth
	FROM
		[Rule] R
	INNER JOIN
		Interface I ON R.InterfaceId = I.Id
	WHERE
		([Enabled] = 1) AND
		(ExecutionTime > @LastQueryTime) AND 
		(ExecutionTime < CONVERT(TIME, @Now)) AND

		-- note: in default SQL server the week starts with Sunday = 1
		(((DaysOfWeek & 1 > 0) AND (@Weekday = 2)) OR 
		 ((DaysOfWeek & 2 > 0) AND (@Weekday = 3)) OR
		 ((DaysOfWeek & 4 > 0) AND (@Weekday = 4)) OR
		 ((DaysOfWeek & 8 > 0) AND (@Weekday = 5)) OR
		 ((DaysOfWeek & 16 > 0) AND (@Weekday = 6)) OR
		 ((DaysOfWeek & 32 > 0) AND (@Weekday = 7)) OR
		 ((DaysOfWeek & 64 > 0) AND (@Weekday = 1)) OR
		 ((DaysOfWeek IS NULL) OR (DaysOfWeek = 0))) AND 

		((CHARINDEX(@DayOfMonth, DaysOfMonth) > 0) OR 
		 (DaysOfMonth IS NULL) OR
		 (DaysOfMonth = ''))
END

GO
/****** Object:  StoredProcedure [dbo].[RuleInsert]    Script Date: 22.09.2017 15:45:19 ******/
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
	@TransactionCount INT,
	@DaysOfWeek INT,
	@DaysOfMonth NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Rule]
		(Name, InterfaceId, [Endpoint], [Timeout], RepeatAfter, [Enabled], ExecutionTime, LimitMode, TransactionCount, DaysOfWeek, DaysOfMonth)
	VALUES
		(@Name, @InterfaceId, @Endpoint, @Timeout, @RepeatAfter, @Enabled, @ExecutionTime, @LimitMode, @TransactionCount, @DaysOfWeek, @DaysOfMonth)

	SELECT CAST(SCOPE_IDENTITY() AS INT)
END

GO
/****** Object:  StoredProcedure [dbo].[RuleUpdate]    Script Date: 22.09.2017 15:45:19 ******/
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
	@TransactionCount INT,
	@DaysOfWeek INT,
	@DaysOfMonth NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		[Rule]
	SET
		Name = @Name, InterfaceId = @InterfaceId, [Endpoint] = @Endpoint,
		[Timeout] = @Timeout, RepeatAfter = @RepeatAfter, [Enabled] = @Enabled,
		ExecutionTime = @ExecutionTime, LimitMode = @LimitMode, TransactionCount = @TransactionCount,
		DaysOfWeek = @DaysOfWeek, DaysOfMonth = @DaysOfMonth
	WHERE
		Id = @RuleId
END

GO
/****** Object:  StoredProcedure [dbo].[StatisticAreaDeleteEntry]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Delete the statisticArea with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[StatisticAreaDeleteEntry]
	@Id INT
AS
BEGIN	
	DELETE FROM	Statistic WHERE [StatisticAreaId] = @Id
	DELETE FROM StatisticArea WHERE [Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[StatisticAreaInsertOrUpdate]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Creates a new statisticArea if @Id is 0 or update an existing statisticArea.
-- =============================================================================
CREATE PROCEDURE [dbo].[StatisticAreaInsertOrUpdate]
	@Id INT,
	@InstallationId UNIQUEIDENTIFIER,
	@StatisticAreaName NVARCHAR(255),
	@NewId INT OUTPUT
AS
BEGIN	
	IF (@Id = 0)
	BEGIN
		INSERT INTO StatisticArea
			([InstallationId], [StatisticAreaName]) 
		VALUES
			(@InstallationId, @StatisticAreaName)
		
		SET @NewId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE
			StatisticArea
		SET
			[InstallationId] = @InstallationId,
			[StatisticAreaName] = @StatisticAreaName
		WHERE
			[Id] = @Id
		
		SET @NewId = @Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[StatisticAreasGetAll]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Returns all statistic areas for the given installation.
-- ========================================================
CREATE PROCEDURE [dbo].[StatisticAreasGetAll]
	@InstallationId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id], [StatisticAreaName]
	FROM
		StatisticArea
	WHERE
		[InstallationId] = @InstallationId
END
GO
/****** Object:  StoredProcedure [dbo].[StatisticDeleteEntry]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Delete the statistic with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[StatisticDeleteEntry]
	@Id INT
AS
BEGIN	
	DELETE FROM Statistic WHERE [Id] = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[StatisticGetById]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Returns the statistic with the given id.
-- =============================================
CREATE PROCEDURE [dbo].[StatisticGetById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id], [Name], [DiagramType], [Height], [Width], [Sql], [DataJson], [LegendLabels], [StatisticAreaId]
	FROM
		Statistic
	WHERE
		[Id] = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[StatisticInsertOrUpdate]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Creates a new statistic if @Id is 0 or update an existing statistic.
-- ========================================================================
CREATE PROCEDURE [dbo].[StatisticInsertOrUpdate]
	@Id INT,
	@InstallationId UNIQUEIDENTIFIER,
	@StatisticName NVARCHAR(255),
	@DiagramType INT,
	@Height INT, 
	@Width INT,
	@SqlScript NVARCHAR(MAX),
	@DataJson NVARCHAR(MAX),
	@LegendLabels NVARCHAR(255),
	@StatisticAreaId INT,
	@NewId INT OUTPUT
AS
BEGIN
	DECLARE @OldSqlScript NVARCHAR(MAX);
	DECLARE @OldDataJson NVARCHAR(MAX);
	DECLARE @TempTable Table (Label NVARCHAR(100) NOT NULL, FirstValue NVARCHAR(50) NOT NULL, SecondValue NVARCHAR(50) NOT NULL DEFAULT '');


	SET @OldDataJson = @DataJson;

	IF (@Id = 0)
	BEGIN		
		IF (@SqlScript like '%SecondValue%')
		BEGIN			
			INSERT INTO @TempTable (Label, FirstValue, SecondValue) EXEC sp_executesql @SqlScript;
			
			SET @DataJson = (SELECT '[' +  STUFF((SELECT ',{"Label":"' + CAST(Label AS VARCHAR(50)) +
				'","FirstValue":"' + CAST(FirstValue AS VARCHAR(50)) +
				'","SecondValue":"' + CAST(SecondValue AS VARCHAR(50)) + '"}'
			FROM @TempTable
			FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,1,'') + ']');
		END
		ELSE
		BEGIN
			INSERT INTO @TempTable (Label, FirstValue) EXEC sp_executesql @SqlScript;

			SET @DataJson = (SELECT '[' +  STUFF((SELECT ',{"Label":"' + CAST(Label AS VARCHAR(50)) +
				'","FirstValue":"' + CAST(FirstValue AS VARCHAR(50)) + '"}'
			FROM @TempTable
			FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,1,'') + ']');
		END

		DECLARE @SortOrder INT
		SELECT
			@SortOrder = ISNULL(MAX(SortOrder), 0) + 1
		FROM
			Statistic
		WHERE
			StatisticAreaId = @StatisticAreaId

		INSERT INTO Statistic
			([InstallationId], [Name], [DiagramType], [Height], [Width], [Sql], [DataJson], [LegendLabels], [StatisticAreaId],[SortOrder] )
		VALUES
			(@InstallationId, @StatisticName, @DiagramType, @Height, @Width, @SqlScript, @DataJson, @LegendLabels, @StatisticAreaId, @SortOrder)
		
		SET @NewId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN		
		SET @OldSqlScript = (SELECT [Sql] FROM [Statistic] WHERE [Id] = @Id);

		IF(@OldSqlScript != @SqlScript)
		BEGIN
			IF (@SqlScript like '%SecondValue%')
			BEGIN			
				INSERT INTO @TempTable (Label, FirstValue, SecondValue) EXEC sp_executesql @SqlScript;
			
				SET @DataJson = (SELECT '[' +  STUFF((SELECT ',{"Label":"' + CAST(Label AS VARCHAR(50)) +
					'","FirstValue":"' + CAST(FirstValue AS VARCHAR(50)) +
					'","SecondValue":"' + CAST(SecondValue AS VARCHAR(50)) + '"}'
				FROM @TempTable
				FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,1,'') + ']');
			END
			ELSE
			BEGIN
				INSERT INTO @TempTable (Label, FirstValue) EXEC sp_executesql @SqlScript;

				SET @DataJson = (SELECT '[' +  STUFF((SELECT ',{"Label":"' + CAST(Label AS VARCHAR(50)) +
					'","FirstValue":"' + CAST(FirstValue AS VARCHAR(50)) + '"}'
				FROM @TempTable
				FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,1,'') + ']');
			END
		END

		UPDATE
			Statistic
		SET
			[InstallationId] = @InstallationId,
			[Name] = @StatisticName,
			[DiagramType] = @DiagramType,
			[Height] = @Height,
			[Width] = @Width,
			[Sql] = @SqlScript,
			[DataJson] = @DataJson,
			[LegendLabels] = @LegendLabels,
			[StatisticAreaId] = @StatisticAreaId
		WHERE
			[Id] = @Id
		
		SET @NewId = @Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[StatisticsGetAll]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================
-- Returns all statistics for the given installation.
-- ===================================================
CREATE PROCEDURE [dbo].[StatisticsGetAll]
	@InstallationId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[Id], [Name], [DiagramType], [Height], [Width], [DataJson], [LegendLabels], [StatisticAreaId]
	FROM
		Statistic
	WHERE
		[InstallationId] = @InstallationId
	ORDER BY [SortOrder];
END

GO
/****** Object:  StoredProcedure [dbo].[StatisticUpdateAllDataJson]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================
-- Refresh all cached statistic queries.
-- ============================================================
CREATE PROCEDURE [dbo].[StatisticUpdateAllDataJson]
AS
BEGIN

	DECLARE @statisticId INT;
	DECLARE @dataJson NVARCHAR(MAX);
	DECLARE @sqlQuery NVARCHAR(MAX);
	DECLARE @tempTable Table (Label NVARCHAR(100) NOT NULL, FirstValue INT NOT NULL, SecondValue INT NOT NULL DEFAULT '');
	
	DECLARE statisticCursor CURSOR FOR SELECT Id, [Sql] FROM Statistic;

	OPEN statisticCursor
	FETCH NEXT FROM statisticCursor INTO @statisticId, @sqlQuery

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM @tempTable

		IF (@sqlQuery like '%SecondValue%')
		BEGIN
			INSERT INTO @tempTable (Label, FirstValue, SecondValue) EXEC sp_executesql @sqlQuery;
			
			SET @dataJson = (SELECT '[' +  STUFF((SELECT ',{"Label":"' + CAST(Label AS VARCHAR(50)) +
				'","FirstValue":"' + CAST(FirstValue AS VARCHAR(50)) +
				'","SecondValue":"' + CAST(SecondValue AS VARCHAR(50)) + '"}'
			FROM @TempTable
			FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,1,'') + ']');
		END
		ELSE
		BEGIN
			INSERT INTO @tempTable (Label, FirstValue) EXEC sp_executesql @sqlQuery;

			SET @dataJson = (SELECT '[' +  STUFF((SELECT ',{"Label":"' + CAST(Label AS VARCHAR(50)) +
				'","FirstValue":"' + CAST(FirstValue AS VARCHAR(50)) + '"}'
			FROM @TempTable
			FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,1,'') + ']');
		END

		UPDATE
			Statistic
		SET
			DataJson = @dataJson
		WHERE
			Id = @statisticId

		FETCH NEXT FROM statisticCursor INTO @statisticId, @sqlQuery
	END   

	CLOSE statisticCursor   
	DEALLOCATE statisticCursor
END
GO
/****** Object:  StoredProcedure [dbo].[StatisticUpdateSortOrder]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Change sort order
-- ===========================================================================
CREATE PROCEDURE [dbo].[StatisticUpdateSortOrder] 
	@Id INT,
	@SortOrder INT

AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Statistic
	SET SortOrder = @SortOrder
	WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[test_InsertTestData]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_InsertTestData]
AS
BEGIN

	DECLARE @i INT = 0
	DECLARE @InsterfaceId INT
	DECLARE @EndPoint NVARCHAR(255)
	DECLARE @Success BIT

	WHILE (@i < 10000)
	BEGIN
		SET @InsterfaceId = ROUND(((102 - 80 -1) * RAND() + 80), 0)
		SET @EndPoint = 'Endpoint_' + CONVERT(NVARCHAR, ROUND(((20 - 1 -1) * RAND() + 1), 0))
		SET @Success = CASE WHEN RAND() > 0.9 THEN 0 ELSE 1 END

		INSERT INTO [Transaction]
			([Timestamp], InterfaceId, [Endpoint], Success, [Message], InstanceName)
		VALUES
			(GETDATE(), @InsterfaceId, @EndPoint, @Success, 'Message', 'Instanz')

		SET @i = @i + 1
	END

END

GO
/****** Object:  StoredProcedure [dbo].[TransactionDelete]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionDeleteAll]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Delete all Transactions
-- ===========================================================================
CREATE PROCEDURE [dbo].[TransactionDeleteAll]
	@InterfaceId INT,
	@Endpoint NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM [Transaction] WHERE (InterfaceId = @InterfaceId) AND ([Endpoint] = @Endpoint)
	DELETE FROM TransactionCache WHERE (InterfaceId = @InterfaceId) AND ([Endpoint] = @Endpoint)
END
GO
/****** Object:  StoredProcedure [dbo].[TransactionGetHistoryFromInterfaceEndpoint]    Script Date: 22.09.2017 15:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================
-- Returns the 20 last transactions from an interface/endpoint combination
-- that occured before a given timestamp.
-- =========================================================================
CREATE PROCEDURE [dbo].[TransactionGetHistoryFromInterfaceEndpoint]
	@InterfaceId int,
	@Endpoint varchar(255),
	@TimeStamp DateTime
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP(20)
		[Timestamp], InterfaceId, [Endpoint], Success, [Message]
	FROM
		[Transaction]
	WHERE
		(InterfaceId = @InterfaceId) AND
		([Endpoint] =  @Endpoint) AND
		([Timestamp] <  @TimeStamp)
	ORDER BY
		[Timestamp] DESC, Id DESC
END

GO
/****** Object:  StoredProcedure [dbo].[TransactionGetOverview]    Script Date: 22.09.2017 15:45:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionInsert]    Script Date: 22.09.2017 15:45:19 ******/
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
	@Message NVARCHAR(1023),
	@Now DATETIME
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @InstanceName NVARCHAR(255)
	IF (@InterfaceId IS NULL)
	BEGIN
		SELECT @InterfaceId = InterfaceId, @InstanceName = Name FROM Instance WHERE Id = @InstanceId
	END

	-- if there is no instance, the transaction is created for a violated rule
	DECLARE @RuleViolation BIT = CASE WHEN @InstanceId IS NULL THEN 1 ELSE 0 END	

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
			EXEC MailQueueCheckIfInsert @InterfaceId, @Endpoint, @Message, @RuleViolation
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
