update
	munkalap
set
	sorsz = id
where
	sorsz is null



******************************************************************************

set nocount on
declare karbcursor cursor fast_forward for
	select id from munkalap
	where (muvel = 'HIT' or muvel = 'SAV' or muvel = 'SZV')
		and allapot = 4
		and (fszam = 62323 or fszam = 62317)


open karbcursor

select 'open megvolt'


declare @mun_id integer
fetch next from karbcursor
	into @mun_id

while @@fetch_status = 0
	begin
		select @mun_id
		if not exists (select id from karban where mun_sorsz = @mun_id)
			begin
			select 'ins'
			exec sp_InsKarban @mun_id
			end
		fetch next from karbcursor
			into @mun_id
	end

close karbcursor
deallocate karbcursor
set nocount off

*******************************************************************************
