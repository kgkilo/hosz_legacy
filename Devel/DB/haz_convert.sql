declare zzz cursor for 
select distinct
	substring(kod,6,3),
	--kod,
	utca,
	hazszam
from
	hazak1
order by
	utca,
	hazszam

declare @a varchar(3)
declare @b varchar(35)
declare @c varchar(5)

open zzz

FETCH NEXT FROM zzz
	INTO @a,@b,@c

WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC sp_InsEpul null,null,1,@b,@c,null,null,null,@a

	FETCH NEXT FROM zzz
		INTO @a,@b,@c
END
CLOSE zzz
DEALLOCATE zzz
