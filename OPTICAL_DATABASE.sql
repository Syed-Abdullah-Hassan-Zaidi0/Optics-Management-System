create database db_Optical
use[db_Optical]
------CUSTOMER INFORMATION TABLE---------
create table CustomerInfo (
CustomerId int identity(1,1) PRIMARY KEY,
CustomerName varchar(500) NULL,
Addresss varchar(50)  NULL,
PhoneNo varchar(30)  NULL,
Age varchar(30) NULL,
Email varchar(320) NULL,
[Date] nvarchar (30) NULL,
OrderNumber varchar(15) NULL,
Frame varchar(15) NULL,
Lens varchar(50) NULL,
Price varchar(50) NULL,
[status] varchar(10),

DistanceSphereLE varchar(50) NULL,
DistanceCyliderLE varchar(50) NULL,
DistanceAxisLE varchar(50) NULL,

DistanceSphereRE varchar(50) NULL,
DistanceCyliderRE varchar(50) NULL,
DistanceAxisRE varchar(50) NULL,

NearSphereLE varchar(50) NULL,
NearCyliderLE varchar(50) NULL,
NearAxisLE varchar(50) NULL,

NearSphereRE varchar(50) NULL,
NearCyliderRE varchar(50) NULL,
NearAxisRE varchar(50) NULL
)

------SHOP REGISTRATION TABLE---------

create table ShopRegistration(

ShopId int identity(1,1) PRIMARY KEY,
ShopName varchar(500) unique NULL,
[Address] varchar(50) NULL,
City varchar(50) NULL,
PhoneNo varchar(30) NULL,
WhatsappNo varchar(30)  NULL,
Email varchar(320) NULL,
[Password] varchar(40),
fk_OwnerId int ,
)
------OWNER REGISTRATION TABLE---------
create table OwnerRegistration(

OwnerId int identity(1,1) PRIMARY KEY,
OwnerName varchar(500)  NULL,
[Address] varchar(50) NULL,
WhatsappNo varchar(30)  NULL,

)
select * from OwnerRegistration



-----------------------------------------------------------------
 
-----------PROCEDURES----------------------
create proc Sp_SaveCustomerInfo
@CustomerName varchar(500),
@Addresss varchar(50)  ,
@PhoneNo varchar(30) ,
@Age varchar(30) ,
@Email varchar(320) ,
@Date nvarchar(30),
@OrderNumber varchar(15),
@Frame varchar(15) ,
@Lens varchar(50) ,
@Price varchar(50) ,
@status varchar(10),
@DistanceSphereLE varchar(50) ,
@DistanceCyliderLE varchar(50) ,
@DistanceAxisLE varchar(50) ,
@DistanceSphereRE varchar(50) ,
@DistanceCyliderRE varchar(50) ,
@DistanceAxisRE varchar(50) ,
@NearSphereLE varchar(50) ,
@NearCyliderLE varchar(50) ,
@NearAxisLE varchar(50) ,
@NearSphereRE varchar(50) ,
@NearCyliderRE varchar(50) ,
@NearAxisRE varchar(50) 
as
begin
insert into CustomerInfo(CustomerName,Addresss,PhoneNo,Age,Email,[Date],OrderNumber,Frame,Lens,Price,[status],DistanceSphereLE,DistanceCyliderLE,DistanceAxisLE,DistanceSphereRE,DistanceCyliderRE,DistanceAxisRE,NearSphereLE,NearCyliderLE,NearAxisLE,NearSphereRE,NearCyliderRE,NearAxisRE)
values(@CustomerName,@Addresss,@PhoneNo,@Age,@Email,@Date,@OrderNumber,@Frame,@Lens,@Price,@status,@DistanceSphereLE,@DistanceCyliderLE,@DistanceAxisLE,@DistanceSphereRE,@DistanceCyliderRE,@DistanceAxisRE,@NearSphereLE,@NearCyliderLE,@NearAxisLE,@NearSphereRE,@NearCyliderRE,@NearAxisRE)
end


--------------------------------------

create proc Sp_ShopRegistration
@ShopName varchar(500),
@Address varchar(50)  ,
@City varchar(50) ,
@PhoneNo varchar(30) ,
@WhatsappNo varchar(30) ,
@Email varchar(320) ,
@Password varchar(40)
as
begin
insert into ShopRegistration(ShopName,[Address],City,PhoneNo,WhatsappNo,Email,[Password])
values(@ShopName,@Address,@City,@PhoneNo,@WhatsappNo,@Email,@Password)
end

create proc sp_getowner
as begin
select * from OwnerRegistration
end
------------------------------------------------
create proc Sp_SaveOwnerRegistration
@OwnerName varchar(500),
@Address varchar(50)  ,
@WhatsappNo varchar(30) 

as
begin
insert into OwnerRegistration(OwnerName,[Address],WhatsappNo)
values(@OwnerName,@Address,@WhatsappNo)
end
---------------------------------------------------

create proc Sp_DeleteCustomerInfo 
@CustomerID int
as 
begin
delete from CustomerInfo where CustomerID = @CustomerID
end
-----------------------------------
create proc Sp_GetCustomer
as
begin
select * from CustomerInfo
end



create proc Sp_GetCustomerByPhone
@phone varchar(20)
as
begin
select * from CustomerInfo where PhoneNo=@phone
end

------------------------------------------------------------------------------
create proc Sp_GetCustomerByName
@Name varchar(500)
as
begin
select * from CustomerInfo where CustomerName=@Name
end

------------------------------------------------------------------------------
create proc Sp_GetCustomerByDate
@Date varchar(500)
as
begin
select * from CustomerInfo where [Date]=@Date
end

------------------------------------------------------------------------------
create proc sp_returnAuth
as
begin
select ShopName ,[Password] from ShopRegistration 
end
--------------------------------
create proc Sp_DeleteOwnerInfo 
@OwnerId int
as 
begin
delete from OwnerRegistration where OwnerId = @OwnerId
end
--------------------------------------
select * from ShopRegistration
select * from CustomerInfo
select * from OwnerRegistration
----------------------------------
truncate table ShopRegistration
truncate table OwnerRegistration
truncate table CustomerInfo

