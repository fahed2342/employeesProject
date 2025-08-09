CREATE PROCEDURE usp_Employee_Create
(
    @first_name NVARCHAR(100),
    @last_name NVARCHAR(100),
    @email NVARCHAR(100),
    @phone NVARCHAR(100),
    @hire_date DATE
)
AS
BEGIN
    INSERT INTO Employees (first_name, last_name, email, phone, hire_date)
    VALUES (@first_name, @last_name, @email, @phone, @hire_date);
END;

select * from Employees


ALTER PROCEDURE usp_Employee_Create
(
    @employee_id INT,
    @first_name NVARCHAR(100),
    @last_name NVARCHAR(100),
    @email NVARCHAR(100),
    @phone NVARCHAR(100),
    @hire_date DATE
)
AS
BEGIN
    INSERT INTO Employees (employee_id, first_name, last_name, email, phone, hire_date)
    VALUES (@employee_id, @first_name, @last_name, @email, @phone, @hire_date);
END;

exec usp_Employee_Create
@employee_id=41,
@first_name='fahed',
@last_name='ayouty',
@email='fahed12@example.com',
@phone='0541369522',
@hire_date='2025-04-10'


select * from Employees


CREATE PROCEDURE usp_Employee_Update
(
    @employee_id INT,
    @first_name NVARCHAR(100) = NULL,
    @last_name NVARCHAR(100) = NULL
)
AS
BEGIN
    UPDATE Employees
    SET
        first_name = COALESCE(@first_name, first_name),
        last_name = COALESCE(@last_name, last_name)
    WHERE employee_id = @employee_id;
END;

create procedure usp_employee_assignproject
(
    @employee_id int,
    @project_id int
)
as
begin
    insert into employeeprojects (employee_id, project_id)
    values (@employee_id, @project_id);
end;

create procedure usp_employee_assignequipment
(
    @employee_id int,
    @equipment_id int
)
as
begin
    insert into employeeequipment (employee_id, equipment_id)
    values (@employee_id, @equipment_id);
end;

create procedure usp_timelog_create
(
    @time_log_id int,
    @employee_id int,
	@work_date nvarchar(50),
	@hours_worked nvarchar(50)

)
as
begin
    insert into timelogs (time_log_id, employee_id, work_date, hours_worked)
    values (@time_log_id, @employee_id, @work_date, @hours_worked);
end;

create procedure usp_attendance_record
(
    @employee_id int,
    @work_date date,
    @check_in_time datetime = null,
    @check_out_time datetime = null
)
as
begin
    insert into attendance (employee_id, work_date, check_in_time, check_out_time)
    values (@employee_id, @work_date, @check_in_time, @check_out_time);
end;


create procedure usp_leave_request
(
    @employee_id int,
    @start_date date,
    @end_date date
)
as
begin
    insert into leaverequests (employee_id, start_date, end_date, status)
    values (@employee_id, @start_date, @end_date, 'pending');
end;

create procedure usp_leave_updatestatus
(
    @request_id int,
    @status nvarchar(50)
)
as
begin
    update leaverequests
    set status = @status
    where request_id = @request_id;
end;

create procedure usp_project_create
(
    @project_name nvarchar(200)
)
as
begin
    insert into projects (project_name)
    values (@project_name);
end;

create procedure usp_project_getteam
(
    @project_id int
)
as
begin
    select employee_id
    from employeeprojects
    where project_id = @project_id;
end;

create procedure usp_report_employeeworksummary
(
    @employee_id int
)
as
begin
    select *
    from timelogs
    where employee_id = @employee_id;
end;

go
