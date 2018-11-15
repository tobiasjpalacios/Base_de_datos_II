
-- Primer ejercicio-- 



select lastname, sum(salesamount) from factinternetsales 
inner join dimcustomer using (customerkey)
where dimcustomer.customerkey = factinternetsales.customerkey
group by lastname
order by lastname;

-- Segundo ejercicio 

-- suma total de valor entre 2005 y 2008

select sum(salesamount) from factinternetsales
inner join dimdate on factinternetsales.duedatekey=dimdate.datekey
where calendaryear between '2005' and '2008'
;

-- suma por año 

select calendaryear, sum(salesamount) from factinternetsales
inner join dimdate on factinternetsales.duedatekey=dimdate.datekey
where calendaryear between '2005' and '2008'
group by calendaryear
;

-- Tercer Ejercicio 

select sum(salesamount) , spanishproductcategoryname , spanishproductsubcategoryname
from factinternetsales
inner join dimproduct using (productkey)
inner join dimproductsubcategory using (productsubcategorykey)
inner join dimproductcategory using (productcategorykey)
group by spanishproductcategoryname , spanishproductsubcategoryname;


-- cuarto ejercicio 
select sum(salesamount) as "montos de venta"  ,sum(freight) as "freight", 
spanishproductcategoryname , spanishproductsubcategoryname, spanishproductname
from factinternetsales
inner join dimproduct using (productkey)
inner join dimproductsubcategory using (productsubcategorykey)
inner join dimproductcategory using (productcategorykey)
group by spanishproductcategoryname , spanishproductsubcategoryname,spanishproductname;


-- Quinto ejercicio 
select spanishproductname ,salesamount from factinternetsales
inner join dimproduct using (productkey)
where spanishproductname like 'a%'
and salesamount::numeric < 5000
group by spanishproductname , salesamount;

--Sexto ejercicio 
select salesterritorycountry as "pais", sum(salesamount)  as "monto total"
from factinternetsales 
inner join dimsalesterritory using (salesterritorykey)
group by dimsalesterritory.salesterritorycountry
order by dimsalesterritory.salesterritorycountry;

-- septimo ejercicio 
select spanishproductname , sum(salesamount) as "total",calendaryear
from factinternetsales
inner join dimproduct using (productkey)
inner join dimdate on factinternetsales.duedatekey=dimdate.datekey
where calendaryear = 2007
group by spanishproductname,calendaryear 
order by sum(salesamount ) desc;

-- Octavo ejercicio
select calendaryear, monthnumberofyear, sum(salesamount::numeric) as monto
from factinternetsales
inner join dimdate on factinternetsales.duedatekey=dimdate.datekey
group by rollup (calendaryear, monthnumberofyear);

-- noveno ejercicio 
-- en español no anda muy bien pero lo igual 
select spanishproductname ,count(productkey), sum(unitsin), sum(unitsout)
from factproductinventory
inner join dimproduct using (productkey)
inner join dimdate using (datekey)
inner join dimproductsubcategory using (productsubcategorykey)
inner join dimproductcategory using (productcategorykey)
where spanishproductname like '%Pedales%' or spanishproductname like '%Tubos%' 
and fiscalyear = 2006 and fiscalsemester =2
group by spanishproductname;

-- en ingles anda correcto 
select englishproductname, count(productkey) as "producto", sum(unitsin) as "entrantes", sum(unitsout) as "salientes" from factproductinventory
inner join dimproduct  using (productkey)
inner join dimdate using(datekey)
inner join dimproductsubcategory using(productsubcategorykey)
inner join dimproductcategory using (productcategorykey)
where englishproductname like '%Pedal%' or englishproductname like '%Tire%' 
and fiscalyear = 2006 and fiscalsemester =2
group by englishproductname;

--decimo ejercicio 
select count(calls) as "Llamadas ", count(automaticresponses) as "respuestas automaticas ", count(issuesraised) as "problemas solucionados " 
from factcallcenter
inner join dimdate using(datekey)
where englishdaynameofweek <> 'Saturday' or englishdaynameofweek <> 'Sunday'
and shift like '%AM%'
and weeknumberofyear between 20 and 53
and fiscalyear = 2007

