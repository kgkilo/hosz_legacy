/*insert into objektum(objtip,azon,varos,utca,hsz,akod,adatum)
select distinct
	'01',
	substring(azon,1,8),
	'1',
	utca,
	hsz,
	User_Name(),
	GetDate()
from
	fogyt
where
	tipus<>"0"
order by
	utca,
	hsz
*/

/*insert into epulet(id)
select
	id
from
	objektum
where
	objtip='01'
*/

/* objektum table azon->>>15!!!

/*
insert into objektum(objtip,azon,varos,utca,hsz,adatum,akod)
select
	'02',
	azon,
	'1',
	utca,
	hsz,
	GetDate(),
	User_Name()
from
	fogyt
order by
	azon
*/

/*
insert into
	lakas(id,fkod,lepcs,em,ajto)
select
	objektum.id,
	objektum.azon,
	lepcs,
	em,
	ajto
from
	fogyt inner join objektum on fogyt.azon = objektum.azon
order by
	id
*/

/*
insert into
	kapcsolat(id1,id2,adatum,akod)
select distinct
	objektum.id,
	lakas.id,
	GetDate(),
	User_Name()
from
	objektum inner join lakas on objektum.azon = substring(lakas.fkod,1,8)
where
	objtip = '01'
	and objektum.id is not null
	and lakas.id is not null
order by
	objektum.id,
	lakas.id
*/

