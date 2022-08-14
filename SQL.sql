create table salesperson(
SalespersonID int Not Null primary key,
Name varchar(30),
Age int,
Salary int
)

create table customer(
CustomerID int Not Null primary key,
Name varchar(30)
)

create table orders(
OrderID int Not Null primary key,
OrderDate Date,
CustomerID int Foreign key references customer(CustomerID),
SalespersonID int Foreign key references salesperson(SalespersonID),
NumberofUnits int,
CostofUnit int,
)


Insert into salesperson values(1,'Alice',61,140000)
Insert into salesperson values(2,'Bob',34,44000)
Insert into salesperson values(6,'Chris',34,40000)
Insert into salesperson values(8,'Derek',41,52000)
Insert into salesperson values(11,'Emmit',57,115000)
Insert into salesperson values(16,'Fred',38,38000)

Insert into customer values(4,'George')
Insert into customer values(6,'Harry')
Insert into customer values(7,'Ingrid')
Insert into customer values(11,'Jerry')

Insert into orders values(3,convert(datetime,'17/01/2013',103),4,2,4,400)
Insert into orders values(6,convert(datetime,'07/02/2013',103),4,1,1,600)
Insert into orders values(10,convert(datetime,'04/03/2013',103),7,6,2,300)
Insert into orders values(17,convert(datetime,'15/03/2013',103),6,1,5,300)
Insert into orders values(25,convert(datetime,'19/04/2013',103),11,11,7,300)
Insert into orders values(34,convert(datetime,'22/04/2013',103),11,11,100,26)
Insert into orders values(57,convert(datetime,'12/07/2013',103),7,11,14,11)

/*Question 5 Solutions*/

/*Question 5-a*/
select s.name as Salesperson_Name from salesperson s left join orders o 
on s.SalespersonID=o.SalespersonID where o.CustomerID=(select CustomerID from customer where Name='George') group by s.Name

/*Question 5-b*/
select s.name as Salesperson_Name from salesperson s left join orders o 
on s.SalespersonID=o.SalespersonID where o.CustomerID!=(select CustomerID from customer where Name ='George') group by s.Name

/*Question 5-c*/
select s.name as Salesperson_Name from salesperson s left join orders o 
on s.SalespersonID=o.SalespersonID group by s.Name Having COUNT(o.SalespersonID)>=2 

/*Question 6 Solutions*/

/*Question 6-a*/
With Result As(
 Select Salary,DENSE_RANK() over (order by Salary desc) as DENSERANK
 from salesperson
)
Select Name as Salesperson_Name  from salesperson where Salary=(Select Top 1 Salary from Result where DENSERANK=3)

/*Question 6-b*/
Create Table BigOrders(
CustomerID int not null Foreign key references customer(CustomerID),
TotalCost int
)

Insert into BigOrders(CustomerID,TotalCost)
Select c.CustomerID,(o.NumberofUnits*o.CostofUnit) from customer c inner join orders o on c.CustomerID=o.CustomerID
where (o.NumberofUnits*o.CostofUnit) >=1000

select * from BigOrders

/*Question 6-C*/

/*Since the orders only have date entries of the year 2013 The data would show entries in ascending order.
Assuming there would be any entries of any other year it would show in appropriate order in this query*/

Select Year(OrderDate) as Year,DATENAME(MONTH,OrderDate) as OrderMonth,COUNT(OrderID) as TotalOrders from orders 
Group by YEAR(OrderDate),DATENAME(MONTH,OrderDate) order by YEAR(OrderDate) desc

/*Since the I have used names of the month in the second query 
the data is ordered in descending order based on the alphabetical order*/

Select DATENAME(MONTH,OrderDate) as OrderMonth,COUNT(OrderID) as TotalOrders from orders 
Group by DATENAME(MONTH,OrderDate) order by DATENAME(MONTH,OrderDate) desc

 
