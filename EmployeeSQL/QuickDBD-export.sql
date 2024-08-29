-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [employees] (
    [emp_no] VARCHAR(10)  NOT NULL ,
    [emp_title] VARCHAR(50)  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR(50)  NOT NULL ,
    [last_name] VARCHAR(50)  NOT NULL ,
    [sex] CHAR(1)  NOT NULL ,
    [hire_date] DATE  NOT NULL 
)

CREATE TABLE [departments] (
    [dept_no] VARCHAR(10)  NOT NULL ,
    [dept_name] VARCHAR(50)  NOT NULL 
)

CREATE TABLE [dept_emp] (
    [emp_no] VARCHAR(10)  NOT NULL ,
    [dept_no] VARCHAR(10)  NOT NULL ,
    CONSTRAINT [PK_dept_emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[dept_no] ASC
    )
)

CREATE TABLE [dept_manager] (
    [dept_no] VARCHAR(10)  NOT NULL ,
    [emp_no] VARCHAR(10)  NOT NULL ,
    CONSTRAINT [PK_dept_manager] PRIMARY KEY CLUSTERED (
        [dept_no] ASC,[emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] VARCHAR(10)  NOT NULL ,
    [salary] NUMERIC(10,2)  NOT NULL ,
    CONSTRAINT [PK_salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [titles] (
    [title_id] VARCHAR(10)  NOT NULL ,
    [title] VARCHAR(50)  NOT NULL 
)

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [dept_emp] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_title] FOREIGN KEY([title])
REFERENCES [employees] ([emp_title])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_title]

CREATE INDEX [idx_employees_emp_title]
ON [employees] ([emp_title])

CREATE INDEX [idx_employees_last_name]
ON [employees] ([last_name])

CREATE INDEX [idx_employees_hire_date]
ON [employees] ([hire_date])

COMMIT TRANSACTION QUICKDBD