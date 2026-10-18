USE `Chinook`;

select 'artist' as tablenames ,
Count(*) as rowscount from artist 
union all 
select 'album', count(*) from album 
union all
select 'customer', count(*) from customer
union all
select 'employee', count(*) from employee
union all
select 'genre', count(*) from genre
union all
select 'invoice', count(*) from invoice
union all
select 'invoiceline', count(*) from invoiceline
union all
select 'mediatype', count(*) from mediatype
union all
select 'playlist', count(*) from playlist
union all 
select 'playlisttrack', count(*) from playlisttrack
union all
select 'track', count(*) from track;



select count(*) as TotalCustomer,
sum(company is null) as companynull,
sum(state is null) as statenull,
sum(fax is null) as faxnull
from customer;


select
  i.invoiceid,
  i.total as invoiceTotal,
  round(sum( il.unitprice* il.quantity), 2 ) as calculatedTotal,
  round( i.total - sum(il.unitprice * il.quantity), 2 )as difference
  from invoice i
  join invoiceline il
     on i.invoiceid = il.invoiceid
   group by i.invoiceid, i.total
   having ABS( i.total - sum(il.unitprice * il.quantity) )> 0.01;
   
   
   
   
select country as country, count(*) as customer
 from customer
   group by country
   order by customer desc;

   
   
select Name, round(milliseconds/60000, 2) as minutes 
   
   from track
   order by milliseconds desc
   limit 5;
   
   select g.name as genre, count(t.trackid) as totaltracks
   from genre g
   join track t
    on g.genreid = t.genreid
    group by g.genreid, g.name
    order by totaltracks desc;
    
    
  
select  billingcountry, round(sum(total), 2) as salesC

 from invoice
 group by billingcountry
 order by salesc desc;
 
 select sum(total) as totalsale, year(invoiceDate) as years
 from invoice
 group by years;
 
 
 select 
 g.Name as genre, round(sum(il.unitprice * il.quantity),2) as totalearning
 from genre g
 join track t
  on g.genreid = t.genreid
   join invoiceline il
   on t.trackid = il.trackid
    group by g.genreid, g.Name
    order by totalearning desc;
    
    
    
    
    select a.name as artist,  round(sum(il.unitprice * il.quantity),2) as totalEarning
    from artist a
    join album al
on a.artistid = al.artistid
join track t
on al.albumid = t.albumid
join invoiceline il
on t.trackid = il.trackid
group by a.artistid, a.name
order by totalEarning desc
limit 5;


select concat(c.firstname, '  ', c.lastname) as customername,
c.country,
round(sum(i.total), 2) as totalspent
from customer c
join invoice i 
     on c.customerid = i.customerid
  group by
     c.customerid,
     c.firstname,
     c.lastname,
     c.country
  order by totalspent desc 
  limit 10;
  
  
  select concat(e.firstname, ' ', e.lastname) as employeename,
   count(distinct c.customerid) as totalcustomers,
   round(coalesce(sum(i.total), 0),2) as totalsales
   from employee e
   left join customer c
    on e.employeeid = c.supportrepid
    left join invoice i 
     on c.customerid = i.customerid
     group by e.employeeid, e.firstname, e.lastname
     order by totalsales desc;
  