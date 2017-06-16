
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/16/2017 09:49:54
-- Generated from EDMX file: D:\NetProjects\DQInterviewWebApi\DQInterviewWebApi\Models\DQIModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CategoryQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_CategoryQuestion];
GO
IF OBJECT_ID(N'[dbo].[FK_InterviewApplicant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Interviews] DROP CONSTRAINT [FK_InterviewApplicant];
GO
IF OBJECT_ID(N'[dbo].[FK_AnswersQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Answers] DROP CONSTRAINT [FK_AnswersQuestion];
GO
IF OBJECT_ID(N'[dbo].[FK_AnswersInterview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Answers] DROP CONSTRAINT [FK_AnswersInterview];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestionnaireJobOpening]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Questionnaires] DROP CONSTRAINT [FK_QuestionnaireJobOpening];
GO
IF OBJECT_ID(N'[dbo].[FK_InterviewQuestionnaire]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Interviews] DROP CONSTRAINT [FK_InterviewQuestionnaire];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestionnaireQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_QuestionnaireQuestion];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeInterview_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeInterview] DROP CONSTRAINT [FK_EmployeeInterview_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeInterview_Interview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeInterview] DROP CONSTRAINT [FK_EmployeeInterview_Interview];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Questions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Questions];
GO
IF OBJECT_ID(N'[dbo].[Interviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Interviews];
GO
IF OBJECT_ID(N'[dbo].[Applicants]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Applicants];
GO
IF OBJECT_ID(N'[dbo].[Answers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Answers];
GO
IF OBJECT_ID(N'[dbo].[JobOpenings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JobOpenings];
GO
IF OBJECT_ID(N'[dbo].[Questionnaires]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Questionnaires];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[EmployeeInterview]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeInterview];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(max)  NULL
);
GO

-- Creating table 'Questions'
CREATE TABLE [dbo].[Questions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QuestionText] nvarchar(max)  NULL,
    [badAnswer] nvarchar(max)  NOT NULL,
    [neutralAnswer] nvarchar(max)  NOT NULL,
    [goodAnswer] nvarchar(max)  NOT NULL,
    [excellentAnswer] nvarchar(max)  NOT NULL,
    [QuestionnaireId] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'Interviews'
CREATE TABLE [dbo].[Interviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TimeOfInterview] datetime  NOT NULL,
    [Applicant_Id] int  NOT NULL,
    [Questionnaire_Id] int  NOT NULL
);
GO

-- Creating table 'Applicants'
CREATE TABLE [dbo].[Applicants] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Answers'
CREATE TABLE [dbo].[Answers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AnswerIndex] nvarchar(max)  NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [Question_Id] int  NOT NULL,
    [Interview_Id] int  NOT NULL
);
GO

-- Creating table 'JobOpenings'
CREATE TABLE [dbo].[JobOpenings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [JobTitle] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Questionnaires'
CREATE TABLE [dbo].[Questionnaires] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [JobOpening_Id] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Email] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmployeeInterview'
CREATE TABLE [dbo].[EmployeeInterview] (
    [Employees_Email] nvarchar(max)  NOT NULL,
    [Interviews_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Questions'
ALTER TABLE [dbo].[Questions]
ADD CONSTRAINT [PK_Questions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Interviews'
ALTER TABLE [dbo].[Interviews]
ADD CONSTRAINT [PK_Interviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Applicants'
ALTER TABLE [dbo].[Applicants]
ADD CONSTRAINT [PK_Applicants]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Answers'
ALTER TABLE [dbo].[Answers]
ADD CONSTRAINT [PK_Answers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'JobOpenings'
ALTER TABLE [dbo].[JobOpenings]
ADD CONSTRAINT [PK_JobOpenings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Questionnaires'
ALTER TABLE [dbo].[Questionnaires]
ADD CONSTRAINT [PK_Questionnaires]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Email] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Email] ASC);
GO

-- Creating primary key on [Employees_Email], [Interviews_Id] in table 'EmployeeInterview'
ALTER TABLE [dbo].[EmployeeInterview]
ADD CONSTRAINT [PK_EmployeeInterview]
    PRIMARY KEY CLUSTERED ([Employees_Email], [Interviews_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_Id] in table 'Questions'
ALTER TABLE [dbo].[Questions]
ADD CONSTRAINT [FK_CategoryQuestion]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryQuestion'
CREATE INDEX [IX_FK_CategoryQuestion]
ON [dbo].[Questions]
    ([Category_Id]);
GO

-- Creating foreign key on [Applicant_Id] in table 'Interviews'
ALTER TABLE [dbo].[Interviews]
ADD CONSTRAINT [FK_InterviewApplicant]
    FOREIGN KEY ([Applicant_Id])
    REFERENCES [dbo].[Applicants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InterviewApplicant'
CREATE INDEX [IX_FK_InterviewApplicant]
ON [dbo].[Interviews]
    ([Applicant_Id]);
GO

-- Creating foreign key on [Question_Id] in table 'Answers'
ALTER TABLE [dbo].[Answers]
ADD CONSTRAINT [FK_AnswersQuestion]
    FOREIGN KEY ([Question_Id])
    REFERENCES [dbo].[Questions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnswersQuestion'
CREATE INDEX [IX_FK_AnswersQuestion]
ON [dbo].[Answers]
    ([Question_Id]);
GO

-- Creating foreign key on [Interview_Id] in table 'Answers'
ALTER TABLE [dbo].[Answers]
ADD CONSTRAINT [FK_AnswersInterview]
    FOREIGN KEY ([Interview_Id])
    REFERENCES [dbo].[Interviews]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AnswersInterview'
CREATE INDEX [IX_FK_AnswersInterview]
ON [dbo].[Answers]
    ([Interview_Id]);
GO

-- Creating foreign key on [JobOpening_Id] in table 'Questionnaires'
ALTER TABLE [dbo].[Questionnaires]
ADD CONSTRAINT [FK_QuestionnaireJobOpening]
    FOREIGN KEY ([JobOpening_Id])
    REFERENCES [dbo].[JobOpenings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestionnaireJobOpening'
CREATE INDEX [IX_FK_QuestionnaireJobOpening]
ON [dbo].[Questionnaires]
    ([JobOpening_Id]);
GO

-- Creating foreign key on [Questionnaire_Id] in table 'Interviews'
ALTER TABLE [dbo].[Interviews]
ADD CONSTRAINT [FK_InterviewQuestionnaire]
    FOREIGN KEY ([Questionnaire_Id])
    REFERENCES [dbo].[Questionnaires]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InterviewQuestionnaire'
CREATE INDEX [IX_FK_InterviewQuestionnaire]
ON [dbo].[Interviews]
    ([Questionnaire_Id]);
GO

-- Creating foreign key on [QuestionnaireId] in table 'Questions'
ALTER TABLE [dbo].[Questions]
ADD CONSTRAINT [FK_QuestionnaireQuestion]
    FOREIGN KEY ([QuestionnaireId])
    REFERENCES [dbo].[Questionnaires]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestionnaireQuestion'
CREATE INDEX [IX_FK_QuestionnaireQuestion]
ON [dbo].[Questions]
    ([QuestionnaireId]);
GO

-- Creating foreign key on [Employees_Email] in table 'EmployeeInterview'
ALTER TABLE [dbo].[EmployeeInterview]
ADD CONSTRAINT [FK_EmployeeInterview_Employee]
    FOREIGN KEY ([Employees_Email])
    REFERENCES [dbo].[Users]
        ([Email])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Interviews_Id] in table 'EmployeeInterview'
ALTER TABLE [dbo].[EmployeeInterview]
ADD CONSTRAINT [FK_EmployeeInterview_Interview]
    FOREIGN KEY ([Interviews_Id])
    REFERENCES [dbo].[Interviews]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeInterview_Interview'
CREATE INDEX [IX_FK_EmployeeInterview_Interview]
ON [dbo].[EmployeeInterview]
    ([Interviews_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------