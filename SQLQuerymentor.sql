--register mentor--
alter procedure spregistermentor(@name varchar(40),@mname nvarchar(40),@mpass nvarchar(40),@murl nvarchar(40),@mexp int)
as
insert into mentordtls values(@name,@mname,@mpass,@murl,getdate(),null,@mexp,'yes')
execute spregistermentor 'jeni','jeni@gmail.com','jeni','jeni','2019/11/20',6
delete from mentordtls where m_userName='jeni@gmail.com'
select * from mentordtls

--register user--
alter procedure spregisteruser(@uname nvarchar(50),@upass nvarchar(50),@fname nvarchar(50),@lname nvarchar(50),@con numeric,@date Date)
as
insert into userdtls values(@uname,@upass,@fname,@lname,@con,null,null,null,@date)
execute spregisteruser 'priyanka@gmail.com','priyanka','priyanka','priyanka',7373021163,'2019/11/24'
select * from userdtls


--admin insert--
insert into admin values('jk@gmail.com','jk')
select * from admin

--login as admin--
create procedure sploginadmin(@uname varchar(50),@pass varchar(50))
as
select * from admin where a_username=@uname and a_password=@pass
execute sploginadmin 'jk@gmail.com','jk'

--login as mentor--
create procedure sploginmentor(@uname varchar(50),@pass varchar(50))
as
select * from mentordtls where m_username=@uname and m_password=@pass
execute  sploginmentor 'jeni@gmail.com','jeni'


--login as mentor--
create procedure sploginuser(@uname varchar(50),@pass varchar(50))
as
select * from userdtls where username=@uname and password=@pass
execute  sploginuser 'priyanka@gmail.com','priyanka'

--List of technologies that the application can store/use--
insert into skills values('Java','java',40,null)
insert into skills values('Python','Python',50,null)
insert into skills values('Csharp','Csharp',45,null)
insert into skills values('Machine Learning','Machine Learning',28,null)
insert into skills values('R Programming','R Programming',20,null)
insert into skills values('Artificial Intelligance','Artificial Intelligance',19,null)

select * from skills

--Search--
create procedure spsearch
