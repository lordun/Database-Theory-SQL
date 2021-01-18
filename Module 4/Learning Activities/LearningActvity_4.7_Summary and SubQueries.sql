--Learning Activity 4.7: Summary and SubQueries

--Use “create_ap.sql” to create database

--Question 1.  Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column.
--Group the result set by VendorID.

 select VendorID, sum (PaymentTotal) as PaymentSum from Invoices
	group by VendorID;

--Question 2.   Write a SELECT statement that returns two columns: VendorName and PaymentSum, where PaymentSum is the sum of the PaymentTotal column.
--Group the result set by VendorName. Return only 10 rows, corresponding to the 10 vendors who’ve been paid the most.
--Hint: Use the TOP clause and join Vendors to Invoices.

select top 10 VendorName, sum(PaymentTotal) as PaymentSum from Vendors join Invoices
	on Invoices.VendorID = Vendors.VendorID
	group by VendorName
	order by sum(PaymentTotal) desc;
	
--Question 3.   Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. InvoiceCount is the count of the number of invoices,
--and InvoiceSum is the sum of the InvoiceTotal column. Group the result set by vendor. Sort the result set so that the vendor with the highest number of invoices appears first.

select VendorName, count(InvoiceNumber) as InvoiceCount, sum(InvoiceTotal) as InvoiceSum from Vendors join Invoices
	on Invoices.VendorID = Vendors.VendorID
	group by VendorName
	order by count(InvoiceNumber) desc;

--Question 4.   Write a SELECT statement that answers this question: Which vendors are being paid from more than one account?
--Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices. Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo

select distinct count(AccountNo) as TotalNumberAccounts, VendorName from InvoiceLineItems join Vendors
	on InvoiceLineItems.AccountNo = Vendors.DefaultAccountNo
	group by VendorName

--Question 5.   Write a SELECT statement that returns six columns:
--VendorID From the Invoices table
--InvoiceDate From the Invoices table
--InvoiceTotal From the Invoices table
--VendorTotal The sum of the invoice totals for each vendor
--VendorCount The count of invoices for each vendor
--VendorAvg The average of the invoice totals for each vendor 
--The result set should include the individual invoices for each

select VendorID, InvoiceDate, InvoiceTotal, sum(InvoiceTotal) as VendorTotal, count(InvoiceNumber) as VendorCount, avg(InvoiceTotal) as VendorAvg from Invoices
	group by VendorID, InvoiceDate, InvoiceTotal;

--Question 6. Write a SELECT statement that answers this question: Which invoices have a PaymentTotal that’s greater than the average PaymentTotal for all paid invoices?
--Return the InvoiceNumber and InvoiceTotal for each invoice.

select InvoiceNumber, InvoiceTotal from Invoices
	where PaymentTotal > (select avg(PaymentTotal) from Invoices)
	order by InvoiceNumber;