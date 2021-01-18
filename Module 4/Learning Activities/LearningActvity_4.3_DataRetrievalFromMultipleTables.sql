--Learning Activity 4.3: Data Retrieval from Multiple Tables
--Question 1 Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table.

select * from Vendors inner join Invoices on Vendors.VendorID = Invoices.VendorID;

--Question 2 Write a SELECT statement that returns four columns:
--VendorName 	From the Vendors table
--InvoiceNumber 	From the Invoices table
--InvoiceDate 		From the Invoices table
--Balance    InvoiceTotal minus the sum of PaymentTotal and CreditTotal

--The result set should have one row for each invoice with a non-zero balance. Sort the result set by VendorName in ascending order.

select Vendors.VendorName, Invoices.InvoiceNumber, Invoices.InvoiceDate, Invoices.InvoiceTotal-Invoices.PaymentTotal+Invoices.CreditTotal as Balance from 
Vendors inner join Invoices on Vendors.VendorID = Invoices.VendorID where (Invoices.InvoiceTotal-Invoices.PaymentTotal+Invoices.CreditTotal) > 0.00 order by VendorName;

--Question 3 Write a SELECT statement that returns three columns:
--VendorName 		From the Vendors table
--DefaultAccountNo 		From the Vendors table
--AccountDescription		From the GLAccounts table

--The result set should have one row for each vendor, with the account number and account description for that vendor’s default account number.
--Sort the result set by AccountDescription, then by VendorName.

select Vendors.VendorName, Vendors.DefaultAccountNo, GLAccounts.AccountDescription from Vendors inner join GLAccounts
on Vendors.DefaultAccountNo = GLAccounts.AccountNo order by GLAccounts.AccountDescription, Vendors.VendorName;

--Question 4 Write a SELECT statement that returns five columns from three tables, all using column aliases:
--Vendor	 	VendorName column
--Date 		InvoiceDate column
--Number 	InvoiceNumber column
--# 		InvoiceSequence column
--LineItem	InvoiceLineItemAmount column

--Assign the following correlation names to the tables:
--‘V’ for Vendors table
--‘I’ for Invoices table
--‘LI’ for InvoiceLineItems table
--Sort the final result set by Vendor, Date, Number, and #.

select V.VendorName as Vendor, I.InvoiceDate as Date, I.InvoiceNumber as Number, LI.InvoiceSequence as #,
LI.InvoiceLineItemAmount as LineItem from [Vendors] V join Invoices I on V.VendorID = I.VendorID
join InvoiceLineItems LI on LI.InvoiceID = I.InvoiceID order by Vendor, Date, Number, #;

--Question 5 Use the UNION operator to generate a result set consisting of two columns from the Vendors table: VendorName and VendorState.
--If the vendor is in California, the VendorState value should be “CA”; otherwise, the VendorState value should be “Outside CA.”
--Sort the final result set by VendorName

select 'CA' as VendorState, VendorName from Vendors where VendorState = 'CA' Union
select 'Outside CA' as VendorState, VendorName from Vendors where VendorState != 'CA'
order by VendorName;

