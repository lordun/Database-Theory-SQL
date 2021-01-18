--Learning Activity 4.8: Data Types and Functions 
--Use “create_ap.sql” to create database

--Question 1.	Write a SELECT statement that returns four columns based on the InvoiceTotal column of the Invoices table: 
--Use the CAST function to return the first column as data type decimal with 2 digits to the right of the decimal point.
--Use CAST to return the second column as a varchar
--Use the CONVERT function to return the third column as the same data type as the first column.
--Use CONVERT to return the fourth column as a varchar, using style 1

select InvoiceTotal, CAST(InvoiceTotal AS varchar), CONVERT(money, InvoiceTotal), CONVERT(varchar, InvoiceTotal, 101) from Invoices;

--Question 2.	Write a SELECT statement that returns two columns based on the Vendors table.
--The first column, Contact, is the vendor contact name in this format: first name followed by last initial (for example, “John S.”)
--The second column, Phone, is the VendorPhone column without the area code. Only return rows for those vendors in the 559 area code.
--Sort the result set by first name, then last name.

select convert(varchar, VendorContactFName)+' '+convert(char(1), VendorContactLName)+'.' as ContactName, right(VendorPhone,8) as Phone from Vendors
	where VendorPhone like'(559)%'
	order by VendorContactFName, VendorContactLName;

--Question 3.	Write a SELECT statement that returns the InvoiceNumber and balance due for every invoice with a non-zero balance and an InvoiceDueDate
--that’s less than 30 days from today.

select InvoiceNumber, InvoiceTotal-PaymentTotal-CreditTotal as BalanceDue, InvoiceDueDate from Invoices
	where InvoiceTotal-PaymentTotal-CreditTotal > 0 and InvoiceDueDate > dateadd(day, -30, getdate());

	