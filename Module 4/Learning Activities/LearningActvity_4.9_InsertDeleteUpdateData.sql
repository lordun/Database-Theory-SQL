--Learning Activity 4.9: Insert, Delete and Update Data 

--Use “create_ap.sql” to create database

--Question 1.	Write SELECT INTO statements to create two test tables named VendorCopy and InvoiceCopy that are complete copies of the Vendors and Invoices tables.
--If VendorCopy and InvoiceCopy already exist, first code two DROP TABLE statements to delete them.



select VendorID, VendorName, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode, VendorPhone, 
	VendorContactLName, VendorContactFName, DefaultTermsID, DefaultAccountNo into VendorCopy from Vendors;


select InvoiceID, VendorID, InvoiceNumber, InvoiceDate, InvoiceTotal, PaymentTotal, CreditTotal, TermsID, 
	InvoiceDueDate, PaymentDate into InvoiceCopy from Invoices;

--Question 2.	Write an INSERT statement that adds a row to the InvoiceCopy table with the following values:
--VendorID: 32 
--InvoiceTotal: $434.58 
--TermsID: 2 
--InvoiceNumber: AX-014-027 
--PaymentTotal: $0.00 
--InvoiceDueDate: 07/8/2016 
--InvoiceDate: 6/21/2016 
--CreditTotal: $0.00 
--PaymentDate: null

insert into InvoiceCopy (VendorID, InvoiceTotal, TermsID, InvoiceNumber, PaymentTotal, InvoiceDueDate, InvoiceDate, CreditTotal, PaymentDate)
	values (32, 434.58, 2, 'AX-014-027', $0.00, 07/8/2016, 6/21/2019, $0.00, null)

--Question 3.	Write an UPDATE statement that modifies the VendorCopy table. Change the default account number to 403 for each vendor that has a default account number of 400.

update VendorCopy set DefaultAccountNo=403
	where DefaultAccountNo=400;

--Question 4.	Write an UPDATE statement that modifies the InvoiceCopy table. Change the PaymentDate to today’s date and the PaymentTotal to the balance due for each invoice with a balance due. Set today’s date with a literal date string, or use the GETDATE() function.

update InvoiceCopy set PaymentDate = GetDate()

--Question 5.	Write a DELETE statement that deletes all vendors in the state of Minnesota from the VendorCopy table.



--Question 6.	Write a DELETE statement for the VendorCopy table. Delete the vendors that are located in states from which no vendor has ever sent an invoice.
--Hint: Use a subquery coded with “SELECT DISTINCT VendorState” introduced with the NOT IN operator.
