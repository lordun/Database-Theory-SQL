--Learning Activity 4.1 Data Retrieval from a Single Table

--Question 1 Select all column from vendor
select * from Vendors;

--Question 2 Select id and name from vendor
select VendorID, VendorName from Vendors;

--Question 3 Return the vendor ID, date, and invoice total of all invoices
select VendorID, InvoiceDate, InvoiceTotal from Invoices;

--Question 4 Return the invoice number as “Number” and the invoice date as “Date” from Invoices
select InvoiceNumber as Number, InvoiceDate as Date from Invoices;

--Question 5 Return all vendor names and IDs, with a single column for both lines of mailing address called “Mailing Address”
select VendorName, VendorID, VendorAddress1+' '+VendorAddress2 as MailingAddress from Vendors;

--Question 6 Return all vendor names and a single column for city and state called “Region.”
select VendorName, VendorCity+' '+VendorState as Region from Vendors;

--Question 7 Return all distinct invoice dates from invoices
select distinct InvoiceDate from Invoices;

--Question 8 Return all distinct city, state combinations from Vendors
select distinct VendorCity, VendorState from Vendors;

--Question 9 Return all distinct zip codes from Vendors
select distinct VendorZipCode from Vendors;

--Question 10 Return all vendors ordered by last name, then first name.
select VendorContactLName, VendorContactFName from Vendors
order by VendorContactLName;

--Question 11 Return the top five most recent invoices.
select top 5 InvoiceNumber from Invoices
order by InvoiceDate desc;

--Question 12 Return the top 10 percent oldest invoices
select  top 10 percent InvoiceNumber from Invoices
order by InvoiceDate;

--Question 13 Select the bottom ten percent of invoice line items by amount.
select  top 10 percent InvoiceLineItemAmount from InvoiceLineItems
order by InvoiceLineItemAmount;

--Question 14 Select the top ten percent of invoices ordered by invoicetotal. 
select  top 10 percent InvoiceNumber from Invoices
order by InvoiceTotal desc;

--Question 15 Return the vendorID column, invoice total, and amount owed. Amount owed is equal to credit + payment - total.
select VendorID, InvoiceTotal, CreditTotal+PaymentTotal-InvoiceTotal as AmountOwed from Invoices;

--Question 16 Select all invoices with a payment less than the invoice total.
select InvoiceID from Invoices where PaymentTotal < InvoiceTotal;

--Question 17 Return all vendors who are located in a state other than CA
select VendorID, VendorName from Vendors where VendorState not in ('CA');

--Question 18 Select all line items with an invoice ID greater than 50 and an amount less than 1000.
select InvoiceID, InvoiceLineItemAmount from InvoiceLineItems where InvoiceID > 50 and InvoiceID < 1000;

--Question 19 Find all invoices with a total amount greater than or equal to 500 and a date less than January 15, 2016.
select InvoiceID, InvoiceTotal, InvoiceDate from Invoices where InvoiceTotal >= 500 and InvoiceDate < '2016-01-15';

--Question 20 Return all invoices with a payment total between 0 and 500.
select InvoiceID, PaymentTotal from Invoices where PaymentTotal between 0 and 500;

--Question 21 Return all vendors located in one of the following states: AL, AB, FL, MS
select VendorID, VendorName, VendorState from Vendors where VendorState in ('AL', 'AB', 'FL', 'MS');

--Question 22 Return all vendors with ‘Main’ in their address.
select VendorID, VendorName, VendorAddress1+' '+VendorAddress2 as Address from Vendors where VendorAddress1 in ('Main');
