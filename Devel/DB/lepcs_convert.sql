set nocount on
declare zzz cursor for 
select distinct
	substring(kod,6,3) as kod, --epulsz
	utca,
	hazszam,
	lepcso,
	cime
from
	hazak
order by
	utca,
	hazszam,
	lepcso

declare @kod varchar(3)
declare @utca varchar(100)
declare @hazszam varchar(5)
declare @lepcso varchar(5)
declare @cime varchar(100)

open zzz

FETCH NEXT FROM zzz
	INTO @kod,@utca,@hazszam,@lepcso,@cime

WHILE @@FETCH_STATUS = 0
BEGIN
	insert into objektum(objtip, megnev, varos, utca, hsz, adatum, akod, kapcsolt)
		select '37', @cime, '1', @utca, @hazszam, GetDate(), 'gabor', 1

	insert into lepcsohaz
		select @@identity, @lepcso, @cime, @kod

	FETCH NEXT FROM zzz
		INTO @kod,@utca,@hazszam,@lepcso,@cime
END
CLOSE zzz
DEALLOCATE zzz
set nocount off


--------------------------------------------------------

set nocount on
declare zzz cursor for 
select distinct
	id,
	kod
from
	lepcsohaz
order by
	id

declare @kod varchar(3)
declare @id2 integer
declare @id1 integer

open zzz

FETCH NEXT FROM zzz
	INTO @id2,@kod

WHILE @@FETCH_STATUS = 0
BEGIN
	select @id1 = id from epulet where epulsz=@kod
	insert into kapcsolat
		select @id1, @id2, GetDate(), 'gabor'

	FETCH NEXT FROM zzz
		INTO @id2,@kod
END
CLOSE zzz
DEALLOCATE zzz
set nocount off

