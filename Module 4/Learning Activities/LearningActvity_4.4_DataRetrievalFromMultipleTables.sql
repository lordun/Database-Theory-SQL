--Learning Activity 4.4: Data Retrieval from Multiple Tables
select * from album

--Question 1 For each track, return the following columns:
--a.	Track Name
--b.	Track Length 
--c.	Album Title
--d.	Artist name
--Do not include tracks without a matching album or artist.
--Order the results by album id, ascending.

select Track.Name as TrackName, Track.Milliseconds as TrackLength, Album.Title as AlbumTitle, Artist.Name as ArtistName from [Track]
join Album on Track.AlbumId = Album.AlbumId join Artist on Artist.ArtistId = Album.ArtistId order by Album.AlbumId asc;

--Question 2 For each track, return the following columns:
--a.	Track name
--b.	Track unit price
--c.	Media type name
--d.	Genre name
--Do not include tracks without a matching genre type or media type.
--Order by genre name alphabetically

select Track.Name as TrackName, Track.UnitPrice as TrackUnitPrice, MediaType.Name as MediaTypeName, Genre.Name as GenreName from [Track]
join MediaType on Track.MediaTypeId = MediaType.MediaTypeId join Genre on Track.GenreId = Genre.GenreId  order by GenreName asc;

--Question 3 For each track that is not in playlist, return the following
--a.	Track name
--b.	Size in bytes

select Track.Name as TrackName, Bytes as SizeInBytes from Track except select Playlist.Name, PlaylistId from Playlist;

--Question 4 For each employee who does not support a customer, return the following
--a.	First name
--b.	Last name

select Employee.FirstName, Employee.LastName, Employee.EmployeeID from Employee except select Customer.FirstName, Customer.LastName, Customer.SupportRepId from Customer;

--Question 5 Return the following columns
--a.	Last name
--b.	First name
--c.	Phone number
--Return a row for each customer and a row for each employee in a single table

select Customer.FirstName, Customer.LastName from Customer union select Employee.FirstName, Employee.LastName from Employee;

--Question 6 Return the following columns
--a.	Name
--Name should contain a composer name or an artist name.
--Return a row for each artist and a row for each track that has a composer in a single table.

select Artist.Name as Name from Artist union select Track.Composer from Track;