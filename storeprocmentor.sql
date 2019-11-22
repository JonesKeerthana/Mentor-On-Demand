--register mentor--
alter procedure spregistermentor(@name varchar(40),@mname nvarchar(40),@mpass nvarchar(40),@murl nvarchar(40),@mexp int)
as
insert into mentordtls values(@name,@mname,@mpass,@murl,getdate(),null,@mexp,'yes')
execute spregistermentor 'jeni','jeni@gmail.com','jeni','jeni',6
delete from mentordtls where m_name='Jones'
select * from mentordtls

--register user--
alter procedure spregisteruser(@uname nvarchar(50),@upass nvarchar(50),@fname nvarchar(50),@lname nvarchar(50),@con numeric)
as
insert into userdtls values(@uname,@upass,@fname,@lname,@con,null,null,null,getdate())
execute spregisteruser 'priyanka@gmail.com','priyanka','priyanka','priyanka',7373021163


update userdtls set username='sankari@gmail.com',password='sankari',firstname='sankari' where id=4

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

insert into mentorskills values(1032,1003,4,8,null,null)
select * from mentorskills
delete from mentorskills where ms_sid=1005
--mentor display--
alter procedure spmentorlist(@id int)
as
select skills.sk_Name as  SkillName,mentorskills.ms_selfrating as MskillSelfrating,mentorskills.ms_yearsofexperience as MskillYearsofexperience,ms_trainingdelivered as MskillTrainingdelivered,ms_facilitiesoffered as MskillFacilitiesoffered from mentorskills,skills where mentorskills.ms_mid=@id and skills.sk_Id=mentorskills.ms_sid
execute spmentorlist 1032
--mentor edit--
alter procedure speaddskill(@id int,@sid int,@rate int,@exp int)
as
insert into mentorskills values(@id,@sid,@rate,@exp,null,null)
execute speaddskill 1018,1004,8,1
select * from mentorskills



create procedure findid(@name nvarchar(50))
as
select sk_Id from skills where sk_Name=@name
execute findid 'Java'
--user page diplays mentor details--
alter procedure spuser
as
select ms_id as DMsId,m_id as DMId,sk_Id as DSkId,m_name as DMName,m_linkedinurl as DMLinkedinurl,sk_Name as DSkName,ms_yearsofexperience as  DMsYearsofexperience ,ms_selfrating as DMsSelfrating from mentordtls,mentorskills,skills where sk_Id=ms_sid and m_id=ms_mid
execute spuser

--choose mentor--
alter procedure spchoosementor(@uid int,@mid int,@sid int)
as
insert into training values(@uid,@mid,@sid,'requested');
execute spchoosementor 4,1032,1007

select * from training 
delete from training where tr_uid=6

--mentor accept--
alter procedure spaccept(@id int)
as
select tr_id as acsId,userdtls.firstname as acUsername,userdtls.contactnumber as acContactnumber,skills.sk_Name as acSkName from userdtls,skills,training where tr_mid=@id and tr_uid=userdtls.id and tr_sid=skills.sk_Id and tr_status='requested'
execute spaccept 1032

--search--
alter procedure spsearch(@id int)
as
select ms_id as DMsId,m_id as DMId,sk_Id as DSkId,m_name as DMName,m_linkedinurl as DMLinkedinurl,sk_Name as DSkName,ms_yearsofexperience as  DMsYearsofexperience ,ms_selfrating as DMsSelfrating from mentordtls,mentorskills,skills where sk_Id=@id and ms_sid=sk_Id and m_id=ms_mid
execute spsearch 1007

--acceptnomination--
create procedure spacceptnomination(@id int)
as
select tr_id as acsId,mentordtls.m_name,mentordtls.m_linkedinurl,m_yearsofexperience,skills.sk_Name as acSkName from mentordtls,userdtls,skills,training where tr_mid=@id and tr_uid=userdtls.id and tr_sid=skills.sk_Id and tr_status='requested'  



