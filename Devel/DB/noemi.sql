set nocount on

CREATE TABLE #ZZZ
	(
	munkalap_id INTEGER NULL,
	objid INTEGER NULL,
	futomu_id INTEGER NULL,
	munora REAL NULL
	)

DECLARE cc CURSOR FAST_FORWARD FOR
SELECT
	munkalap.ID,
	munkalap.objid,
	teljm.munora
FROM
	munkalap inner join teljm on teljm.munkalap_id = munkalap.id
where
	objid is not null
	and mundat between '2000.08.01' and '2000.08.31'

DECLARE @munkalap_ID INTEGER
DECLARE @objid INTEGER
declare @FUTOMU_ID INTEGER
declare @munora REAL

OPEN cc

FETCH NEXT FROM cc
	INTO @munkalap_ID,@objid,@munora

WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC @FUTOMU_ID = sp_Rekurziv @objid
	
--	if @futomu_id is null
	begin
		INSERT INTO #ZZZ
		SELECT
			@munkalap_ID,
			@objid,
			@FUTOMU_ID,
			@munora
	end
	FETCH NEXT FROM cc
		INTO @munkalap_ID,@objid,@munora
END

--Lezárjuk és töröljük a kurzort
CLOSE cc
DEALLOCATE cc

SET NOCOUNT OFF


select
	munkalap_id as munkalap,
	objid as berendezes,
	munora,
	gyszam,
	telephsz,
	megnev as megnevezes,
	Q296.kodenev as tipus
from
	Q296 right join
		(#ZZZ inner join objektum on objektum.id = objid)
	on Q296.kodert = objektum.objtip
where
	futomu_id is null
	or futomu_id < 0

drop table #zzz
