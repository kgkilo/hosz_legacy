IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SZETAV')
	DROP DATABASE [SZETAV]
GO

CREATE DATABASE [SZETAV]  ON (NAME = N'SZETAV_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\SZETAV_Data.MDF' , SIZE = 73, FILEGROWTH = 10%) LOG ON (NAME = N'SZETAV_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\SZETAV_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE Hungarian_CI_AS
GO

exec sp_dboption N'SZETAV', N'autoclose', N'true'
GO

exec sp_dboption N'SZETAV', N'bulkcopy', N'false'
GO

exec sp_dboption N'SZETAV', N'trunc. log', N'true'
GO

exec sp_dboption N'SZETAV', N'torn page detection', N'true'
GO

exec sp_dboption N'SZETAV', N'read only', N'false'
GO

exec sp_dboption N'SZETAV', N'dbo use', N'false'
GO

exec sp_dboption N'SZETAV', N'single', N'false'
GO

exec sp_dboption N'SZETAV', N'autoshrink', N'true'
GO

exec sp_dboption N'SZETAV', N'ANSI null default', N'false'
GO

exec sp_dboption N'SZETAV', N'recursive triggers', N'false'
GO

exec sp_dboption N'SZETAV', N'ANSI nulls', N'false'
GO

exec sp_dboption N'SZETAV', N'concat null yields null', N'false'
GO

exec sp_dboption N'SZETAV', N'cursor close on commit', N'false'
GO

exec sp_dboption N'SZETAV', N'default to local cursor', N'false'
GO

exec sp_dboption N'SZETAV', N'quoted identifier', N'false'
GO

exec sp_dboption N'SZETAV', N'ANSI warnings', N'false'
GO

exec sp_dboption N'SZETAV', N'auto create statistics', N'true'
GO

exec sp_dboption N'SZETAV', N'auto update statistics', N'true'
GO

if( ( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) ) or ( (@@microsoftversion / power(2, 24) = 7) and (@@microsoftversion & 0xffff >= 1082) ) )
	exec sp_dboption N'SZETAV', N'db chaining', N'false'
GO

use [SZETAV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_CheckPermis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_CheckPermis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelArvalt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelArvalt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelDolgozo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelDolgozo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelEgyediSzlatet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelEgyediSzlatet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelKarbterv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelKarbterv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelKepvis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelKepvis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelKontir]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelKontir]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelObj]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelObj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelRaktarKepv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelRaktarKepv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelSzerzfej]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelSzerzfej]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelSzerztet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelSzerztet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelSzlaEgyedi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelSzlaEgyedi]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DelTeljm]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DelTeljm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Duplikal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Duplikal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DuplikalEpul]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DuplikalEpul]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DuplikalMunk]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DuplikalMunk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillArvalt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillArvalt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillConnected]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillConnected]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillDolgozo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillDolgozo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillEgyediSzlaTet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillEgyediSzlaTet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillEpuletByFutomu]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillEpuletByFutomu]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillKarb]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillKarb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillKepvis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillKepvis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillLaborJegyz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillLaborJegyz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillLakasByEpulet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillLakasByEpulet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillMunkalapJegyz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillMunkalapJegyz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillMunkalapszam]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillMunkalapszam]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillNincsKarbterv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillNincsKarbterv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillNotConnected]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillNotConnected]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillObjMegnev]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillObjMegnev]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillObjTelephsz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillObjTelephsz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillOsszesitoSorsz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillOsszesitoSorsz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillRaktarKepv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillRaktarKepv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillSzertet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillSzertet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillSzerzfej]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillSzerzfej]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillSzlaEgyedi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillSzlaEgyedi]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillTabPlomb]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillTabPlomb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillTabVizora]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillTabVizora]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillTeljm]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillTeljm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_FillVanKarbterv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FillVanKarbterv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GeneralAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GeneralAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetElozoKapcs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetElozoKapcs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetFszamInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetFszamInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetGridHeader]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetGridHeader]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetInfoAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetInfoAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetInfoSpec]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetInfoSpec]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetJegyzKarbInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetJegyzKarbInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetKapcs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetKapcs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetKarbLekerdInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetKarbLekerdInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetMunkalapObj]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetMunkalapObj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetOsszesitoSorsz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetOsszesitoSorsz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetPermis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetPermis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetRaktKepvisInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetRaktKepvisInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetSzertetOsszeg]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetSzertetOsszeg]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetTeljmSum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetTeljmSum]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsArvalt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsArvalt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsDolgozo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsDolgozo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsEgyediSzlatet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsEgyediSzlatet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsEpul]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsEpul]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsJegyz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsJegyz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsKarban]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsKarban]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsKarbterv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsKarbterv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsKepvis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsKepvis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsKontir]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsKontir]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsLabor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsLabor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsMunkalap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsMunkalap]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsObjAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsObjAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsRaktarKepv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsRaktarKepv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsSzerzfej]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsSzerzfej]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsSzerztet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsSzerztet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsSzlaEgyedi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsSzlaEgyedi]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsTeljm]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsTeljm]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Jegyzokonyv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Jegyzokonyv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Kapcsol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Kapcsol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LaborOsszesito]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LaborOsszesito]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdBerRaktar]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdBerRaktar]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdBerRaktarSz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdBerRaktarSz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdDolgozo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdDolgozo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdHierarchia]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdHierarchia]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdJegyz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdJegyz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdKarban]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdKarban]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdKarbterv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdKarbterv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdKepvis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdKepvis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdKontir]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdKontir]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdMlap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdMlap]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdRaktar]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdRaktar]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdSzerz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdSzerz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdSzlaAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdSzlaAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LekerdSzolg]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LekerdSzolg]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ListKapcsID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ListKapcsID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadBerRaktarDb]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadBerRaktarDb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadBerRaktarSzDb]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadBerRaktarSzDb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadDolgozo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadDolgozo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadEpul]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadEpul]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadJegyz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadJegyz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadJegyzDb]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadJegyzDb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadKepvis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadKepvis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadKontir]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadKontir]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadLabor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadLabor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadMlapDb]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadMlapDb]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadMunkalap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadMunkalap]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadObjAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadObjAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadObjEgyedi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadObjEgyedi]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadRaktar]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadRaktar]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadRaktarInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadRaktarInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadRaktarKepv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadRaktarKepv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadRaktarSz]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadRaktarSz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadSzerzfej]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadSzerzfej]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_LoadSzlaEgyedi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_LoadSzlaEgyedi]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeCsekk]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeCsekk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB403]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB403]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB404]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB404]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB406]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB406]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB407]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB407]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB408]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB408]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB413]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB413]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB_R01]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB_R01]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB_R03]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB_R03]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTAB_R04]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTAB_R04]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MakeTab_kint]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MakeTab_kint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MlapObjFeltolt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MlapObjFeltolt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q271]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q271]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q272]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q272]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q274]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q274]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q275]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q275]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q276]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q276]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q277]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q277]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q278]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q278]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q279]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q279]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q281]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q281]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q282]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q282]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q283]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q283]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q284]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q284]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q285]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q285]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q288]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q288]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q289]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q289]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q291]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q291]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q291D]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q291D]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q293]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q293]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q296]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q296]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q296_Diszp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q296_Diszp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q297]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q297]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q298]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q298]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q299]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q299]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q300]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q300]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q302]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q302]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q304]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q304]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q305]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q305]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q306]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q306]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q307]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q307]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q308]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q308]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q309]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q309]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q310]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q310]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q310A]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q310A]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q310D]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q310D]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q311]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q311]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q312]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q312]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q313]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q313]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q314]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q314]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q315]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q315]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q316]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q316]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q317]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q317]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q318]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q318]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q319]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q319]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q320]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q320]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q321]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q321]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q322]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q322]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q323]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q323]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q324]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q324]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q325]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q325]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q326]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q326]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q327]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q327]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q328]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q328]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q329]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q329]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q330]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q330]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q331]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q331]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q332]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q332]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q333]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q333]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q334]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q334]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q335]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q335]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q336]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q336]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q337]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q337]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q338]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q338]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q339]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q339]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q340]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q340]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q341]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q341]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q342]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q342]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q343]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q343]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q344]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q344]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q345]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q345]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q346]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q346]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q347]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q347]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q348]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q348]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q349]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q349]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q350]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q350]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q351]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q351]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q352]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q352]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q353]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q353]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q354]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q354]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q355]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q355]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q356]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q356]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q357]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q357]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q358]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q358]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q359]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q359]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q360]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q360]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q361]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q361]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q362]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q362]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q363]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q363]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q364]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q364]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q365]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q365]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q366]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q366]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q367]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q367]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q368]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q368]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q369]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q369]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q370]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q370]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Q371]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Q371]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QueryParams]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QueryParams]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Rekurziv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Rekurziv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_SetMunkalapAllapot]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_SetMunkalapAllapot]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Szetkapcsol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Szetkapcsol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_TruncKapcsTab]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_TruncKapcsTab]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdDolgozo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdDolgozo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdEpul]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdEpul]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdKepvis]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdKepvis]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdKontir]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdKontir]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdMunkalap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdMunkalap]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdMunkalapVisszair]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdMunkalapVisszair]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdObjAlt]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdObjAlt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdObjGep]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdObjGep]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdObjUzem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdObjUzem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdObjVill]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdObjVill]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdRaktarAllapot]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdRaktarAllapot]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdRaktarKepv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdRaktarKepv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdRaktarObj]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdRaktarObj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdSzerzfej]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdSzerzfej]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdSzlaEgyedi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdSzlaEgyedi]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_WriteKapcsTab]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_WriteKapcsTab]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_WriteMlapTab]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_WriteMlapTab]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Zarol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Zarol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q271]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q271]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q272]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q272]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q274]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q274]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q275]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q275]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q276]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q276]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q277]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q277]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q278]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q278]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q279]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q279]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q281]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q281]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q282]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q282]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q283]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q283]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q284]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q284]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q285]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q285]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q288]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q288]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q289]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q289]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q291]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q291]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q293]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q293]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q296]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q296]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q297]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q297]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q298]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q298]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q299]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q299]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q300]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q300]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q302]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q302]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q304]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q304]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q305]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q305]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q306]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q306]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q307]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q307]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q308]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q308]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q309]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q309]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q310]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q310]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q310A]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q310A]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q310D]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q310D]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q311]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q311]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q312]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q312]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q313]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q313]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q314]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q314]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q315]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q315]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q316]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q316]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q317]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q317]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q318]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q318]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q319]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q319]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q320]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q320]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q321]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q321]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q322]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q322]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q323]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q323]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q324]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q324]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q325]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q325]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q326]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q326]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q327]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q327]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q328]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q328]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q329]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q329]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q330]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q330]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q331]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q331]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q332]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q332]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q333]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q333]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q334]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q334]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q335]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q335]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q336]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q336]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q337]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q337]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q338]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q338]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q339]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q339]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q340]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q340]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q341]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q341]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q342]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q342]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q343]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q343]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q344]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q344]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q345]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q345]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q346]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q346]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q347]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q347]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q348]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q348]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q349]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q349]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q350]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q350]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q351]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q351]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q352]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q352]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q353]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q353]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q354]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q354]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q355]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q355]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q356]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q356]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q357]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q357]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q358]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q358]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q359]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q359]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q360]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q360]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q361]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q361]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q362]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q362]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q363]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q363]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q364]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q364]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q365]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q365]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q366]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q366]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q367]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q367]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q368]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q368]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q369]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q369]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q370]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q370]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Q371]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Q371]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR1]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR10]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR10]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR11]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR11]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR12]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR12]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR13]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR13]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR14]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR14]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR15]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR15]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR16]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR16]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR17]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR17]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR18]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR18]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR19]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR19]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR2]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR20]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR20]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR21]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR21]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR22]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR22]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR23]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR23]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR24]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR24]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR25]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR25]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR3]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR4]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR5]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR6]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR6]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR7]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR7]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR8]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR8]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QLABOR9]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QLABOR9]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QTAB413]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[QTAB413]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ARAMKOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ARAMKOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ARVALT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ARVALT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BERRAKTAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BERRAKTAR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BIZTONSAGI_SZELEP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BIZTONSAGI_SZELEP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOYLER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOYLER]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CSEKK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CSEKK]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DEMAG_EMELOGEP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DEMAG_EMELOGEP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DOLGOZO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DOLGOZO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EPULET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EPULET]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ERZEKELO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ERZEKELO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FAZISJAVITO_KONDENZATOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FAZISJAVITO_KONDENZATOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FOGYT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FOGYT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FOKAPCSOLO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FOKAPCSOLO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FREKVENCIAVALTO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FREKVENCIAVALTO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUTOMU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FUTOMU]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GAZNYOMAS_MERO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GAZNYOMAS_MERO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GAZNYOMAS_SZABALYOZO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GAZNYOMAS_SZABALYOZO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GAZVESZELY_JELZO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GAZVESZELY_JELZO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GRID_FEJLEC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GRID_FEJLEC]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HAJTOMU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HAJTOMU]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HAZAK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HAZAK]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HOCSERELO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HOCSERELO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HOKOZPONT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HOKOZPONT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HOOSSZEGZO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HOOSSZEGZO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[JEGYZ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[JEGYZ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[JOGOS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[JOGOS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KAPCSOLAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KAPCSOLAT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KAPCSTAB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KAPCSTAB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KARBAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KARBAN]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KARBTERV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KARBTERV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KAZAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KAZAN]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KAZANEGO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KAZANEGO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KEPVIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KEPVIS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KEPV_TET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KEPV_TET]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KODLEIR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KODLEIR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KODSZOT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KODSZOT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KOLTSEGMEGOSZTO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KOLTSEGMEGOSZTO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KOMPRESSZOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KOMPRESSZOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KONTIR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KONTIR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LABOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LABOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LAKAS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LAKAS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LANGOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LANGOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LEPCSOHAZ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LEPCSOHAZ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MELEGVIZ_TAROLO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MELEGVIZ_TAROLO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MLAPTAB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MLAPTAB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MOTOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MOTOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MUNKALAP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MUNKALAP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OBJEKTUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OBJEKTUM]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PERMIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PERMIS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RAKTAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RAKTAR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RAKTHISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RAKTHISTORY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RAKTKEPVIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RAKTKEPVIS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZABALYOZO_AUTOMATIKA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZABALYOZO_AUTOMATIKA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZABALYOZO_SZELEP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZABALYOZO_SZELEP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZERELVENY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZERELVENY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZERZFEJ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZERZFEJ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZERZTEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZERZTEL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZINTKAPCSOLO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZINTKAPCSOLO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZIVATTYU]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZIVATTYU]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZLA_ALT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZLA_ALT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZLA_ALT_TET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZLA_ALT_TET]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SZUROK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SZUROK]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB403]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB403]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB403_1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB403_1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB404]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB404]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB406]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB406]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB407]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB407]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB408]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB408]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB413]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB413]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_LABORO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_LABORO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_PLOMB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_PLOMB]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_R01]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_R01]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_R03]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_R03]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_R04]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_R04]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_VIZORA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_VIZORA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TAB_kint]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAB_kint]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TARCSA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TARCSA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TARTALY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TARTALY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TELJM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TELJM]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TERMALKUT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TERMALKUT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TERMELO_CSO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TERMELO_CSO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VENTILLATOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VENTILLATOR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VIZLAGYITO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VIZLAGYITO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VIZORA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VIZORA]
GO

if not exists (select * from master.dbo.syslogins where loginname = N'eszter')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SZETAV', @loginlang = N'magyar'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'eszter', null, @logindb, @loginlang
END
GO

if not exists (select * from master.dbo.syslogins where loginname = N'gabor')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SZETAV', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'gabor', null, @logindb, @loginlang
END
GO

if not exists (select * from master.dbo.syslogins where loginname = N'geza')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SZETAV', @loginlang = N'magyar'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'geza', null, @logindb, @loginlang
END
GO

if not exists (select * from master.dbo.syslogins where loginname = N'kerekes')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SZETAV', @loginlang = N'magyar'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'kerekes', null, @logindb, @loginlang
END
GO

if not exists (select * from master.dbo.syslogins where loginname = N'mini')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SZETAV', @loginlang = N'magyar'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'mini', null, @logindb, @loginlang
END
GO

if not exists (select * from master.dbo.syslogins where loginname = N'szityu')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SZETAV', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'szityu', null, @logindb, @loginlang
END
GO

exec sp_addsrvrolemember N'mini', sysadmin
GO

if not exists (select * from dbo.sysusers where name = N'eszter' and uid < 16382)
	EXEC sp_grantdbaccess N'eszter', N'eszter'
GO

if not exists (select * from dbo.sysusers where name = N'gabor' and uid < 16382)
	EXEC sp_grantdbaccess N'gabor', N'gabor'
GO

if not exists (select * from dbo.sysusers where name = N'geza' and uid < 16382)
	EXEC sp_grantdbaccess N'geza', N'geza'
GO

if not exists (select * from dbo.sysusers where name = N'kerekes' and uid < 16382)
	EXEC sp_grantdbaccess N'kerekes', N'kerekes'
GO

if not exists (select * from dbo.sysusers where name = N'mini' and uid < 16382)
	EXEC sp_grantdbaccess N'mini', N'mini'
GO

if not exists (select * from dbo.sysusers where name = N'szityu' and uid < 16382)
	EXEC sp_grantdbaccess N'szityu', N'szityu'
GO

CREATE TABLE [dbo].[ARAMKOR] (
	[ID] [int] NOT NULL ,
	[HOLEP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[TERFOGAT] [real] NULL ,
	[HOSSZ] [real] NULL ,
	[SZABALYOZAS] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[FUT_LAKAS] [int] NULL ,
	[HMV_LAKAS] [int] NULL ,
	[FUT_KOZULET] [int] NULL ,
	[HMV_KOZULET] [int] NULL ,
	[HOKOZP_SZAM] [int] NULL ,
	[NYOMKUL] [real] NULL ,
	[TOMEGARAM] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ARVALT] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SZOLG] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[NOTERT] [real] NOT NULL ,
	[ERVDAT] [datetime] NOT NULL ,
	[BEFDAT] [datetime] NULL ,
	[FELAR] [real] NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BERRAKTAR] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[OBJID] [int] NOT NULL ,
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[BEKERUL_DAT] [datetime] NOT NULL ,
	[BEKERUL_MERO] [int] NULL ,
	[BEKERUL_DOLG] [int] NULL ,
	[BEKERUL_MEGJ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[KIKERUL_DAT] [datetime] NULL ,
	[KIKERUL_MERO] [int] NULL ,
	[KIKERUL_DOLG] [int] NULL ,
	[KIKERUL_MEGJ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BIZTONSAGI_SZELEP] (
	[ID] [int] NOT NULL ,
	[SZELTIP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[MERET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MERETME] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[NYITNYOM] [real] NULL ,
	[ZARNYOM] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BOYLER] (
	[ID] [int] NOT NULL ,
	[VESZO] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[FELEP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[BOYTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FUTOFEL] [real] NULL ,
	[TERFOGAT] [real] NULL ,
	[SZABMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FU_KOZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CSEKK] (
	[PAZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[BRUTTO] [real] NULL ,
	[KOZCIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZNEV] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZIRSZ] [varchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[SZLASZ] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DEMAG_EMELOGEP] (
	[ID] [int] NOT NULL ,
	[FORDSZ] [int] NULL ,
	[TERHEL] [real] NULL ,
	[ARAMFELV] [real] NULL ,
	[FESZULTS] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DOLGOZO] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NEV] [varchar] (20) COLLATE Hungarian_CI_AS NOT NULL ,
	[LOGIN] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZEREGYS] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[BEOSZT] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[UFR] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[UFW] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[UER] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[UEW] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL ,
	[ADATUM] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EPULET] (
	[ID] [int] NOT NULL ,
	[IRSZAM] [int] NULL ,
	[EPULTIP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[HELYR] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[EPULSZ] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[FUTESMOD] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[LEGTELTIP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[LEGTHELY] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[EPULATAD] [datetime] NULL ,
	[FUTOTIP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[UZEMELT] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[KARBANTAR] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[EPULHOSZ] [real] NULL ,
	[LAKTERF] [real] NULL ,
	[LEPCSOTERF] [real] NULL ,
	[KOZOSTERF] [real] NULL ,
	[KOZULTERF] [real] NULL ,
	[TERF_ARAM] [real] NULL ,
	[HOLEPCSO] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[EPUL_ARAM] [real] NULL ,
	[CIRK_ARAM] [real] NULL ,
	[FUTBESZAB] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[CIRKUL] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[ATKOTES] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[HMVRENDS] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[NYOMKUL] [real] NULL ,
	[CIRK_MOD] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[FOELZ] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FELOSZT] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[UTEM] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ERZEKELO] (
	[ID] [int] NOT NULL ,
	[VEZHOSSZ] [real] NULL ,
	[BENYHOSSZ] [real] NULL ,
	[KIMENET] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[CSATLMERET] [real] NULL ,
	[PLOMBA] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[PLOMBA2] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[SZUKSHOSSZ] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FAZISJAVITO_KONDENZATOR] (
	[ID] [int] NOT NULL ,
	[MEDDTELJ] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FOGYT] (
	[AZON] [nvarchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[LAKO_SOR] [nvarchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[TIPUS] [nvarchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[VAROS] [nvarchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[UTCA] [nvarchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[HSZ] [nvarchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[LEPCS] [nvarchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[EM] [nvarchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[AJTO] [nvarchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[IRSZAM] [nvarchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[LAKO_NEV] [nvarchar] (30) COLLATE Hungarian_CI_AS NULL ,
	[KEPV_AZON] [nvarchar] (5) COLLATE Hungarian_CI_AS NULL ,
	[KEPV_NEV] [nvarchar] (30) COLLATE Hungarian_CI_AS NULL ,
	[KEPV_VAROS] [nvarchar] (30) COLLATE Hungarian_CI_AS NULL ,
	[KEPV_CIM] [nvarchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[KEPV_IRSZ] [nvarchar] (4) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FOKAPCSOLO] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FREKVENCIAVALTO] (
	[ID] [int] NOT NULL ,
	[MKHOM] [real] NULL ,
	[KIMARAM] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FUTOMU] (
	[ID] [int] NOT NULL ,
	[KEZOSZT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MKHOM] [real] NULL ,
	[HOTELJ] [real] NULL ,
	[GAZCSUCS] [real] NULL ,
	[HOHOR_KO] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[HOLEP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[VILLCSUCSNY] [real] NULL ,
	[VILLCSUCST] [real] NULL ,
	[TERFARAM] [real] NULL ,
	[CIRKTERFARAM] [real] NULL ,
	[NYOMTARTTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HMVHOMERS] [real] NULL ,
	[FUT_LAKAS] [int] NULL ,
	[HMV_LAKAS] [char] (10) COLLATE Hungarian_CI_AS NULL ,
	[FUT_KOZULET] [int] NULL ,
	[HMV_KOZULET] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GAZNYOMAS_MERO] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GAZNYOMAS_SZABALYOZO] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GAZVESZELY_JELZO] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GRID_FEJLEC] (
	[OBJTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEGNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[AZON] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VAROS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UTCA] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[GYARTM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[GYARTO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TIPUS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[GYSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UZEMIDO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TELEPHSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HITIDO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ELHELYEZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ALAIR] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NEVLTELJ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NEVLTELJME] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KATEG] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VESZO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UZALL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FKOD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KEZOSZT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MKHOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FAGYVED] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FELEP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[BOYTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZELTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEVNYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VIZNYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZURTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ELLENALL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEMSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UZEMINYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[BEVTELJ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FORDSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EMEL_MAG] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZAL_KOZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZAL_MENNY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZIVFOK] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MERET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MERETME] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUTOFEL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[DB] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOTELJ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[GAZCSUCS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOHOR_KO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[BEEPCSOVDB] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[PRIM_ARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NYITNYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ZARNYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOSSZ_NAGY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOSSZ_KICS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FELUGY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOLEP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TERFOGAT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TERFARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEGSZAL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZABMOD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VEGNYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ATMERO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[BEALL_ERTEK] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[IMPULZUS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOSSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TERHEL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VIZSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FU_KOZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[OSZLSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[BECSOV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ARAMFELV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FESZULTS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VEZHOSSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[BENYHOSSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NYOMATEK] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ERZEKENY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MUKMOD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KVS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KIMARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FOGYMERHELY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KIMENET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CSATLMERET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEDDTELJ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KISMEGSZAK] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEKVILLTELJ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VILLCSUCSNY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VILLCSUCST] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[VILLFORDSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TELJT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUR_ATM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[PRIMELL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KAPCSOLAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TOLTESMOD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUTOTT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZABALYOZAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KUTFNYOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NYUGVIZSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UZEMIVIZSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CIRKTERFARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOMERS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NYOMTARTTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HMVHOMERS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUT_LAKAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HMV_LAKAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUT_KOZULET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HMV_KOZULET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOKOZP_SZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZEKU_TOM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NYOMKUL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TOMEGARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NYOMAS_K] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOMER_SZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEGJ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[IRSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EPULTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HELYR] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EPULSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUTESMOD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEGTELTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEGTHELY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EPULATAD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUTOTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UZEMELT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KARBANTAR] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EPULHOSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LAKTERF] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[LEPCSOTERF] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KOZOSTERF] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KOZULTERF] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TERF_ARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HOLEPCSO] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EPUL_ARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CIRK_ARAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FUTBESZAB] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CIRKUL] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ATKOTES] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HMVRENDS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CIRK_MOD] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FOELZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[FELOSZT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[UTEM] [varchar] (50) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HAJTOMU] (
	[ID] [int] NOT NULL ,
	[ATMERO] [real] NULL ,
	[BEALL_ERTEK] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[ARAMFELV] [real] NULL ,
	[FESZULTS] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HAZAK] (
	[KOD] [nvarchar] (9) COLLATE Hungarian_CI_AS NULL ,
	[UTCA] [nvarchar] (35) COLLATE Hungarian_CI_AS NULL ,
	[HAZSZAM] [nvarchar] (5) COLLATE Hungarian_CI_AS NULL ,
	[LEPCSO] [nvarchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[CIME] [nvarchar] (50) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HOCSERELO] (
	[ID] [int] NOT NULL ,
	[ELLENALL] [real] NULL ,
	[LEMSZAM] [int] NULL ,
	[MERET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MERETME] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[FUTOFEL] [real] NULL ,
	[DB] [int] NULL ,
	[HOHOR_KO] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[HOSSZ_NAGY] [real] NULL ,
	[HOSSZ_KICS] [real] NULL ,
	[FELUGY] [char] (1) COLLATE Hungarian_CI_AS NULL ,
	[FU_KOZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HOKOZPONT] (
	[ID] [int] NOT NULL ,
	[PRIM_ARAM] [real] NULL ,
	[HOLEP] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[FOGYMERHELY] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KISMEGSZAK] [real] NULL ,
	[LEKVILLTELJ] [real] NULL ,
	[PRIMELL] [real] NULL ,
	[FUT_LAKAS] [int] NULL ,
	[HMV_LAKAS] [int] NULL ,
	[FUT_KOZULET] [int] NULL ,
	[SZEKU_TOM] [real] NULL ,
	[NYOMAS_K] [real] NULL ,
	[HOMER_SZ] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HOOSSZEGZO] (
	[ID] [int] NOT NULL ,
	[LEOLVMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FESZULTS] [real] NULL ,
	[IMPULZUS] [real] NULL ,
	[PLOMBA] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[HELYZET] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[ELEKTRONIKA] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[JEGYZ] (
	[JEGYZSZ] [int] IDENTITY (1, 1) NOT NULL ,
	[KARB_ID] [int] NOT NULL ,
	[JTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[JDAT] [datetime] NOT NULL ,
	[VONEV] [datetime] NULL ,
	[NEV] [int] NULL ,
	[MSZAM] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[JOGOS] (
	[KEP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[JOGOK] [tinyint] NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL ,
	[ADATUM] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KAPCSOLAT] (
	[ID1] [int] NOT NULL ,
	[ID2] [int] NOT NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KAPCSTAB] (
	[OBJTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEGNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TIPUS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TELEPHSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[GYSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[HITIDO] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KARBAN] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[OBJID] [int] NULL ,
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[KARBTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[MUVEL] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[KDATUM] [datetime] NULL ,
	[MUVLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[MUN_SORSZ] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KARBTERV] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[OBJID] [int] NOT NULL ,
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[KARBTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[MUVEL] [varchar] (3) COLLATE Hungarian_CI_AS NOT NULL ,
	[IDOE] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[IDO] [int] NOT NULL ,
	[AKTIV] [int] NOT NULL ,
	[ROGZITVE] [datetime] NOT NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KAZAN] (
	[ID] [int] NOT NULL ,
	[UZEMINYOM] [real] NULL ,
	[HOHOR_KO] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[TERFARAM] [real] NULL ,
	[SZABMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KAZANEGO] (
	[ID] [int] NOT NULL ,
	[BEVTELJ] [real] NULL ,
	[SZABMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[GAZMIN] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[GAZMAX] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[EGMIN] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[POROLAJ_MIN] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[PORLEV_MIN] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[PORGOZ_MIN] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[GOZMAX] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[VIZMAX] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[VESZVIZ_MIN] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FUSTCSAP_RET] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[EGYEB_RET] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[KETPONTSZAB] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[HAROMPONTSZAB] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FOLYSZAB] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[EGYEB] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FUST_TOM] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KEPVIS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SZERNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZERCIM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[SZERIRSZ] [varchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[KOZNEV] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZCIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZIRSZ] [varchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[MEGJ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KEPV_TET] (
	[SZERZ_ID] [int] NOT NULL ,
	[KEPVIS_ID] [int] NOT NULL ,
	[PAZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[KEZDATUM] [datetime] NULL ,
	[BEFDATUM] [datetime] NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KODLEIR] (
	[UGYFAZ] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[KODAZ] [varchar] (3) COLLATE Hungarian_CI_AS NOT NULL ,
	[KODTIP] [varchar] (40) COLLATE Hungarian_CI_AS NULL ,
	[KODOSZT] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[MNEMNEV] [varchar] (16) COLLATE Hungarian_CI_AS NULL ,
	[SZINONIMA] [varchar] (30) COLLATE Hungarian_CI_AS NULL ,
	[TARTALOM] [text] COLLATE Hungarian_CI_AS NULL ,
	[ERVKOR] [tinyint] NULL ,
	[FUNKCIO] [tinyint] NULL ,
	[KODSZLEIR] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KODSZABRA] [image] NULL ,
	[KODKEPSZAB] [varchar] (65) COLLATE Hungarian_CI_AS NULL ,
	[KODHELY] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[FELHELY] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[FORMTIP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[TEMA] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[KODHOSSZ] [tinyint] NULL ,
	[REND] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[KITOLT] [datetime] NULL ,
	[KOD] [varchar] (15) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[KODSZOT] (
	[UGYFAZ] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[KODTIP] [varchar] (4) COLLATE Hungarian_CI_AS NOT NULL ,
	[KODERT] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL ,
	[KODENEV] [varchar] (70) COLLATE Hungarian_CI_AS NULL ,
	[KITOLT] [datetime] NULL ,
	[KOD] [varchar] (15) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KOLTSEGMEGOSZTO] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KOMPRESSZOR] (
	[ID] [int] NOT NULL ,
	[FORDSZ] [int] NULL ,
	[SZAL_KOZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[SZAL_MENNY] [real] NULL ,
	[VEGNYOM] [real] NULL ,
	[ARAMFELV] [real] NULL ,
	[FESZULTS] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KONTIR] (
	[FSZAM] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL ,
	[FSZNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KIJELOLT] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL ,
	[ADATUM] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LABOR] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TIPUS] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[SORSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MUN_SORSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MINTA_IDO] [datetime] NULL ,
	[MINTA_NEV] [int] NULL ,
	[MINTA_ATAD_IDO] [datetime] NULL ,
	[MINTA_ATVEVO] [int] NULL ,
	[VIZSG_NEV] [int] NULL ,
	[VIZSG_KEZD] [datetime] NULL ,
	[VIZSG_VEGE] [datetime] NULL ,
	[PH] [real] NULL ,
	[OXI] [real] NULL ,
	[ELEKTRO] [real] NULL ,
	[VAS] [real] NULL ,
	[KOI] [real] NULL ,
	[OK] [real] NULL ,
	[KULSO] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[AMMONIA] [real] NULL ,
	[NITRAT] [real] NULL ,
	[NITRIT] [real] NULL ,
	[ERTEKELES] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LAKAS] (
	[ID] [int] NOT NULL ,
	[FKOD] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[LEPCS] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[EM] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[AJTO] [varchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[AZON] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[LEPCSK] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[LAKASK] [varchar] (6) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LANGOR] (
	[ID] [int] NOT NULL ,
	[ARAMFELV] [real] NULL ,
	[FESZULTS] [real] NULL ,
	[VEZHOSSZ] [real] NULL ,
	[BENYHOSSZ] [real] NULL ,
	[NYOMATEK] [real] NULL ,
	[ERZEKENY] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LEPCSOHAZ] (
	[ID] [int] NOT NULL ,
	[NEV] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[CIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOD] [varchar] (15) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MELEGVIZ_TAROLO] (
	[ID] [int] NOT NULL ,
	[FELEP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[TERFOGAT] [real] NULL ,
	[KAPCSOLAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TOLTESMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MLAPTAB] (
	[ID] [int] NULL ,
	[SORSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KIALLDAT] [datetime] NULL ,
	[BEJDAT] [datetime] NULL ,
	[BEJNEV] [varchar] (40) COLLATE Hungarian_CI_AS NULL ,
	[UTCA] [varchar] (256) COLLATE Hungarian_CI_AS NULL ,
	[LAKAS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[FSZAM] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[TELEPHSZ] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[HIBLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[MUNELV] [datetime] NULL ,
	[IDOTOL] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[IDOIG] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[SZOLGJELL] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[MFDOLG] [varchar] (50) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MOTOR] (
	[ID] [int] NOT NULL ,
	[ARAMFELV] [real] NULL ,
	[FESZULTS] [real] NULL ,
	[VILLFORDSZ] [real] NULL ,
	[TELJT] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MUNKALAP] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[MTIP] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[BEJDAT] [datetime] NULL ,
	[BEJNEV] [varchar] (40) COLLATE Hungarian_CI_AS NULL ,
	[TIPUSH] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[HIBLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[SZEREGYS] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[MFDOLG] [int] NULL ,
	[MUNELV] [datetime] NULL ,
	[IDOTOL] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[IDOIG] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[SZOLGTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[MUNVEGZ] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[SZOLGJELL] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[OBJID] [int] NULL ,
	[KARBTIP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[MUVEL] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[FELTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FELLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[JELENSTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[JELENSLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[MUVLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[INTEZ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[VONEV] [datetime] NULL ,
	[SORSZ] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[NAPSZAM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KIALLDAT] [datetime] NULL ,
	[FSZAM] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[SZOLTIP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[MUNSZ] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[MKAP] [int] NULL ,
	[ALLAPOT] [int] NULL ,
	[MVDOLG] [int] NULL ,
	[MVDAT] [datetime] NULL ,
	[LAKAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[REF] [int] NULL ,
	[PLOMBAZAS] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[UJ] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[FELUJITOTT] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL ,
	[ADATUM] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OBJEKTUM] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[AZON] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[MEGNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TIPUS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[VAROS] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[UTCA] [varchar] (35) COLLATE Hungarian_CI_AS NULL ,
	[HSZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[ELHELYEZ] [varchar] (25) COLLATE Hungarian_CI_AS NULL ,
	[GYSZAM] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[GYARTO] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[UZALL] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[UZEMIDO] [datetime] NULL ,
	[HITIDO] [datetime] NULL ,
	[GYARTM] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[TELEPHSZ] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[VESZO] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[FKOD] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[ALAIR] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[NEVLTELJ] [real] NULL ,
	[NEVLTELJME] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[KATEG] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[FSZAM] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[TULAJDON] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[KAPCSOLT] [int] NOT NULL ,
	[ELOZOKAPCS] [int] NULL ,
	[ELOZOKAPCSDATE] [datetime] NULL ,
	[MEGJ] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[AKTIV] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PERMIS] (
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[AZON] [int] NULL ,
	[MEGJ] [int] NULL ,
	[MEGNEV] [int] NULL ,
	[VAROS] [int] NULL ,
	[UTCA] [int] NULL ,
	[HSZ] [int] NULL ,
	[GYARTM] [int] NULL ,
	[GYARTO] [int] NULL ,
	[TIPUS] [int] NULL ,
	[GYSZAM] [int] NULL ,
	[UZEMIDO] [int] NULL ,
	[TELEPHSZ] [int] NULL ,
	[HITIDO] [int] NULL ,
	[ELHELYEZ] [int] NULL ,
	[ALAIR] [int] NULL ,
	[NEVLTELJ] [int] NULL ,
	[NEVLTELJME] [int] NULL ,
	[KATEG] [int] NULL ,
	[VESZO] [int] NULL ,
	[UZALL] [int] NULL ,
	[FKOD] [int] NULL ,
	[FSZAM] [int] NULL ,
	[MKHOM] [int] NULL ,
	[FAGYVED] [int] NULL ,
	[FELEP] [int] NULL ,
	[BOYTIP] [int] NULL ,
	[SZELTIP] [int] NULL ,
	[LEVNYOM] [int] NULL ,
	[VIZNYOM] [int] NULL ,
	[SZURTIP] [int] NULL ,
	[ELLENALL] [int] NULL ,
	[LEMSZAM] [int] NULL ,
	[UZEMINYOM] [int] NULL ,
	[BEVTELJ] [int] NULL ,
	[FORDSZ] [int] NULL ,
	[EMEL_MAG] [int] NULL ,
	[SZAL_KOZ] [int] NULL ,
	[SZAL_MENNY] [int] NULL ,
	[SZIVFOK] [int] NULL ,
	[MERET] [int] NULL ,
	[MERETME] [int] NULL ,
	[FUTOFEL] [int] NULL ,
	[DB] [int] NULL ,
	[HOTELJ] [int] NULL ,
	[GAZCSUCS] [int] NULL ,
	[HOHOR_KO] [int] NULL ,
	[BEEPCSOVDB] [int] NULL ,
	[PRIM_ARAM] [int] NULL ,
	[NYITNYOM] [int] NULL ,
	[ZARNYOM] [int] NULL ,
	[HOSSZ_NAGY] [int] NULL ,
	[HOSSZ_KICS] [int] NULL ,
	[FELUGY] [int] NULL ,
	[HOLEP] [int] NULL ,
	[TERFOGAT] [int] NULL ,
	[TERFARAM] [int] NULL ,
	[LEGSZAL] [int] NULL ,
	[SZABMOD] [int] NULL ,
	[VEGNYOM] [int] NULL ,
	[ATMERO] [int] NULL ,
	[BEALL_ERTEK] [int] NULL ,
	[IMPULZUS] [int] NULL ,
	[HOSSZ] [int] NULL ,
	[TERHEL] [int] NULL ,
	[VIZSZ] [int] NULL ,
	[FU_KOZ] [int] NULL ,
	[OSZLSZAM] [int] NULL ,
	[BECSOV] [int] NULL ,
	[ARAMFELV] [int] NULL ,
	[FESZULTS] [int] NULL ,
	[VEZHOSSZ] [int] NULL ,
	[BENYHOSSZ] [int] NULL ,
	[NYOMATEK] [int] NULL ,
	[ERZEKENY] [int] NULL ,
	[MUKMOD] [int] NULL ,
	[KVS] [int] NULL ,
	[KIMARAM] [int] NULL ,
	[FOGYMERHELY] [int] NULL ,
	[KIMENET] [int] NULL ,
	[CSATLMERET] [int] NULL ,
	[MEDDTELJ] [int] NULL ,
	[KISMEGSZAK] [int] NULL ,
	[LEKVILLTELJ] [int] NULL ,
	[VILLCSUCSNY] [int] NULL ,
	[VILLCSUCST] [int] NULL ,
	[VILLFORDSZ] [int] NULL ,
	[TELJT] [int] NULL ,
	[FUR_ATM] [int] NULL ,
	[PRIMELL] [int] NULL ,
	[KAPCSOLAS] [int] NULL ,
	[TOLTESMOD] [int] NULL ,
	[FUTOTT] [int] NULL ,
	[SZABALYOZAS] [int] NULL ,
	[KUTFNYOM] [int] NULL ,
	[NYUGVIZSZ] [int] NULL ,
	[UZEMIVIZSZ] [int] NULL ,
	[CIRKTERFARAM] [int] NULL ,
	[HOMERS] [int] NULL ,
	[NYOMTARTTIP] [int] NULL ,
	[HMVHOMERS] [int] NULL ,
	[FUT_LAKAS] [int] NULL ,
	[HMV_LAKAS] [int] NULL ,
	[FUT_KOZULET] [int] NULL ,
	[HMV_KOZULET] [int] NULL ,
	[HOKOZP_SZAM] [int] NULL ,
	[SZEKU_TOM] [int] NULL ,
	[NYOMKUL] [int] NULL ,
	[TOMEGARAM] [int] NULL ,
	[NYOMAS_K] [int] NULL ,
	[HOMER_SZ] [int] NULL ,
	[GAZMIN] [int] NULL ,
	[GAZMAX] [int] NULL ,
	[EGMIN] [int] NULL ,
	[POROLAJ_MIN] [int] NULL ,
	[PORLEV_MIN] [int] NULL ,
	[PORGOZ_MIN] [int] NULL ,
	[GOZMAX] [int] NULL ,
	[VIZMAX] [int] NULL ,
	[VESZVIZ_MIN] [int] NULL ,
	[FUSTCSAP_RET] [int] NULL ,
	[EGYEB_RET] [int] NULL ,
	[KETPONTSZAB] [int] NULL ,
	[HAROMPONTSZAB] [int] NULL ,
	[FOLYSZAB] [int] NULL ,
	[EGYEB] [int] NULL ,
	[NEV] [int] NULL ,
	[MSZAM] [int] NULL ,
	[FUST_TOM] [int] NULL ,
	[AKTIV] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RAKTAR] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[OBJID] [int] NOT NULL ,
	[DATUMTOL] [datetime] NOT NULL ,
	[DATUMIG] [datetime] NULL ,
	[MEGJ] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[ALLAPOT] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[SZLEVEL_SZAM] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[SZLEVEL_DATUM] [datetime] NULL ,
	[DOLG_ID] [int] NULL ,
	[KEPVIS] [int] NULL ,
	[KULCS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KULCS_LAKTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[KULCS_MOBTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[KULCS_MUNTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RAKTHISTORY] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[OBJID] [int] NOT NULL ,
	[DATUMTOL] [datetime] NOT NULL ,
	[DATUMIG] [datetime] NOT NULL ,
	[MEGJ] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[ALLAPOT] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[SZLEVEL_SZAM] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[SZLEVEL_DATUM] [datetime] NULL ,
	[DOLG_ID] [int] NULL ,
	[TULAJDON] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RAKTKEPVIS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NEV] [varchar] (50) COLLATE Hungarian_CI_AS NOT NULL ,
	[CIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[LAK_TEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MOB_TEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MUN_TEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_LAK_TEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_MOB_TEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_MUN_TEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZABALYOZO_AUTOMATIKA] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZABALYOZO_SZELEP] (
	[ID] [int] NOT NULL ,
	[MERET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MERETME] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[ATMERO] [real] NULL ,
	[MUKMOD] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[KVS] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZERELVENY] (
	[ID] [int] NOT NULL ,
	[ATMERO] [real] NULL ,
	[BEALL_ERTEK] [varchar] (50) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZERZFEJ] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[PAZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[SZETIP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[SZEJEL] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[SZEKELT] [datetime] NULL ,
	[ERVDAT] [datetime] NULL ,
	[FIZMOD] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[SZERTAR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[SZOLG] [int] NULL ,
	[BEFDAT] [datetime] NULL ,
	[SZERSZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[SZLA_CIKL] [int] NULL ,
	[JEL] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[SZJ] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[UGYFN] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[UGYFC] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZERZTEL] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SZER_ID] [int] NOT NULL ,
	[SZERTET] [int] NOT NULL ,
	[OBJ_ID] [int] NULL ,
	[CIKK] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[CIKK_MENNY] [real] NULL ,
	[SZ_MENNY] [real] NULL ,
	[MENNY_ME] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[OSSZEG] [real] NULL ,
	[AFA] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZINTKAPCSOLO] (
	[ID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZIVATTYU] (
	[ID] [int] NOT NULL ,
	[FORDSZ] [int] NULL ,
	[EMEL_MAG] [real] NULL ,
	[SZAL_KOZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[SZAL_MENNY] [real] NULL ,
	[SZIVFOK] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZLA_ALT] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SZLASZ] [int] NOT NULL ,
	[SZERZSZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[FIZMOD] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[TDAT] [datetime] NOT NULL ,
	[KDAT] [datetime] NOT NULL ,
	[FDAT] [datetime] NOT NULL ,
	[JEL] [varchar] (1) COLLATE Hungarian_CI_AS NOT NULL ,
	[SZJ] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[SZERTAR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[UGYFN] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[PAZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[SZOLG] [int] NULL ,
	[KOZNEV] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZCIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZIRSZ] [varchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[SZERNEV] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[CIKLUS] [int] NULL ,
	[ZAROLT] [int] NOT NULL ,
	[EGYEDI] [int] NOT NULL ,
	[UGYFC] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[OSSZ_NETTO] [real] NULL ,
	[OSSZ_AFA] [real] NULL ,
	[OSSZ_BRUTTO] [real] NULL ,
	[OSSZ_TEXT] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZLA_ALT_TET] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SZLA_ID] [int] NOT NULL ,
	[TET_SORSZ] [int] NOT NULL ,
	[LEPCSOHAZ] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[CIKK] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[CIKK_MENNY] [real] NULL ,
	[SZ_MENNY] [real] NOT NULL ,
	[MENNY_ME] [varchar] (3) COLLATE Hungarian_CI_AS NOT NULL ,
	[NOTERT] [real] NOT NULL ,
	[OSSZEG] [real] NULL ,
	[AFA] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[AFAOSSZ] [real] NULL ,
	[BRUTTO] [real] NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SZUROK] (
	[ID] [int] NOT NULL ,
	[SZURTIP] [varchar] (2) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB403] (
	[FUTOMU_ID] [int] NULL ,
	[NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[C62317] [int] NULL ,
	[C62318] [int] NULL ,
	[C62319] [int] NULL ,
	[C62323] [int] NULL ,
	[C62325] [int] NULL ,
	[C722] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB403_1] (
	[FSZAM] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[FSZNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MUNORA] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB404] (
	[FUTOMU_ID] [int] NULL ,
	[NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[E] [int] NULL ,
	[F] [int] NULL ,
	[G] [int] NULL ,
	[L] [int] NULL ,
	[V] [int] NULL ,
	[SZUM] [int] NULL ,
	[c736] [int] NULL ,
	[c737] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB406] (
	[DOLGID] [int] NULL ,
	[NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[EL] [int] NULL ,
	[FO] [int] NULL ,
	[GB] [int] NULL ,
	[GT] [int] NULL ,
	[LA] [int] NULL ,
	[LE] [int] NULL ,
	[LF] [int] NULL ,
	[VE] [int] NULL ,
	[SZUM] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB407] (
	[FUTOMU_ID] [int] NULL ,
	[NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CIM] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[ORA] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB408] (
	[SZOLGJELL_ID] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[SZOLGJELL] [varchar] (70) COLLATE Hungarian_CI_AS NULL ,
	[MUNKALAP_ID] [int] NULL ,
	[DATUM] [datetime] NULL ,
	[HIBLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[MUNORA] [int] NULL ,
	[DOLG] [varchar] (20) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB413] (
	[KOZNEV] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KOZCIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[PAZ] [varchar] (8) COLLATE Hungarian_CI_AS NULL ,
	[SZLASZAM] [int] NULL ,
	[MENNY] [real] NULL ,
	[NOTERT] [real] NULL ,
	[OSSZEG] [real] NULL ,
	[AFAERT] [real] NULL ,
	[BRUTTO] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_LABORO] (
	[SOR] [int] NULL ,
	[DATUM] [datetime] NULL ,
	[MUN] [int] NULL ,
	[SORSZ] [int] NULL ,
	[P] [real] NULL ,
	[OX] [real] NULL ,
	[E] [real] NULL ,
	[V] [real] NULL ,
	[K] [real] NULL ,
	[O] [real] NULL ,
	[A] [real] NULL ,
	[N] [real] NULL ,
	[I] [real] NULL ,
	[KU] [varchar] (255) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_PLOMB] (
	[SORSZ] [int] NULL ,
	[DATUM] [datetime] NULL ,
	[BEJNEV] [varchar] (40) COLLATE Hungarian_CI_AS NULL ,
	[CIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[MEGJ] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[PLOMBAZAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_R01] (
	[OBJTIP] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[GYSZAM] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[TIPUS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[HITIDO] [datetime] NULL ,
	[ALLAPOT] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[DATUMTOL] [datetime] NULL ,
	[MEGJ] [varchar] (255) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_R03] (
	[OBJTIP] [varchar] (2) COLLATE Hungarian_CI_AS NOT NULL ,
	[OBJID] [int] NOT NULL ,
	[GYSZAM] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[TIPUS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[HITIDO] [varchar] (4) COLLATE Hungarian_CI_AS NULL ,
	[TERULET] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[CIM] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEGJ] [varchar] (255) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NOT NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_R04] (
	[FUTOMU] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[EPULET] [varchar] (30) COLLATE Hungarian_CI_AS NULL ,
	[KEPVIS] [int] NULL ,
	[KEPVIS_NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[KEPVIS_CIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[KEPVIS_LAKTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[KEPVIS_MOBTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[KEPVIS_MUNTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_NEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_LAKTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_MOBTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[MEGB_MUNTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[H_ID] [int] NULL ,
	[H_GYSZAM] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[H_HITIDO] [datetime] NULL ,
	[H_TIPUS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[H_ELHELYEZ] [varchar] (25) COLLATE Hungarian_CI_AS NULL ,
	[H_IMPULZUS] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[H_LEOLV] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[H_HELYZET] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[H_ELEKTRONIKA] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[H_PLOMBA] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[H_KULCS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[H_KULCS_LAKTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[H_KULCS_MOBTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[H_KULCS_MUNTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[H_TULAJDON] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[H_MEGJ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[V_ID] [int] NULL ,
	[V_GYSZAM] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[V_HITIDO] [datetime] NULL ,
	[V_TIPUS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[V_ELHELYEZ] [varchar] (25) COLLATE Hungarian_CI_AS NULL ,
	[V_IMPULZUS] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[V_ATMERO] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[V_TOMEGARAM] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[V_PLOMBA] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[V_KULCS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[V_KULCS_LAKTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[V_KULCS_MOBTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[V_KULCS_MUNTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[V_TULAJDON] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[V_MEGJ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[E_ID] [int] NULL ,
	[E_GYSZAM] [varchar] (15) COLLATE Hungarian_CI_AS NULL ,
	[E_HITIDO] [datetime] NULL ,
	[E_TIPUS] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[E_ELHELYEZ] [varchar] (25) COLLATE Hungarian_CI_AS NULL ,
	[E_BENYHOSSZ] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[E_VEZHOSSZ] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[E_PLOMBA] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[E_PLOMBA2] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[E_SZUKSHOSSZ] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[E_KULCS] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[E_KULCS_LAKTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[E_KULCS_MOBTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[E_KULCS_MUNTEL] [varchar] (20) COLLATE Hungarian_CI_AS NULL ,
	[E_TULAJDON] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[E_MEGJ] [varchar] (1024) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_VIZORA] (
	[SORSZ] [int] NULL ,
	[DATUM] [datetime] NULL ,
	[BEJNEV] [varchar] (40) COLLATE Hungarian_CI_AS NULL ,
	[CIM] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[MEGJ] [varchar] (100) COLLATE Hungarian_CI_AS NULL ,
	[UJ] [varchar] (10) COLLATE Hungarian_CI_AS NULL ,
	[FELUJITOTT] [varchar] (10) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAB_kint] (
	[MUN_SORSZ] [int] NULL ,
	[KIALLDAT] [datetime] NULL ,
	[MUVLEIR] [varchar] (1024) COLLATE Hungarian_CI_AS NULL ,
	[MEGNEV] [varchar] (50) COLLATE Hungarian_CI_AS NULL ,
	[TELEPHSZ] [varchar] (20) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TARCSA] (
	[ID] [int] NOT NULL ,
	[ATMERO] [real] NULL ,
	[FUR_ATM] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TARTALY] (
	[ID] [int] NOT NULL ,
	[FELEP] [varchar] (1) COLLATE Hungarian_CI_AS NULL ,
	[LEVNYOM] [real] NULL ,
	[VIZNYOM] [real] NULL ,
	[TERFOGAT] [real] NULL ,
	[FUTOTT] [char] (1) COLLATE Hungarian_CI_AS NULL ,
	[SZABALYOZAS] [varchar] (50) COLLATE Hungarian_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TELJM] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[MUNKALAP_ID] [int] NOT NULL ,
	[DOLG_ID] [int] NOT NULL ,
	[MUNORA] [real] NULL ,
	[MUNDAT] [datetime] NULL ,
	[AKOD] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[ADATUM] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TERMALKUT] (
	[ID] [int] NOT NULL ,
	[SZAL_MENNY] [real] NULL ,
	[KUTFNYOM] [real] NULL ,
	[NYUGVIZSZ] [real] NULL ,
	[UZEMIVIZSZ] [real] NULL ,
	[HOMERS] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TERMELO_CSO] (
	[ID] [int] NOT NULL ,
	[BEEPCSOVDB] [int] NULL ,
	[ATMERO] [real] NULL ,
	[HOSSZ] [real] NULL ,
	[VIZSZ] [real] NULL ,
	[BECSOV] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[VENTILLATOR] (
	[ID] [int] NOT NULL ,
	[FAGYVED] [char] (1) COLLATE Hungarian_CI_AS NULL ,
	[FORDSZ] [int] NULL ,
	[LEGSZAL] [real] NULL ,
	[FU_KOZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[ARAMFELV] [real] NULL ,
	[FESZULTS] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[VIZLAGYITO] (
	[ID] [int] NOT NULL ,
	[SZABMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[OSZLSZAM] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[VIZORA] (
	[ID] [int] NOT NULL ,
	[LEOLVMOD] [varchar] (2) COLLATE Hungarian_CI_AS NULL ,
	[SZAL_KOZ] [varchar] (3) COLLATE Hungarian_CI_AS NULL ,
	[SZAL_MENNY] [real] NULL ,
	[ATMERO] [real] NULL ,
	[IMPULZUS] [real] NULL ,
	[PLOMBA] [varchar] (12) COLLATE Hungarian_CI_AS NULL ,
	[TOMEGARAM] [real] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ARAMKOR] WITH NOCHECK ADD 
	CONSTRAINT [PK_ARAMKOR] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BIZTONSAGI_SZELEP] WITH NOCHECK ADD 
	CONSTRAINT [PK_BIZTONSAGI_SZELEP] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EPULET] WITH NOCHECK ADD 
	CONSTRAINT [PK_EPULET] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FUTOMU] WITH NOCHECK ADD 
	CONSTRAINT [PK_FUTOMU] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[KAPCSOLAT] WITH NOCHECK ADD 
	CONSTRAINT [PK_KAPCSOLAT] PRIMARY KEY  CLUSTERED 
	(
		[ID1],
		[ID2]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[KODSZOT] WITH NOCHECK ADD 
	CONSTRAINT [PK_KODSZOT] PRIMARY KEY  CLUSTERED 
	(
		[KODTIP],
		[KODERT]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LAKAS] WITH NOCHECK ADD 
	CONSTRAINT [PK_LAKAS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[OBJEKTUM] WITH NOCHECK ADD 
	CONSTRAINT [PK_OBJEKTUM] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TELJM] WITH NOCHECK ADD 
	CONSTRAINT [PK_TELJM] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

 CREATE  CLUSTERED  INDEX [IX_MUNKALAP_FILL] ON [dbo].[MUNKALAP]([ID], [SZOLGJELL], [KIALLDAT]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ARVALT] ADD 
	CONSTRAINT [DF_ARVALT_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_ARVALT_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[BERRAKTAR] ADD 
	CONSTRAINT [DF_BERRAKTAR_BEKERUL_DAT] DEFAULT (getdate()) FOR [BEKERUL_DAT],
	CONSTRAINT [DF_BERRAKTAR_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_BERRAKTAR_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[BOYLER] ADD 
	CONSTRAINT [PK_BOYLER] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DEMAG_EMELOGEP] ADD 
	CONSTRAINT [PK_DEMAG_EMELOGEP] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DOLGOZO] ADD 
	CONSTRAINT [DF_DOLGOZO_IRASJOG] DEFAULT ('n') FOR [UFR],
	CONSTRAINT [DF_DOLGOZO_UFW] DEFAULT ('n') FOR [UFW],
	CONSTRAINT [DF_DOLGOZO_UER] DEFAULT ('n') FOR [UER],
	CONSTRAINT [DF_DOLGOZO_UEW] DEFAULT ('n') FOR [UEW],
	CONSTRAINT [DF_DOLGOZO_AKOD] DEFAULT (user_name()) FOR [AKOD],
	CONSTRAINT [DF_DOLGOZO_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [PK_DOLGOZO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ERZEKELO] ADD 
	CONSTRAINT [PK_ERZEKELO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FAZISJAVITO_KONDENZATOR] ADD 
	CONSTRAINT [PK_FAZISJAVITO_KONDENZATOR] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FOKAPCSOLO] ADD 
	CONSTRAINT [PK_FOKAPCSOLO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FREKVENCIAVALTO] ADD 
	CONSTRAINT [PK_FREKVENCIAVALTO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GAZNYOMAS_MERO] ADD 
	CONSTRAINT [PK_GAZNYOMAS_MERO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GAZNYOMAS_SZABALYOZO] ADD 
	CONSTRAINT [PK_GAZNYOMAS_SZABALYOZO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GAZVESZELY_JELZO] ADD 
	CONSTRAINT [PK_GAZVESZELY_JELZO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HAJTOMU] ADD 
	CONSTRAINT [PK_HAJTOMU] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HOCSERELO] ADD 
	CONSTRAINT [PK_HOCSERELO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HOKOZPONT] ADD 
	CONSTRAINT [PK_HOKOZPONT] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HOOSSZEGZO] ADD 
	CONSTRAINT [PK_HOOSSZEGZO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[JEGYZ] ADD 
	CONSTRAINT [DF_JEGYZ_ADATUM_1] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_JEGYZ_AKOD_1] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[JOGOS] ADD 
	CONSTRAINT [DF_JOGOS_AKOD] DEFAULT (user_name()) FOR [AKOD],
	CONSTRAINT [DF_JOGOS_ADATUM] DEFAULT (getdate()) FOR [ADATUM]
GO

ALTER TABLE [dbo].[KAPCSOLAT] ADD 
	CONSTRAINT [DF_KAPCSOLAT_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_KAPCSOLAT_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

 CREATE  INDEX [IX_KAPCSOLAT_1] ON [dbo].[KAPCSOLAT]([ID1]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_KAPCSOLAT_2] ON [dbo].[KAPCSOLAT]([ID2]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KARBAN] ADD 
	CONSTRAINT [DF_KARBAN_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_KARBAN_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[KARBTERV] ADD 
	CONSTRAINT [DF_KARBTERV_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_KARBTERV_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[KAZAN] ADD 
	CONSTRAINT [PK_KAZAN] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[KEPVIS] ADD 
	CONSTRAINT [DF_KEPVIS_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_KEPVIS_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[KEPV_TET] ADD 
	CONSTRAINT [DF_KEPV_TET_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_KEPV_TET_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[KODLEIR] ADD 
	CONSTRAINT [PK_KODLEIR] PRIMARY KEY  NONCLUSTERED 
	(
		[UGYFAZ],
		[KODAZ]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[KOLTSEGMEGOSZTO] ADD 
	CONSTRAINT [PK_KOLTSEGMEGOSZTO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[KOMPRESSZOR] ADD 
	CONSTRAINT [PK_KOMPRESSZOR] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[KONTIR] ADD 
	CONSTRAINT [DF_KONTIR_AKOD] DEFAULT (user_name()) FOR [AKOD],
	CONSTRAINT [DF_KONTIR_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [PK_KONTIR] PRIMARY KEY  NONCLUSTERED 
	(
		[FSZAM]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LABOR] ADD 
	CONSTRAINT [DF_LABOR_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_LABOR_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[LANGOR] ADD 
	CONSTRAINT [PK_LANGOR] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LEPCSOHAZ] ADD 
	CONSTRAINT [PK_LEPCSOHAZ] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MELEGVIZ_TAROLO] ADD 
	CONSTRAINT [PK_MELEGVIZ_TAROLO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MOTOR] ADD 
	CONSTRAINT [PK_MOTOR] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MUNKALAP] ADD 
	CONSTRAINT [DF_MUNKALAP_REF] DEFAULT (null) FOR [REF],
	CONSTRAINT [DF_MUNKALAP_AKOD] DEFAULT (user_name()) FOR [AKOD],
	CONSTRAINT [DF_MUNKALAP_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [PK_MUNKALAP] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_MUNKALAP] ON [dbo].[MUNKALAP]([MTIP]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OBJEKTUM] ADD 
	CONSTRAINT [DF_OBJEKTUM_TULAJDON] DEFAULT ('S') FOR [TULAJDON],
	CONSTRAINT [DF_OBJEKTUM_AKTIV] DEFAULT (1) FOR [AKTIV],
	CONSTRAINT [DF_OBJEKTUM_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_OBJEKTUM_AKOD] DEFAULT (user_name()) FOR [AKOD],
	CONSTRAINT [IX_OBJEKTUM] UNIQUE  NONCLUSTERED 
	(
		[OBJTIP],
		[ID]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_OBJEKTUM_1] ON [dbo].[OBJEKTUM]([KAPCSOLT], [MEGNEV], [TIPUS], [TELEPHSZ], [GYSZAM]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PERMIS] ADD 
	CONSTRAINT [PK_PERMIS] PRIMARY KEY  NONCLUSTERED 
	(
		[OBJTIP]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RAKTAR] ADD 
	CONSTRAINT [DF_RAKTAR_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_RAKTAR_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

 CREATE  UNIQUE  INDEX [fk_lekerd] ON [dbo].[RAKTAR]([OBJID], [OBJTIP], [ALLAPOT], [DOLG_ID], [SZLEVEL_SZAM], [SZLEVEL_DATUM], [DATUMIG]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RAKTHISTORY] ADD 
	CONSTRAINT [DF_RAKTHISTORY_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_RAKTHISTORY_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[RAKTKEPVIS] ADD 
	CONSTRAINT [DF_RAKTKEPVIS_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_RAKTKEPVIS_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[SZABALYOZO_AUTOMATIKA] ADD 
	CONSTRAINT [PK_SZABALYOZO_AUTOMATIKA] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SZABALYOZO_SZELEP] ADD 
	CONSTRAINT [PK_SZABALYOZO_SZELEP] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SZERELVENY] ADD 
	CONSTRAINT [PK_SZERELVENY] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SZERZFEJ] ADD 
	CONSTRAINT [DF_SZERZFEJ_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_SZERZFEJ_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[SZERZTEL] ADD 
	CONSTRAINT [DF_SZERZTEL_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_SZERZTEL_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[SZINTKAPCSOLO] ADD 
	CONSTRAINT [PK_SZINTKAPCSOLO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SZIVATTYU] ADD 
	CONSTRAINT [PK_SZIVATTYU] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SZLA_ALT] ADD 
	CONSTRAINT [DF_SZLA_ALT_ZAROLT] DEFAULT (0) FOR [ZAROLT],
	CONSTRAINT [DF_SZLA_ALT_EGYEDI] DEFAULT (0) FOR [EGYEDI],
	CONSTRAINT [DF_SZLA_ALT_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_SZLA_ALT_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[SZLA_ALT_TET] ADD 
	CONSTRAINT [DF_SZLA_ALT_TET_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_SZLA_ALT_TET_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[SZUROK] ADD 
	CONSTRAINT [PK_SZUROK] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TAB403] ADD 
	CONSTRAINT [DF_TAB403_C62317] DEFAULT (0) FOR [C62317],
	CONSTRAINT [DF_TAB403_C62318] DEFAULT (0) FOR [C62318],
	CONSTRAINT [DF_TAB403_C62319] DEFAULT (0) FOR [C62319],
	CONSTRAINT [DF_TAB403_C62323] DEFAULT (0) FOR [C62323],
	CONSTRAINT [DF_TAB403_C62325] DEFAULT (0) FOR [C62325],
	CONSTRAINT [DF_TAB403_C722] DEFAULT (0) FOR [C722]
GO

ALTER TABLE [dbo].[TAB403_1] ADD 
	CONSTRAINT [DF_TAB403_1_MUNORA] DEFAULT (0) FOR [MUNORA]
GO

ALTER TABLE [dbo].[TAB404] ADD 
	CONSTRAINT [DF_TAB404_E] DEFAULT (0) FOR [E],
	CONSTRAINT [DF_TAB404_F] DEFAULT (0) FOR [F],
	CONSTRAINT [DF_TAB404_G] DEFAULT (0) FOR [G],
	CONSTRAINT [DF_TAB404_L] DEFAULT (0) FOR [L],
	CONSTRAINT [DF_TAB404_V] DEFAULT (0) FOR [V],
	CONSTRAINT [DF_TAB404_SZUM] DEFAULT (0) FOR [SZUM],
	CONSTRAINT [DF_TAB404_c736] DEFAULT (0) FOR [c736],
	CONSTRAINT [DF_TAB404_c737] DEFAULT (0) FOR [c737]
GO

ALTER TABLE [dbo].[TAB406] ADD 
	CONSTRAINT [DF_TAB406_E] DEFAULT (0) FOR [EL],
	CONSTRAINT [DF_TAB406_F] DEFAULT (0) FOR [FO],
	CONSTRAINT [DF_TAB406_GB] DEFAULT (0) FOR [GB],
	CONSTRAINT [DF_TAB406_GT] DEFAULT (0) FOR [GT],
	CONSTRAINT [DF_TAB406_L] DEFAULT (0) FOR [LA],
	CONSTRAINT [DF_TAB406_LE] DEFAULT (0) FOR [LE],
	CONSTRAINT [DF_TAB406_LF] DEFAULT (0) FOR [LF],
	CONSTRAINT [DF_TAB406_V] DEFAULT (0) FOR [VE],
	CONSTRAINT [DF_TAB406_SZUM] DEFAULT (0) FOR [SZUM]
GO

ALTER TABLE [dbo].[TAB407] ADD 
	CONSTRAINT [DF_TAB407_CIM] DEFAULT (null) FOR [CIM],
	CONSTRAINT [DF_TAB407_ORA] DEFAULT (0) FOR [ORA]
GO

ALTER TABLE [dbo].[TAB408] ADD 
	CONSTRAINT [DF_TAB408_SZOLGJELL_ID] DEFAULT ('-') FOR [SZOLGJELL_ID],
	CONSTRAINT [DF_TAB408_SZOLGJELL] DEFAULT ('-') FOR [SZOLGJELL],
	CONSTRAINT [DF_TAB408_MUNKALAP_ID] DEFAULT (0) FOR [MUNKALAP_ID],
	CONSTRAINT [DF_TAB408_HIBLEIR] DEFAULT ('-') FOR [HIBLEIR],
	CONSTRAINT [DF_TAB408_MUNORA] DEFAULT (0) FOR [MUNORA],
	CONSTRAINT [DF_TAB408_MKAP] DEFAULT ('-') FOR [DOLG]
GO

ALTER TABLE [dbo].[TAB_R01] ADD 
	CONSTRAINT [DF_TAB_R01_OBJTIP] DEFAULT ('?') FOR [OBJTIP],
	CONSTRAINT [DF_TAB_R01_GYSZAM] DEFAULT ('-') FOR [GYSZAM],
	CONSTRAINT [DF_TAB_R01_TIPUS] DEFAULT ('-') FOR [TIPUS],
	CONSTRAINT [DF_TAB_R01_ALLAPOT] DEFAULT ('?') FOR [ALLAPOT],
	CONSTRAINT [DF_TAB_R01_MEGJ] DEFAULT ('-') FOR [MEGJ]
GO

ALTER TABLE [dbo].[TAB_R03] ADD 
	CONSTRAINT [DF_TAB_R03_GYSZAM] DEFAULT ('-') FOR [GYSZAM],
	CONSTRAINT [DF_TAB_R03_TIPUS] DEFAULT ('-') FOR [TIPUS],
	CONSTRAINT [DF_TAB_R03_HITIDO] DEFAULT ('-') FOR [HITIDO],
	CONSTRAINT [DF_TAB_R03_TERULET] DEFAULT ('-') FOR [TERULET],
	CONSTRAINT [DF_TAB_R03_CIM] DEFAULT ('-') FOR [CIM],
	CONSTRAINT [DF_TAB_R03_ADATUM] DEFAULT (getdate()) FOR [ADATUM],
	CONSTRAINT [DF_TAB_R03_AKOD] DEFAULT (user_name()) FOR [AKOD]
GO

ALTER TABLE [dbo].[TARCSA] ADD 
	CONSTRAINT [PK_TARCSA] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TARTALY] ADD 
	CONSTRAINT [PK_TARTALY] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TELJM] ADD 
	CONSTRAINT [DF_TELJM_AKOD] DEFAULT (user_name()) FOR [AKOD],
	CONSTRAINT [DF_TELJM_ADATUM] DEFAULT (getdate()) FOR [ADATUM]
GO

ALTER TABLE [dbo].[TERMALKUT] ADD 
	CONSTRAINT [PK_TERMALKUT] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TERMELO_CSO] ADD 
	CONSTRAINT [PK_TERMELO_CSO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VENTILLATOR] ADD 
	CONSTRAINT [PK_VENTILLATOR] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VIZLAGYITO] ADD 
	CONSTRAINT [PK_VIZLAGYITO] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ARAMKOR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ARVALT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[BERRAKTAR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[BIZTONSAGI_SZELEP]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[BOYLER]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[DEMAG_EMELOGEP]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[DOLGOZO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[EPULET]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ERZEKELO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[FAZISJAVITO_KONDENZATOR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[FOGYT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[FOKAPCSOLO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[FREKVENCIAVALTO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[FUTOMU]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[GAZNYOMAS_MERO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[GAZNYOMAS_SZABALYOZO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[GAZVESZELY_JELZO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[GRID_FEJLEC]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[HAJTOMU]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[HAZAK]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[HOCSERELO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[HOKOZPONT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[HOOSSZEGZO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[JEGYZ]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[JOGOS]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KAPCSOLAT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KAPCSTAB]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KARBAN]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KARBTERV]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KAZAN]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KAZANEGO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KEPVIS]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KEPV_TET]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KODLEIR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KODSZOT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KOLTSEGMEGOSZTO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KOMPRESSZOR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[KONTIR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[LAKAS]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[LANGOR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[LEPCSOHAZ]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MELEGVIZ_TAROLO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MLAPTAB]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MOTOR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MUNKALAP]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[OBJEKTUM]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[PERMIS]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[RAKTAR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[RAKTKEPVIS]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZABALYOZO_AUTOMATIKA]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZABALYOZO_SZELEP]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZERELVENY]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZERZFEJ]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZERZTEL]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZINTKAPCSOLO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZIVATTYU]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZLA_ALT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZLA_ALT_TET]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SZUROK]  TO [public]
GO

GRANT  SELECT ,  DELETE  ON [dbo].[TAB403]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB403_1]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB404]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB406]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB407]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB408]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB413]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TAB_LABORO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TAB_PLOMB]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB_R01]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB_R03]  TO [public]
GO

GRANT  SELECT  ON [dbo].[TAB_R04]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TAB_VIZORA]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TAB_kint]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TARCSA]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TARTALY]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TELJM]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TERMALKUT]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TERMELO_CSO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[VENTILLATOR]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[VIZLAGYITO]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[VIZORA]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  View dbo.Q271    Script Date: 2000. 07. 04. 18:55:51 ******/

CREATE VIEW dbo.Q271
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '271'
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q271]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q272    Script Date: 2000. 07. 04. 18:55:51 ******/









CREATE VIEW dbo.Q272
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '272'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q272]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q274    Script Date: 2000. 07. 04. 18:55:51 ******/









CREATE VIEW dbo.Q274
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '274'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q274]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q275    Script Date: 2000. 07. 04. 18:55:52 ******/









CREATE VIEW dbo.Q275
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '275'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q275]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q276    Script Date: 2000. 07. 04. 18:55:53 ******/









CREATE VIEW dbo.Q276
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '276'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q276]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q277    Script Date: 2000. 07. 04. 18:55:53 ******/









CREATE VIEW dbo.Q277
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '277'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q277]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q278    Script Date: 2000. 07. 04. 18:55:54 ******/









CREATE VIEW dbo.Q278
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '278'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q278]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q279    Script Date: 2000. 07. 04. 18:55:54 ******/









CREATE VIEW dbo.Q279
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '279'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q279]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q281    Script Date: 2000. 07. 04. 18:55:54 ******/









CREATE VIEW dbo.Q281
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '281'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q281]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q282    Script Date: 2000. 07. 04. 18:55:55 ******/









CREATE VIEW dbo.Q282
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '282'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q282]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q283    Script Date: 2000. 07. 04. 18:55:55 ******/









CREATE VIEW dbo.Q283
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '283'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q283]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q284    Script Date: 2000. 07. 04. 18:55:56 ******/









CREATE VIEW dbo.Q284
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '284'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q284]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q285    Script Date: 2000. 07. 04. 18:55:56 ******/









CREATE VIEW dbo.Q285
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '285'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q285]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q288    Script Date: 2000. 07. 04. 18:55:57 ******/









CREATE VIEW dbo.Q288
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '288'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q288]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q289    Script Date: 2000. 07. 04. 18:55:57 ******/









CREATE VIEW dbo.Q289
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '289'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q289]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q291    Script Date: 2000. 07. 04. 18:55:57 ******/







CREATE VIEW dbo.Q291
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '291'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q291]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q293    Script Date: 2000. 07. 04. 18:55:58 ******/







CREATE VIEW dbo.Q293
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '293'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q293]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q296    Script Date: 2000. 07. 04. 18:55:58 ******/







CREATE VIEW dbo.Q296
AS
SELECT
	KODERT,
	KODENEV AS KODENEV
FROM
	KODSZOT
WHERE
	UGYFAZ = '05'
	AND KODTIP = '296'
	/*AND KODERT <> '01'*/




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q296]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q297    Script Date: 2000. 07. 04. 18:55:58 ******/









CREATE VIEW dbo.Q297
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '297'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q297]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q298    Script Date: 2000. 07. 04. 18:55:58 ******/







CREATE VIEW dbo.Q298
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '298'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q298]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q299    Script Date: 2000. 07. 04. 18:55:58 ******/

CREATE VIEW dbo.Q299
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '299')









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q299]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q300    Script Date: 2000. 07. 04. 18:55:58 ******/







CREATE VIEW dbo.Q300
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '300'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q300]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q302    Script Date: 2000. 07. 04. 18:55:58 ******/
CREATE VIEW dbo.Q302
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '302')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q302]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q304    Script Date: 2000. 07. 04. 18:55:58 ******/







CREATE VIEW dbo.Q304
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '304'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q304]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q305    Script Date: 2000. 07. 04. 18:55:58 ******/







CREATE VIEW dbo.Q305
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '305'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q305]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q306    Script Date: 2000. 07. 04. 18:55:59 ******/







CREATE VIEW dbo.Q306
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '306'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q306]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q307    Script Date: 2000. 07. 04. 18:55:59 ******/







CREATE VIEW dbo.Q307
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '307'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q307]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q308    Script Date: 2000. 07. 04. 18:55:59 ******/







CREATE VIEW dbo.Q308
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '308'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q308]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q309    Script Date: 2000. 07. 04. 18:55:59 ******/







CREATE VIEW dbo.Q309
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '309'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q309]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q310    Script Date: 2000. 07. 04. 18:55:59 ******/





CREATE VIEW dbo.Q310
AS
SELECT FSZAM, FSZNEV
FROM KONTIR













GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q310]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q310A
AS
SELECT FSZAM, FSZNEV
FROM KONTIR
WHERE KIJELOLT = 'y'





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q310A]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.Q310D
AS
SELECT FSZAM, FSZNEV
FROM KONTIR
WHERE (FSZAM = '736') OR
    (FSZAM = '737') OR
    (FSZAM = '62317') OR
    (FSZAM = '62325')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q310D]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q311    Script Date: 2000. 07. 04. 18:55:59 ******/







CREATE VIEW dbo.Q311
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '311'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q311]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q312    Script Date: 2000. 07. 04. 18:55:59 ******/









CREATE VIEW dbo.Q312
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '312'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q312]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q313    Script Date: 2000. 07. 04. 18:55:59 ******/









CREATE VIEW dbo.Q313
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '313'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q313]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q314    Script Date: 2000. 07. 04. 18:55:59 ******/









CREATE VIEW dbo.Q314
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '314'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q314]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q315    Script Date: 2000. 07. 04. 18:55:59 ******/









CREATE VIEW dbo.Q315
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '315'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q315]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q316    Script Date: 2000. 07. 04. 18:56:00 ******/









CREATE VIEW dbo.Q316
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '316'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q316]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q317    Script Date: 2000. 07. 04. 18:56:00 ******/









CREATE VIEW dbo.Q317
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '317'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q317]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q318    Script Date: 2000. 07. 04. 18:56:01 ******/









CREATE VIEW dbo.Q318
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '318'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q318]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q319    Script Date: 2000. 07. 04. 18:56:01 ******/









CREATE VIEW dbo.Q319
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '319'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q319]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q320    Script Date: 2000. 07. 04. 18:56:02 ******/









CREATE VIEW dbo.Q320
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '320'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q320]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q321    Script Date: 2000. 07. 04. 18:56:02 ******/









CREATE VIEW dbo.Q321
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '331'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q321]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q322    Script Date: 2000. 07. 04. 18:56:03 ******/









CREATE VIEW dbo.Q322
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '322'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q322]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q323    Script Date: 2000. 07. 04. 18:56:03 ******/









CREATE VIEW dbo.Q323
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '323'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q323]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q324    Script Date: 2000. 07. 04. 18:56:04 ******/









CREATE VIEW dbo.Q324
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '324'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q324]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q325    Script Date: 2000. 07. 04. 18:56:04 ******/









CREATE VIEW dbo.Q325
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '325'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q325]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q326    Script Date: 2000. 07. 04. 18:56:05 ******/









CREATE VIEW dbo.Q326
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '326'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q326]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q327    Script Date: 2000. 07. 04. 18:56:05 ******/









CREATE VIEW dbo.Q327
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '327'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q327]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q328    Script Date: 2000. 07. 04. 18:56:06 ******/









CREATE VIEW dbo.Q328
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '328'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q328]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q329    Script Date: 2000. 07. 04. 18:56:06 ******/









CREATE VIEW dbo.Q329
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '329'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q329]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q330    Script Date: 2000. 07. 04. 18:56:07 ******/









CREATE VIEW dbo.Q330
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '330'

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q330]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q331    Script Date: 2000. 07. 04. 18:56:07 ******/







CREATE VIEW dbo.Q331
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '331'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q331]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q332    Script Date: 2000. 07. 04. 18:56:08 ******/







CREATE VIEW dbo.Q332
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '332'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q332]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q333    Script Date: 2000. 07. 04. 18:56:08 ******/







CREATE VIEW dbo.Q333
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '333'















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q333]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q334    Script Date: 2000. 07. 04. 18:56:09 ******/







CREATE VIEW dbo.Q334
AS
SELECT ID, NEV
FROM DOLGOZO

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q334]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q335    Script Date: 2000. 07. 04. 18:56:09 ******/





CREATE VIEW dbo.Q335
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE UGYFAZ = '05' AND KODTIP = '335'













GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q335]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q336    Script Date: 2000. 07. 04. 18:56:09 ******/





CREATE VIEW dbo.Q336
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '336')













GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q336]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q337    Script Date: 2000. 07. 04. 18:56:09 ******/

CREATE VIEW dbo.Q337
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '337')









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q337]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q338    Script Date: 2000. 07. 04. 18:56:09 ******/
CREATE VIEW dbo.Q338
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '338')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q338]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q339    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE VIEW dbo.Q339
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '339')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q339]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q340    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE VIEW dbo.Q340
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '340')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q340]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q341    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE VIEW dbo.Q341
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '341')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q341]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q342    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE VIEW dbo.Q342
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '342')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q342]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








/****** Object:  View dbo.Q343    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE VIEW dbo.Q343
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '343')








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q343]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  View dbo.Q344    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE VIEW dbo.Q344
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '344')









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q344]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q345
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '345')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q345]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q346
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '346')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q346]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q347
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '347')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q347]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q348
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '348')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q348]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q349
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '349')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q349]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q350
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '350')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q350]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q351
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '351')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q351]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q352
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '352')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q352]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q353
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '353')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q353]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q354
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '354')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q354]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q355
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '355')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q355]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q356
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '356')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q356]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q357
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '357')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q357]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q358
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '358')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q358]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q359
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '359')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q359]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q360
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '360')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q360]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q361
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '361')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q361]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q362
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '362')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q362]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q363
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '363')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q363]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.Q364
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '364')





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q364]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.Q365
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '365')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q365]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.Q366
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '366')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q366]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.Q367
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '367')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q367]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.Q368
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '368')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q368]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.Q369
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '369')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q369]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.Q370
AS
SELECT KODERT, KODENEV
FROM KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '370')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q370]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.Q371
AS
SELECT KODERT, KODENEV
FROM dbo.KODSZOT
WHERE (UGYFAZ = '05') AND (KODTIP = '371')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[Q371]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR1
AS
	SELECT
		MUN AS MUN1,
		SORSZ AS SOR1,
		P AS P1,
		OX AS OX1,
		E AS E1,
		V AS V1,
		K AS K1,
		O AS O1,
		A AS A1,
		N AS N1,
		I AS I1,
		KU AS KU1
	FROM
		TAB_LABORO
	WHERE
		SOR = 1


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR1]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR10
AS
	SELECT
		MUN AS MUN10,
		SORSZ AS SOR10,
		P AS P10,
		OX AS OX10,
		E AS E10,
		V AS V10,
		K AS K10,
		O AS O10,
		A AS A10,
		N AS N10,
		I AS I10,
		KU AS KU10
	FROM
		TAB_LABORO
	WHERE
		SOR = 10


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR10]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR11
AS
	SELECT
		MUN AS MUN11,
		SORSZ AS SOR11,
		P AS P11,
		OX AS OX11,
		E AS E11,
		V AS V11,
		K AS K11,
		O AS O11,
		A AS A11,
		N AS N11,
		I AS I11,
		KU AS KU11
	FROM
		TAB_LABORO
	WHERE
		SOR = 11


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR11]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR12
AS
	SELECT
		MUN AS MUN12,
		SORSZ AS SOR12,
		P AS P12,
		OX AS OX12,
		E AS E12,
		V AS V12,
		K AS K12,
		O AS O12,
		A AS A12,
		N AS N12,
		I AS I12,
		KU AS KU12
	FROM
		TAB_LABORO
	WHERE
		SOR = 12


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR12]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR13
AS
	SELECT
		MUN AS MUN13,
		SORSZ AS SOR13,
		P AS P13,
		OX AS OX13,
		E AS E13,
		V AS V13,
		K AS K13,
		O AS O13,
		A AS A13,
		N AS N13,
		I AS I13,
		KU AS KU13
	FROM
		TAB_LABORO
	WHERE
		SOR = 13


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR13]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR14
AS
	SELECT
		MUN AS MUN14,
		SORSZ AS SOR14,
		P AS P14,
		OX AS OX14,
		E AS E14,
		V AS V14,
		K AS K14,
		O AS O14,
		A AS A14,
		N AS N14,
		I AS I14,
		KU AS KU14
	FROM
		TAB_LABORO
	WHERE
		SOR = 14


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR14]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR15
AS
	SELECT
		MUN AS MUN15,
		SORSZ AS SOR15,
		P AS P15,
		OX AS OX15,
		E AS E15,
		V AS V15,
		K AS K15,
		O AS O15,
		A AS A15,
		N AS N15,
		I AS I15,
		KU AS KU15
	FROM
		TAB_LABORO
	WHERE
		SOR = 15


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR15]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR16
AS
	SELECT
		MUN AS MUN16,
		SORSZ AS SOR16,
		P AS P16,
		OX AS OX16,
		E AS E16,
		V AS V16,
		K AS K16,
		O AS O16,
		A AS A16,
		N AS N16,
		I AS I16,
		KU AS KU16
	FROM
		TAB_LABORO
	WHERE
		SOR = 16


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR16]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR17
AS
	SELECT
		MUN AS MUN17,
		SORSZ AS SOR17,
		P AS P17,
		OX AS OX17,
		E AS E17,
		V AS V17,
		K AS K17,
		O AS O17,
		A AS A17,
		N AS N17,
		I AS I17,
		KU AS KU17
	FROM
		TAB_LABORO
	WHERE
		SOR = 17


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR17]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR18
AS
	SELECT
		MUN AS MUN18,
		SORSZ AS SOR18,
		P AS P18,
		OX AS OX18,
		E AS E18,
		V AS V18,
		K AS K18,
		O AS O18,
		A AS A18,
		N AS N18,
		I AS I18,
		KU AS KU18
	FROM
		TAB_LABORO
	WHERE
		SOR = 18


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR18]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR19
AS
	SELECT
		MUN AS MUN19,
		SORSZ AS SOR19,
		P AS P19,
		OX AS OX19,
		E AS E19,
		V AS V19,
		K AS K19,
		O AS O19,
		A AS A19,
		N AS N19,
		I AS I19,
		KU AS KU19
	FROM
		TAB_LABORO
	WHERE
		SOR = 19


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR19]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR2
AS
	SELECT
		MUN AS MUN2,
		SORSZ AS SOR2,
		P AS P2,
		OX AS OX2,
		E AS E2,
		V AS V2,
		K AS K2,
		O AS O2,
		A AS A2,
		N AS N2,
		I AS I2,
		KU AS KU2
	FROM
		TAB_LABORO
	WHERE
		SOR = 2


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR2]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR20
AS
	SELECT
		MUN AS MUN20,
		SORSZ AS SOR20,
		P AS P20,
		OX AS OX20,
		E AS E20,
		V AS V20,
		K AS K20,
		O AS O20,
		A AS A20,
		N AS N20,
		I AS I20,
		KU AS KU20
	FROM
		TAB_LABORO
	WHERE
		SOR = 20


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR20]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR21
AS
	SELECT
		MUN AS MUN21,
		SORSZ AS SOR21,
		P AS P21,
		OX AS OX21,
		E AS E21,
		V AS V21,
		K AS K21,
		O AS O21,
		A AS A21,
		N AS N21,
		I AS I21,
		KU AS KU21
	FROM
		TAB_LABORO
	WHERE
		SOR = 21


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR21]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR22
AS
	SELECT
		MUN AS MUN22,
		SORSZ AS SOR22,
		P AS P22,
		OX AS OX22,
		E AS E22,
		V AS V22,
		K AS K22,
		O AS O22,
		A AS A22,
		N AS N22,
		I AS I22,
		KU AS KU22
	FROM
		TAB_LABORO
	WHERE
		SOR = 22


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR22]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR23
AS
	SELECT
		MUN AS MUN23,
		SORSZ AS SOR23,
		P AS P23,
		OX AS OX23,
		E AS E23,
		V AS V23,
		K AS K23,
		O AS O23,
		A AS A23,
		N AS N23,
		I AS I23,
		KU AS KU23
	FROM
		TAB_LABORO
	WHERE
		SOR = 23


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR23]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.QLABOR24
AS
SELECT MUN AS MUN24, SORSZ AS SOR24, P AS P24, 
    OX AS OX24, E AS E24, V AS V24, K AS K24, O AS O24, 
    A AS A24, N AS N24, I AS I24, KU AS KU24
FROM TAB_LABORO
WHERE (SOR = 24)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR24]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.QLABOR25
AS
SELECT MUN AS MUN25, SORSZ AS SOR25, P AS P25, 
    OX AS OX25, E AS E25, V AS V25, K AS K25, O AS O25, 
    A AS A25, N AS N25, I AS I25, KU AS KU25
FROM TAB_LABORO
WHERE (SOR = 25)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR25]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR3
AS
	SELECT
		MUN AS MUN3,
		SORSZ AS SOR3,
		P AS P3,
		OX AS OX3,
		E AS E3,
		V AS V3,
		K AS K3,
		O AS O3,
		A AS A3,
		N AS N3,
		I AS I3,
		KU AS KU3
	FROM
		TAB_LABORO
	WHERE
		SOR = 3


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR3]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR4
AS
	SELECT
		MUN AS MUN4,
		SORSZ AS SOR4,
		P AS P4,
		OX AS OX4,
		E AS E4,
		V AS V4,
		K AS K4,
		O AS O4,
		A AS A4,
		N AS N4,
		I AS I4,
		KU AS KU4
	FROM
		TAB_LABORO
	WHERE
		SOR = 4


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR4]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR5
AS
	SELECT
		MUN AS MUN5,
		SORSZ AS SOR5,
		P AS P5,
		OX AS OX5,
		E AS E5,
		V AS V5,
		K AS K5,
		O AS O5,
		A AS A5,
		N AS N5,
		I AS I5,
		KU AS KU5
	FROM
		TAB_LABORO
	WHERE
		SOR = 5


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR5]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR6
AS
	SELECT
		MUN AS MUN6,
		SORSZ AS SOR6,
		P AS P6,
		OX AS OX6,
		E AS E6,
		V AS V6,
		K AS K6,
		O AS O6,
		A AS A6,
		N AS N6,
		I AS I6,
		KU AS KU6
	FROM
		TAB_LABORO
	WHERE
		SOR = 6


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR6]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR7
AS
	SELECT
		MUN AS MUN7,
		SORSZ AS SOR7,
		P AS P7,
		OX AS OX7,
		E AS E7,
		V AS V7,
		K AS K7,
		O AS O7,
		A AS A7,
		N AS N7,
		I AS I7,
		KU AS KU7
	FROM
		TAB_LABORO
	WHERE
		SOR = 7


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR7]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR8
AS
	SELECT
		MUN AS MUN8,
		SORSZ AS SOR8,
		P AS P8,
		OX AS OX8,
		E AS E8,
		V AS V8,
		K AS K8,
		O AS O8,
		A AS A8,
		N AS N8,
		I AS I8,
		KU AS KU8
	FROM
		TAB_LABORO
	WHERE
		SOR = 8


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR8]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create view QLABOR9
AS
	SELECT
		MUN AS MUN9,
		SORSZ AS SOR9,
		P AS P9,
		OX AS OX9,
		E AS E9,
		V AS V9,
		K AS K9,
		O AS O9,
		A AS A9,
		N AS N9,
		I AS I9,
		KU AS KU9
	FROM
		TAB_LABORO
	WHERE
		SOR = 9


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QLABOR9]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE VIEW dbo.QTAB413
AS
SELECT KOZNEV, KOZCIM, SUM(MENNY) AS MENNY, 
    SUM(OSSZEG) AS OSSZEG, SUM(AFAERT) AS AFA, 
    SUM(BRUTTO) AS BRUTTO
FROM TAB413
GROUP BY KOZNEV, KOZCIM






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[QTAB413]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE Procedure sp_CheckPermis
@sForm VARCHAR(50),
@sLogin VARCHAR(50)
AS

SET NOCOUNT ON

DECLARE @PERM_NULL INTEGER
DECLARE @PERM_RO INTEGER
DECLARE @PERM_RW INTEGER
SELECT @PERM_NULL = 0
SELECT @PERM_RO = 1
SELECT @PERM_RW = 2

DECLARE @JOG_UFR TINYINT
DECLARE @JOG_UFW TINYINT
DECLARE @JOG_UER TINYINT
DECLARE @JOG_UEW TINYINT
SELECT @JOG_UFR = 1
SELECT @JOG_UFW = 2
SELECT @JOG_UER = 4
SELECT @JOG_UEW = 8

DECLARE @RET INTEGER
SELECT @RET = @PERM_NULL

DECLARE @UFR VARCHAR(1)
DECLARE @UFW VARCHAR(1)
DECLARE @UER VARCHAR(1)
DECLARE @UEW VARCHAR(1)
SELECT
	@UFR = UFR,
	@UFW = UFW,
	@UER = UER,
	@UEW = UEW
FROM
	DOLGOZO
WHERE
	DOLGOZO.LOGIN = @sLogin
	
DECLARE @JOG TINYINT
SELECT
	@JOG = JOGOK
FROM
	JOGOS
WHERE
	KEP = @sForm	

DECLARE @TMP TINYINT

IF @UFW = 'y'
BEGIN
	SELECT @TMP = @JOG & @JOG_UFW
	IF @TMP <> 0
	BEGIN
		SELECT @RET = @PERM_RW
	END
	ELSE
	BEGIN
		SELECT @TMP = @JOG & @JOG_UFR
		IF @TMP <> 0
		BEGIN
			SELECT @RET = @PERM_RO
		END
	END
END
ELSE
BEGIN
	IF @UFR = 'y'
	BEGIN
		SELECT @TMP = @JOG & @JOG_UFR
		IF @TMP <> 0
		BEGIN
			SELECT @RET = @PERM_RO
		END
	END
END

IF @UEW = 'y'
BEGIN
	SELECT @TMP = @JOG & @JOG_UEW
	IF @TMP <> 0
	BEGIN
		SELECT @RET = @PERM_RW
	END
	ELSE
	BEGIN
		SELECT @TMP = @JOG & @JOG_UER
		IF @TMP <> 0
		BEGIN
			SELECT @RET = @PERM_RO
		END
	END
END
ELSE
BEGIN
	IF @UER = 'y'
	BEGIN
		SELECT @TMP = @JOG & @JOG_UER
		IF @TMP <> 0
		BEGIN
			SELECT @RET = @RET & @PERM_RO
		END
	END
END

SET NOCOUNT OFF

SELECT @RET
RETURN @RET



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_CheckPermis]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





/****** Object:  Stored Procedure dbo.sp_DelArvalt    Script Date: 2000. 07. 04. 18:56:10 ******/
CREATE PROCEDURE sp_DelArvalt
@pID INTEGER
AS
DELETE
FROM
	ARVALT
WHERE
	ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelArvalt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_DelDolgozo
@pID INTEGER
AS
DELETE
FROM
	DOLGOZO
WHERE
	ID = @pID
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDolgozo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_DelEgyediSzlatet
@pID INTEGER
AS
DELETE FROM
	SZLA_ALT_TET
WHERE
	ID = @pID







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelEgyediSzlatet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_DelKarbterv
@pID INTEGER
AS
UPDATE
	KARBTERV
SET
	AKTIV = 0,
	ADATUM = GetDate(),
	AKOD = User_Name()
WHERE
	ID = @pID










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelKarbterv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_DelKepvis    Script Date: 2000. 07. 04. 18:56:11 ******/
CREATE PROCEDURE sp_DelKepvis
@pID INTEGER
AS
DELETE FROM
	KEPVIS
WHERE
	ID = @pID
	








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelKepvis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_DelKontir    Script Date: 2000. 07. 04. 18:56:11 ******/





CREATE PROCEDURE sp_DelKontir
@pID VARCHAR(12)
AS
DELETE
FROM
	KONTIR
WHERE
	FSZAM = @pID














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelKontir]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_DelObj
@pID AS INTEGER
AS

DECLARE @pOBJTIP VARCHAR(2)
SELECT /* Lekérdezzük az objektum típusát*/
	@pOBJTIP = OBJTIP
FROM
	OBJEKTUM
WHERE
	ID = @pID

DELETE /* Töröljük az OBJEKTUM táblából a rekordot*/
FROM
	OBJEKTUM
WHERE
	ID = @pID

/* Az objektum típusától függoen a megfelelo táblából is töröljük a rekordot*/
IF @pOBJTIP = '01'
BEGIN
 DELETE FROM EPULET
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='02'
BEGIN
 DELETE FROM LAKAS
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='03'
BEGIN
 DELETE FROM FUTOMU
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='04'
BEGIN
 DELETE FROM KAZAN
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='05'
BEGIN
 DELETE FROM KAZANEGO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='06'
BEGIN
 DELETE FROM SZIVATTYU
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='07'
BEGIN
 DELETE FROM HOCSERELO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='08'
BEGIN
 DELETE FROM VENTILLATOR
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='09'
BEGIN
 DELETE FROM BOYLER
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='10'
BEGIN
 DELETE FROM MELEGVIZ_TAROLO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='11'
BEGIN
 DELETE FROM TARTALY
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='12'
BEGIN
 DELETE FROM SZUROK
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='13'
BEGIN
 DELETE FROM VIZLAGYITO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='14'
BEGIN
 DELETE FROM KOMPRESSZOR
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='15'
BEGIN
 DELETE FROM TERMELO_CSO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='16'
BEGIN
 DELETE FROM DEMAG_EMELOGEP
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='17'
BEGIN
 DELETE FROM HOKOZPONT
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='18'
BEGIN
 DELETE FROM HOOSSZEGZO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='19'
BEGIN
 DELETE FROM VIZORA
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='20'
BEGIN
 DELETE FROM ERZEKELO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='21'
BEGIN
 DELETE FROM FOKAPCSOLO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='22'
BEGIN
 DELETE FROM FAZISJAVITO_KONDENZATOR
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='23'
BEGIN
 DELETE FROM GAZVESZELY_JELZO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='24'
BEGIN
 DELETE FROM MOTOR
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='25'
BEGIN
 DELETE FROM SZINTKAPCSOLO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='26'
BEGIN
 DELETE FROM SZABALYOZO_AUTOMATIKA
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='27'
BEGIN
 DELETE FROM SZABALYOZO_SZELEP
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='28'
BEGIN
 DELETE FROM BIZTONSAGI_SZELEP
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='29'
BEGIN
 DELETE FROM FREKVENCIAVALTO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='30'
BEGIN
 DELETE FROM ARAMKOR
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='31'
BEGIN
 DELETE FROM KOLTSEGMEGOSZTO
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='32'
BEGIN
 DELETE FROM TARCSA
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='33'
BEGIN
 DELETE FROM HAJTOMU
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='34'
BEGIN
 DELETE FROM LANGOR
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='35'
BEGIN
 DELETE FROM TERMALKUT
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='36'
BEGIN
 DELETE FROM SZERELVENY
 WHERE ID = @pID
END
ELSE IF @pOBJTIP='37'
BEGIN
 DELETE FROM LEPCSOHAZ
 WHERE ID = @pID
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelObj]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_DelRaktarKepv
@pID INTEGER
AS
DELETE
FROM
	RAKTKEPVIS
WHERE
	ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelRaktarKepv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_DelSzerzfej    Script Date: 2000. 07. 04. 18:56:11 ******/
CREATE PROCEDURE sp_DelSzerzfej
@pID INTEGER
AS
DELETE FROM
	SZERZFEJ
WHERE
	ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelSzerzfej]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









CREATE PROCEDURE sp_DelSzerztet
@pID INTEGER
AS
DELETE FROM
	SZERZTEL
WHERE
	ID = @pID










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelSzerztet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_DelSzlaEgyedi
@pID INTEGER
AS
DELETE FROM
	SZLA_ALT
WHERE
	ID = @pID

DELETE FROM
	SZLA_ALT_TET
WHERE
	SZLA_ID = @pID







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelSzlaEgyedi]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_DelTeljm    Script Date: 2000. 07. 04. 18:56:11 ******/





CREATE PROCEDURE sp_DelTeljm
@pID INTEGER
AS
DELETE
FROM
	TELJM
WHERE
	ID = @pID














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DelTeljm]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.sp_Duplikal    Script Date: 2000. 07. 04. 18:56:11 ******/
CREATE PROCEDURE sp_Duplikal
@pID INTEGER
AS
DECLARE @OBJTIP VARCHAR(2)
DECLARE @AZON VARCHAR(8)
DECLARE @MEGNEV VARCHAR(50)
DECLARE @TIPUS VARCHAR(20)
DECLARE @VAROS VARCHAR(1)
DECLARE @UTCA VARCHAR(35)
DECLARE @HSZ VARCHAR(3)
DECLARE @ELHELYEZ VARCHAR(25)
DECLARE @GYSZAM VARCHAR(15)
DECLARE @GYARTO VARCHAR(3)
DECLARE @UZALL VARCHAR(1)
DECLARE @UZEMIDO DATETIME
DECLARE @HITIDO DATETIME
DECLARE @GYARTM VARCHAR(20)
DECLARE @TELEPHSZ VARCHAR(20)
DECLARE @VESZO VARCHAR(1)
DECLARE @FKOD VARCHAR(3)
DECLARE @ALAIR VARCHAR(3)
DECLARE @NEVLTELJ REAL
DECLARE @NEVLTELJME VARCHAR(3)
DECLARE @KATEG VARCHAR(2)
DECLARE @FSZAM VARCHAR(12)
DECLARE @MEGJ VARCHAR(255)
DECLARE @MKHOM REAL
DECLARE @FAGYVED CHAR(1)
DECLARE @FELEP VARCHAR(1)
DECLARE @BOYTIP VARCHAR(2)
DECLARE @SZELTIP VARCHAR(3)
DECLARE @LEVNYOM REAL
DECLARE @VIZNYOM REAL
DECLARE @SZURTIP VARCHAR(2)
DECLARE @ELLENALL REAL
DECLARE @LEMSZAM INT
DECLARE @UZEMINYOM REAL
DECLARE @BEVTELJ REAL
DECLARE @FORDSZ INT
DECLARE @EMEL_MAG REAL
DECLARE @SZAL_KOZ VARCHAR(3)
DECLARE @SZAL_MENNY REAL
DECLARE @SZIVFOK VARCHAR(2)
DECLARE @MERET VARCHAR(50)
DECLARE @MERETME VARCHAR(3)
DECLARE @FUTOFEL REAL
DECLARE @DB INT
DECLARE @HOTELJ REAL
DECLARE @GAZCSUCS REAL
DECLARE @HOHOR_KO VARCHAR(3)
DECLARE @BEEPCSOVDB INT
DECLARE @PRIM_ARAM REAL
DECLARE @NYITNYOM REAL
DECLARE @ZARNYOM REAL
DECLARE @HOSSZ_NAGY REAL
DECLARE @HOSSZ_KICS REAL
DECLARE @FELUGY CHAR(1)
DECLARE @HOLEP VARCHAR(3)
DECLARE @TERFOGAT REAL
DECLARE @TERFARAM REAL
DECLARE @LEGSZAL REAL
DECLARE @SZABMOD VARCHAR(2)
DECLARE @VEGNYOM REAL
DECLARE @ATMERO REAL
DECLARE @BEALL_ERTEK VARCHAR(50)
DECLARE @IMPULZUS REAL
DECLARE @HELYZET VARCHAR(2)
DECLARE @ELEKTRONIKA VARCHAR(2)
DECLARE @LEOLVMOD VARCHAR(2)
DECLARE @PLOMBA VARCHAR(12)
DECLARE @HOSSZ REAL
DECLARE @TERHEL REAL
DECLARE @VIZSZ REAL
DECLARE @FU_KOZ VARCHAR(3)
DECLARE @OSZLSZAM INT
DECLARE @BECSOV INT
DECLARE @ARAMFELV REAL
DECLARE @FESZULTS REAL
DECLARE @VEZHOSSZ REAL
DECLARE @BENYHOSSZ REAL
DECLARE @NYOMATEK REAL
DECLARE @ERZEKENY REAL
DECLARE @MUKMOD VARCHAR(3)
DECLARE @KVS REAL
DECLARE @KIMARAM REAL
DECLARE @FOGYMERHELY VARCHAR(50)
DECLARE @KIMENET VARCHAR(2)
DECLARE @CSATLMERET REAL
DECLARE @MEDDTELJ REAL
DECLARE @KISMEGSZAK REAL
DECLARE @LEKVILLTELJ REAL
DECLARE @VILLCSUCSNY REAL
DECLARE @VILLCSUCST REAL
DECLARE @VILLFORDSZ REAL
DECLARE @TELJT REAL
DECLARE @FUR_ATM REAL
DECLARE @PRIMELL REAL
DECLARE @KAPCSOLAS VARCHAR(50)
DECLARE @TOLTESMOD VARCHAR(2)
DECLARE @FUTOTT CHAR(1)
DECLARE @SZABALYOZAS VARCHAR(3)
DECLARE @KUTFNYOM REAL
DECLARE @NYUGVIZSZ REAL
DECLARE @UZEMIVIZSZ REAL
DECLARE @CIRKTERFARAM REAL
DECLARE @HOMERS REAL
DECLARE @NYOMTARTTIP VARCHAR(50)
DECLARE @HMVHOMERS REAL
DECLARE @FUT_LAKAS INT
DECLARE @HMV_LAKAS INT
DECLARE @FUT_KOZULET INT
DECLARE @HMV_KOZULET INT
DECLARE @HOKOZP_SZAM INT
DECLARE @SZEKU_TOM REAL
DECLARE @NYOMKUL REAL
DECLARE @TOMEGARAM REAL
DECLARE @NYOMAS_K REAL
DECLARE @HOMER_SZ REAL

DECLARE @RET INTEGER

/* Kiolvassuk az objektum táblából a duplikálandó objektum adatait */
SELECT 
	@OBJTIP = OBJTIP,
	@AZON = AZON,
	@MEGNEV = MEGNEV,
	@TIPUS = TIPUS,
	@VAROS = VAROS,
	@UTCA = UTCA,
	@HSZ = HSZ,
	@ELHELYEZ = ELHELYEZ,
	@GYSZAM = GYSZAM,
	@GYARTO = GYARTO,
	@UZALL = UZALL,
	@UZEMIDO = UZEMIDO,
	@HITIDO = HITIDO,
	@GYARTM = GYARTM,
	@TELEPHSZ = TELEPHSZ,
	@VESZO = VESZO,
	@FKOD = FKOD,
	@ALAIR = ALAIR,
	@NEVLTELJ = NEVLTELJ,
	@NEVLTELJME = NEVLTELJME,
	@KATEG = KATEG,
	@FSZAM = FSZAM,
	@MEGJ = MEGJ
FROM
	OBJEKTUM
WHERE
	ID = @pID

/*IF @pOBJTIP = '02'
BEGIN
SELECT
	@VALAMI = VALAMI
FROM
	LAKAS
WHERE
	ID = @pID
END
ELSE*/ IF @OBJTIP = '03'
BEGIN
SELECT
	@MKHOM = MKHOM,
	@HOTELJ = HOTELJ,
	@GAZCSUCS = GAZCSUCS,
	@HOHOR_KO = HOHOR_KO,
	@HOLEP = HOLEP,
	@VILLCSUCSNY = VILLCSUCSNY,
	@VILLCSUCST = VILLCSUCST,
	@TERFARAM = TERFARAM,
	@CIRKTERFARAM = CIRKTERFARAM,
	@NYOMTARTTIP = NYOMTARTTIP,
	@HMVHOMERS = HMVHOMERS,
	@FUT_LAKAS = FUT_LAKAS,
	@HMV_LAKAS = HMV_LAKAS,
	@FUT_KOZULET = FUT_KOZULET,
	@HMV_KOZULET = HMV_KOZULET
FROM
	FUTOMU
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '04'
BEGIN
SELECT
	@UZEMINYOM = UZEMINYOM,
	@HOHOR_KO = HOHOR_KO,
	@TERFARAM = TERFARAM,
	@SZABMOD = SZABMOD
FROM
	KAZAN
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '05'
BEGIN
SELECT
	@BEVTELJ = BEVTELJ,
	@SZABMOD = SZABMOD
FROM
	KAZANEGO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '06'
BEGIN
SELECT
	@FORDSZ = FORDSZ,
	@EMEL_MAG = EMEL_MAG,
	@SZAL_KOZ = SZAL_KOZ,
	@SZAL_MENNY = SZAL_MENNY,
	@SZIVFOK = SZIVFOK
FROM
	SZIVATTYU
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '07'
BEGIN
SELECT
	@ELLENALL = ELLENALL,
	@LEMSZAM = LEMSZAM,
	@MERET = MERET,
	@MERETME = MERETME,
	@FUTOFEL = FUTOFEL,
	@DB = DB,
	@HOHOR_KO = HOHOR_KO,
	@HOSSZ_NAGY = HOSSZ_NAGY,
	@HOSSZ_KICS = HOSSZ_KICS,
	@FELUGY = FELUGY,
	@FU_KOZ = FU_KOZ
FROM
	HOCSERELO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '08'
BEGIN
SELECT
	@FAGYVED = FAGYVED,
	@FORDSZ = FORDSZ,
	@LEGSZAL = LEGSZAL,
	@FU_KOZ = FU_KOZ,
	@ARAMFELV = ARAMFELV,
	@FESZULTS = FESZULTS
FROM
	VENTILLATOR
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '09'
BEGIN
SELECT
	@VESZO = VESZO,
	@FELEP = FELEP,
	@BOYTIP = BOYTIP,
	@FUTOFEL = FUTOFEL,
	@TERFOGAT = TERFOGAT,
	@SZABMOD = SZABMOD,
	@FU_KOZ = FU_KOZ
FROM
	BOYLER
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '10'
BEGIN
SELECT
	@FELEP = FELEP,
	@TERFOGAT = TERFOGAT,
	@KAPCSOLAS = KAPCSOLAS,
	@TOLTESMOD = TOLTESMOD
FROM
	MELEGVIZ_TAROLO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '11'
BEGIN
SELECT
	@FELEP = FELEP,
	@LEVNYOM = LEVNYOM,
	@VIZNYOM = VIZNYOM,
	@TERFOGAT = TERFOGAT,
	@FUTOTT = FUTOTT,
	@SZABALYOZAS = SZABALYOZAS
FROM
	TARTALY
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '12'
BEGIN
SELECT
	@SZURTIP = SZURTIP
FROM
	SZUROK
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '13'
BEGIN
SELECT
	@SZABMOD = SZABMOD,
	@OSZLSZAM = OSZLSZAM
FROM
	VIZLAGYITO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '14'
BEGIN
SELECT
	@FORDSZ = FORDSZ,
	@SZAL_KOZ = SZAL_KOZ,
	@SZAL_MENNY = SZAL_MENNY,
	@VEGNYOM = VEGNYOM,
	@ARAMFELV = ARAMFELV,
	@FESZULTS = FESZULTS
FROM
	KOMPRESSZOR
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '15'
BEGIN
SELECT
	@BEEPCSOVDB = BEEPCSOVDB,
	@ATMERO = ATMERO,
	@HOSSZ = HOSSZ,
	@VIZSZ = VIZSZ,
	@BECSOV = BECSOV
FROM
	TERMELO_CSO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '16'
BEGIN
SELECT
	@FORDSZ = FORDSZ,
	@TERHEL = TERHEL,
	@ARAMFELV = ARAMFELV,
	@FESZULTS = FESZULTS
FROM
	DEMAG_EMELOGEP
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '17'
BEGIN
SELECT
	@PRIM_ARAM = PRIM_ARAM,
	@HOLEP = HOLEP,
	@FOGYMERHELY = FOGYMERHELY,
	@KISMEGSZAK = KISMEGSZAK,
	@LEKVILLTELJ = LEKVILLTELJ,
	@PRIMELL = PRIMELL,
	@FUT_LAKAS = FUT_LAKAS,
	@HMV_LAKAS = HMV_LAKAS,
	@FUT_KOZULET = FUT_KOZULET,
	@SZEKU_TOM = SZEKU_TOM,
	@NYOMAS_K = NYOMAS_K,
	@HOMER_SZ = HOMER_SZ
FROM
	HOKOZPONT
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '18'
BEGIN
SELECT
	@LEOLVMOD = LEOLVMOD,
	@FESZULTS = FESZULTS,
	@IMPULZUS = IMPULZUS,
	@PLOMBA = PLOMBA,
	@HELYZET = HELYZET,
	@ELEKTRONIKA = ELEKTRONIKA
FROM
	HOOSSZEGZO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '19'
BEGIN
SELECT
	@ATMERO = ATMERO,
	@IMPULZUS = IMPULZUS,
	@SZAL_KOZ = SZAL_KOZ,
	@SZAL_MENNY = SZAL_MENNY
FROM
	VIZORA
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '20'
BEGIN
SELECT
	@VEZHOSSZ = VEZHOSSZ,
	@BENYHOSSZ = BENYHOSSZ,
	@KIMENET = KIMENET,
	@CSATLMERET = CSATLMERET
FROM
	ERZEKELO
WHERE
	ID = @pID
END
/*
ELSE IF @OBJTIP = '21'
BEGIN
SELECT
	@VALAMI = VALAMI
FROM
	FOKAPCSOLO
WHERE
	ID = @pID
END
*/
ELSE IF @OBJTIP = '22'
BEGIN
SELECT
	@MEDDTELJ = MEDDTELJ
FROM
	FAZISJAVITO_KONDENZATOR
WHERE
	ID = @pID
END
/*
ELSE IF @OBJTIP = '23'
BEGIN
SELECT
	@VALAMI = VALAMI
FROM
	GAZVESZELY_JELZO
WHERE
	ID = @pID
END
*/
ELSE IF @OBJTIP = '24'
BEGIN
SELECT
	@ARAMFELV = ARAMFELV,
	@FESZULTS = FESZULTS,
	@VILLFORDSZ = VILLFORDSZ,
	@TELJT = TELJT
FROM
	MOTOR
WHERE
	ID = @pID
END
/*
ELSE IF @OBJTIP = '25'
GIN
SELECT
	@VALAMI = VALAMI
FROM
	SZINTKAPCSOLO
WHERE
	ID = @pID
END
*/
/*
ELSE IF @OBJTIP = '26'
BEGIN
SELECT
	@VALAMI = VALAMI
FROM
	SZABALYOZO_AUTOMATIKA
WHERE
	ID = @pID
END
*/
ELSE IF @OBJTIP = '27'
BEGIN
SELECT
	@MERET = MERET,
	@MERETME = MERETME,
	@ATMERO = ATMERO,
	@MUKMOD = MUKMOD,
	@KVS = KVS
FROM
	SZABALYOZO_SZELEP
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '28'
BEGIN
SELECT
	@SZELTIP =SZELTIP,
	@MERET = MERET,
	@MERETME = MERETME,
	@NYITNYOM = NYITNYOM,
	@ZARNYOM = ZARNYOM
FROM
	BIZTONSAGI_SZELEP
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '29'
BEGIN
SELECT
	@MKHOM = MKHOM,
	@KIMARAM = KIMARAM
FROM
	FREKVENCIAVALTO
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '30'
BEGIN
SELECT
	@HOLEP = HOLEP,
	@TERFOGAT = TERFOGAT,
	@HOSSZ = HOSSZ,
	@SZABALYOZAS = SZABALYOZAS,
	@FUT_LAKAS = FUT_LAKAS,
	@HMV_LAKAS = HMV_LAKAS,
	@FUT_KOZULET = FUT_KOZULET,
	@HMV_KOZULET = HMV_KOZULET,
	@HOKOZP_SZAM = HOKOZP_SZAM,
	@NYOMKUL = NYOMKUL,
	@TOMEGARAM = TOMEGARAM
FROM
	ARAMKOR
WHERE
	ID = @pID
END
/*
ELSE IF @OBJTIP = '31`'
BEGIN
SELECT
	@VALAMI = VALAMI
FROM
	KOLTSEGMEGOSZTO
WHERE
	ID = @pID
END
*/
ELSE IF @OBJTIP = '32'
BEGIN
SELECT
	@ATMERO = ATMERO,
	@FUR_ATM = FUR_ATM
FROM
	TARCSA
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '33'
BEGIN
SELECT
	@ATMERO = ATMERO,
	@BEALL_ERTEK = BEALL_ERTEK,
	@ARAMFELV = ARAMFELV,
	@FESZULTS = FESZULTS
FROM
	HAJTOMU
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '34'
BEGIN
SELECT
	@ARAMFELV = ARAMFELV,
	@FESZULTS = FESZULTS,
	@VEZHOSSZ = VEZHOSSZ,
	@BENYHOSSZ = BENYHOSSZ,
	@NYOMATEK = NYOMATEK,
	@ERZEKENY = ERZEKENY
FROM
	LANGOR
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '35'
BEGIN
SELECT
	@SZAL_MENNY = SZAL_MENNY,
	@KUTFNYOM = KUTFNYOM,
	@NYUGVIZSZ = NYUGVIZSZ,
	@UZEMIVIZSZ = UZEMIVIZSZ,
	@HOMERS = HOMERS
FROM
	TERMALKUT
WHERE
	ID = @pID
END
ELSE IF @OBJTIP = '36'
BEGIN
SELECT
	@ATMERO = ATMERO,
	@BEALL_ERTEK = BEALL_ERTEK
FROM
	SZERELVENY
WHERE
	ID = @pID
END
/*ELSE IF @pOBJTIP = '37'
BEGIN
SELECT
	@VALAMI = VALAMI
FROM
	LEPCSOHAZ
WHERE
	ID = @pID
END
*/

/* Betesszük az objektum táblába az új, duplikált rekordot */
/* Az új rekord azonosítója lesz a visszatérési érték */
EXEC @RET = sp_InsObjAlt @OBJTIP,@AZON,@MEGNEV,@TIPUS,@VAROS,@UTCA,@HSZ,@ELHELYEZ,
		@GYSZAM,@GYARTO,@UZALL, @UZEMIDO, @HITIDO,
		@GYARTM,@TELEPHSZ,@VESZO,@FKOD,@ALAIR,@NEVLTELJ,@NEVLTELJME,@KATEG,@FSZAM, @MEGJ

/* Frissítjük a duplikált objektum gépészeti adatait */
EXEC sp_UpdObjGep @RET, @MKHOM, @FAGYVED, @FELEP, @BOYTIP, @SZELTIP, @LEVNYOM, @VIZNYOM, @SZURTIP,
	@ELLENALL, @LEMSZAM, @UZEMINYOM, @BEVTELJ, @FORDSZ, @EMEL_MAG, @SZAL_KOZ, @SZAL_MENNY,
	@SZIVFOK, @MERET, @MERETME, @FUTOFEL, @DB, @HOTELJ, @GAZCSUCS, @HOHOR_KO, @BEEPCSOVDB,
	@PRIM_ARAM, @NYITNYOM, @ZARNYOM, @HOSSZ_NAGY, @HOSSZ_KICS, @FELUGY, @HOLEP, @TERFOGAT,
	@TERFARAM, @LEGSZAL, @SZABMOD, @VEGNYOM, @ATMERO, @BEALL_ERTEK, @IMPULZUS, @LEOLVMOD, @PLOMBA,
	@HOSSZ,	@TERHEL, @VIZSZ, @FU_KOZ, @OSZLSZAM, @BECSOV

/* Frissítjük a duplikált objektum villamos adatait */
EXEC sp_UpdObjVill @RET, @ARAMFELV, @FESZULTS, @VEZHOSSZ, @BENYHOSSZ, @NYOMATEK, @ERZEKENY, @MUKMOD,
	@KVS, @KIMARAM, @FOGYMERHELY, @KIMENET, @CSATLMERET, @MEDDTELJ, @KISMEGSZAK, @LEKVILLTELJ,
	@VILLCSUCSNY, @VILLCSUCST, @VILLFORDSZ, @TELJT

/* Frissítjük a duplikált objektum üzemeltetési adatait */
EXEC sp_UpdObjUzem @RET, @FUR_ATM, @PRIMELL, @KAPCSOLAS, @TOLTESMOD, @FUTOTT, @SZABALYOZAS, @KUTFNYOM,
	@NYUGVIZSZ, @UZEMIVIZSZ, @CIRKTERFARAM, @HOMERS, @NYOMTARTTIP, @HMVHOMERS, @FUT_LAKAS,
	@HMV_LAKAS, @FUT_KOZULET, @HMV_KOZULET, @HOKOZP_SZAM, @SZEKU_TOM, @NYOMKUL, @TOMEGARAM,
	@NYOMAS_K, @HOMER_SZ

/* Visszaadjuk az új rekord azonosítóját */
SELECT @RET



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Duplikal]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_DuplikalEpul    Script Date: 2000. 07. 04. 18:56:11 ******/







CREATE PROCEDURE sp_DuplikalEpul
@pID INTEGER
AS
DECLARE @IRSZAM INTEGER
DECLARE @VAROS VARCHAR(1)
DECLARE @UTCA VARCHAR(35)
DECLARE @HSZ VARCHAR(3)
DECLARE @EPULNEV VARCHAR(50)
DECLARE @EPULTIP VARCHAR(3)
DECLARE @HELYR VARCHAR(12)
DECLARE @EPULSZ VARCHAR(3)
DECLARE @FUTESMOD VARCHAR(3)
DECLARE @LEGTELTIP VARCHAR(3)
DECLARE @LEGTHELY VARCHAR(2)
DECLARE @EPULATAD VARCHAR(20)
DECLARE @FUTOTIP VARCHAR(3)
DECLARE @UZEMELT VARCHAR(2)
DECLARE @KARBANTAR VARCHAR(3)
DECLARE @EPULHOSZ REAL
DECLARE @LAKTERF REAL
DECLARE @LEPCSOTERF REAL
DECLARE @KOZOSTERF REAL
DECLARE @KOZULTERF REAL
DECLARE @TERF_ARAM REAL
DECLARE @HOLEPCSO VARCHAR(3)
DECLARE @EPUL_ARAM REAL
DECLARE @CIRK_ARAM REAL
DECLARE @FUTBESZAB VARCHAR(3)
DECLARE @CIRKUL VARCHAR(3)
DECLARE @ATKOTES VARCHAR(1)
DECLARE @HMVRENDS VARCHAR(3)
DECLARE @NYOMKUL REAL
DECLARE @CIRK_MOD VARCHAR(3)
DECLARE @FOELZ VARCHAR(2)
DECLARE @FELOSZT VARCHAR(3)
DECLARE @UTEM VARCHAR(2)

DECLARE @RET INTEGER

SELECT
	@IRSZAM = IRSZAM,
	@VAROS = VAROS,
	@UTCA = UTCA,
	@HSZ = HSZ,
	@EPULNEV = MEGNEV,
	@EPULTIP = EPULTIP,
	@HELYR = HELYR,
	@EPULSZ = EPULSZ,
	@FUTESMOD = FUTESMOD,
	@LEGTELTIP = LEGTELTIP,
	@LEGTHELY = LEGTHELY,
	@EPULATAD = EPULATAD,
	@FUTOTIP = FUTOTIP,
	@UZEMELT = UZEMELT,
	@KARBANTAR = KARBANTAR,
	@EPULHOSZ = EPULHOSZ,
	@LAKTERF = LAKTERF,
	@LEPCSOTERF = LEPCSOTERF,
	@KOZOSTERF = KOZOSTERF,
	@KOZULTERF = KOZULTERF,
	@TERF_ARAM = TERF_ARAM,
	@HOLEPCSO = HOLEPCSO,
	@EPUL_ARAM = EPUL_ARAM,
	@CIRK_ARAM = CIRK_ARAM,
	@FUTBESZAB = FUTBESZAB,
	@CIRKUL = CIRKUL,
	@ATKOTES = ATKOTES,
	@HMVRENDS = HMVRENDS,
	@NYOMKUL = NYOMKUL,
	@CIRK_MOD = CIRK_MOD,
	@FOELZ = FOELZ,
	@FELOSZT = FELOSZT,
	@UTEM = UTEM
FROM
	OBJEKTUM,
	EPULET
WHERE
	OBJEKTUM.ID = @pID
	AND EPULET.ID = @pID

EXEC @RET = sp_InsEpul @VAROS, @IRSZAM, @UTCA, @HSZ, @EPULNEV, @EPULTIP, @HELYR, @EPULSZ,
	@FUTESMOD, @LEGTELTIP, @LEGTHELY, @EPULATAD, @FUTOTIP, @UZEMELT,
	@KARBANTAR, @EPULHOSZ, @LAKTERF, @LEPCSOTERF, @KOZOSTERF, @KOZULTERF,
	@TERF_ARAM, @HOLEPCSO, @EPUL_ARAM, @CIRK_ARAM, @FUTBESZAB, @CIRKUL,
	@ATKOTES, @HMVRENDS, @NYOMKUL, @CIRK_MOD, @FOELZ, @FELOSZT, @UTEM

RETURN @RET
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DuplikalEpul]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_DuplikalMunk
@pID INTEGER
AS
DECLARE @MTIP VARCHAR(1)
DECLARE @NAPSZAM VARCHAR(50)
DECLARE @BEJDAT DATETIME
DECLARE @KIALLDAT DATETIME
DECLARE @SZEREGYS VARCHAR(2)
DECLARE @MFDOLG INTEGER
DECLARE @SZOLGJELL VARCHAR(2)
--DECLARE @BEJNEV VARCHAR(40)
DECLARE @FSZAM VARCHAR(12)
DECLARE @TIPUSH VARCHAR(3)
DECLARE @MUNELV DATETIME
--DECLARE @IDOTOL VARCHAR(10)
--DECLARE @IDOIG VARCHAR(10)
DECLARE @MKAP INTEGER
DECLARE @MUVEL VARCHAR(3)
DECLARE @MUNVEGZ VARCHAR(2)
DECLARE @SZOLTIP VARCHAR(1)
DECLARE @MUNSZ VARCHAR(2)
DECLARE @KARBTIP VARCHAR(1)
DECLARE @HIBLEIR VARCHAR(1024)
DECLARE @ALLAPOT INTEGER
DECLARE @SORSZ VARCHAR(50)

BEGIN TRAN

DECLARE @RET INTEGER

/* Kiolvassuk a munkalap táblából a duplikálandó munkalap adatait */
SELECT 
	@MTIP = MTIP,
	@NAPSZAM = NAPSZAM,
	@BEJDAT = BEJDAT,
	@KIALLDAT = KIALLDAT,
	@SZEREGYS = SZEREGYS,
	@MFDOLG = MFDOLG,
	@SZOLGJELL = SZOLGJELL,
	--@BEJNEV = BEJNEV,
	@FSZAM = FSZAM,
	@TIPUSH = TIPUSH,
	@MUNELV = MUNELV,
	--@IDOTOL = IDOTOL,
	--@IDOIG = IDOIG,
	@MKAP = MKAP,
	@MUVEL = MUVEL,
	@MUNVEGZ = MUNVEGZ,
	@SZOLTIP = SZOLTIP,
	@MUNSZ = MUNSZ,
	@KARBTIP = KARBTIP,
	@HIBLEIR = HIBLEIR,
	@ALLAPOT = ALLAPOT,
	@SORSZ = SORSZ
FROM
	MUNKALAP
WHERE
	ID = @pID

/* Betesszük a MUNKALAP táblába az új, duplikált rekordot */
	INSERT INTO MUNKALAP(MTIP,BEJDAT,/*BEJNEV,*/TIPUSH,HIBLEIR,SZEREGYS,MFDOLG,MUNELV,
						/*IDOTOL,IDOIG,*/MUNVEGZ,SZOLGJELL,KARBTIP,MUVEL,SORSZ,NAPSZAM,KIALLDAT,
						FSZAM,SZOLTIP,MUNSZ,MKAP,ALLAPOT,REF)
	SELECT @MTIP,
			@BEJDAT,
			--@BEJNEV,
			@TIPUSH,
			@HIBLEIR,
			@SZEREGYS,
			@MFDOLG,
			@MUNELV,
			--@IDOTOL,
			--@IDOIG,
			@MUNVEGZ,
			@SZOLGJELL,
			@KARBTIP,
			@MUVEL,
			@SORSZ,
			@NAPSZAM,
			@KIALLDAT,
			@FSZAM,
			@SZOLTIP,
			@MUNSZ,
			@MKAP,
			@ALLAPOT,
			@pID	--REF: a hivatkozott munkalap ID-je

SELECT @RET = @@IDENTITY

--A hivatkozott munkalapon is beállítjuk a referencia ID-t
-- (saját magára hivatkozik)
--Ez jelzi majd, hogy hivatkozott munkalap - nem illik törölni, módosítgatni
UPDATE
	MUNKALAP
SET
	REF = @pID
WHERE
	ID = @pID
	

COMMIT TRAN

/* Visszaadjuk az új rekord azonosítóját */
SELECT @RET
RETURN @RET





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_DuplikalMunk]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillArvalt    Script Date: 2000. 07. 04. 18:56:11 ******/
CREATE PROCEDURE sp_FillArvalt
@pSZOLG VARCHAR(1)
AS

SELECT
	ID,
		CONVERT(VARCHAR(15),NOTERT) + ';' +
		CONVERT(VARCHAR(20),ERVDAT,102) + ';' +
		ISNULL(CONVERT(VARCHAR(20),BEFDAT,102),' - ') + ';' +
		CONVERT(VARCHAR(15),COALESCE(FELAR, 0)) + ';'
FROM
	ARVALT
WHERE
	SZOLG = @pSZOLG
ORDER BY
	ERVDAT DESC








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillArvalt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillConnected    Script Date: 2000. 07. 04. 18:56:12 ******/

CREATE PROCEDURE sp_FillConnected
@pOBJTIP VARCHAR(2),
@pID INTEGER
AS
IF @pOBJTIP='01'
BEGIN
	SELECT
		OBJEKTUM.ID,
		RTRIM(COALESCE(UTCA,' - ')) AS UTCA,
		RTRIM(COALESCE(HSZ,' - ')) AS HSZ,
		RTRIM(COALESCE(EPULSZ, ' - ')) AS EPULSZ,
		RTRIM(COALESCE(HELYR,' - ')) AS HELYR
	FROM
		EPULET INNER JOIN
			(OBJEKTUM INNER JOIN KAPCSOLAT ON OBJEKTUM.ID = KAPCSOLAT.ID2)
		ON EPULET.ID = OBJEKTUM.ID
	WHERE
		KAPCSOLAT.ID1 = @pID
		AND OBJEKTUM.OBJTIP = @pOBJTIP
	ORDER BY
		UTCA,
		HSZ,
		EPULSZ,
		HELYR
END
ELSE
BEGIN
	SELECT
		ID,
		RTRIM(COALESCE(MEGNEV,' - ')) AS MEGNEV,
		RTRIM(COALESCE(TIPUS,' - ')) AS TIPUS,
		RTRIM(COALESCE(TELEPHSZ, ' - '))AS TELEPHSZ,
		RTRIM(COALESCE(GYSZAM,' - ')) AS GYSZAM
	FROM
		OBJEKTUM JOIN KAPCSOLAT ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE
		KAPCSOLAT.ID1 = @pID
		AND OBJEKTUM.OBJTIP = @pOBJTIP
	ORDER BY
		MEGNEV,
		TIPUS,
		TELEPHSZ,
		GYSZAM
END










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillConnected]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillDolgozo    Script Date: 2000. 07. 04. 18:56:12 ******/







CREATE PROCEDURE sp_FillDolgozo
AS
SELECT
	ID,
	NEV
FROM
	DOLGOZO
ORDER BY
	NEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillDolgozo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_FillEgyediSzlaTet
@pSZLA_ID INTEGER
AS
SELECT
	SZLA_ALT_TET.ID,
	CONVERT(VARCHAR(20),TET_SORSZ) + ';' +
	COALESCE(Q338.KODENEV, ' - ') + ';' +
	CONVERT(VARCHAR(20),SZ_MENNY) + ';' +
	COALESCE(Q279.KODENEV, ' - ') + ';' +
	CONVERT(VARCHAR(20),NOTERT) + ';' +
	CONVERT(VARCHAR(20),OSSZEG) + ';' +
	COALESCE(Q341.KODENEV,'-') + ';'
FROM
	Q341 RIGHT JOIN
		(Q279 RIGHT JOIN
			(Q338 RIGHT JOIN
				SZLA_ALT_TET
			ON Q338.KODERT = SZLA_ALT_TET.CIKK)
		ON Q279.KODERT = SZLA_ALT_TET.MENNY_ME)
	ON Q341.KODERT = SZLA_ALT_TET.AFA
WHERE
	SZLA_ID = @pSZLA_ID
ORDER BY
	TET_SORSZ







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillEgyediSzlaTet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_FillEpuletByFutomu
@pFUTOMU_ID INTEGER = NULL
AS

SET NOCOUNT ON

CREATE TABLE #ZZZ
	(
	ID INTEGER,
	MEGNEV VARCHAR(100)
	)

DECLARE MEGNEVcursor CURSOR FAST_FORWARD FOR
SELECT
	OE.ID,
	OE.UTCA,
	OE.HSZ,
	E.EPULSZ
FROM
	OBJEKTUM OE INNER JOIN EPULET E ON E.ID = OE.ID

DECLARE @OE_ID INTEGER
DECLARE @UTCA VARCHAR(35)
DECLARE @HSZ VARCHAR(3)
DECLARE @EPULSZ VARCHAR(15)
DECLARE @FUTOMU_ID INTEGER

--Megnyitjuk a kurzort
OPEN MEGNEVcursor

--Lekérjük az elso rekordot
FETCH NEXT FROM MEGNEVcursor
	INTO @OE_ID,@UTCA,@HSZ,@EPULSZ

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk, hogy az adott objektum melyik futomuhöz tartozik.
	EXEC @FUTOMU_ID = sp_Rekurziv @OE_ID
	IF @pFUTOMU_ID IS NULL OR
		(@pFUTOMU_ID IS NOT NULL AND (@FUTOMU_ID = @pFUTOMU_ID))
		BEGIN
		INSERT INTO #ZZZ
		SELECT @OE_ID, RTRIM(COALESCE(@UTCA, ' - ')) + CHAR(32) +
				RTRIM(COALESCE(@HSZ, ' - ')) + ';' +
				COALESCE(@EPULSZ, ' - ') + ';'
		END

	--Lekérjük a következo rekordot
	FETCH NEXT FROM MEGNEVcursor
		INTO @OE_ID,@UTCA,@HSZ,@EPULSZ
END

--Lezárjuk és töröljük a kurzort
CLOSE MEGNEVcursor
DEALLOCATE MEGNEVcursor

SET NOCOUNT OFF

SELECT * FROM #ZZZ
DROP TABLE #ZZZ


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillEpuletByFutomu]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillKarb    Script Date: 2000. 07. 04. 18:56:12 ******/
CREATE PROCEDURE sp_FillKarb
/*@pOBJTIP VARCHAR(2),*/
@pOBJID INTEGER
AS
SELECT
	ID,
	Q298.KODENEV + ';'
		+ CONVERT(VARCHAR(20),KDATUM,102) + ';'
FROM
	Q298 RIGHT JOIN KARBAN ON Q298.KODERT = KARBAN.MUVEL
WHERE
	/*OBJTIP = @pOBJTIP
	AND*/ OBJID = @pOBJID/*coalesce(@pOBJID, OBJID)*/
ORDER BY
	KDATUM









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillKarb]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillKepvis    Script Date: 2000. 07. 04. 18:56:12 ******/
CREATE PROCEDURE sp_FillKepvis
AS
SELECT
	ID,
	coalesce(KOZNEV,' - ') + ';'
		+ coalesce(SZERNEV,' - ') + ';' AS MEGNEV
FROM
	KEPVIS
ORDER BY
	KOZNEV,
	SZERNEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillKepvis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_FillLaborJegyz
@pFUTOMU_ID INTEGER
AS

SELECT
	LABOR.ID,
	CONVERT(VARCHAR(20),LABOR.VIZSG_VEGE,102) + ' - ' + LABOR.SORSZ AS SORSZ
FROM
	LABOR LEFT JOIN MUNKALAP ON LABOR.MUN_SORSZ = MUNKALAP.ID
WHERE
	MUNKALAP.OBJID = @pFUTOMU_ID
ORDER BY
	LABOR.ID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillLaborJegyz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillLakasByEpulet    Script Date: 2000. 07. 04. 18:56:12 ******/

CREATE PROCEDURE sp_FillLakasByEpulet
@pEPULID INTEGER
AS
SELECT DISTINCT
	LAKAS.ID,
	MEGNEV,
	LAKAS.FKOD,
	coalesce(LEPCS,'-') + ' ' +
		coalesce(EM,'-') + ' ' +
		coalesce(AJTO,'-') AS NEV
FROM
	OBJEKTUM INNER JOIN (LAKAS INNER JOIN KAPCSOLAT ON LAKAS.ID = KAPCSOLAT.ID2) ON OBJEKTUM.ID = LAKAS.ID
WHERE
	KAPCSOLAT.ID1 = @pEPULID
ORDER BY
	NEV










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillLakasByEpulet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_FillMunkalapJegyz
AS
SELECT
	ID,
	CONVERT(VARCHAR(10),ID) + ';' +
		COALESCE(CONVERT(VARCHAR(30),KIALLDAT,111),'-') + ';'
		AS SORSZ
FROM
	MUNKALAP
WHERE
	MUVEL = 'HIT' AND (ALLAPOT=1 OR ALLAPOT=2) AND KIALLDAT > '2001.01.01'
ORDER BY
	ID DESC


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillMunkalapJegyz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





/****** Object:  Stored Procedure dbo.sp_FillMunkalapszam    Script Date: 2000. 07. 04. 18:56:12 ******/
CREATE PROCEDURE sp_FillMunkalapszam
@pMTIP AS VARCHAR(1)
AS
SELECT
	ID,
	CONVERT(VARCHAR(10),ID) + ';' +
		COALESCE(CONVERT(VARCHAR(30),KIALLDAT,111),'-') + ';' +
		COALESCE(Q291.KODENEV,'-') + ';' AS SORSZ
FROM
	Q291 RIGHT JOIN MUNKALAP ON Q291.KODERT = MUNKALAP.SZOLGJELL
WHERE
	MTIP = @pMTIP AND KIALLDAT > '2001.01.01'
ORDER BY
	ID DESC





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillMunkalapszam]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_FillNincsKarbterv
@pOBJTIP VARCHAR(2) = NULL
AS
--Ha nincs objektumtípus kiválasztva, akkor az objektumtípusokat kell kiírni
IF @pOBJTIP IS NULL
	BEGIN
	SELECT
		*
	FROM
		Q296
	ORDER BY
		KODENEV
	END
-- Ha van kiválasztott objektumtípus, akkor az olyan objektumok összességét kell kiírni
ELSE
	BEGIN
	IF @pOBJTIP='01'	--Épületek esetén kicsit mást kell kiírni
		BEGIN
		SELECT
			OBJEKTUM.ID,
			COALESCE(UTCA,' - '),
			COALESCE(HSZ,' - '),
			COALESCE(EPULSZ, ' - '),
			COALESCE(HELYR,' - ')
		FROM
			EPULET INNER JOIN OBJEKTUM ON EPULET.ID = OBJEKTUM.ID
		WHERE
			OBJEKTUM.OBJTIP = @pOBJTIP
			--AND (NOT EXISTS(SELECT * FROM KARBTERV WHERE AKTIV=1 AND OBJID=OBJEKTUM.ID))
		ORDER BY
			UTCA,
			HSZ,
			EPULSZ,
			HELYR
		END
	ELSE	--Ha nem épület, akkor ezek az adatok kellenek
		BEGIN
		SELECT
			ID,
			COALESCE(MEGNEV,' - '),
			COALESCE(TIPUS,' - '),
			COALESCE(TELEPHSZ, ' - '),
			COALESCE(GYSZAM,' - ')
		FROM
			OBJEKTUM
		WHERE
			OBJEKTUM.OBJTIP = @pOBJTIP
			--AND (NOT EXISTS(SELECT * FROM KARBTERV WHERE AKTIV=1 AND OBJID=OBJEKTUM.ID))
		ORDER BY
			MEGNEV,
			TIPUS,
			TELEPHSZ
		END
	END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillNincsKarbterv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillNotConnected    Script Date: 2000. 07. 04. 18:56:12 ******/

CREATE PROCEDURE sp_FillNotConnected
@pOBJTIP VARCHAR(2),
@pID INTEGER
AS
IF @pOBJTIP='01'
BEGIN
	SELECT DISTINCT
		OBJEKTUM.ID,
		RTRIM(COALESCE(UTCA,' - ')) AS UTCA,
		RTRIM(COALESCE(HSZ,' - ')) AS HSZ,
		RTRIM(COALESCE(EPULSZ, ' - ')) AS EPULSZ,
		RTRIM(COALESCE(HELYR,' - ')) AS HELYR
	FROM
		EPULET INNER JOIN OBJEKTUM ON EPULET.ID = OBJEKTUM.ID
	WHERE
		OBJTIP = @pOBJTIP
		AND KAPCSOLT=0
	ORDER BY
		UTCA,
		HSZ,
		EPULSZ,
		HELYR
END
ELSE
BEGIN
	SELECT DISTINCT
		ID,
		RTRIM(COALESCE(MEGNEV,' - ')) AS MEGNEV,
		RTRIM(COALESCE(TIPUS,' - ')) AS TIPUS,
		RTRIM(COALESCE(TELEPHSZ, ' - '))AS TELEPHSZ,
		RTRIM(COALESCE(GYSZAM,' - ')) AS GYSZAM
	FROM
		OBJEKTUM
	WHERE
		OBJTIP = @pOBJTIP
		AND KAPCSOLT=0
	ORDER BY
		MEGNEV,
		TIPUS,
		TELEPHSZ,
		GYSZAM
END










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillNotConnected]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_FillObjMegnev
@pObjTip VARCHAR(2),
@pAKTIV INTEGER = 0,
@ELSOOSZLOP VARCHAR(1) = NULL
AS

SET NOCOUNT ON

DECLARE @IS_AKTIV VARCHAR(1)
IF @pAKTIV = 1
BEGIN
	SELECT @IS_AKTIV = 'n'
END
ELSE
BEGIN
	SELECT @IS_AKTIV = 'y'
END

SET NOCOUNT OFF

IF @pObjTip = '01'
BEGIN
	SELECT
		OBJEKTUM.ID,
			RTRIM(COALESCE(UTCA, ' - ')) + CHAR(32) +
			RTRIM(COALESCE(HSZ, ' - ')) + ';' +
			COALESCE(EPULSZ, ' - ') + ';'
	FROM
		OBJEKTUM JOIN EPULET ON EPULET.ID = OBJEKTUM.ID
	WHERE
		OBJTIP = '01' AND (AKTIV='y' OR AKTIV = @IS_AKTIV)
	ORDER BY
		UTCA,
		HSZ,
		EPULSZ
END
ELSE IF @pObjTip = '37'
BEGIN
	SELECT
		ID,
		RTRIM(COALESCE(CIM, ' - ')) + ';'/* +
			COALESCE(EPULSZ, ' - ') + ';'*/
	FROM
		LEPCSOHAZ
	ORDER BY
		CIM
END
ELSE	--Ha nem lépcsoház és nem épület
BEGIN
	IF @ELSOOSZLOP = 'T'
	BEGIN
		SELECT
			ID,
			COALESCE(TELEPHSZ, ' - ') + ';'  +
				COALESCE(MEGNEV, ' - ') + ';' +
				COALESCE(TIPUS, ' - ') + ';' +
				COALESCE(GYSZAM, ' - ') + ';'
		FROM
			OBJEKTUM
		WHERE
			OBJTIP=@pObjTip AND (AKTIV='y' OR AKTIV = @IS_AKTIV)
		ORDER BY
			TELEPHSZ,		
			MEGNEV,
			TIPUS
	END
	ELSE
	BEGIN
		SELECT
			ID,
			COALESCE(MEGNEV, ' - ') + ';' +
				COALESCE(TIPUS, ' - ') + ';' +
				COALESCE(TELEPHSZ, ' - ') + ';'  +
				COALESCE(GYSZAM, ' - ') + ';'
		FROM
			OBJEKTUM
		WHERE
			OBJTIP=@pObjTip AND (AKTIV='y' OR AKTIV = @IS_AKTIV)
		ORDER BY
			MEGNEV,
			TIPUS,
			TELEPHSZ
	END
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillObjMegnev]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_FillObjTelephsz
@pObjTip VARCHAR(2)

AS
SELECT
	ID,
	COALESCE(TELEPHSZ, ' - ')
FROM
	OBJEKTUM
WHERE
	OBJTIP=@pObjTip AND AKTIV='y'
ORDER BY
	TELEPHSZ



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillObjTelephsz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_FillOsszesitoSorsz
@pDATUM DATETIME
AS
SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_LABORO
*/
DELETE FROM TAB_LABORO

--A futomu ID-jétol függoen kell elhelyezni a tábla megfelelo sorában
INSERT INTO
	TAB_LABORO(SOR, DATUM, MUN, SORSZ, P, OX, E, V, K, O, A, N, I, KU)
SELECT
	CASE OBJID
		WHEN 27 THEN 1
		WHEN 28 THEN 2
		WHEN 29 THEN 3
		WHEN 30 THEN 4
		WHEN 31 THEN 5
		WHEN 32 THEN 6
		WHEN 9  THEN 7
		WHEN 26 THEN 8
		WHEN 34 THEN 9
		WHEN 38 THEN 10
		WHEN 20 THEN 11
		WHEN 39 THEN 12
		WHEN 24 THEN 13
		WHEN 43 THEN 14
		WHEN 41 THEN 15
		WHEN 45 THEN 16
		WHEN 40 THEN 17
		WHEN 46 THEN 18
		WHEN 915 THEN 19
		WHEN 47 THEN 20
		WHEN 674 THEN 21
		WHEN 44 THEN 22
		WHEN 1722 THEN 23
		WHEN 40214 THEN 24
		WHEN 46476 THEN 25
		ELSE 0
	END,
	LABOR.MINTA_IDO,
	MUN_SORSZ,
	LABOR.SORSZ,
	PH,
	OXI,
	ELEKTRO,
	VAS,
	KOI,
	OK,
	AMMONIA,
	NITRAT,
	NITRIT,
	KULSO
FROM
	LABOR LEFT JOIN MUNKALAP ON MUNKALAP.ID = LABOR.MUN_SORSZ
WHERE
	DATEPART(year, LABOR.MINTA_IDO) = DATEPART(year, @pDATUM)
	AND DATEPART(month, LABOR.MINTA_IDO) = DATEPART(month, @pDATUM)

SET NOCOUNT OFF


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillOsszesitoSorsz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_FillRaktarKepv
AS
SELECT
	ID,
	NEV + ';' + coalesce(CIM,' - ') + ';' AS MEGNEV
FROM
	RAKTKEPVIS
ORDER BY
	NEV,
	CIM



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillRaktarKepv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_FillSzertet
@pSZERZ_ID INTEGER
AS
SELECT
	SZERZTEL.ID,
	CONVERT(VARCHAR(20),SZERTET) + ';' +
	CONVERT(VARCHAR(20),CIM) + ';' +
	COALESCE(Q343.KODENEV,'-') + ';' +
	CONVERT(VARCHAR(20),CIKK_MENNY) + ';' +
	CONVERT(VARCHAR(20),SZ_MENNY) + ';' +
	COALESCE(Q279.KODENEV,'-') + ';' +
	CONVERT(VARCHAR(20),OSSZEG) + ';' +
	COALESCE(Q341.KODENEV,'-') + ';'
FROM
	Q341 RIGHT JOIN
		(Q279 RIGHT JOIN
			(Q343 RIGHT JOIN
				(SZERZTEL INNER JOIN LEPCSOHAZ ON LEPCSOHAZ.ID = SZERZTEL.OBJ_ID)
			ON Q343.KODERT = SZERZTEL.CIKK)
		ON Q279.KODERT = SZERZTEL.MENNY_ME)
	ON Q341.KODERT = SZERZTEL.AFA
WHERE
	SZER_ID = @pSZERZ_ID
ORDER BY
	SZERTET







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillSzertet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillSzerzfej    Script Date: 2000. 07. 04. 18:56:13 ******/
CREATE PROCEDURE sp_FillSzerzfej
AS
SELECT
	ID,
	coalesce(PAZ, ' - ') + ';'
	+ coalesce(UGYFN, ' - ') + ';' AS MEGNEV
FROM
	SZERZFEJ
ORDER BY
	MEGNEV








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillSzerzfej]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_FillSzlaEgyedi
AS
SELECT
	ID,
	UGYFN + ';' +
	CONVERT(VARCHAR(20),KDAT,102) + ';'
FROM
	SZLA_ALT
WHERE
	EGYEDI = 1
	AND ZAROLT = 0
ORDER BY
	UGYFN,
	SZOLG,
	KDAT







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillSzlaEgyedi]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_FillTabPlomb
@pREF INTEGER
AS
BEGIN TRAN
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_PLOMB
*/
DELETE FROM TAB_PLOMB

INSERT INTO
	TAB_PLOMB
SELECT
	MUNKALAP.ID,
	MUNELV,
	BEJNEV,
	coalesce(CIM, ' ') + ' ' + coalesce(LAKAS, ' '),
	coalesce(IDOTOL, ' ') + ' - ' + coalesce(IDOIG, ' '),
	Q348.KODENEV
FROM
	Q348 RIGHT JOIN
		(LEPCSOHAZ RIGHT JOIN MUNKALAP ON LEPCSOHAZ.ID = MUNKALAP.OBJID)
	ON Q348.KODERT = MUNKALAP.PLOMBAZAS
WHERE
	MUNKALAP.REF = @pREF
	AND MUNKALAP.ALLAPOT <> 3
	
COMMIT TRAN




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillTabPlomb]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_FillTabVizora
@pREF INTEGER
AS
BEGIN TRAN
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_VIZORA
*/
DELETE FROM TAB_VIZORA

INSERT INTO
	TAB_VIZORA
SELECT
	MUNKALAP.ID,
	MUNELV,
	BEJNEV,
	coalesce(CIM, ' ') + ' ' + coalesce(LAKAS, ' '),
	coalesce(IDOTOL, ' ') + ' - ' + coalesce(IDOIG, ' '),
	UJ,
	FELUJITOTT
FROM
	LEPCSOHAZ RIGHT JOIN MUNKALAP ON LEPCSOHAZ.ID = MUNKALAP.OBJID
WHERE
	MUNKALAP.REF = @pREF
	AND MUNKALAP.ALLAPOT <> 3
	
COMMIT TRAN






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillTabVizora]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillTeljm    Script Date: 2000. 07. 04. 18:56:13 ******/
CREATE PROCEDURE sp_FillTeljm
@pMUNKALAP_ID INTEGER
AS
SELECT
	TELJM.ID,
	NEV,
	/*convert(VARCHAR(20),*/MUNDAT/*,102)*/,
	/*convert(VARCHAR(20),*/MUNORA/*)*/
FROM
	DOLGOZO INNER JOIN
		(TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
	ON DOLGOZO.ID = TELJM.DOLG_ID
WHERE
	MUNKALAP.ID = @pMUNKALAP_ID
ORDER BY
	NEV,
	MUNDAT,
	MUNORA









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillTeljm]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_FillVanKarbterv    Script Date: 2000. 07. 04. 18:56:13 ******/

CREATE PROCEDURE sp_FillVanKarbterv
@pMUVEL VARCHAR(3),
@pOBJTIP VARCHAR(2) = NULL
AS
SELECT
	KARBTERV.ID,
	COALESCE(MEGNEV,' - '),
	COALESCE(TIPUS,' - '),
	COALESCE(TELEPHSZ, ' - '),
	COALESCE(GYSZAM,' - '),
		--RTRIM(MUVEL),
	IDO,
	Q299.KODENEV
FROM
	Q299 RIGHT JOIN
		(OBJEKTUM INNER JOIN KARBTERV ON OBJEKTUM.ID = KARBTERV.OBJID)
	ON Q299.KODERT = KARBTERV.IDOE
WHERE
	KARBTERV.AKTIV = 1
	AND KARBTERV.OBJTIP = COALESCE(@pOBJTIP, KARBTERV.OBJTIP)
	AND KARBTERV.MUVEL = COALESCE(@pMUVEL, KARBTERV.MUVEL)





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_FillVanKarbterv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_GeneralAlt
@TDAT DATETIME,
@FDAT DATETIME,
@SZLA_CIKL INTEGER
AS

SET NOCOUNT ON

BEGIN TRAN

--Segédváltozók
DECLARE @SZLA_ID INTEGER
DECLARE @MAX_SZLASZ INTEGER
DECLARE @SZERZ_ID INTEGER
DECLARE @NUM_OF_SZLA INTEGER
DECLARE @SZOLG_AR REAL
DECLARE @SZAMLAZANDO_HO INTEGER
DECLARE @OSSZ_NETTO REAL
DECLARE @OSSZ_BRUTTO REAL
DECLARE @OSSZ_AFA REAL
DECLARE @NETTO REAL

--Számla kurzorhoz
DECLARE @SZERSZ VARCHAR(8)
DECLARE @FIZMOD VARCHAR(1)
DECLARE @JEL VARCHAR(1)
DECLARE @SZJ VARCHAR(12)
DECLARE @SZERTAR VARCHAR(1024)
DECLARE @PAZ VARCHAR(8)
DECLARE @UGYFN VARCHAR(100)
DECLARE @SZOLG INTEGER
DECLARE @KOZNEV VARCHAR(100)
DECLARE @KOZCIM VARCHAR(100)
DECLARE @KOZIRSZ VARCHAR(4)
DECLARE @SZERNEV VARCHAR(100)
DECLARE @ERVDAT DATETIME
DECLARE @BEFDAT DATETIME


--Számla tétel kurzorhoz
DECLARE @CIKK VARCHAR(2)
DECLARE @CIKK_MENNY REAL
DECLARE @SZ_MENNY REAL
DECLARE @MENNY_ME VARCHAR(3)
DECLARE @AFA VARCHAR(2)
DECLARE @TET_SORSZ INTEGER
DECLARE @CIM VARCHAR(100)


DECLARE @CIKL_KEZD DATETIME
DECLARE @CIKL_VEG DATETIME
DECLARE @CIKL_SZAM INTEGER
DECLARE @SZAML_ELEJE DATETIME
DECLARE @SZAML_VEGE DATETIME
DECLARE @AKT_HONAP DATETIME
DECLARE @AKT_AR REAL
DECLARE @PREV_AR REAL
DECLARE @SZOLG_JEL VARCHAR(4)

SELECT @CIKL_SZAM = MONTH(GetDate())
SELECT @CIKL_SZAM = @CIKL_SZAM / @SZLA_CIKL
SELECT @CIKL_KEZD = DATEADD(month, @CIKL_SZAM * @SZLA_CIKL, STR(YEAR(GetDate())) + '.01.01')
SELECT @CIKL_VEG = DATEADD(month, @SZLA_CIKL, @CIKL_KEZD)

------------------------------------------
--Számla kurzor: szerzodésekbol összeállítjuk a számlafejléc tartalmát
DECLARE SZLACursor CURSOR FAST_FORWARD FOR
SELECT
	SZERZFEJ.ID,
	SZERSZ,
	FIZMOD,
	JEL,
	SZJ,
	SZERTAR,
	SZERZFEJ.PAZ,
	UGYFN,
	SZOLG,
	KOZNEV,
	KOZCIM,
	KOZIRSZ,
	SZERNEV,
	ERVDAT,
	BEFDAT
FROM
	KEPVIS INNER JOIN
		(SZERZFEJ INNER JOIN KEPV_TET ON KEPV_TET.SZERZ_ID = SZERZFEJ.ID)
	ON KEPVIS.ID = KEPV_TET.KEPVIS_ID
WHERE
	SZERZFEJ.SZEJEL = '01'	--Átalánydíjas szerzodés
	AND SZERZFEJ.SZLA_CIKL = @SZLA_CIKL	--Megfelelo számlázási ciklusú
	AND (SZERZFEJ.BEFDAT IS NULL OR (SZERZFEJ.BEFDAT IS NOT NULL AND SZERZFEJ.BEFDAT > @CIKL_KEZD))	--Még érvényes a szerzodés
	AND KEPV_TET.BEFDATUM IS NULL	--Aktív képviselo
ORDER BY
	KOZNEV
	
------------------------------------------
--Generálás megkezdése elott töröljük
--a már generált, de még le nem zárt rekordokat
DECLARE SZLADelCursor CURSOR FAST_FORWARD FOR
	SELECT ID FROM SZLA_ALT WHERE EGYEDI = 0 AND ZAROLT = 0
	ORDER BY ID
	
OPEN SZLADelCursor
FETCH NEXT FROM SZLADelCursor
	INTO @SZLA_ID
WHILE @@FETCH_STATUS = 0
BEGIN
	DELETE FROM SZLA_ALT_TET WHERE SZLA_ID = @SZLA_ID
	FETCH NEXT FROM SZLADelCursor
		INTO @SZLA_ID
END
CLOSE SZLADelCursor
DEALLOCATE SZLADelCursor

DELETE FROM SZLA_ALT WHERE EGYEDI = 0 AND ZAROLT = 0



--Hány db számlát generáltunk
SELECT @NUM_OF_SZLA = 0

OPEN SZLACursor

FETCH NEXT FROM SZLACursor
	INTO @SZERZ_ID,@SZERSZ,@FIZMOD,@JEL,@SZJ,@SZERTAR,@PAZ,@UGYFN,@SZOLG,@KOZNEV,@KOZCIM,@KOZIRSZ,@SZERNEV,@ERVDAT,@BEFDAT
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk az eddigi legnagyobb számlaszámot
	SELECT @MAX_SZLASZ = MAX(SZLASZ) FROM SZLA_ALT
	IF @MAX_SZLASZ IS NULL
		BEGIN
		SELECT @MAX_SZLASZ = 0
		END

	SELECT @OSSZ_NETTO = 0
	SELECT @OSSZ_BRUTTO = 0
	SELECT @OSSZ_AFA = 0
	
	--IF NOT EXISTS(SELECT ID FROM SZLA_ALT WHERE SZERZSZ = @SZERZSZ AND FIZMOD = @FIZMOD AND JEL = @JEL AND SZJ = @SZJ AND SZERTAR = @SZERTAR AND PAZ = @PAZ AND UGYFN = @UGYFN AND SZOLG = @SZOLG)
	--	BEGIN
	INSERT INTO
		SZLA_ALT(SZLASZ,SZERZSZ,FIZMOD,TDAT,KDAT,FDAT,JEL,SZJ,SZERTAR,PAZ,UGYFN,SZOLG,KOZNEV,KOZCIM,KOZIRSZ,SZERNEV,CIKLUS)
	SELECT
		@MAX_SZLASZ + 1,
		@SZERSZ,
		@FIZMOD,
		@TDAT,
		GetDate(),
		@FDAT,
		@JEL,
		@SZJ,
		@SZERTAR,
		@PAZ,
		@UGYFN,
		@SZOLG,
		@KOZNEV,
		@KOZCIM,
		@KOZIRSZ,
		@SZERNEV,
		@CIKL_SZAM+1
	
	SELECT @SZLA_ID = @@IDENTITY
	SELECT @NUM_OF_SZLA = @NUM_OF_SZLA + 1
	SELECT @SZOLG_JEL = SZOLG FROM ARVALT WHERE ID = @SZOLG
	
	IF @ERVDAT > @CIKL_KEZD	--Ha az érvényességi dátum a ciklusba esik,
		BEGIN
		SELECT @SZAML_ELEJE = @ERVDAT	-- akkor az érvényességi dátumtól kezdve kell számlázni
		END
	ELSE	--Ha az érvényességi dátum a cikluson kívül van, akkor minden OK
		BEGIN
		SELECT @SZAML_ELEJE = @CIKL_KEZD	-- és a ciklus elejétol kezdve kell számlázni
		END
	
	IF @BEFDAT IS NOT NULL AND @BEFDAT < @CIKL_VEG	--Ha a szerzodés a ciklus vége elott befejezodik,
		BEGIN
		SELECT @SZAML_VEGE = @BEFDAT	--akkor csak a befejezésig kell számlázni
		END
	ELSE
		BEGIN
		SELECT @SZAML_VEGE = @CIKL_VEG
		END

	SELECT @AKT_HONAP = @SZAML_ELEJE	--Ciklusváltozó, végigmegy a cikluson belüli hónapokon
	SELECT @SZAMLAZANDO_HO = 0	--Hány hónapot kell az adott árral számlázni
	SELECT @PREV_AR = NOTERT FROM ARVALT WHERE SZOLG = @SZOLG_JEL AND @AKT_HONAP BETWEEN ERVDAT AND COALESCE(BEFDAT,@AKT_HONAP)	--Elozo hónapban érvényes ár
	WHILE @AKT_HONAP < @SZAML_VEGE	--Amíg a ciklus végére nem érünk
	BEGIN
		--Adott hónapban érvényes ár
		SELECT @AKT_AR = NOTERT FROM ARVALT WHERE SZOLG = @SZOLG_JEL AND @AKT_HONAP BETWEEN ERVDAT AND COALESCE(BEFDAT,@AKT_HONAP)

		IF @AKT_AR <> @PREV_AR	--Ha másik ár jönne, akkor
			BEGIN

			DECLARE SZLA_TETCursor CURSOR FAST_FORWARD FOR
			SELECT
				CIKK,
				CIKK_MENNY,
				SZ_MENNY,
				MENNY_ME,
				AFA,
				CIM
			FROM
				SZERZTEL INNER JOIN LEPCSOHAZ ON SZERZTEL.OBJ_ID = LEPCSOHAZ.ID
			WHERE
				SZER_ID = @SZERZ_ID

			SELECT @TET_SORSZ = 0
			OPEN SZLA_TETCursor

			FETCH NEXT FROM SZLA_TETCursor
				INTO @CIKK,@CIKK_MENNY,@SZ_MENNY,@MENNY_ME,@AFA,@CIM
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SELECT @TET_SORSZ = @TET_SORSZ + 1
				SELECT @NETTO = ROUND(@PREV_AR * @SZ_MENNY * @SZAMLAZANDO_HO / 12,0)
				INSERT INTO
					SZLA_ALT_TET(SZLA_ID,TET_SORSZ,LEPCSOHAZ,CIKK,CIKK_MENNY,SZ_MENNY,MENNY_ME,NOTERT,OSSZEG,AFA,AFAOSSZ,BRUTTO)
				SELECT
					@SZLA_ID,
					@TET_SORSZ,
					@CIM,
					@CIKK,
					@CIKK_MENNY,
					@SZ_MENNY,
					@MENNY_ME,
					@PREV_AR,
					@NETTO,
					@AFA,
					CASE @AFA
						WHEN '01' THEN 0
						WHEN '02' THEN 0
						WHEN '03' THEN ROUND(@NETTO * 0.12,0)
						WHEN '04' THEN ROUND(@NETTO * 0.25,0)
					END,
					CASE @AFA
						WHEN '01' THEN @NETTO
						WHEN '02' THEN @NETTO
						WHEN '03' THEN ROUND(@NETTO * 1.12,0)
						WHEN '04' THEN ROUND(@NETTO * 1.25,0)
					END

				SELECT @OSSZ_NETTO = @OSSZ_NETTO + @NETTO
				SELECT @OSSZ_AFA = CASE @AFA
										WHEN '01' THEN @OSSZ_AFA
										WHEN '02' THEN @OSSZ_AFA
										WHEN '03' THEN @OSSZ_AFA + ROUND(@NETTO * 0.12,0)
										WHEN '04' THEN @OSSZ_AFA + ROUND(@NETTO * 0.25,0)
									END
				SELECT @OSSZ_BRUTTO = CASE @AFA
										WHEN '01' THEN @OSSZ_BRUTTO + @NETTO
										WHEN '02' THEN @OSSZ_BRUTTO + @NETTO
										WHEN '03' THEN @OSSZ_BRUTTO + ROUND(@NETTO * 1.12,0)
										WHEN '04' THEN @OSSZ_BRUTTO + ROUND(@NETTO * 1.25,0)
									END
				
				FETCH NEXT FROM SZLA_TETCursor
					INTO @CIKK,@CIKK_MENNY,@SZ_MENNY,@MENNY_ME,@AFA,@CIM
			END

			--Lezárjuk a kurzort
			CLOSE SZLA_TETCursor
			DEALLOCATE SZLA_TETCursor

			SELECT @PREV_AR = @AKT_AR
			SELECT @SZAMLAZANDO_HO = 1
			END
		ELSE
			BEGIN
			SELECT @SZAMLAZANDO_HO = @SZAMLAZANDO_HO + 1
			END
		
		--select @szerz_id
		--SELECT @AKT_HONAP,'AKT AR',@AKT_AR,'PREV AR',@PREV_AR,'SZAML HO',@SZAMLAZANDO_HO
		
		SELECT @AKT_HONAP = DATEADD(month, 1, @AKT_HONAP)	--Következo hónapra lépünk
	END

	IF @SZAMLAZANDO_HO <> 0
		BEGIN
		DECLARE SZLA_TETCursor CURSOR FAST_FORWARD FOR
		SELECT
			CIKK,
			CIKK_MENNY,
			SZ_MENNY,
			MENNY_ME,
			AFA,
			CIM
		FROM
			SZERZTEL INNER JOIN LEPCSOHAZ ON LEPCSOHAZ.ID = SZERZTEL.OBJ_ID
		WHERE
			SZER_ID = @SZERZ_ID

		SELECT @TET_SORSZ = 0
		OPEN SZLA_TETCursor

		FETCH NEXT FROM SZLA_TETCursor
			INTO @CIKK,@CIKK_MENNY,@SZ_MENNY,@MENNY_ME,@AFA,@CIM
		WHILE @@FETCH_STATUS = 0
			BEGIN
			SELECT @TET_SORSZ = @TET_SORSZ + 1
			SELECT @NETTO = ROUND(@PREV_AR * @SZ_MENNY * @SZAMLAZANDO_HO / 12,0)
			INSERT INTO
				SZLA_ALT_TET(SZLA_ID,TET_SORSZ,LEPCSOHAZ,CIKK,CIKK_MENNY,SZ_MENNY,MENNY_ME,NOTERT,OSSZEG,AFA,AFAOSSZ,BRUTTO)
			SELECT
				@SZLA_ID,
				@TET_SORSZ,
				@CIM,
				@CIKK,
				@CIKK_MENNY,
				@SZ_MENNY,
				@MENNY_ME,
				@PREV_AR,
				@PREV_AR * @SZ_MENNY * @SZAMLAZANDO_HO / 12,
				@AFA,
				CASE @AFA
					WHEN '01' THEN 0
					WHEN '02' THEN 0
					WHEN '03' THEN ROUND(@NETTO * 0.12,0)
					WHEN '04' THEN ROUND(@NETTO * 0.25,0)
				END,
				CASE @AFA
					WHEN '01' THEN @NETTO
					WHEN '02' THEN @NETTO
					WHEN '03' THEN ROUND(@NETTO * 1.12,0)
					WHEN '04' THEN ROUND(@NETTO * 1.25,0)
				END

			SELECT @OSSZ_NETTO = @OSSZ_NETTO + @NETTO
			SELECT @OSSZ_AFA = CASE @AFA
									WHEN '01' THEN @OSSZ_AFA
									WHEN '02' THEN @OSSZ_AFA
									WHEN '03' THEN @OSSZ_AFA + ROUND(@NETTO * 0.12,0)
									WHEN '04' THEN @OSSZ_AFA + ROUND(@NETTO * 0.25,0)
								END
			SELECT @OSSZ_BRUTTO = CASE @AFA
									WHEN '01' THEN @OSSZ_BRUTTO + @NETTO
									WHEN '02' THEN @OSSZ_BRUTTO + @NETTO
									WHEN '03' THEN @OSSZ_BRUTTO + ROUND(@NETTO * 1.12,0)
									WHEN '04' THEN @OSSZ_BRUTTO + ROUND(@NETTO * 1.25,0)
								END
			
			FETCH NEXT FROM SZLA_TETCursor
				INTO @CIKK,@CIKK_MENNY,@SZ_MENNY,@MENNY_ME,@AFA,@CIM
			END

		--Lezárjuk a kurzort
		CLOSE SZLA_TETCursor
		DEALLOCATE SZLA_TETCursor
		END

	UPDATE
		SZLA_ALT
	SET
		OSSZ_NETTO = @OSSZ_NETTO,
		OSSZ_AFA = @OSSZ_AFA,
		OSSZ_BRUTTO = @OSSZ_BRUTTO
	WHERE
		SZLASZ = @MAX_SZLASZ + 1
	
	FETCH NEXT FROM SZLACursor
		INTO @SZERZ_ID,@SZERSZ,@FIZMOD,@JEL,@SZJ,@SZERTAR,@PAZ,@UGYFN,@SZOLG,@KOZNEV,@KOZCIM,@KOZIRSZ,@SZERNEV,@ERVDAT,@BEFDAT
END

CLOSE SZLACursor
DEALLOCATE SZLACursor

SET NOCOUNT OFF


COMMIT TRAN

SELECT @NUM_OF_SZLA

RETURN @NUM_OF_SZLA







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GeneralAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE Procedure sp_GetElozoKapcs
@pID INTEGER,		--ennek az elozo kapcsolatát
@pOBJTIP VARCHAR(2),	--ilyen objektum típus alatt keresek
@pOBJTIP2 VARCHAR(2)	--ilyen objektum típust keresek

AS

DECLARE @ID INTEGER
DECLARE @ID_TEMP INTEGER
DECLARE @ELOZOKAPCSDATE DATETIME

SELECT @ELOZOKAPCSDATE = '1900.01.01'

DECLARE zzz CURSOR fast_forward FOR
SELECT
	ID,
	OBJTIP,
	ELOZOKAPCS,
	ELOZOKAPCSDATE
FROM
	OBJEKTUM
WHERE
	OBJTIP = @pOBJTIP2 AND ELOZOKAPCS IS NOT NULL

DECLARE @tID INTEGER
DECLARE @tOBJTIP VARCHAR(2)
DECLARE @tELOZOKAPCS INTEGER
DECLARE @tELOZOKAPCSDATE DATETIME

OPEN zzz

FETCH NEXT FROM zzz INTO @tID, @tOBJTIP, @tELOZOKAPCS, @tELOZOKAPCSDATE
WHILE @@fetch_status = 0
BEGIN
	
	EXEC @ID_TEMP = sp_Rekurziv @tELOZOKAPCS, @pOBJTIP
	
	IF (@ID_TEMP = @pID AND @ELOZOKAPCSDATE < @tELOZOKAPCSDATE)
		OR (@tELOZOKAPCS = @pID AND @tOBJTIP = @pOBJTIP2 AND @ELOZOKAPCSDATE < @tELOZOKAPCSDATE)
	BEGIN
		SELECT @ID = @tID, @ELOZOKAPCSDATE = @tELOZOKAPCSDATE
	END
	
	FETCH NEXT FROM zzz INTO @tID, @tOBJTIP, @tELOZOKAPCS, @tELOZOKAPCSDATE
END

CLOSE zzz
DEALLOCATE zzz

SELECT
--	Q296.KODENEV AS OBJTIP,
	MEGNEV,
	TIPUS,
	TELEPHSZ,
	GYSZAM
FROM
	Q296 RIGHT JOIN OBJEKTUM ON Q296.KODERT = OBJEKTUM.OBJTIP
WHERE
	ID = @ID





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetElozoKapcs]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetFszamInfo    Script Date: 2000. 07. 04. 18:56:13 ******/





CREATE PROCEDURE sp_GetFszamInfo
@pFSZAM VARCHAR(12)
AS
SELECT
	OBJTIP,
	ID
FROM
	OBJEKTUM
WHERE
	FSZAM = @pFSZAM














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetFszamInfo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetGridHeader    Script Date: 2000. 07. 04. 18:56:13 ******/







CREATE PROCEDURE sp_GetGridHeader
AS
SELECT
	*
FROM
	GRID_FEJLEC
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetGridHeader]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_GetInfoAlt    Script Date: 2000. 07. 04. 18:56:14 ******/
CREATE PROCEDURE sp_GetInfoAlt
@pID INTEGER
AS
DECLARE @FUTOMU_ID INT

EXEC @FUTOMU_ID = sp_Rekurziv @pID

SELECT
	MEGNEV AS FUTOMUNEV
FROM
	OBJEKTUM
WHERE
	ID = @FUTOMU_ID



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetInfoAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetInfoSpec    Script Date: 2000. 07. 04. 18:56:14 ******/
CREATE PROCEDURE sp_GetInfoSpec
@pID INTEGER
AS
DECLARE @FUTOMU_ID INT
DECLARE @FUTOMU_NEV VARCHAR(100)
EXEC @FUTOMU_ID = sp_Rekurziv @pID
SELECT @FUTOMU_NEV = MEGNEV
FROM
	OBJEKTUM
WHERE
	ID = @FUTOMU_ID

SELECT
	MEGNEV,
	TELEPHSZ,
	TIPUS,
	GYSZAM,
	@FUTOMU_NEV AS FUTOMUNEV
FROM
	OBJEKTUM
WHERE
	ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetInfoSpec]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetJegyzKarbInfo    Script Date: 2000. 07. 04. 18:56:14 ******/
CREATE PROCEDURE sp_GetJegyzKarbInfo
@pID INTEGER
AS
SELECT
	Q300.KODENEV AS KARBTIP,
	Q298.KODENEV AS MUVEL,
	MEGNEV,
	GYSZAM,
	coalesce(VAROS,'-') + ' ' +
		coalesce(UTCA,'-') + ' ' +
		coalesce(HSZ,'-') AS CIM,
	' ' AS UJDAT,
	' ' AS UJEGYZSZ
FROM
	Q300 RIGHT JOIN
		(Q298 RIGHT JOIN
			(KARBAN INNER JOIN OBJEKTUM ON KARBAN.OBJID = OBJEKTUM.ID)
		ON Q298.KODERT = KARBAN.MUVEL)
	ON Q300.KODERT = KARBAN.KARBTIP
WHERE
	KARBAN.ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetJegyzKarbInfo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetKapcs    Script Date: 2000. 07. 04. 18:56:14 ******/

CREATE PROCEDURE sp_GetKapcs
@pID INTEGER,
@pOBJTIP VARCHAR(2)=NULL
AS
SELECT
	Q296.KODENEV AS OBJTIP,
	RTRIM(COALESCE(MEGNEV,' - '))  AS MEGNEV,
	RTRIM(COALESCE(TIPUS,' - ')) AS TIPUS,
	RTRIM(COALESCE(TELEPHSZ, ' - ')) AS TELEPHSZ,
	RTRIM(COALESCE(GYSZAM,' - '))  AS GYSZAM,
	/*RTRIM(COALESCE(UZEMIDO,'-')) AS UZEMIDO,*/
	CASE HITIDO
		WHEN NULL THEN '-'
		ELSE HITIDO
	END AS HITIDO
FROM
	Q296 JOIN OBJEKTUM ON Q296.KODERT = OBJEKTUM.OBJTIP
WHERE
	OBJEKTUM.ID = @pID
	AND OBJTIP = COALESCE(@pOBJTIP,OBJTIP)










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetKapcs]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetKarbLekerdInfo    Script Date: 2000. 07. 04. 18:56:14 ******/
CREATE PROCEDURE sp_GetKarbLekerdInfo
@pID INTEGER
AS
-- A karbantartás lekérdezo képernyon valamely kijelölt sorhoz kiírja
-- az adott objektum megjegyzés mezojét.
SELECT
	coalesce(MEGJ,'-') AS MEGJ
FROM
	OBJEKTUM RIGHT JOIN KARBAN ON OBJEKTUM.ID = KARBAN.OBJID
WHERE
	KARBAN.ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetKarbLekerdInfo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_GetMunkalapObj
@OBJID INTEGER
AS
DECLARE @OBJTIP VARCHAR(2)
SELECT @OBJTIP = OBJTIP FROM OBJEKTUM WHERE ID = @OBJID

DECLARE @FUTOMU_ID INT
DECLARE @FUTOMU_NEV VARCHAR(100)
EXEC @FUTOMU_ID = sp_Rekurziv @OBJID
SELECT @FUTOMU_NEV = MEGNEV
FROM
	OBJEKTUM
WHERE
	ID = @FUTOMU_ID

IF @OBJTIP = '01' OR @OBJTIP = '02' OR @OBJTIP = '37'
	BEGIN
	SELECT
		Q296.KODENEV AS OBJTIP,
		MEGNEV,
		coalesce(Q289.KODENEV,' - ') + ' ' + coalesce(UTCA,' - ') + ' ' + coalesce(HSZ,' - ') + ';' + coalesce(@FUTOMU_NEV, ' - ') AS INFO
	FROM
		Q289 RIGHT JOIN
			(Q296 RIGHT JOIN OBJEKTUM ON Q296.KODERT = OBJEKTUM.OBJTIP)
		ON Q289.KODERT = OBJEKTUM.VAROS
	WHERE
		ID = @OBJID
	END
ELSE
	BEGIN
	SELECT
		Q296.KODENEV AS OBJTIP,
		MEGNEV,
		coalesce(TIPUS, ' - ') + ';' + coalesce(TELEPHSZ, ' - ') + ';'  + coalesce(GYSZAM, ' - ') + ';' + coalesce(@FUTOMU_NEV, ' - ') AS INFO
	FROM
		Q296 RIGHT JOIN OBJEKTUM ON Q296.KODERT = OBJEKTUM.OBJTIP
	WHERE
		ID = @OBJID
	END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetMunkalapObj]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_GetOsszesitoSorsz
@pSORSZ VARCHAR(2)
AS
SELECT
	SOR,
	SORSZ
FROM
	TAB_LABORO
where
	SOR = @pSORSZ


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetOsszesitoSorsz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetPermis    Script Date: 2000. 07. 04. 18:56:14 ******/







CREATE PROCEDURE sp_GetPermis
@pOBJTIP VARCHAR(2)
AS
SELECT
	*
FROM
	PERMIS
WHERE
	OBJTIP = @pOBJTIP
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetPermis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_GetRaktKepvisInfo
@pID INTEGER
AS
SELECT
	NEV,
	CIM,
	LAK_TEL,
	MOB_TEL,
	MUN_TEL,
	MEGB_NEV,
	MEGB_LAK_TEL,
	MEGB_MOB_TEL,
	MEGB_MUN_TEL
FROM
	RAKTKEPVIS
WHERE
	ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetRaktKepvisInfo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_GetSzertetOsszeg    Script Date: 2000. 07. 04. 18:56:14 ******/
CREATE PROCEDURE sp_GetSzertetOsszeg
@SZOLG VARCHAR(1)
AS

DECLARE @PREV_NOTERT REAL	-- Elozo nettó ár
DECLARE @PREV_DATE DATETIME	-- Elozo nettó ár felvitelének idopontja
-- Adott szolgáltatás alatt mi volt utoljára felvive
SELECT @PREV_DATE = max(ERVDAT) FROM ARVALT WHERE SZOLG = @SZOLG
-- Ahhoz a dátumhoz tartozó nettó ár
SELECT @PREV_NOTERT = NOTERT FROM ARVALT WHERE SZOLG = @SZOLG AND ERVDAT = @PREV_DATE

SELECT @PREV_NOTERT









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetSzertetOsszeg]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_GetTeljmSum
@pMUNKALAP_ID INTEGER
AS
DECLARE @MUNORA INTEGER

SELECT @MUNORA = SUM(MUNORA)
FROM
	TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID
WHERE
	MUNKALAP.ID = @pMUNKALAP_ID

IF @MUNORA IS NULL
SELECT @MUNORA = 0

SELECT @MUNORA





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_GetTeljmSum]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_InsArvalt    Script Date: 2000. 07. 04. 18:56:14 ******/
CREATE PROCEDURE sp_InsArvalt
@SZOLG VARCHAR(1),
@NOTERT REAL,
@ERVDAT DATETIME
AS

DECLARE @RET INTEGER	-- Visszatérési érték

BEGIN TRAN

--Amikor új árat visz fel az adott szolgáltatáshoz,
--csak az új ár érvényességi kezdetének dátuma ismert.
--Az elozo ár befejezési dátumát be kell írni, aminek értéke
--az új ár kezdete elotti nap.
DECLARE @PREV_NOTERT REAL	-- Elozo nettó ár
DECLARE @PREV_DATE DATETIME	-- Elozo nettó ár felvitelének idopontja
-- Adott szolgáltatás alatt mi volt utoljára felvive
SELECT @PREV_DATE = max(ERVDAT) FROM ARVALT WHERE SZOLG = @SZOLG
-- Ahhoz a dátumhoz tartozó nettó ár
SELECT @PREV_NOTERT = NOTERT FROM ARVALT WHERE ERVDAT = @PREV_DATE AND SZOLG = @SZOLG
UPDATE ARVALT SET BEFDAT = dateadd(day,-1,@ERVDAT) WHERE ERVDAT = @PREV_DATE AND SZOLG = @SZOLG

INSERT INTO ARVALT(SZOLG, NOTERT, ERVDAT, BEFDAT, FELAR)
SELECT
	@SZOLG,
	@NOTERT,
	@ERVDAT,
	NULL,
	@NOTERT - @PREV_NOTERT

SELECT @RET = @@IDENTITY

COMMIT TRAN

SELECT @RET
RETURN @RET









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsArvalt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_InsDolgozo
@NEV VARCHAR(20) = NULL,
@SZEREGYS VARCHAR(2) = NULL,
@BEOSZT VARCHAR(2) = NULL,
@UFR VARCHAR(1),
@UFW VARCHAR(1),
@UER VARCHAR(1),
@UEW VARCHAR(1)
AS
DECLARE @RET INTEGER
INSERT INTO
	DOLGOZO(NEV,SZEREGYS,BEOSZT,UFR,UFW,UER,UEW)
SELECT
	@NEV,
	@SZEREGYS,
	@BEOSZT,
	@UFR,
	@UFW,
	@UER,
	@UEW

SELECT @RET = @@IDENTITY

SELECT @RET
RETURN @RET















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsDolgozo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_InsEgyediSzlatet
@SZLA_ID INTEGER,
@CIKK VARCHAR(2),
@SZ_MENNY REAL,
@MENNY_ME VARCHAR(3),
@NOTERT REAL,
@OSSZEG REAL,
@AFA VARCHAR(2)
AS
DECLARE @RET INTEGER
DECLARE @PREV_SZLATET INTEGER

BEGIN TRAN

SELECT @PREV_SZLATET = MAX(TET_SORSZ) FROM SZLA_ALT_TET WHERE SZLA_ID = @SZLA_ID
IF @PREV_SZLATET IS NULL SELECT @PREV_SZLATET = 0

INSERT INTO
	SZLA_ALT_TET(SZLA_ID,TET_SORSZ,CIKK,SZ_MENNY,MENNY_ME,NOTERT,OSSZEG,AFA)
SELECT
	@SZLA_ID,
	@PREV_SZLATET + 1,
	@CIKK,
	@SZ_MENNY,
	@MENNY_ME,
	@NOTERT,
	@OSSZEG,
	@AFA

SELECT @RET = @@IDENTITY
SELECT @RET

COMMIT TRAN

RETURN @RET







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsEgyediSzlatet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





/****** Object:  Stored Procedure dbo.sp_InsEpul    Script Date: 2000. 07. 04. 18:56:15 ******/
CREATE PROCEDURE sp_InsEpul
@AZON VARCHAR(15)=NULL,
@IRSZAM INTEGER=NULL,
@VAROS VARCHAR(1)=NULL,
@UTCA VARCHAR(35)=NULL,
@HSZ VARCHAR(3)=NULL,
@EPULNEV VARCHAR(50)=NULL,
@EPULTIP VARCHAR(3)=NULL,
@HELYR VARCHAR(12)=NULL,
@EPULSZ VARCHAR(3)=NULL,
@FUTESMOD VARCHAR(3)=NULL,
@LEGTELTIP VARCHAR(3)=NULL,
@LEGTHELY VARCHAR(2)=NULL,
@EPULATAD VARCHAR(20)=NULL,
@FUTOTIP VARCHAR(3)=NULL,
@UZEMELT VARCHAR(2)=NULL,
@KARBANTAR VARCHAR(3)=NULL,
@EPULHOSZ REAL=NULL,
@LAKTERF REAL=NULL,
@LEPCSOTERF REAL=NULL,
@KOZOSTERF REAL=NULL,
@KOZULTERF REAL=NULL,
@TERF_ARAM REAL=NULL,
@HOLEPCSO VARCHAR(3)=NULL,
@EPUL_ARAM REAL=NULL,
@CIRK_ARAM REAL=NULL,
@FUTBESZAB VARCHAR(3)=NULL,
@CIRKUL VARCHAR(3)=NULL,
@ATKOTES VARCHAR(1)=NULL,
@HMVRENDS VARCHAR(3)=NULL,
@NYOMKUL REAL=NULL,
@CIRK_MOD VARCHAR(3)=NULL,
@FOELZ VARCHAR(2)=NULL,
@FELOSZT VARCHAR(3)=NULL,
@UTEM VARCHAR(2)=NULL
AS

DECLARE @RET INTEGER

INSERT INTO
	OBJEKTUM(OBJTIP,MEGNEV,VAROS,UTCA,HSZ,KAPCSOLT,AZON)
SELECT
	'01',
	@EPULNEV,
	@VAROS,
	@UTCA,
	@HSZ,
	0,	--Alapértelmezés szerint nem kapcsolt
	@AZON

SELECT @RET = @@IDENTITY

INSERT INTO
	EPULET(ID,IRSZAM,EPULTIP,HELYR,EPULSZ,FUTESMOD,LEGTELTIP,
		LEGTHELY,EPULATAD,FUTOTIP,UZEMELT,KARBANTAR,
		EPULHOSZ,LAKTERF,LEPCSOTERF,KOZOSTERF,KOZULTERF,
		TERF_ARAM,HOLEPCSO,EPUL_ARAM,CIRK_ARAM,
		FUTBESZAB,CIRKUL,ATKOTES,HMVRENDS,NYOMKUL,
		CIRK_MOD,FOELZ,FELOSZT,UTEM)
SELECT
	@@IDENTITY,
	@IRSZAM,
	@EPULTIP,
	@HELYR,
	@EPULSZ,
	@FUTESMOD,
	@LEGTELTIP,
	@LEGTHELY,
	CONVERT(datetime,@EPULATAD,20),
	@FUTOTIP,
	@UZEMELT,
	@KARBANTAR,
	@EPULHOSZ,
	@LAKTERF,
	@LEPCSOTERF,
	@KOZOSTERF,
	@KOZULTERF,
	@TERF_ARAM,
	@HOLEPCSO,
	@EPUL_ARAM,
	@CIRK_ARAM,
	@FUTBESZAB,
	@CIRKUL,
	@ATKOTES,
	@HMVRENDS,
	@NYOMKUL,
	@CIRK_MOD,
	@FOELZ,
	@FELOSZT,
	@UTEM

SELECT @RET
RETURN @RET














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsEpul]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_InsJegyz
@KARB_ID INTEGER,
@JTIP VARCHAR(2),
@JDAT DATETIME,
--@VONEV DATETIME
@NEV INTEGER
AS
DECLARE @RET INTEGER

INSERT INTO
	JEGYZ(KARB_ID,JTIP,JDAT,/*VONEV,*/NEV,MSZAM)
SELECT
	@KARB_ID,
	@JTIP,
	@JDAT,
	--@VONEV
	@NEV,
	MUN_SORSZ
FROM
	KARBAN
WHERE
	KARBAN.ID = @KARB_ID
	
SELECT @RET = @@IDENTITY
SELECT @RET

RETURN @RET






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsJegyz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





/****** Object:  Stored Procedure dbo.sp_InsKarban    Script Date: 2000. 07. 04. 18:56:15 ******/
CREATE PROCEDURE sp_InsKarban
@MUN_ID INTEGER
AS

--Lekérdezzük az adott munkalaphoz kapcsolódó teljesítmény adatok
--közül a legutóbbi bejegyzés dátumát
DECLARE @MUNDAT DATETIME
SELECT @MUNDAT=max(TELJM.MUNDAT) FROM TELJM WHERE TELJM.MUNKALAP_ID=@MUN_ID


-- Ha még nem létezik ilyen KARBAN rekord, akkor insert kell.
IF NOT EXISTS(SELECT MUN_SORSZ FROM KARBAN WHERE MUN_SORSZ = @MUN_ID)
BEGIN
	BEGIN TRAN
	--Betesszük a KARBAN táblába az adott munkalapon található adatokat, illetve
	--a fent megállapított dátumot.
	INSERT INTO
		KARBAN(OBJID, OBJTIP, KARBTIP, MUVEL, KDATUM, MUVLEIR, MUN_SORSZ)
	SELECT
		MUNKALAP.OBJID,
		OBJEKTUM.OBJTIP,
		MUNKALAP.KARBTIP,
		MUNKALAP.MUVEL,
		@MUNDAT,
		MUNKALAP.MUVLEIR,
		@MUN_ID
	FROM
		MUNKALAP INNER JOIN OBJEKTUM ON OBJEKTUM.ID = MUNKALAP.OBJID
	WHERE
		MUNKALAP.ID = @MUN_ID
		--AND MUNKALAP.ALLAPOT = 4 AND MUNKALAP.KARBTIP IS NOT NULL
	
	COMMIT TRAN
END
ELSE	--Ha már van ilyen KARBAN rekord, akkor update kell.
BEGIN
	DECLARE @OBJID INTEGER
	DECLARE @OBJTIP VARCHAR(2)
	DECLARE @KARBTIP VARCHAR(2)
	DECLARE @MUVEL VARCHAR(3)
	DECLARE @MUVLEIR VARCHAR(1024)
	
	SELECT
		@OBJID = MUNKALAP.OBJID,
		@OBJTIP = OBJEKTUM.OBJTIP,
		@KARBTIP = MUNKALAP.KARBTIP,
		@MUVEL = MUNKALAP.MUVEL,
		@MUVLEIR = MUNKALAP.MUVLEIR
	FROM
		MUNKALAP INNER JOIN OBJEKTUM ON OBJEKTUM.ID = MUNKALAP.OBJID
	WHERE
		MUNKALAP.ID = @MUN_ID
		
	UPDATE KARBAN
	SET
		OBJID = @OBJID,
		OBJTIP = @OBJTIP,
		KARBTIP = @KARBTIP,
		MUVEL = @MUVEL,
		KDATUM = @MUNDAT,
		MUVLEIR = @MUVLEIR
	WHERE
		MUN_SORSZ = @MUN_ID
END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsKarban]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_InsKarbterv
@OBJID INTEGER = NULL,
@OBJTIP VARCHAR(2),
--@KARBTIP VARCHAR(2),
@MUVEL VARCHAR(3),
@IDOE VARCHAR(2),
@IDO INTEGER
AS

BEGIN TRAN

IF @OBJID IS NULL
	BEGIN

	SET NOCOUNT ON
	
	-- Eloször az adott objektumtípushoz kapcsolt terv(ek)et inaktívvá tesszük.
	UPDATE
		KARBTERV
	SET
		AKTIV=0
	WHERE
		OBJTIP = @OBJTIP
		AND MUVEL = @MUVEL
		
	-- Majd rögzítjük az új tervet az összes ilyen típusú objektumra.
	DECLARE @tmpOBJID INTEGER
	-- Ehhez egy kurzor segítségével lekérdezzük az összes ilyen típusú
	-- objektum ID-jét az OBJEKTUM táblából.
	DECLARE OBJIDcursor CURSOR FAST_FORWARD FOR
	SELECT
		ID
	FROM
		OBJEKTUM
	WHERE
		OBJTIP = @OBJTIP
	
	--Megnyitjuk a kurzort
	OPEN OBJIDcursor

	--Lekérjük az elso rekordot
	FETCH NEXT FROM OBJIDcursor
		INTO @tmpOBJID

	--Amíg van következo rekord
	WHILE @@FETCH_STATUS = 0
		BEGIN
		INSERT INTO
			KARBTERV(OBJID, OBJTIP, /*KARBTIP, */MUVEL, IDOE, IDO,
				AKTIV, ROGZITVE)
		SELECT
			@tmpOBJID,
			@OBJTIP,
			/*@KARBTIP,*/
			@MUVEL,
			@IDOE,
			@IDO,
			1,	-- Alapértelmezés szerint aktív
			GetDate()	-- Rögzítés dátuma
		
		FETCH NEXT FROM OBJIDcursor
			INTO @tmpOBJID
		END	--WHILE

	--Lezárjuk és töröljük a kurzort
	CLOSE OBJIDcursor
	DEALLOCATE OBJIDcursor

	SET NOCOUNT OFF
	END	--IF
ELSE
	BEGIN
	-- Eloször az adott objektumhoz kapcsolt terv(ek)et inaktívvá tesszük.
	UPDATE
		KARBTERV
	SET
		AKTIV=0
	WHERE
		OBJID = @OBJID
		AND MUVEL = @MUVEL
		
	-- Majd rögzítjük az új tervet.
	INSERT INTO
		KARBTERV(OBJID, OBJTIP, /*KARBTIP, */MUVEL, IDOE, IDO,
			AKTIV, ROGZITVE)
	SELECT
		@OBJID,
		@OBJTIP,
		/*@KARBTIP,*/
		@MUVEL,
		@IDOE,
		@IDO,
		1,	-- Alapértelmezés szerint aktív
		GetDate()	-- Rögzítés dátuma
	END
	
COMMIT TRAN




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsKarbterv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_InsKepvis    Script Date: 2000. 07. 04. 18:56:15 ******/
CREATE PROCEDURE sp_InsKepvis
@SZERNEV VARCHAR(50),
@SZERCIM VARCHAR(50),
@SZERIRSZ VARCHAR(4),
@KOZNEV VARCHAR(100),
@KOZCIM VARCHAR(100),
@KOZIRSZ VARCHAR(4),
@MEGJ VARCHAR(1024)
AS
DECLARE @RET INTEGER

INSERT INTO
	KEPVIS(SZERNEV, SZERCIM, SZERIRSZ, KOZNEV, KOZCIM, KOZIRSZ, MEGJ)
SELECT
	@SZERNEV,
	@SZERCIM,
	@SZERIRSZ,
	@KOZNEV,
	@KOZCIM,
	@KOZIRSZ,
	@MEGJ

SELECT @RET = @@IDENTITY
SELECT @RET

RETURN @RET









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsKepvis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_InsKontir    Script Date: 2000. 07. 04. 18:56:15 ******/





CREATE PROCEDURE sp_InsKontir
@FSZAM VARCHAR(12),
@FSZNEV VARCHAR(30)=NULL,
@KIJELOLT VARCHAR(1)='n'
AS

DECLARE @RET INTEGER

INSERT INTO
	KONTIR(FSZAM,FSZNEV,KIJELOLT)
SELECT
	@FSZAM,
	@FSZNEV,
	@KIJELOLT
	
SELECT @RET = @@IDENTITY

SELECT @RET
RETURN @RET









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsKontir]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_InsLabor
@TIPUS VARCHAR(1),
@MUN_SORSZ INTEGER = NULL,
@MINTA_IDO DATETIME = NULL,
@MINTA_NEV INTEGER = NULL,
@MINTA_ATAD_IDO DATETIME = NULL,
@MINTA_ATVEVO INTEGER = NULL,
@VIZSG_NEV INTEGER = NULL,
@VIZSG_KEZD DATETIME = NULL,
@VIZSG_VEGE DATETIME = NULL,
@PH REAL = NULL,
@OXI REAL = NULL,
@ELEKTRO REAL = NULL,
@VAS REAL = NULL,
@KOI REAL = NULL,
@OK REAL = NULL,
@AMMONIA REAL = NULL,
@NITRAT REAL = NULL,
@NITRIT REAL = NULL,
@KULSO VARCHAR(255) = NULL,
@ERTEKELES VARCHAR(255) = NULL
AS

DECLARE @RET INTEGER
BEGIN TRAN
INSERT INTO
	LABOR(TIPUS,MUN_SORSZ,MINTA_IDO,MINTA_NEV,
		MINTA_ATAD_IDO,MINTA_ATVEVO,
		VIZSG_NEV,VIZSG_KEZD,VIZSG_VEGE,
		PH,OXI,ELEKTRO,VAS,
		KOI,OK,AMMONIA,NITRAT,NITRIT,
		KULSO,ERTEKELES)
SELECT
	@TIPUS,
	@MUN_SORSZ,
	@MINTA_IDO,
	@MINTA_NEV,
	@MINTA_ATAD_IDO,
	@MINTA_ATVEVO,
	@VIZSG_NEV,
	@VIZSG_KEZD,
	@VIZSG_VEGE,
	@PH,
	@OXI,
	@ELEKTRO,
	@VAS,
	@KOI,
	@OK,
	@AMMONIA,
	@NITRAT,
	@NITRIT,
	@KULSO,
	@ERTEKELES

SELECT @RET = @@IDENTITY

UPDATE
	LABOR
SET
	SORSZ = @RET
WHERE
	ID = @RET

/*UPDATE MUNKALAP
SET
	MUVLEIR = 'Jegyzokönyv száma: ' + CONVERT(VARCHAR(12),@RET),
	ALLAPOT = 4, --visszaerkezett
	ADATUM  = GetDate(),
	AKOD = User_Name()
WHERE
	ID = @MUN_SORSZ
*/

COMMIT TRAN
SELECT @RET
RETURN @RET


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsLabor]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_InsMunkalap
@MTIP VARCHAR(1),
@BEJDAT DATETIME=NULL,
@BEJNEV VARCHAR(40)=NULL,
@TIPUSH VARCHAR(3)=NULL,
@HIBLEIR VARCHAR (1024)=NULL,
@SZEREGYS VARCHAR(2)=NULL,
@MFDOLG INTEGER=NULL,
@MUNELV DATETIME=NULL,
@IDOTOL VARCHAR(10)=NULL,
@IDOIG VARCHAR(10)=NULL,
@SZOLGTIP VARCHAR(2)=NULL,
@MUNVEGZ VARCHAR(2)=NULL,
@SZOLGJELL VARCHAR(2)=NULL,
@OBJID INTEGER=NULL,
@KARBTIP VARCHAR(1)=NULL,
@MUVEL VARCHAR(3)=NULL,
@FELTIP VARCHAR(2)=NULL,
@FELLEIR VARCHAR(1024)=NULL,
@JELENSTIP VARCHAR(2)=NULL,
@JELENSLEIR VARCHAR(1024)=NULL,
@MUVLEIR VARCHAR(1024)=NULL,
@INTEZ VARCHAR(1024)=NULL,
@VONEV DATETIME=NULL,
@SORSZ VARCHAR(50)=NULL,
@NAPSZAM VARCHAR(50)=NULL,
@KIALLDAT DATETIME=NULL,
@FSZAM VARCHAR(12)=NULL,
@SZOLTIP VARCHAR(1)=NULL,
@MUNSZ VARCHAR(2)=NULL,
@MKAP INTEGER=NULL,
@ALLAPOT INTEGER=NULL,
@EPUL_ID INTEGER=NULL,
@MVDOLG INTEGER=NULL,
@MVDAT DATETIME=NULL,
@LAKAS VARCHAR(50)=NULL,
@PLOMBAZAS VARCHAR(1)=NULL,
@UJ VARCHAR(10)=NULL,
@FELUJITOTT VARCHAR(10)=NULL
AS
DECLARE @OBJ INTEGER	--Az objid mezoben ezt tároljuk majd el.

IF @EPUL_ID IS NOT NULL	--Ha épület id-t kell tárolni
BEGIN
	SELECT @OBJ = @EPUL_ID
END
ELSE	--Ha egyéb objektum id-t kell tárolni
BEGIN
	SELECT @OBJ = @OBJID
END

DECLARE @RET INTEGER
INSERT INTO
	MUNKALAP(MTIP, BEJDAT, BEJNEV, TIPUSH, HIBLEIR, SZEREGYS, MFDOLG, MUNELV,
		IDOTOL, IDOIG, SZOLGTIP, MUNVEGZ, SZOLGJELL, OBJID, KARBTIP, MUVEL, FELTIP,
		FELLEIR, JELENSTIP, JELENSLEIR, MUVLEIR, INTEZ, VONEV, SORSZ, NAPSZAM,
		KIALLDAT, FSZAM, SZOLTIP, MUNSZ, MKAP, ALLAPOT, MVDOLG, MVDAT, LAKAS, REF, PLOMBAZAS,
		UJ, FELUJITOTT)
		
SELECT
	@MTIP,
	@BEJDAT,
	@BEJNEV,
	@TIPUSH,
	@HIBLEIR,
	@SZEREGYS,
	@MFDOLG,
	@MUNELV,
	@IDOTOL,
	@IDOIG,
	@SZOLGTIP,
	@MUNVEGZ,
	@SZOLGJELL,
	@OBJ,	--Lakás, épület vagy egyéb objektum id-je.
	@KARBTIP,
	@MUVEL,
	@FELTIP,
	@FELLEIR,
	@JELENSTIP,
	@JELENSLEIR,
	@MUVLEIR,
	@INTEZ,
	@VONEV,
	@SORSZ,
	@NAPSZAM,
	@KIALLDAT,
	@FSZAM,
	@SZOLTIP,
	@MUNSZ,
	@MKAP,
	@ALLAPOT,
	@MVDOLG,
	@MVDAT,
	@LAKAS,
	NULL,
	@PLOMBAZAS,
	@UJ,
	@FELUJITOTT

SELECT @RET = @@IDENTITY

IF @SORSZ IS NULL
	BEGIN
	UPDATE
		MUNKALAP
	SET
		SORSZ = @RET
	WHERE
		ID = @RET
	END

SELECT @RET
RETURN @RET






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsMunkalap]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_InsObjAlt
@pOBJTIP VARCHAR(2),
@AZON VARCHAR(8)=NULL,
@MEGNEV VARCHAR(50)=NULL,
@TIPUS VARCHAR(20)=NULL,
@VAROS VARCHAR(1)=NULL,
@UTCA VARCHAR(35)=NULL,
@HSZ VARCHAR(3)=NULL,
@ELHELYEZ VARCHAR(25)=NULL,
@GYSZAM VARCHAR(15)=NULL,
@GYARTO VARCHAR(3)=NULL,
@UZALL VARCHAR(1)=NULL,
@UZEMIDO VARCHAR(20)=NULL,
@HITIDO DATETIME=NULL,
@GYARTM DATETIME=NULL,
@TELEPHSZ VARCHAR(20)=NULL,
@VESZO VARCHAR(1)=NULL,
@FKOD VARCHAR(3)=NULL,
@ALAIR VARCHAR(3)=NULL,
@NEVLTELJ REAL=NULL,
@NEVLTELJME VARCHAR(3)=NULL,
@KATEG VARCHAR(2)=NULL,
@FSZAM VARCHAR(12)=NULL,
@MEGJ VARCHAR(255)=NULL,
@AKTIV VARCHAR(1)='y'
AS

DECLARE @RET INTEGER

INSERT INTO
	OBJEKTUM(OBJTIP,AZON,MEGNEV,TIPUS,VAROS,UTCA,HSZ,
		ELHELYEZ,GYSZAM,GYARTO,UZALL,UZEMIDO,HITIDO,
		GYARTM,TELEPHSZ,VESZO,FKOD,ALAIR,NEVLTELJ,
		NEVLTELJME,KATEG,FSZAM,MEGJ,KAPCSOLT,AKTIV)
SELECT
	@pOBJTIP,
	@AZON,
	@MEGNEV,
	@TIPUS,
	@VAROS,
	@UTCA,
	@HSZ,
	@ELHELYEZ,
	@GYSZAM,
	@GYARTO,
	@UZALL,
	@UZEMIDO,
	@HITIDO,
	@GYARTM,
	@TELEPHSZ,
	@VESZO,
	@FKOD,
	@ALAIR,
	@NEVLTELJ,
	@NEVLTELJME,
	@KATEG,
	@FSZAM,
	@MEGJ,
	0,	--Alapértelmezés szerint nem kapcsolt
	@AKTIV

SELECT @RET = @@IDENTITY

IF @pOBJTIP='01'
BEGIN
 INSERT INTO EPULET(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='02'
BEGIN
 INSERT INTO LAKAS(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='03'
BEGIN
 INSERT INTO FUTOMU(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='04'
BEGIN
 INSERT INTO KAZAN(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='05'
BEGIN
 INSERT INTO KAZANEGO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='06'
BEGIN
 INSERT INTO SZIVATTYU(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='07'
BEGIN
 INSERT INTO HOCSERELO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='08'
BEGIN
 INSERT INTO VENTILLATOR(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='09'
BEGIN
 INSERT INTO BOYLER(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='10'
BEGIN
 INSERT INTO MELEGVIZ_TAROLO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='11'
BEGIN
 INSERT INTO TARTALY(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='12'
BEGIN
 INSERT INTO SZUROK(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='13'
BEGIN
 INSERT INTO VIZLAGYITO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='14'
BEGIN
 INSERT INTO KOMPRESSZOR(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='15'
BEGIN
 INSERT INTO TERMELO_CSO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='16'
BEGIN
 INSERT INTO DEMAG_EMELOGEP(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='17'
BEGIN
 INSERT INTO HOKOZPONT(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='18'
BEGIN
 INSERT INTO HOOSSZEGZO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='19'
BEGIN
 INSERT INTO VIZORA(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='20'
BEGIN
 INSERT INTO ERZEKELO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='21'
BEGIN
 INSERT INTO FOKAPCSOLO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='22'
BEGIN
 INSERT INTO FAZISJAVITO_KONDENZATOR(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='23'
BEGIN
 INSERT INTO GAZVESZELY_JELZO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='24'
BEGIN
 INSERT INTO MOTOR(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='25'
BEGIN
 INSERT INTO SZINTKAPCSOLO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='26'
BEGIN
 INSERT INTO SZABALYOZO_AUTOMATIKA(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='27'
BEGIN
 INSERT INTO SZABALYOZO_SZELEP(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='28'
BEGIN
 INSERT INTO BIZTONSAGI_SZELEP(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='29'
BEGIN
 INSERT INTO FREKVENCIAVALTO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='30'
BEGIN
 INSERT INTO ARAMKOR(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='31'
BEGIN
 INSERT INTO KOLTSEGMEGOSZTO(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='32'
BEGIN
 INSERT INTO TARCSA(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='33'
BEGIN
 INSERT INTO HAJTOMU(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='34'
BEGIN
 INSERT INTO LANGOR(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='35'
BEGIN
 INSERT INTO TERMALKUT(ID)
 SELECT @RET
END
ELSE IF @pOBJTIP='36'
BEGIN
 INSERT INTO SZERELVENY(ID)
 SELECT @RET
END
/*ELSE IF @pOBJTIP='37'
BEGIN
 INSERT INTO LEPCSOHAZ(ID)
 SELECT @RET
END*/

SELECT @RET
RETURN @RET



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsObjAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_InsRaktarKepv
@ID INTEGER=NULL,
@NEV VARCHAR(50),
@CIM VARCHAR(100)=NULL,
@LAK_TEL VARCHAR(20)=NULL,
@MOB_TEL VARCHAR(20)=NULL,
@MUN_TEL VARCHAR(20)=NULL,
@MEGB_NEV VARCHAR(50),
@MEGB_LAK_TEL VARCHAR(20)=NULL,
@MEGB_MOB_TEL VARCHAR(20)=NULL,
@MEGB_MUN_TEL VARCHAR(20)=NULL
AS
IF @ID IS NULL
	BEGIN
	INSERT INTO
		RAKTKEPVIS(NEV,CIM,LAK_TEL,MOB_TEL,MUN_TEL,
			MEGB_NEV,MEGB_LAK_TEL,MEGB_MOB_TEL,MEGB_MUN_TEL)
	SELECT
		@NEV,
		@CIM,
		@LAK_TEL,
		@MOB_TEL,
		@MUN_TEL,
		@MEGB_NEV,
		@MEGB_LAK_TEL,
		@MEGB_MOB_TEL,
		@MEGB_MUN_TEL
	END
ELSE
	BEGIN
	EXEC sp_UpdRaktarKepv @ID, @NEV, @CIM, @LAK_TEL, @MOB_TEL, @MUN_TEL, @MEGB_NEV, @MEGB_LAK_TEL, @MEGB_MOB_TEL, @MEGB_MUN_TEL
	END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsRaktarKepv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_InsSzerzfej    Script Date: 2000. 07. 04. 18:56:16 ******/
CREATE PROCEDURE sp_InsSzerzfej
@PAZ VARCHAR(8),
@SZETIP VARCHAR(1),
@SZEJEL VARCHAR(2),
@SZEKELT DATETIME,
@ERVDAT DATETIME,
@FIZMOD VARCHAR(1),
@SZERTAR VARCHAR(1024),
@SZOLG VARCHAR(2),
@BEFDAT DATETIME,
@SZERSZ VARCHAR(8),
@SZLA_CIKL INTEGER,
@JEL VARCHAR(1),
@SZJ VARCHAR(12),
@UGYFN VARCHAR(100),
@UGYFC VARCHAR(100)
AS
DECLARE @RET INTEGER

DECLARE @ARVALT_ID INTEGER
DECLARE @PREV_DATE DATETIME	-- Elozo nettó ár érvényességének idopontja
-- Adott szolgáltatás alatt melyik a legutóbbi ervényességi dátumú
SELECT @PREV_DATE = MAX(ERVDAT) FROM ARVALT WHERE SZOLG = @SZOLG
-- Ahhoz a dátumhoz tartozó id
SELECT @ARVALT_ID = ID FROM ARVALT WHERE ERVDAT = @PREV_DATE AND SZOLG = @SZOLG

INSERT INTO
	SZERZFEJ(PAZ,SZETIP,SZEJEL,SZEKELT,ERVDAT,FIZMOD,SZERTAR,SZOLG,BEFDAT,
		SZERSZ,SZLA_CIKL,JEL,SZJ,UGYFN,UGYFC)
SELECT
	@PAZ,
	@SZETIP,
	@SZEJEL,
	@SZEKELT,
	@ERVDAT,
	@FIZMOD,
	@SZERTAR,
	@ARVALT_ID,
	@BEFDAT,
	@SZERSZ,
	@SZLA_CIKL,
	@JEL,
	@SZJ,
	@UGYFN,
	@UGYFC

SELECT @RET = @@IDENTITY
SELECT @RET

RETURN @RET









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsSzerzfej]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_InsSzerztet    Script Date: 2000. 07. 04. 18:56:16 ******/
CREATE PROCEDURE sp_InsSzerztet
@SZER_ID INTEGER,
@OBJ_ID INTEGER,
@CIKK VARCHAR(2),
@CIKK_MENNY REAL,
@SZ_MENNY REAL,
@MENNY_ME VARCHAR(3),
@OSSZEG REAL,
@AFA VARCHAR(2)
AS
DECLARE @RET INTEGER
DECLARE @PREV_SZERTET INTEGER

BEGIN TRAN

SELECT @PREV_SZERTET = MAX(SZERTET) FROM SZERZTEL WHERE SZER_ID = @SZER_ID
IF @PREV_SZERTET IS NULL SELECT @PREV_SZERTET = 0

INSERT INTO
	SZERZTEL(SZER_ID,SZERTET,OBJ_ID,CIKK,CIKK_MENNY,SZ_MENNY,MENNY_ME,OSSZEG,AFA)
SELECT
	@SZER_ID,
	@PREV_SZERTET + 1,
	@OBJ_ID,
	@CIKK,
	@CIKK_MENNY,
	@SZ_MENNY,
	@MENNY_ME,
	@OSSZEG,
	@AFA

SELECT @RET = @@IDENTITY
SELECT @RET

COMMIT TRAN

RETURN @RET








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsSzerztet]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_InsSzlaEgyedi
@SZERZSZ VARCHAR(8) = NULL,
@FIZMOD VARCHAR(1),
@TDAT DATETIME,
@KDAT DATETIME,
@FDAT DATETIME,
@JEL VARCHAR(1),
@SZJ VARCHAR(12) = NULL,
@SZERTAR VARCHAR(1024) = NULL,
@UGYFN VARCHAR(100) = NULL,
@UGYFC VARCHAR(100) = NULL
AS

BEGIN TRAN

DECLARE @RET INTEGER

DECLARE @MAX_SZLASZ INTEGER
SELECT @MAX_SZLASZ = MAX(SZLASZ) FROM SZLA_ALT
IF @MAX_SZLASZ IS NULL
	BEGIN
	SELECT @MAX_SZLASZ = 0
	END

INSERT INTO
	SZLA_ALT(SZLASZ,SZERZSZ,FIZMOD,TDAT,KDAT,FDAT,JEL,SZJ,SZERTAR,UGYFN,UGYFC,EGYEDI)
SELECT
	@MAX_SZLASZ + 1,
	@SZERZSZ,
	@FIZMOD,
	@TDAT,
	@KDAT,
	@FDAT,
	@JEL,
	@SZJ,
	@SZERTAR,
	@UGYFN,
	@UGYFC,
	1

COMMIT TRAN

SELECT @RET = @@IDENTITY
SELECT @RET

RETURN @RET







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsSzlaEgyedi]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_InsTeljm    Script Date: 2000. 07. 04. 18:56:16 ******/
CREATE PROCEDURE sp_InsTeljm
@MUNKALAP_ID INTEGER,
@DOLG_ID INTEGER,
@MUNORA REAL=NULL,
@MUNDAT DATETIME=NULL
AS

DECLARE @RET INTEGER

INSERT INTO
	TELJM(MUNKALAP_ID,DOLG_ID,MUNORA,MUNDAT)
SELECT
	@MUNKALAP_ID,
	@DOLG_ID,
	@MUNORA,
	@MUNDAT

SELECT @RET = @@IDENTITY

UPDATE
	MUNKALAP
SET
	ALLAPOT = 4
WHERE
	ID = @MUNKALAP_ID

SELECT @RET
RETURN @RET









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_InsTeljm]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Jegyzokonyv
@pJTIP VARCHAR(2),
@pID INTEGER
AS

IF @pJTIP = '1'
	BEGIN	--Homennyiség ellenorzo lap
	SELECT
		JEGYZSZ,
		JDAT,
		coalesce(VAROS,'-') + ' ' + coalesce(UTCA,'-') + ' ' + coalesce(HSZ,'-') AS CIM,
		coalesce(TIPUS,'-') AS TIPUS,
		coalesce(GYSZAM,'-') AS GYSZAM
	FROM
		OBJEKTUM RIGHT JOIN
			(JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID)
		ON OBJEKTUM.ID = KARBAN.OBJID
	WHERE JEGYZSZ = @pID
	END
	
ELSE IF @pJTIP = '2'
	BEGIN	--Biztonsági szelep beállítási jegyzokönyv
	DECLARE @SZELEP_ID INTEGER
	DECLARE @KAZAN_ID INTEGER
	DECLARE @KAZAN_GYSZAM VARCHAR(15)
	DECLARE @KAZAN_TIPUS VARCHAR(20)
	DECLARE @KAZAN_TELEPHSZ VARCHAR(20)
	DECLARE @FUTOMU_ID INTEGER
	DECLARE @FUTOMU_NEV VARCHAR(50)
	
	--Lekérdezzük a szelep ID-jét
	SELECT @SZELEP_ID = OBJID FROM JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID WHERE JEGYZSZ = @pID
	
	--Lekérdezzük a szelep fölött álló kazán ID-jét, majd annak tulajdonságait.
	EXEC @KAZAN_ID = sp_Rekurziv @SZELEP_ID, '04'
	SELECT
		@KAZAN_GYSZAM = GYSZAM,
		@KAZAN_TIPUS = TIPUS,
		@KAZAN_TELEPHSZ = TELEPHSZ
	FROM
		OBJEKTUM
	WHERE
		ID = @KAZAN_ID
	
	--Lekérdezzük a szelep fölött álló futomu ID-jét, majd annak nevét.
	EXEC @FUTOMU_ID = sp_Rekurziv @SZELEP_ID
	SELECT
		@FUTOMU_NEV = MEGNEV
	FROM
		OBJEKTUM
	WHERE
		ID = @FUTOMU_ID
		
	-- Ez már maga a jegyzokönyvhöz szükséges adathalmaz...
	SELECT
		JEGYZSZ,
		JDAT,
		--coalesce(TIPUS,'-') AS TIPUS,
		--coalesce(VAROS,'-') + ' ' + coalesce(UTCA,'-') + ' ' + coalesce(HSZ,'-') AS CIM,
		coalesce(@FUTOMU_NEV,'-') AS CIM,
		coalesce(GYSZAM,'-') AS GYSZAM,
		coalesce(@KAZAN_TIPUS,'-') AS K_TIPUS,
		coalesce(@KAZAN_GYSZAM,'-') AS K_GYSZAM,
		coalesce(@KAZAN_TELEPHSZ,'-') AS K_TELEPHSZ
	FROM
		OBJEKTUM RIGHT JOIN
			(JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID)
		ON OBJEKTUM.ID = KARBAN.OBJID
	WHERE JEGYZSZ = @pID
	END

ELSE IF @pJTIP = '3'
	BEGIN	--Hideg -és melegüzemi vizsgálat jegyzokönyve
	DECLARE @EGO_ID INTEGER
	
	--Lekérdezzük a kazánégo ID-jét
	SELECT
		@EGO_ID = OBJID
	FROM
		JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID
	WHERE
		JEGYZ.JEGYZSZ = @pID
	
	--Lekérdezzük a kazán ID-jét
	SELECT @KAZAN_ID = ID1 FROM KAPCSOLAT WHERE ID2 = @EGO_ID
	
	--Lekérdezzük a kazán tulajdonságait
	SELECT
		@KAZAN_TIPUS = TIPUS,
		@KAZAN_GYSZAM = GYSZAM
	FROM
		OBJEKTUM
	WHERE
		OBJEKTUM.ID = @KAZAN_ID
	
	--Lekérdezzük a kazán fölött álló futomu ID-jét, majd annak nevét.
	EXEC @FUTOMU_ID = sp_Rekurziv @EGO_ID
	SELECT
		@FUTOMU_NEV = MEGNEV
	FROM
		OBJEKTUM
	WHERE
		ID = @FUTOMU_ID
	
	-- Ez már maga a jegyzokönyvhöz szükséges adathalmaz...
	SELECT
		coalesce(@FUTOMU_NEV,'-') AS FUTOMU_CIM,
		JEGYZSZ,
		JEGYZSZ AS JEGYZSZ2,
		JDAT,
		coalesce(Q349.KODENEV,'-') AS GAZMIN,
		coalesce(Q350.KODENEV,'-') AS GAZMAX,
		coalesce(Q351.KODENEV,'-') AS EGMIN,
		coalesce(Q352.KODENEV,'-') AS POROLAJ_MIN,
		coalesce(Q353.KODENEV,'-') AS PORLEV_MIN,
		coalesce(Q354.KODENEV,'-') AS PORGOZ_MIN,
		coalesce(Q355.KODENEV,'-') AS GOZMAX,
		coalesce(Q356.KODENEV,'-') AS VIZMAX,
		coalesce(Q357.KODENEV,'-') AS VESZVIZ_MIN,
		coalesce(Q358.KODENEV,'-') AS FUSTCSAP_RET,
		coalesce(Q359.KODENEV,'-') AS EGYEB_RET,
		coalesce(Q360.KODENEV,'-') AS KETPONTSZAB,
		coalesce(Q361.KODENEV,'-') AS HAROMPONTSZAB,
		coalesce(Q362.KODENEV,'-') AS FOLYSZAB,
		coalesce(Q363.KODENEV,'-') AS EGYEB,
		coalesce(Q364.KODENEV,'-') AS FUST_TOM,
		coalesce(MSZAM,'-') AS MSZAM,
		coalesce(DOLGOZO.NEV,'-') AS NEV,
		coalesce(VAROS,'-') + ' ' + coalesce(UTCA,'-') + ' ' + coalesce(HSZ,'-') AS CIM,
		KDATUM,
		coalesce(TIPUS,'-') AS EGO_TIPUS,
		coalesce(GYSZAM,'-') AS EGO_GYSZAM,
		coalesce(SZABMOD,'-') AS EGO_SZABMOD,
		coalesce(@KAZAN_TIPUS,'-') AS TIPUS,
		coalesce(@KAZAN_GYSZAM,'-') AS GYSZAM,
		coalesce(OBJEKTUM.TELEPHSZ,'-') AS TELEPHSZ
	FROM
		Q364 RIGHT JOIN
			(Q363 RIGHT JOIN
				(Q362 RIGHT JOIN
					(Q361 RIGHT JOIN
						(Q360 RIGHT JOIN
							(Q359 RIGHT JOIN
								(Q358 RIGHT JOIN
									(Q357 RIGHT JOIN
										(Q356 RIGHT JOIN
											(Q355 RIGHT JOIN
												(Q354 RIGHT JOIN
													(Q353 RIGHT JOIN
														(Q352 RIGHT JOIN
															(Q351 RIGHT JOIN
																(Q350 RIGHT JOIN
																	(Q349 RIGHT JOIN
																		(DOLGOZO RIGHT JOIN
																			(KAZANEGO RIGHT JOIN
																				(OBJEKTUM RIGHT JOIN
																					(JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID)
																				ON OBJEKTUM.ID = KARBAN.OBJID)
																			ON KAZANEGO.ID = OBJEKTUM.ID)
																		ON DOLGOZO.ID = JEGYZ.NEV)
																	ON Q349.KODERT = KAZANEGO.GAZMIN)
																ON Q350.KODERT = KAZANEGO.GAZMAX)
															ON Q351.KODERT = KAZANEGO.EGMIN)
														ON Q352.KODERT = KAZANEGO.POROLAJ_MIN)
													ON Q353.KODERT = KAZANEGO.PORLEV_MIN)
												ON Q354.KODERT = KAZANEGO.PORGOZ_MIN)
											ON Q355.KODERT = KAZANEGO.GOZMAX)
										ON Q356.KODERT = KAZANEGO.VIZMAX)
									ON Q357.KODERT = KAZANEGO.VESZVIZ_MIN)
								ON Q358.KODERT = KAZANEGO.FUSTCSAP_RET)
							ON Q359.KODERT = KAZANEGO.EGYEB_RET)
						ON Q360.KODERT = KAZANEGO.KETPONTSZAB)
					ON Q361.KODERT = KAZANEGO.HAROMPONTSZAB)
				ON Q362.KODERT = KAZANEGO.FOLYSZAB)
			ON Q363.KODERT = KAZANEGO.EGYEB)
		ON Q364.KODERT = KAZANEGO.FUST_TOM
	WHERE
		JEGYZSZ = @pID
	END

ELSE IF @pJTIP = '4'
	BEGIN	--Házi víznyomáspróba jegyzokönyve

	--Lekérdezzük a kazán ID-jét
	SELECT @KAZAN_ID = OBJID FROM JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID WHERE JEGYZSZ = @pID

	--Lekérdezzük a szelep fölött álló futomu ID-jét, majd annak nevét.
	EXEC @FUTOMU_ID = sp_Rekurziv @KAZAN_ID
	SELECT
		@FUTOMU_NEV = MEGNEV
	FROM
		OBJEKTUM
	WHERE
		ID = @FUTOMU_ID
		
	SELECT
		JEGYZSZ,
		JDAT,
		coalesce(TIPUS,'-') AS TIPUS,
		coalesce(GYSZAM,'-') AS GYSZAM,
		coalesce(TELEPHSZ,'-') AS TELEPHSZ,
		--coalesce(VAROS,'-') + ' ' + coalesce(UTCA,'-') + ' ' + coalesce(HSZ,'-') AS CIM,
		coalesce(@FUTOMU_NEV,'-') AS CIM,
		coalesce(UZEMINYOM,0.0) AS UZEMINYOM
	FROM
		KAZAN RIGHT JOIN
			(OBJEKTUM RIGHT JOIN
				(JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID)
			ON OBJEKTUM.ID = KARBAN.OBJID)
		ON KAZAN.ID = KARBAN.OBJID
	WHERE
		JEGYZSZ = @pID
	END

ELSE IF @pJTIP = '8'
	BEGIN	--Vízmintaveteli jegyzokönyv

	SELECT
		@FUTOMU_ID = OBJID
	FROM
		MUNKALAP INNER JOIN LABOR ON MUNKALAP.ID = LABOR.MUN_SORSZ
	WHERE
		LABOR.ID = @pID
		
	SELECT
		@FUTOMU_NEV = MEGNEV
	FROM
		OBJEKTUM
	WHERE
		ID = @FUTOMU_ID
		
	SELECT
		SORSZ,
		Q370.KODENEV AS TIPUS,
		MUN_SORSZ,
		@FUTOMU_NEV AS FUTOMU,
		MINTA_IDO,
		MINTANEV.NEV AS MINTA_NEV,
		MINTA_ATAD_IDO,
		ATVEVONEV.NEV AS MINTA_ATVEVO,
		VIZSGNEV.NEV AS VIZSG_NEV,
		VIZSG_KEZD,
		VIZSG_VEGE,
		PH,
		OXI,
		ELEKTRO,
		VAS,
		KOI,
		OK,
		AMMONIA,
		NITRAT,
		NITRIT,
		KULSO,
		ERTEKELES,
		CONVERT(VARCHAR(20),VIZSG_VEGE,102) AS DATUM
	FROM
		Q370 RIGHT JOIN
			(Q334 MINTANEV RIGHT JOIN
				(Q334 ATVEVONEV RIGHT JOIN
					(Q334 VIZSGNEV RIGHT JOIN LABOR ON VIZSGNEV.ID = LABOR.VIZSG_NEV)
				ON ATVEVONEV.ID = LABOR.MINTA_ATVEVO)
			ON MINTANEV.ID = LABOR.MINTA_NEV)
		ON Q370.KODERT = LABOR.TIPUS
	WHERE
		LABOR.ID = @pID
	END
	


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Jegyzokonyv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Kapcsol
@pID1 INTEGER,
@pID2 INTEGER
AS

INSERT INTO
	KAPCSOLAT(ID1, ID2)
SELECT
	@pID1,
	@pID2

UPDATE
	OBJEKTUM
SET
	KAPCSOLT=1,
	ELOZOKAPCS = NULL,
	ELOZOKAPCSDATE = NULL
WHERE
	ID = @pID2


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Kapcsol]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LaborOsszesito
@pDATUM AS VARCHAR(20)
AS
SELECT
	--CONVERT(VARCHAR(10),GetDate(),102) + '.' AS DATUM,
	@pDATUM AS DATUM,
	*
FROM
	QLABOR1 FULL JOIN
	(QLABOR2 FULL JOIN
	(QLABOR3 FULL JOIN
	(QLABOR4 FULL JOIN
	(QLABOR5 FULL JOIN
	(QLABOR6 FULL JOIN
	(QLABOR7 FULL JOIN
	(QLABOR8 FULL JOIN
	(QLABOR9 FULL JOIN
	(QLABOR10 FULL JOIN
	(QLABOR11 FULL JOIN
	(QLABOR12 FULL JOIN
	(QLABOR13 FULL JOIN
	(QLABOR14 FULL JOIN
	(QLABOR15 FULL JOIN
	(QLABOR16 FULL JOIN
	(QLABOR17 FULL JOIN
	(QLABOR18 FULL JOIN
	(QLABOR19 FULL JOIN
	(QLABOR20 FULL JOIN
	(QLABOR21 FULL JOIN
	(QLABOR22 FULL JOIN
	(QLABOR23 FULL JOIN
	(QLABOR24 FULL JOIN
	QLABOR25
	ON QLABOR25.MUN25 <> QLABOR24.MUN24)
	ON QLABOR24.MUN24 <> QLABOR23.MUN23)
	ON QLABOR23.MUN23 <> QLABOR22.MUN22)
	ON QLABOR22.MUN22 <> QLABOR21.MUN21)
	ON QLABOR21.MUN21 <> QLABOR20.MUN20)
	ON QLABOR20.MUN20 <> QLABOR19.MUN19)
	ON QLABOR19.MUN19 <> QLABOR18.MUN18)
	ON QLABOR18.MUN18 <> QLABOR17.MUN17)
	ON QLABOR17.MUN17 <> QLABOR16.MUN16)
	ON QLABOR16.MUN16 <> QLABOR15.MUN15)
	ON QLABOR15.MUN15 <> QLABOR14.MUN14)
	ON QLABOR14.MUN14 <> QLABOR13.MUN13)
	ON QLABOR13.MUN13 <> QLABOR12.MUN12)
	ON QLABOR12.MUN12 <> QLABOR11.MUN11)
	ON QLABOR11.MUN11 <> QLABOR10.MUN10)
	ON QLABOR10.MUN10 <> QLABOR9.MUN9)
	ON QLABOR9.MUN9 <> QLABOR8.MUN8)
	ON QLABOR8.MUN8 <> QLABOR7.MUN7)
	ON QLABOR7.MUN7 <> QLABOR6.MUN6)
	ON QLABOR6.MUN6 <> QLABOR5.MUN5)
	ON QLABOR5.MUN5 <> QLABOR4.MUN4)
	ON QLABOR4.MUN4 <> QLABOR3.MUN3)
	ON QLABOR3.MUN3 <> QLABOR2.MUN2)
	ON QLABOR2.MUN2 <> QLABOR1.MUN1


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LaborOsszesito]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LekerdAlt
@pOBJTIP VARCHAR(2),
@pID INTEGER=NULL,
@HOTELJTOL REAL=NULL,
@HOTELJIG REAL=NULL,
@NEVLTELJTOL REAL=NULL,
@NEVLTELJIG REAL=NULL,
@GAZCSUCSTOL REAL=NULL,
@GAZCSUCSIG REAL=NULL,
@VILLCSUCSNYTOL REAL=NULL,
@VILLCSUCSNYIG REAL=NULL,
@VILLCSUCSTTOL REAL=NULL,
@VILLCSUCSTIG REAL=NULL,
@TERFARAMTOL REAL=NULL,
@TERFARAMIG REAL=NULL,
@HOMERSTOL REAL=NULL,
@HOMERSIG REAL=NULL,
@PRIM_ARAMTOL REAL=NULL,
@PRIM_ARAMIG REAL=NULL,
@SZEKU_TOMTOL REAL=NULL,
@SZEKU_TOMIG REAL=NULL,
@VIZATMEROTOL REAL=NULL,
@VIZATMEROIG REAL=NULL,
@VIZIMPULZUSTOL REAL=NULL,
@VIZIMPULZUSIG REAL=NULL,
@ERZVEZTOL REAL=NULL,
@ERZVEZIG REAL=NULL,
@ERZBENYTOL REAL=NULL,
@ERZBENYIG REAL=NULL,
@HOOSZIMPTOL REAL=NULL,
@HOOSZIMPIG REAL=NULL,
@329 VARCHAR(2)=NULL,
@278 VARCHAR(3)=NULL,
@277 VARCHAR(3)=NULL,
@281 VARCHAR(3)=NULL,
@274 VARCHAR(3)=NULL
AS

IF @pOBJTIP	= '01'
BEGIN
	SELECT
		OBJEKTUM.ID,
		MEGNEV,
		Q289.KODENEV AS	VAROS,
		UTCA,
		HSZ,
		--AZON,
		IRSZAM,
		Q274.KODENEV AS	EPULTIP,
		HELYR,
		EPULSZ,
		Q275.KODENEV AS	FUTESMOD,
		Q276.KODENEV AS	LEGTELTIP,
		Q328.KODENEV AS	LEGTHELY,
		EPULATAD,
		Q277.KODENEV AS	FUTOTIP,
		Q329.KODENEV AS	UZEMELT,
		Q278.KODENEV AS	KARBANTAR,
		EPULHOSZ,
		LAKTERF,
		LEPCSOTERF,
		KOZOSTERF,
		KOZULTERF,
		TERF_ARAM,
		Q272.KODENEV AS	HOLEPCSO,
		EPUL_ARAM,
		CIRK_ARAM,
		Q281.KODENEV AS	FUTBESZAB,
		Q282.KODENEV AS	CIRKUL,
		CASE ATKOTES
			WHEN 'y' THEN 'van'
			WHEN 'n' THEN 'nincs'
		END	AS ATKOTES,
		Q283.KODENEV AS	HMVRENDS,
		NYOMKUL,
		Q284.KODENEV AS	CIRK_MOD,
		Q330.KODENEV AS	FOELZ,
		Q288.KODENEV AS	FELOSZT,
		Q327.KODENEV AS	UTEM
	FROM
		Q327 RIGHT JOIN
			(Q288 RIGHT	JOIN
				(Q330 RIGHT	JOIN
					(Q284 RIGHT	JOIN
						(Q283 RIGHT	JOIN
							(Q282 RIGHT	JOIN
								(Q281 RIGHT	JOIN
									(Q272 RIGHT	JOIN
										(Q278 RIGHT	JOIN
											(Q329 RIGHT	JOIN
												(Q277 RIGHT	JOIN
													(Q328 RIGHT	JOIN
														(Q276 RIGHT	JOIN
															(Q275 RIGHT	JOIN
																(Q274 RIGHT	JOIN
																	(Q289 RIGHT	JOIN
																		(OBJEKTUM INNER	JOIN EPULET	ON EPULET.ID = OBJEKTUM.ID)
																	ON Q289.KODERT = VAROS)
																ON Q274.KODERT = EPULTIP)
															ON Q275.KODERT = FUTESMOD)
														ON Q276.KODERT = LEGTELTIP)
													ON Q328.KODERT = LEGTHELY)
												ON Q277.KODERT = FUTOTIP)
											ON Q329.KODERT = UZEMELT)
										ON Q278.KODERT = KARBANTAR)
									ON Q272.KODERT = HOLEPCSO)
								ON Q281.KODERT = FUTBESZAB)
							ON Q282.KODERT = CIRKUL)
						ON Q283.KODERT = HMVRENDS)
					ON Q284.KODERT = CIRK_MOD)
				ON Q330.KODERT = FOELZ)
			ON Q288.KODERT = FELOSZT)
		ON Q327.KODERT = UTEM
	WHERE
		OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		AND	((@329 IS NULL)	OR (@329 IS	NOT	NULL AND UZEMELT = @329))
		AND	((@278 IS NULL)	OR (@278 IS	NOT	NULL AND KARBANTAR = @278))
		AND	((@277 IS NULL)	OR (@277 IS	NOT	NULL AND FUTOTIP = @277))
		AND	((@281 IS NULL)	OR (@281 IS	NOT	NULL AND FUTBESZAB = @281))
		AND	((@274 IS NULL)	OR (@274 IS	NOT	NULL AND EPULTIP = @274))
	END
/*ELSE IF @pOBJTIP = '02'
	BEGIN
	SELECT
		*
	FROM
		OBJEKTUM INNER JOIN	LAKAS ON LAKAS.ID =	OBJEKTUM.ID
	WHERE
		OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		AND	OBJTIP = @pOBJTIP
	END
ELSE*/ IF @pOBJTIP = '03'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TELEPHSZ,
			Q289.KODENEV AS	VAROS,
			UTCA,
			HSZ,
			UZEMIDO,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			RTRIM(KEZOSZT) AS KEZOSZT,
			MKHOM,
			HOTELJ,
			GAZCSUCS,
			Q285.KODENEV AS	HOHOR_KO,
			Q272.KODENEV AS	HOLEP,
			VILLCSUCSNY,
			VILLCSUCST,
			TERFARAM,
			CIRKTERFARAM,
			NYOMTARTTIP,
			HMVHOMERS,
			FUT_LAKAS,
			HMV_LAKAS,
			FUT_KOZULET,
			HMV_KOZULET,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(Q285 RIGHT	JOIN
					(Q289 RIGHT	JOIN
						(Q272 RIGHT	JOIN
							(OBJEKTUM INNER	JOIN FUTOMU	ON FUTOMU.ID = OBJEKTUM.ID)
						ON Q272.KODERT = HOLEP)
					ON Q289.KODERT = VAROS)
				ON Q285.KODERT=HOHOR_KO)
			ON Q279.KODERT=	NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
			AND	((@HOTELJTOL IS	NULL OR	@HOTELJIG IS NULL) OR (@HOTELJTOL IS NOT NULL AND @HOTELJIG	IS NOT NULL	AND	HOTELJ BETWEEN @HOTELJTOL AND @HOTELJIG))
			AND	((@NEVLTELJTOL IS NULL OR @NEVLTELJIG IS NULL) OR (@NEVLTELJTOL	IS NOT NULL	AND	@NEVLTELJIG	IS NOT NULL	AND	NEVLTELJ BETWEEN @NEVLTELJTOL AND @NEVLTELJIG))
			AND	((@GAZCSUCSTOL IS NULL OR @GAZCSUCSIG IS NULL) OR (@GAZCSUCSTOL	IS NOT NULL	AND	@GAZCSUCSIG	IS NOT NULL	AND	GAZCSUCS BETWEEN @GAZCSUCSTOL AND @GAZCSUCSIG))
			AND	((@VILLCSUCSNYTOL IS NULL OR @VILLCSUCSNYIG	IS NULL) OR	(@VILLCSUCSNYTOL IS	NOT	NULL AND @VILLCSUCSNYIG	IS NOT NULL	AND	VILLCSUCSNY	BETWEEN	@VILLCSUCSNYTOL	AND	@VILLCSUCSNYIG))
			AND	((@VILLCSUCSTTOL IS	NULL OR	@VILLCSUCSTIG IS NULL) OR (@VILLCSUCSTTOL IS NOT NULL AND @VILLCSUCSTIG	IS NOT NULL	AND	VILLCSUCST BETWEEN @VILLCSUCSTTOL AND @VILLCSUCSTIG))
			AND	((@TERFARAMTOL IS NULL OR @TERFARAMIG IS NULL) OR (@TERFARAMTOL	IS NOT NULL	AND	@TERFARAMIG	IS NOT NULL	AND	TERFARAM BETWEEN @TERFARAMTOL AND @TERFARAMIG))
		END
		ELSE IF	@pOBJTIP = '04'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			GYARTM,
			Q312.KODENEV AS	GYARTO,
			UZEMIDO,
			ELHELYEZ,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			OBJEKTUM.KATEG,
			Q285.KODENEV AS	HOHOR_KO,
			TERFARAM,
			Q318.KODENEV AS	SZABMOD,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(Q285 RIGHT	JOIN
					(Q318 RIGHT	JOIN
						(Q312 RIGHT	JOIN
							(OBJEKTUM INNER	JOIN KAZAN ON KAZAN.ID = OBJEKTUM.ID)
						ON Q312.KODERT=GYARTO)
					ON Q318.KODERT=SZABMOD)
				ON Q285.KODERT=HOHOR_KO)
			ON Q279.KODERT=	NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '05'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			GYARTM,
			UZEMIDO,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			BEVTELJ,
			Q318.KODENEV AS	SZABMOD,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(Q318 RIGHT	JOIN
					(OBJEKTUM INNER	JOIN KAZANEGO ON KAZANEGO.ID = OBJEKTUM.ID)
				ON Q318.KODERT = SZABMOD)
			ON Q279.KODERT=	NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '06'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			FORDSZ,
			EMEL_MAG,
			Q285.KODENEV AS	SZAL_KOZ,
			SZAL_MENNY,
			Q319.KODENEV AS	SZIVFOK,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q319 RIGHT JOIN
				(Q285 RIGHT	JOIN
					(OBJEKTUM INNER	JOIN SZIVATTYU ON SZIVATTYU.ID = OBJEKTUM.ID)
				ON Q285.KODERT = SZAL_KOZ)
			ON Q319.KODERT = SZIVFOK
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '07'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			ELHELYEZ,
			NEVLTELJ,
			Q279_1.KODENEV AS NEVLTELJME,
			ELLENALL,
			LEMSZAM,
			MERET,
			Q279_2.KODENEV AS MERETME,
			FUTOFEL,			DB,
			Q285_1.KODENEV AS HOHOR_KO,
			HOSSZ_NAGY,
			HOSSZ_KICS,			FELUGY,
			Q285_2.KODENEV AS FU_KOZ,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q285 Q285_2	RIGHT JOIN
				(Q285 Q285_1 RIGHT JOIN
					(Q279 Q279_2 RIGHT JOIN
						(Q279 Q279_1 RIGHT JOIN
							(OBJEKTUM INNER	JOIN HOCSERELO ON HOCSERELO.ID = OBJEKTUM.ID)
						ON Q279_1.KODERT = NEVLTELJME)
					ON Q279_2.KODERT = MERETME)
				ON Q285_1.KODERT = HOHOR_KO)
			ON Q285_2.KODERT = FU_KOZ
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '08'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			FAGYVED,
			FORDSZ,
			LEGSZAL,
			Q285.KODENEV AS	FU_KOZ,
			ARAMFELV,
			FESZULTS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q285 RIGHT JOIN
				(OBJEKTUM INNER	JOIN VENTILLATOR ON	VENTILLATOR.ID = OBJEKTUM.ID)
			ON Q285.KODERT = FU_KOZ
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '09'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			Q313.KODENEV AS	VESZO,
			FELEP,
			Q320.KODENEV AS	BOYTIP,
			FUTOFEL,
			TERFOGAT,
			Q318.KODENEV AS	SZABMOD,
			Q285.KODENEV AS	FU_KOZ,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q285 RIGHT JOIN
				(Q318 RIGHT	JOIN
					(Q320 RIGHT	JOIN
						(Q313 RIGHT	JOIN
							(OBJEKTUM INNER	JOIN BOYLER	ON BOYLER.ID = OBJEKTUM.ID)
						ON Q313.KODERT = BOYLER.VESZO)
					ON Q320.KODERT = BOYTIP)
				ON Q318.KODERT = SZABMOD)
			ON Q285.KODERT = FU_KOZ
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '10'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			Q326.KODENEV AS	FELEP,
			TERFOGAT,
			KAPCSOLAS,
			Q321.KODENEV AS	TOLTESMOD,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q321 RIGHT JOIN
				(Q326 RIGHT	JOIN
					(OBJEKTUM INNER	JOIN MELEGVIZ_TAROLO ON	MELEGVIZ_TAROLO.ID = OBJEKTUM.ID)
				ON Q326.KODERT = FELEP)
			ON Q321.KODERT = TOLTESMOD
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '11'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			Q326.KODENEV AS	FELEP,
			LEVNYOM,
			VIZNYOM,
			TERFOGAT,
			FUTOTT,
			SZABALYOZAS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q326 RIGHT JOIN
				(OBJEKTUM INNER	JOIN TARTALY ON	TARTALY.ID = OBJEKTUM.ID)
			ON Q326.KODERT = FELEP
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '12'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			Q322.KODENEV AS	SZURTIP,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q322 RIGHT JOIN
				(OBJEKTUM INNER	JOIN SZUROK	ON SZUROK.ID = OBJEKTUM.ID)
			ON Q322.KODERT = SZURTIP
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '13'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			Q318.KODENEV AS	SZABMOD,
			OSZLSZAM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q318 RIGHT JOIN
				(Q279 RIGHT	JOIN
					(OBJEKTUM INNER	JOIN VIZLAGYITO	ON VIZLAGYITO.ID = OBJEKTUM.ID)
				ON Q279.KODERT = NEVLTELJME)
			ON Q318.KODERT = SZABMOD
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '14'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			FORDSZ,
			Q285.KODENEV AS	SZAL_KOZ,
			SZAL_MENNY,
			VEGNYOM,
			ARAMFELV,
			FESZULTS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q285 RIGHT JOIN
				(Q279 RIGHT	JOIN
					(OBJEKTUM INNER	JOIN KOMPRESSZOR ON	KOMPRESSZOR.ID = OBJEKTUM.ID)
				ON Q279.KODERT = NEVLTELJME)
			ON Q285.KODERT = SZAL_KOZ
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '15'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TELEPHSZ,
			UZEMIDO,
			BEEPCSOVDB,
			ATMERO,
			HOSSZ,
			VIZSZ,
			BECSOV,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	TERMELO_CSO	ON TERMELO_CSO.ID =	OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '16'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			FORDSZ,
			TERHEL,
			ARAMFELV,
			FESZULTS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(OBJEKTUM INNER	JOIN DEMAG_EMELOGEP	ON DEMAG_EMELOGEP.ID = OBJEKTUM.ID)
			ON Q279.KODERT = NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '17'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			UZEMIDO,
			RTRIM(ELHELYEZ)	AS ELHELYEZ,
			PRIM_ARAM,
		Q272.KODENEV AS	HOLEP,
			RTRIM(FOGYMERHELY) AS FOGYMERHELY,
			KISMEGSZAK,
			LEKVILLTELJ,
			PRIMELL,
			FUT_LAKAS,
			HMV_LAKAS,
			FUT_KOZULET,
			SZEKU_TOM,
			NYOMAS_K,
			HOMER_SZ,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q272 RIGHT JOIN
				(OBJEKTUM INNER	JOIN HOKOZPONT ON HOKOZPONT.ID = OBJEKTUM.ID)
			ON Q272.KODERT = HOLEP
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
			AND	((@PRIM_ARAMTOL	IS NULL	OR @PRIM_ARAMIG	IS NULL) OR	(@PRIM_ARAMTOL IS NOT NULL AND @PRIM_ARAMIG	IS NOT NULL	AND	PRIM_ARAM BETWEEN @PRIM_ARAMTOL	AND	@PRIM_ARAMIG))
			AND	((@SZEKU_TOMTOL	IS NULL	OR @SZEKU_TOMIG	IS NULL) OR	(@SZEKU_TOMTOL IS NOT NULL AND @SZEKU_TOMIG	IS NOT NULL	AND	SZEKU_TOM BETWEEN @SZEKU_TOMTOL	AND	@SZEKU_TOMIG))
		END
		ELSE IF	@pOBJTIP = '18'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			GYARTM,
			UZEMIDO,
			HITIDO,
			RTRIM(ELHELYEZ)	AS ELHELYEZ,
			ALAIR,
			FKOD,
			IMPULZUS,
			/*Q316.KODENEV AS LEOLVMOD,*/
			FESZULTS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			/*Q316 RIGHT JOIN
				(*/OBJEKTUM	INNER JOIN HOOSSZEGZO ON HOOSSZEGZO.ID = OBJEKTUM.ID/*)
			ON Q316.KODERT = LEOLVMOD*/
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
			AND	((@HOOSZIMPTOL IS NULL OR @HOOSZIMPIG IS NULL) OR (@HOOSZIMPTOL IS NOT NULL AND @HOOSZIMPIG	IS NOT NULL	AND	IMPULZUS BETWEEN @HOOSZIMPTOL AND @HOOSZIMPIG))

		END

		ELSE IF	@pOBJTIP = '19'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			GYARTM,
			UZEMIDO,
			HITIDO,
			RTRIM(ELHELYEZ)	AS ELHELYEZ,
			ALAIR,
			FKOD,
			/*Q316.KODENEV AS LEOLVMOD,*/
			ATMERO,
			IMPULZUS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			/*Q316 RIGHT JOIN
				(*/OBJEKTUM	INNER JOIN VIZORA ON VIZORA.ID = OBJEKTUM.ID/*)
			ON Q316.KODERT = LEOLVMOD*/
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
			AND	((@VIZATMEROTOL	IS NULL	OR @VIZATMEROIG	IS NULL) OR	(@VIZATMEROTOL IS NOT NULL AND @VIZATMEROIG	IS NOT NULL	AND	VIZORA.ATMERO BETWEEN @VIZATMEROTOL	AND	@VIZATMEROIG))
			AND	((@VIZIMPULZUSTOL	IS NULL	OR @VIZIMPULZUSIG	IS NULL) OR	(@VIZIMPULZUSTOL IS NOT NULL AND @VIZIMPULZUSIG	IS NOT NULL	AND	VIZORA.IMPULZUS BETWEEN @VIZIMPULZUSTOL	AND	@VIZIMPULZUSIG))
		END
		ELSE IF	@pOBJTIP = '20'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			HITIDO,
			RTRIM(ELHELYEZ)	AS ELHELYEZ,
			VEZHOSSZ,
			BENYHOSSZ,
			Q323.KODENEV AS	KIMENET,
			CSATLMERET,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q323 RIGHT JOIN
				(OBJEKTUM INNER	JOIN ERZEKELO ON ERZEKELO.ID = OBJEKTUM.ID)
			ON Q323.KODERT = KIMENET
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
			AND	((@ERZVEZTOL IS NULL OR @ERZVEZIG IS NULL) OR (@ERZVEZTOL IS NOT NULL AND @ERZVEZIG	IS NOT NULL	AND	ERZEKELO.VEZHOSSZ BETWEEN @ERZVEZTOL AND @ERZVEZIG))
			AND	((@ERZBENYTOL IS NULL OR @ERZBENYIG	IS NULL) OR	(@ERZBENYTOL IS NOT NULL AND @ERZBENYIG	IS NOT NULL	AND	ERZEKELO.BENYHOSSZ BETWEEN @ERZBENYTOL AND @ERZBENYIG))
		END

		ELSE IF	@pOBJTIP = '21'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(OBJEKTUM INNER	JOIN FOKAPCSOLO	ON FOKAPCSOLO.ID = OBJEKTUM.ID)
			ON Q279.KODERT = NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '22'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			MEDDTELJ,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	FAZISJAVITO_KONDENZATOR	ON FAZISJAVITO_KONDENZATOR.ID =	OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '23'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	GAZVESZELY_JELZO ON	GAZVESZELY_JELZO.ID	= OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '24'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			GYARTM,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			ARAMFELV,
			FESZULTS,
			VILLFORDSZ,
			TELJT,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(OBJEKTUM INNER	JOIN MOTOR ON MOTOR.ID = OBJEKTUM.ID)
			ON Q279.KODERT = NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '25'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	SZINTKAPCSOLO ON SZINTKAPCSOLO.ID =	OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '26'
		BEGIN
	SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	SZABALYOZO_AUTOMATIKA ON SZABALYOZO_AUTOMATIKA.ID =	OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '27'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			MERET,
			Q279.KODENEV AS	MERETME,
			ATMERO,
			Q324.KODENEV AS	MUKMOD,
			KVS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q324 RIGHT JOIN
				(Q279 RIGHT	JOIN
					(OBJEKTUM INNER	JOIN SZABALYOZO_SZELEP ON SZABALYOZO_SZELEP.ID = OBJEKTUM.ID)
				ON Q279.KODERT = MERETME)
			ON Q324.KODERT = MUKMOD
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '28'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			SZELTIP,
			MERET,
			Q279.KODENEV AS	MERETME,
			NYITNYOM,
			ZARNYOM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(OBJEKTUM INNER	JOIN BIZTONSAGI_SZELEP ON BIZTONSAGI_SZELEP.ID = OBJEKTUM.ID)
			ON Q279.KODERT = MERETME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '29'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
			UZEMIDO,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			MKHOM,
			KIMARAM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(OBJEKTUM INNER	JOIN FREKVENCIAVALTO ON	FREKVENCIAVALTO.ID = OBJEKTUM.ID)
			ON Q279.KODERT = NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '30'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			UZEMIDO,
			Q272.KODENEV AS	HOLEP,
			TERFOGAT,
			HOSSZ,
			SZABALYOZAS,
			FUT_LAKAS,
			HMV_LAKAS,
			FUT_KOZULET,
			HMV_KOZULET,
			HOKOZP_SZAM,
			NYOMKUL,
			TOMEGARAM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q272 RIGHT JOIN
				(OBJEKTUM INNER	JOIN ARAMKOR ON	ARAMKOR.ID = OBJEKTUM.ID)
			ON Q272.KODERT = HOLEP
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '31'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	KOLTSEGMEGOSZTO	ON KOLTSEGMEGOSZTO.ID =	OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '32'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			RTRIM(ELHELYEZ)	AS ELHELYEZ,
			FKOD,
			ATMERO,
			FUR_ATM,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	TARCSA ON TARCSA.ID	= OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '33'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			GYSZAM,
		RTRIM(GYARTM) AS GYARTM,
			NEVLTELJ,
			Q279.KODENEV AS	NEVLTELJME,
			ATMERO,
			RTRIM(BEALL_ERTEK) AS BEALL_ERTEK,
			ARAMFELV,
			FESZULTS,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q279 RIGHT JOIN
				(OBJEKTUM INNER	JOIN HAJTOMU ON	HAJTOMU.ID = OBJEKTUM.ID)
			ON Q279.KODERT = NEVLTELJME
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '34'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			RTRIM(GYARTM) AS GYARTM,
			ARAMFELV,
			FESZULTS,
			VEZHOSSZ,
			BENYHOSSZ,
			NYOMATEK,
			ERZEKENY,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	LANGOR ON LANGOR.ID	= OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '35'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			UZEMIDO,
			Q289.KODENEV AS	VAROS,
			UTCA,
			HSZ,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			Q289 RIGHT JOIN
				(OBJEKTUM INNER	JOIN TERMALKUT ON TERMALKUT.ID = OBJEKTUM.ID)
			ON Q289.KODERT = VAROS
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END
		ELSE IF	@pOBJTIP = '36'
		BEGIN
		SELECT
			OBJEKTUM.ID,
			RTRIM(MEGNEV) AS MEGNEV,
			TIPUS,
			TELEPHSZ,
			RTRIM(GYARTM) AS GYARTM,
			RTRIM(ELHELYEZ)	AS ELHELYEZ,
			ATMERO,
			RTRIM(BEALL_ERTEK) AS BEALL_ERTEK,
			RTRIM(MEGJ)	AS MEGJ
		FROM
			OBJEKTUM INNER JOIN	SZERELVENY ON SZERELVENY.ID	= OBJEKTUM.ID
		WHERE
			OBJEKTUM.ID	= coalesce(@pID,OBJEKTUM.ID)
		END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LekerdBerRaktar
/*
Visszaadja az osszes olyan objektumot, ami
	a berendezes raktarban talahato (BERRAKTAR)
*/
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL,
@pDATUMTOL DATETIME=NULL,
@pDATUMIG DATETIME=NULL
AS
SELECT
	BERRAKTAR.ID,
	Q296.KODENEV AS OBJTIP,
	O.MEGNEV,
	BEKERUL_DAT,
	O.TIPUS,
	O.TELEPHSZ,
	O.GYSZAM
FROM
	OBJEKTUM O RIGHT JOIN
		(Q296 RIGHT JOIN BERRAKTAR ON Q296.KODERT = BERRAKTAR.OBJTIP)
	ON O.ID = BERRAKTAR.OBJID
WHERE
	BERRAKTAR.OBJTIP = coalesce(@pOBJTIP, BERRAKTAR.OBJTIP)
	AND OBJID = coalesce(@pOBJID, BERRAKTAR.OBJID)
	AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
		OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND BEKERUL_DAT BETWEEN @pDATUMTOL AND @pDATUMIG))
ORDER BY
	O.MEGNEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdBerRaktar]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LekerdBerRaktarSz
/*
Visszaadja az osszes olyan objektumot, ami
- nincs bekotve sehova
- nincs a berendezes raktarban (BERRAKTAR)
*/
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL
AS
SELECT
	O.ID,
	Q296.KODENEV AS OBJTIP,
	O.MEGNEV,
	O.TIPUS,
	O.TELEPHSZ,
	O.GYSZAM
FROM
	Q296 RIGHT JOIN OBJEKTUM O ON Q296.KODERT = O.OBJTIP
WHERE
	O.OBJTIP = coalesce(@pOBJTIP, O.OBJTIP)
	AND ID = coalesce(@pOBJID, O.ID)
	AND ((O.KAPCSOLT = 0)
		AND (NOT EXISTS(SELECT ID FROM BERRAKTAR WHERE OBJID=O.ID)))
ORDER BY
	O.MEGNEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdBerRaktarSz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







/****** Object:  Stored Procedure dbo.sp_LekerdDolgozo    Script Date: 2000. 07. 04. 18:56:16 ******/





CREATE PROCEDURE sp_LekerdDolgozo
@pID INTEGER=NULL
AS
SELECT
	ID,
	NEV,
	Q271.KODENEV AS SZEREGYS,
	Q304.KODENEV AS BEOSZT
FROM
	Q304 RIGHT JOIN
		(Q271 RIGHT JOIN DOLGOZO ON Q271.KODERT = DOLGOZO.SZEREGYS)
	ON Q304.KODERT = DOLGOZO.BEOSZT
WHERE
	ID = coalesce(@pID,ID)














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdDolgozo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_LekerdHierarchia
@pID INTEGER
AS

IF not exists(select * from kapcsolat where id2=@pID)
	BEGIN
	SELECT ''
	RETURN 
	END
-- Na nézzük, mihez kapcsolódik
ELSE
	BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ID INTEGER
	DECLARE @ID1 INTEGER
	DECLARE @ID2 INTEGER
	DECLARE @SZINT INTEGER
	DECLARE @OBJTIP VARCHAR(2)
	SELECT @SZINT = 0

	CREATE TABLE #ZZZ
		(
		SZINT INTEGER NULL,
		OBJTIP VARCHAR(2) NULL,
		MEGNEV  VARCHAR(50) NULL,
		TELEPHSZ VARCHAR(20) NULL,
		GYSZAM VARCHAR(15) NULL
		)
		
	DECLARE @FUTOMU_ID INTEGER
	SELECT @FUTOMU_ID = -1

	SELECT @ID2 = @pID	--Amit keresünk, az valamihez kapcsolva van, ezért
						--a KAPCSOLAT táblában a második oszlopban keressük
						-- az o ID-jét.

	WHILE (@FUTOMU_ID = -1) AND (@SZINT < 40)
		BEGIN
		SELECT @SZINT = @SZINT + 1	-- Csak korlát, hogy ne szálljon el
		SELECT @ID1=ID1 FROM KAPCSOLAT WHERE ID2=@ID2	-- Mihez kapcsolódik
		
		SELECT @OBJTIP = OBJTIP FROM OBJEKTUM WHERE ID = @ID1
		IF @OBJTIP = '01'
			BEGIN
			INSERT INTO
				#ZZZ
			SELECT
				@SZINT,
				OBJTIP,
				RTRIM(COALESCE(UTCA, ' - ')) + CHAR(32) +
				RTRIM(COALESCE(HSZ, ' - ')),
				' ',
				' '
			FROM
				OBJEKTUM INNER JOIN EPULET ON EPULET.ID = OBJEKTUM.ID
			WHERE
				OBJEKTUM.ID = @ID1
			END
		ELSE IF @OBJTIP = '37'
			BEGIN
			INSERT INTO
				#ZZZ
			SELECT
				@SZINT,
				OBJTIP,
				RTRIM(COALESCE(CIM, ' - ')),
				' ',
				' '
			FROM
				OBJEKTUM INNER JOIN LEPCSOHAZ ON LEPCSOHAZ.ID = OBJEKTUM.ID
			WHERE
				OBJEKTUM.ID = @ID1
			END
		ELSE
			BEGIN
			INSERT INTO
				#ZZZ
			SELECT
				@SZINT,OBJTIP,MEGNEV,TELEPHSZ,GYSZAM
			FROM
				OBJEKTUM
			WHERE
				ID = @ID1	-- és az milyen berendezés
			END
			
		SELECT @OBJTIP = OBJTIP FROM OBJEKTUM WHERE ID = @ID1
		IF @OBJTIP = '03'	-- Ha a megfelelo berendezés típus, a felsobb kapcsolat
			BEGIN
			SELECT @FUTOMU_ID = @ID1	-- Az ID-t adjuk vissza
			END
		ELSE
			BEGIN
			SELECT @ID2 = @ID1	-- Egyébként nézzük tovább, most már az elobb talált
			END	-- objektum felsobb kapcsolatát követve.
		END
	
	SET NOCOUNT OFF
		
	SELECT
		SZINT,
		KODENEV,
		MEGNEV,
		TELEPHSZ,
		GYSZAM
	FROM
		#ZZZ INNER JOIN Q296 ON Q296.KODERT = #ZZZ.OBJTIP
	ORDER BY
		SZINT
		
	RETURN @FUTOMU_ID
	
	END







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdHierarchia]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LekerdJegyz
@pJTIP VARCHAR(2)=NULL,
@pMUVEL VARCHAR(3)=NULL,
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL,
@pDATUMTOL DATETIME=NULL,
@pDATUMIG DATETIME=NULL
AS
IF @pJTIP IS NULL
	BEGIN
		SELECT
			JEGYZSZ AS ID,
			JEGYZSZ,
			JDAT,
			Q302.KODENEV AS JTIP,
			coalesce(OBJEKTUM.MEGNEV,'-') AS MEGNEV,
			coalesce(OBJEKTUM.TIPUS,'-') AS TIPUS,
			coalesce(OBJEKTUM.GYSZAM,'-') AS GYSZAM
		FROM
			Q302 RIGHT JOIN
				(OBJEKTUM RIGHT JOIN
					(JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID)
				ON OBJEKTUM.ID = KARBAN.OBJID)
			ON Q302.KODERT = JEGYZ.JTIP
		WHERE
			OBJID = coalesce(@pOBJID, OBJID)
			AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
				OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND JDAT BETWEEN @pDATUMTOL AND @pDATUMIG))
		UNION
		SELECT
			LABOR.ID,
			LABOR.SORSZ AS JEGYZSZ,
			CONVERT(VARCHAR(10), MINTA_IDO, 102) AS JDAT,
			Q302.KODENEV AS JTIP,
			coalesce(OBJEKTUM.MEGNEV,'-') AS MEGNEV,
			' ' AS TELEPHSZ,
			' ' AS GYSZAM
		FROM
			OBJEKTUM RIGHT JOIN
				(MUNKALAP RIGHT JOIN
					(Q302 RIGHT JOIN LABOR ON Q302.KODERT = '8')
				ON MUNKALAP.ID = LABOR.MUN_SORSZ)
			ON OBJEKTUM.ID = MUNKALAP.OBJID
		WHERE
			((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
			OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND MINTA_IDO BETWEEN @pDATUMTOL AND @pDATUMIG))
		ORDER BY
			JEGYZSZ
	END

ELSE IF @pJTIP = '8'
	BEGIN
		SELECT
			LABOR.ID,
			LABOR.SORSZ,
			CONVERT(VARCHAR(10), MINTA_IDO, 102) AS JDAT,
			Q370.KODENEV AS TIPUS,
			OBJEKTUM.MEGNEV,
			MUN_SORSZ
		FROM
			OBJEKTUM RIGHT JOIN
				(MUNKALAP RIGHT JOIN
					(Q370 RIGHT JOIN LABOR ON Q370.KODERT = LABOR.TIPUS)
				ON MUNKALAP.ID = LABOR.MUN_SORSZ)
			ON OBJEKTUM.ID = MUNKALAP.OBJID
		WHERE
			((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
			OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND MINTA_IDO BETWEEN @pDATUMTOL AND @pDATUMIG))
		ORDER BY
			LABOR.ID
	END
	
ELSE
	BEGIN
		SELECT
			JEGYZSZ AS ID,
			JEGYZSZ,
			JDAT,
			Q300.KODENEV AS KARBTIP,
			coalesce(MUVEL,'-') AS MUVEL,
			Q296.KODENEV AS OBJTIP,
			coalesce(MEGNEV,'-') AS MEGNEV,
			coalesce(TIPUS,'-') AS TIPUS,
			coalesce(TELEPHSZ,'-') AS TELEPHSZ,
			coalesce(GYSZAM,'-') AS GYSZAM
		FROM
			Q296 RIGHT JOIN
				(Q300 RIGHT JOIN
					(OBJEKTUM RIGHT JOIN
						(JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID)
					ON OBJEKTUM.ID = KARBAN.OBJID)
				ON Q300.KODERT = KARBAN.KARBTIP)
			ON Q296.KODERT = KARBAN.OBJTIP
		WHERE
			OBJID = coalesce(@pOBJID, OBJID)
			AND KARBAN.OBJTIP = coalesce(@pOBJTIP, KARBAN.OBJTIP)
			AND MUVEL = coalesce(@pMUVEL, MUVEL)
			AND JTIP = coalesce(@pJTIP, JTIP)
			AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
				OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND JDAT BETWEEN @pDATUMTOL AND @pDATUMIG))
		ORDER BY
			JEGYZSZ
	END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdJegyz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


--KEP680
CREATE PROCEDURE sp_LekerdKarban
@pMUVEL VARCHAR(3) = NULL,
@pOBJTIP VARCHAR(2) = NULL,
@pOBJID INTEGER = NULL,
@pSZOLGJ VARCHAR(2) = NULL,
@pDATUMTOL DATETIME = NULL,
@pDATUMIG DATETIME = NULL
AS
SELECT
	KARBAN.ID,
	Q296.KODENEV AS OBJTIP,
	coalesce(OBJEKTUM.MEGNEV, ' - ') AS MEGNEV,
	coalesce(OBJEKTUM.TIPUS, ' - ') AS TIPUS,
	coalesce(OBJEKTUM.TELEPHSZ, ' - ') AS TELEPHSZ,
	coalesce(OBJEKTUM.GYSZAM, ' - ') AS GYSZAM,
	MUNKALAP.SZOLGJELL,
	KARBAN.MUVEL,
	KARBAN.KDATUM,
	KARBAN.MUN_SORSZ,
	KARBAN.MUVLEIR
FROM
	Q296 RIGHT JOIN
		(OBJEKTUM RIGHT JOIN
			(KARBAN LEFT JOIN MUNKALAP ON MUNKALAP.SORSZ = KARBAN.MUN_SORSZ)
		ON OBJEKTUM.ID = KARBAN.OBJID)
	ON Q296.KODERT = KARBAN.OBJTIP
WHERE
	OBJEKTUM.AKTIV = 'y'
	AND KARBAN.MUVEL = coalesce(@pMUVEL, KARBAN.MUVEL)
	AND KARBAN.OBJTIP = coalesce(@pOBJTIP, KARBAN.OBJTIP)
	AND KARBAN.OBJID = coalesce(@pOBJID, KARBAN.OBJID)
	AND ((@pSZOLGJ IS NULL) OR (@pSZOLGJ IS NOT NULL AND SZOLGJELL = @pSZOLGJ))	--	AND MUNKALAP.SZOLGJELL = coalesce(@pSZOLGJ, MUNKALAP.SZOLGJELL)
	AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
		OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND
--			KARBAN.KDATUM BETWEEN @pDATUMTOL AND @pDATUMIG))
			MUNKALAP.KIALLDAT BETWEEN @pDATUMTOL AND @pDATUMIG))





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdKarban]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*Karbantartasi terv lekerdezesEloszor egy atmeneti tablaba legyujti a szuresi felteteleknek megfeleloterv adatokat, majd mindegyik rekordot kiegesziti a megfelelo objektumjellemzoivel. Ezutan a teljes atmeneti tablat lekerdezi.
*/CREATE PROCEDURE sp_LekerdKarbterv
@pMUVEL VARCHAR(3)=NULL,
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL,
@pDATUMTOL DATETIME=NULL,
@pDATUMIG DATETIME=NULL
AS

SET NOCOUNT ON

CREATE TABLE #ZZZ
	(
	KARBTERVID INTEGER NULL,
	FUTOMU VARCHAR(50) NULL,
	LEPCSOHAZ VARCHAR(50) NULL,
	OBJID INTEGER NULL,
	OBJTIPNEV VARCHAR(100) NULL,
	OBJMEGNEV VARCHAR(100) NULL,
	OBJTIPUS VARCHAR(100) NULL,
	OBJTELEPHSZ VARCHAR(100) NULL,
	OBJGYSZAM VARCHAR(100) NULL,
	CIM VARCHAR(255) NULL,
	MUVEL VARCHAR(100) NULL,
	TERVDATUM DATETIME NULL,
	KDATUM DATETIME NULL,
	ATMERO REAL NULL,
	IMPULZUS REAL NULL,
	VEZHOSSZ REAL NULL,
	BENYHOSSZ REAL NULL,
	MEGJ VARCHAR(255) NULL
	)
	
DECLARE @KARBTERVID INTEGER
DECLARE @LEPCSOHAZ_ID INTEGER
DECLARE @LEPCSOHAZ VARCHAR(50)
DECLARE @FUTOMU_ID INTEGER
DECLARE @FUTOMU VARCHAR(50)
DECLARE @OBJID INTEGER
DECLARE @OBJTIP INTEGER
DECLARE @OBJTIPNEV VARCHAR(100)
DECLARE @OBJMEGNEV VARCHAR(100)
DECLARE @OBJTIPUS VARCHAR(100)
DECLARE @OBJTELEPHSZ VARCHAR(100)
DECLARE @OBJGYSZAM VARCHAR(100)
DECLARE @CIM VARCHAR(255)
DECLARE @MUVEL VARCHAR(100)
DECLARE @TERVDATUM DATETIME
DECLARE @KDATUM DATETIME
DECLARE @ATMERO REAL
DECLARE @IMPULZUS REAL
DECLARE @VEZHOSSZ REAL
DECLARE @BENYHOSSZ REAL
DECLARE @MEGJ VARCHAR(255)

DECLARE KARBTERVcursor CURSOR FAST_FORWARD FOR
SELECT
	KARBTERV.ID,
	KARBTERV.OBJID,
	KARBTERV.OBJTIP,
	Q296.KODENEV,
	coalesce(OBJEKTUM.MEGNEV, ' - ') AS MEGNEV,
	coalesce(OBJEKTUM.TIPUS, ' - ') AS TIPUS,
	coalesce(OBJEKTUM.TELEPHSZ, ' - ') AS TELEPHSZ,
	coalesce(OBJEKTUM.GYSZAM, ' - ') AS GYSZAM,
	rtrim(coalesce(UTCA, ' - ')) + char(32) + rtrim(coalesce(HSZ, ' - ')) AS CIM,
	Q298.KODERT,
	CASE KARBTERV.IDOE	-- 1-hónap, 2-év
		WHEN 1 THEN	dateadd(month, KARBTERV.IDO, KARBAN.KDATUM)
		WHEN 2 THEN dateadd(year, KARBTERV.IDO, KARBAN.KDATUM)
	END AS TERVDATUM,
	KARBAN.KDATUM,
	VIZORA.ATMERO,
	VIZORA.IMPULZUS,
	ERZEKELO.VEZHOSSZ,
	ERZEKELO.BENYHOSSZ,
	OBJEKTUM.MEGJ
FROM
	ERZEKELO RIGHT JOIN
		(VIZORA RIGHT JOIN
			(Q296 RIGHT JOIN
				(Q298 RIGHT JOIN
					(OBJEKTUM INNER JOIN
						(KARBTERV LEFT JOIN KARBAN ON ((KARBAN.MUVEL = KARBTERV.MUVEL) AND (KARBAN.OBJID = KARBTERV.OBJID)))
					ON KARBTERV.OBJID = OBJEKTUM.ID)
				ON Q298.KODERT = KARBTERV.MUVEL)
			ON Q296.KODERT = KARBTERV.OBJTIP)
		ON VIZORA.ID = OBJEKTUM.ID)
	ON ERZEKELO. ID = OBJEKTUM.ID
WHERE
	OBJEKTUM.AKTIV = 'y'
	AND KARBTERV.AKTIV = 1
	AND KARBTERV.MUVEL = coalesce(@pMUVEL, KARBTERV.MUVEL)
	AND KARBTERV.OBJTIP = coalesce(@pOBJTIP, KARBTERV.OBJTIP)
	AND KARBTERV.OBJID = coalesce(@pOBJID, KARBTERV.OBJID)
	--A dátumszurést az ideiglenes táblában kell csinálni

--Megnyitjuk a kurzort
OPEN KARBTERVcursor

--Lekérjük az elso rekordot
FETCH NEXT FROM KARBTERVcursor
	INTO @KARBTERVID,@OBJID,@OBJTIP,@OBJTIPNEV,@OBJMEGNEV,@OBJTIPUS,@OBJTELEPHSZ,@OBJGYSZAM,
		@CIM,@MUVEL,@TERVDATUM,@KDATUM,@ATMERO,@IMPULZUS,@VEZHOSSZ,@BENYHOSSZ,@MEGJ
	
--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
	BEGIN

--	IF @OBJTIP BETWEEN 18 AND 20
--		BEGIN
-- a Futomu adatainak kikeresése
		EXEC @FUTOMU_ID = sp_Rekurziv @OBJID, '03' -- Futomu
		IF @FUTOMU_ID = 0
			BEGIN
			SELECT @FUTOMU = '-'
			END
		ELSE
			BEGIN
			SELECT
				@FUTOMU = MEGNEV
			FROM
				OBJEKTUM
			WHERE
				OBJEKTUM.ID = @FUTOMU_ID
			END

-- a Lépcsoház adatainak kikeresése
		EXEC @LEPCSOHAZ_ID = sp_Rekurziv @OBJID, '37' -- Lépcsoház
--			IF @LEPCSOHAZ_ID IS NULL
		IF @LEPCSOHAZ_ID = 0
			BEGIN
-- az Épület adatainak kikeresése, ha nics lépcsoház
				EXEC @LEPCSOHAZ_ID = sp_Rekurziv @OBJID, '01' -- Épület
				IF @LEPCSOHAZ_ID = 0
					BEGIN
					SELECT @LEPCSOHAZ = '-'
					END
				ELSE
					BEGIN
					SELECT
						@LEPCSOHAZ = UTCA + HSZ
						--@lepcsohaz=megnev
					FROM
						OBJEKTUM
					WHERE
						OBJEKTUM.ID = @LEPCSOHAZ_ID
					END
			END
		ELSE
			BEGIN
			SELECT
				@LEPCSOHAZ = MEGNEV
			FROM
				OBJEKTUM
			WHERE
				OBJEKTUM.ID = @LEPCSOHAZ_ID
			END

-- Az adatok bevitele az ideiglenes táblába
IF EXISTS (SELECT KDATUM FROM #ZZZ WHERE OBJID = @OBJID)
BEGIN
	IF (SELECT KDATUM FROM #ZZZ WHERE OBJID = @OBJID) < @KDATUM
	BEGIN
	-- Ha van már errol az objektumról bejegyzés és a dátuma korábbi akkor kicserélem
		UPDATE #ZZZ SET
			KARBTERVID = @KARBTERVID,
			FUTOMU = @FUTOMU,
			LEPCSOHAZ = @LEPCSOHAZ,
			OBJID = @OBJID,
			OBJTIPNEV =  @OBJTIPNEV,
			OBJMEGNEV =  @OBJMEGNEV,
			OBJTIPUS =  @OBJTIPUS,
			OBJTELEPHSZ =  @OBJTELEPHSZ,
			OBJGYSZAM = @OBJGYSZAM,
			CIM = @CIM,
			MUVEL = @MUVEL,
			TERVDATUM = @TERVDATUM,
			KDATUM = @KDATUM,
			ATMERO = @ATMERO,
			IMPULZUS = @IMPULZUS,
			VEZHOSSZ = @VEZHOSSZ,
			BENYHOSSZ = @BENYHOSSZ,
			MEGJ = @MEGJ
		WHERE OBJID = @OBJID
	END

END
ELSE
BEGIN
	-- Ha nincs még felvive az objektum, akkor felviszem
	INSERT INTO #ZZZ
	SELECT @KARBTERVID, @FUTOMU, @LEPCSOHAZ, @OBJID, @OBJTIPNEV, @OBJMEGNEV, @OBJTIPUS, @OBJTELEPHSZ,
		@OBJGYSZAM, @CIM, @MUVEL, @TERVDATUM, @KDATUM, @ATMERO, @IMPULZUS, @VEZHOSSZ,
		@BENYHOSSZ,@MEGJ
END
-----------------------
--		END

	FETCH NEXT FROM KARBTERVcursor
	INTO @KARBTERVID,@OBJID,@OBJTIP,@OBJTIPNEV,@OBJMEGNEV,@OBJTIPUS,@OBJTELEPHSZ,@OBJGYSZAM,
		@CIM,@MUVEL,@TERVDATUM,@KDATUM,@ATMERO,@IMPULZUS,@VEZHOSSZ,@BENYHOSSZ,@MEGJ

	END	--WHILE

--Lezárjuk és töröljük a kurzort
CLOSE KARBTERVcursor
DEALLOCATE KARBTERVcursor

SET NOCOUNT OFF

SELECT 
	KARBTERVID,
	FUTOMU,
	LEPCSOHAZ,
--	OBJID,
	OBJTIPNEV,
	OBJMEGNEV,
	OBJTIPUS,
	OBJTELEPHSZ,
	OBJGYSZAM,
	CIM,
	MUVEL,
	TERVDATUM,
	KDATUM,
	ATMERO,
	IMPULZUS,
	VEZHOSSZ,
	BENYHOSSZ,
	MEGJ
FROM #ZZZ
-- 2001.12.17 a dátumszurést itt kell megcsinálni!!!!!
WHERE
	((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
		OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND
			TERVDATUM BETWEEN @pDATUMTOL AND @pDATUMIG))
ORDER BY
	FUTOMU,
	LEPCSOHAZ,
	KDATUM

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdKarbterv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LekerdKepvis    Script Date: 2000. 07. 04. 18:56:17 ******/
CREATE PROCEDURE sp_LekerdKepvis
@pEPULID INTEGER=NULL,
@pKEPVIS_ID INTEGER=NULL,
@pDATUMTOL DATETIME=NULL,
@pDATUMIG DATETIME=NULL
AS
SELECT
	KEPVIS.ID,
	coalesce(CIM, ' - ') AS CIM,
	SZERZFEJ.PAZ,
	coalesce(KOZNEV, ' - ') AS KOZNEV,
	coalesce(KOZCIM, ' - ') AS KOZCIM,
	Q338.KODENEV,
	KEZDATUM,
	BEFDATUM
--	coalesce(MEGJ, ' - ') AS MEGJ
FROM
	Q338 RIGHT JOIN
	(
		SZERZFEJ RIGHT JOIN
		(
			LEPCSOHAZ RIGHT JOIN
			(
				SZERZTEL INNER JOIN
				(
					KEPVIS INNER JOIN KEPV_TET ON KEPV_TET.KEPVIS_ID = KEPVIS.ID
				) ON SZERZTEL.SZER_ID = KEPV_TET.SZERZ_ID
			) ON LEPCSOHAZ.ID = SZERZTEL.OBJ_ID
		) ON SZERZTEL.SZER_ID = SZERZFEJ.ID
	) ON Q338.KODERT = SZERZFEJ.SZOLG
WHERE
	LEPCSOHAZ.ID = coalesce(@pEPULID, LEPCSOHAZ.ID)
	AND KEPVIS.ID = coalesce(@pKEPVIS_ID, KEPVIS.ID)
	AND ((@pDATUMTOL IS NULL OR @pDATUMIG IS NULL)
		OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND
			(
--			(BEFDATUM IS NULL AND KEZDATUM >= @pDATUMTOL AND KEZDATUM <= @pDATUMIG)
			(BEFDATUM IS NULL AND KEZDATUM <= @pDATUMIG)
			OR
			BEFDATUM IS NOT NULL AND
			((KEZDATUM <= @pDATUMTOL AND BEFDATUM >= @pDATUMTOL)
			OR (KEZDATUM >= @pDATUMTOL AND BEFDATUM <= @pDATUMIG)
			OR (KEZDATUM >= @pDATUMTOL AND KEZDATUM <= @pDATUMIG))
			)
			))
ORDER BY
	KOZNEV,
	CIM,
	KEZDATUM,
	BEFDATUM,
	KOZCIM,
	MEGJ




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdKepvis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LekerdKontir    Script Date: 2000. 07. 04. 18:56:17 ******/





CREATE PROCEDURE sp_LekerdKontir
@pID VARCHAR(12)=NULL
AS
SELECT
	FSZAM,
	FSZAM,
	FSZNEV,
	CASE KIJELOLT
		WHEN 'n' THEN 'nem'
		WHEN 'y' THEN 'igen'
	END
FROM
	KONTIR
WHERE
	FSZAM = coalesce(@pID,FSZAM)














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdKontir]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LekerdMlap
@MLAPTIP VARCHAR(1)=NULL,
--@SZEREGYS VARCHAR(2)=NULL,
@SZOLGJELL VARCHAR(2)=NULL,
@TIPUSH VARCHAR(3)=NULL,
@FSZAM VARCHAR(12)=NULL,
@OBJTIP VARCHAR(2)=NULL,
@OBJID INTEGER=NULL,
--@EPULID INTEGER=NULL,
@DOLGID INTEGER=NULL,
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL,
@MUNDATTOL DATETIME=NULL,
@MUNDATIG DATETIME=NULL,
@ALLAPOT INTEGER=NULL,
@MUNKALAPID INTEGER=NULL,
@TELEPHSZ VARCHAR(20)=NULL,
@MUNELV DATETIME=NULL
AS
SELECT
	MUNKALAP.ID,
	MUNKALAP.ID,--SORSZ,
	RTRIM(BEJNEV) AS BEJNEV,
	KIALLDAT,
	IDOTOL + '-' + IDOIG AS VEGEZHETO,
	RTRIM(Q291.KODENEV) AS SZOLGJELL,
	RTRIM(UTCA + ' ' + HSZ) AS CIM,
	RTRIM(MEGNEV) AS MEGNEV,
	RTRIM(TELEPHSZ) AS TELEPHSZ,
	RTRIM(HIBLEIR) AS HIBLEIR,
	RTRIM(MUVLEIR) AS MUVLEIR,
	RTRIM(NEV) AS NEV,
	MUNDAT,
	MUNORA
FROM
	DOLGOZO RIGHT JOIN
		(TELJM RIGHT JOIN
			(OBJEKTUM RIGHT JOIN
				(Q291 RIGHT JOIN MUNKALAP ON Q291.KODERT = MUNKALAP.SZOLGJELL)
			ON OBJEKTUM.ID = MUNKALAP.OBJID)
		ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
	ON DOLGOZO.ID = TELJM.DOLG_ID
WHERE
	(@MUNKALAPID IS NULL OR (@MUNKALAPID IS NOT NULL AND MUNKALAP.ID = @MUNKALAPID)) AND
	((@MLAPTIP IS NULL) OR (@MLAPTIP IS NOT NULL AND MUNKALAP.MTIP=@MLAPTIP))
	--AND ((@SZEREGYS IS NULL) OR (@SZEREGYS IS NOT NULL AND MUNKALAP.SZEREGYS=@SZEREGYS))
	AND ((@SZOLGJELL IS NULL) OR (@SZOLGJELL IS NOT NULL AND SZOLGJELL=@SZOLGJELL))
	AND ((@TIPUSH IS NULL) OR (@TIPUSH IS NOT NULL AND TIPUSH=@TIPUSH))
	AND ((@FSZAM IS NULL) OR (@FSZAM IS NOT NULL AND MUNKALAP.FSZAM=@FSZAM))
	AND ((@OBJTIP IS NULL) OR (@OBJTIP IS NOT NULL AND OBJTIP=@OBJTIP))
	AND ((@OBJID IS NULL) OR (@OBJID IS NOT NULL AND OBJID=@OBJID))
	--AND ((@EPULID IS NULL) OR (@EPULID IS NOT NULL AND OBJID=@EPULID))
	AND ((@DOLGID IS NULL) OR (@DOLGID IS NOT NULL AND DOLGOZO.ID=@DOLGID))
	AND ((@ALLAPOT IS NULL) OR (@ALLAPOT IS NOT NULL AND (ALLAPOT=@ALLAPOT OR (@ALLAPOT=5 AND (ALLAPOT=1 OR ALLAPOT=2 OR ALLAPOT=4)))))
	AND ((@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL AND KIALLDAT BETWEEN @DATUMTOL AND @DATUMIG))
	AND ((@MUNDATTOL IS NULL AND @MUNDATIG IS NULL)
		OR (@MUNDATTOL IS NOT NULL AND @MUNDATIG IS NOT NULL AND MUNDAT BETWEEN @MUNDATTOL AND @MUNDATIG))
	--AND ((@TELEPHSZ IS NULL) OR (@TELEPHSZ IS NOT NULL AND OBJEKTUM.TELEPHSZ LIKE '%'+@TELEPHSZ+'%'))
	AND ((@TELEPHSZ IS NULL) OR (@TELEPHSZ IS NOT NULL AND OBJEKTUM.TELEPHSZ=@TELEPHSZ))
	AND ((@MUNELV IS NULL) OR (@MUNELV IS NOT NULL AND MUNELV=@MUNELV))
ORDER BY
	MUNKALAP.ID DESC


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdMlap]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LekerdRaktar
@pOBJTIP VARCHAR(2),
@pALLAPOT VARCHAR(1)=NULL,
@pEPULET_ID INTEGER=NULL,
@pFUTOMU_ID INTEGER=NULL,
@pHITIDO DATETIME=NULL,
@pDOLG_ID INTEGER=NULL,
@pSZLEVEL_SZAM VARCHAR(20)=NULL,
@pSZLEVEL_DAT DATETIME=NULL,
@pTIPUS VARCHAR(20)=NULL,
@pATMERO REAL=NULL,
@pBENYHOSSZ REAL=NULL,
@pVEZHOSSZ REAL=NULL,
@pSZUKSHOSSZ REAL=NULL
/*
Állapot												Tábla
	NULL,A	Mind
	F		Felszerelt								FELSZERELT
	D		Dolgozonal								DOLGOZONAL
	R		Raktaron								RAKTAR
	E		Szallitonal, ellenorzesre				SZALLITONAL
	J		Szallitonal, hitelesitesre/javitasra	SZALLITONAL
	S		Selejt									RAKTAR
	X		Ellenorzesre elokeszitve
	Y		Javitasra/hitelesitesre elokeszitve
*/
AS

SET NOCOUNT ON

CREATE TABLE #ZZZ
	(
	ID INTEGER,
	OBJTIP VARCHAR(2),
	OBJID INTEGER,
	GYSZAM VARCHAR(15),
	TIPUS VARCHAR(20),
	DATUMTOL DATETIME,--VARCHAR(10),
	ALLAPOT VARCHAR(1),
	EPULET_ID INTEGER,
	FUTOMU_ID INTEGER,
	HITIDO DATETIME,
	DOLG_ID INTEGER,
	SZLEVEL_SZAM VARCHAR(20),
	SZLEVEL_DATUM DATETIME
	)

DECLARE RAKTARcursor CURSOR FAST_FORWARD FOR
SELECT
	R.ID,
	O.OBJTIP,
	R.OBJID,
	O.GYSZAM,
	O.TIPUS,
	R.DATUMTOL,
	R.ALLAPOT,
	O.HITIDO,
	R.DOLG_ID,
	R.SZLEVEL_SZAM,
	R.SZLEVEL_DATUM
FROM
	ERZEKELO E RIGHT JOIN
		(VIZORA V RIGHT JOIN
			(RAKTAR R INNER JOIN OBJEKTUM O ON O.ID = R.OBJID)
		ON V.ID = O.ID)
	ON E.ID = O.ID
WHERE
	(@pOBJTIP = '00' OR
		(@pOBJTIP <> '00' AND R.OBJTIP = @pOBJTIP))
	AND (@pALLAPOT IS NULL OR
			(@pALLAPOT IS NOT NULL AND R.ALLAPOT = @pALLAPOT))
	AND (@pHITIDO IS NULL OR
			(@pHITIDO IS NOT NULL AND O.HITIDO = @pHITIDO))
	AND (@pDOLG_ID IS NULL OR
			(@pDOLG_ID IS NOT NULL AND R.DOLG_ID = @pDOLG_ID))
	AND (@pSZLEVEL_SZAM IS NULL OR
			(@pSZLEVEL_SZAM IS NOT NULL AND R.SZLEVEL_SZAM LIKE @pSZLEVEL_SZAM+'%'))
	AND (@pSZLEVEL_DAT IS NULL OR
			(@pSZLEVEL_DAT IS NOT NULL AND R.SZLEVEL_DATUM = @pSZLEVEL_DAT))
	AND (@pTIPUS IS NULL OR
			(@pTIPUS IS NOT NULL AND O.TIPUS LIKE @pTIPUS+'%'))
	AND (@pATMERO IS NULL OR
			(@pATMERO IS NOT NULL AND O.OBJTIP = '19' AND V.ATMERO = @pATMERO))
	AND (@pBENYHOSSZ IS NULL OR
			(@pBENYHOSSZ IS NOT NULL AND O.OBJTIP = '20' AND E.BENYHOSSZ = @pBENYHOSSZ))
	AND (@pVEZHOSSZ IS NULL OR
			(@pVEZHOSSZ IS NOT NULL AND O.OBJTIP = '20' AND E.VEZHOSSZ = @pVEZHOSSZ))
	AND (@pSZUKSHOSSZ IS NULL OR
			(@pSZUKSHOSSZ IS NOT NULL AND O.OBJTIP = '20' AND E.SZUKSHOSSZ = @pSZUKSHOSSZ))
	AND R.DATUMIG IS NULL

DECLARE @RAKTARID INTEGER
DECLARE @OBJTIP VARCHAR(2)
DECLARE @OBJID INTEGER
DECLARE @GYSZAM VARCHAR(15)
DECLARE @TIPUS VARCHAR(20)
DECLARE @DATUMTOL DATETIME--VARCHAR(10)
DECLARE @ALLAPOT VARCHAR(1)
DECLARE @DOLG_ID INTEGER
DECLARE @HITIDO DATETIME
DECLARE @SZLEVEL_SZAM VARCHAR(20)
DECLARE @SZLEVEL_DATUM DATETIME

DECLARE @EPULET_ID INTEGER
DECLARE @FUTOMU_ID INTEGER

OPEN RAKTARcursor
FETCH NEXT FROM RAKTARcursor
	INTO @RAKTARID,@OBJTIP,@OBJID,@GYSZAM,@TIPUS,@DATUMTOL,@ALLAPOT,@HITIDO,@DOLG_ID,@SZLEVEL_SZAM,@SZLEVEL_DATUM
	
--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
	BEGIN

	EXEC @EPULET_ID = sp_Rekurziv @OBJID, '01'
		--WHERE KAPCSOLAT.ID2 = @OBJID AND OBJEKTUM.OBJTIP = '37'	--Lépcsoház
		--WHERE KAPCSOLAT.ID2 = @OBJID AND OBJEKTUM.OBJTIP = '01'	--Épület
	EXEC @FUTOMU_ID = sp_Rekurziv @OBJID, '03'
		--WHERE KAPCSOLAT.ID2 = @EPULET_ID AND OBJEKTUM.OBJTIP = '03'	--Futomu

	INSERT INTO #ZZZ
	SELECT
		@RAKTARID,
		@OBJTIP,
		@OBJID,
		@GYSZAM,
		@TIPUS,
		@DATUMTOL,
		@ALLAPOT,
		@EPULET_ID,
		@FUTOMU_ID,
		@HITIDO,
		@DOLG_ID,
		@SZLEVEL_SZAM,
		@SZLEVEL_DATUM
	WHERE
		(@pEPULET_ID IS NULL OR
			(@pEPULET_ID IS NOT NULL AND @EPULET_ID = @pEPULET_ID))
		AND (@pFUTOMU_ID IS NULL OR
			(@pFUTOMU_ID IS NOT NULL AND @FUTOMU_ID = @pFUTOMU_ID))
			
	FETCH NEXT FROM RAKTARcursor
		INTO @RAKTARID,@OBJTIP,@OBJID,@GYSZAM,@TIPUS,@DATUMTOL,@ALLAPOT,@HITIDO,@DOLG_ID,@SZLEVEL_SZAM,@SZLEVEL_DATUM

	END	--WHILE

--Lezárjuk és töröljük a kurzort
CLOSE RAKTARcursor
DEALLOCATE RAKTARcursor

SET NOCOUNT OFF

IF @pOBJTIP = '00'
	BEGIN
	SELECT
		#ZZZ.ID,
		Q296.KODENEV AS OBJTIP,
		#ZZZ.GYSZAM,
		#ZZZ.TIPUS,
		CONVERT(VARCHAR(10), #ZZZ.DATUMTOL, 102)+'.' AS DATUMTOL,
		Q367.KODENEV AS ALLAPOT,
		coalesce(rtrim(OE.UTCA),'-') + ' ' + coalesce(rtrim(OE.HSZ),'-') AS EPULET,
		OA.MEGNEV AS FUTOMU,
		CONVERT(VARCHAR(10), #ZZZ.HITIDO, 102)+'.' AS HITIDO,
		Q334.NEV AS DOLG_ID,
		#ZZZ.SZLEVEL_SZAM,
		#ZZZ.SZLEVEL_DATUM
	FROM
		Q296 RIGHT JOIN
			(Q334 RIGHT JOIN
				(Q367 RIGHT JOIN
					(OBJEKTUM OA RIGHT JOIN
						(OBJEKTUM OE RIGHT JOIN #ZZZ ON OE.ID = #ZZZ.EPULET_ID)
					ON OA.ID = #ZZZ.FUTOMU_ID)
				ON Q367.KODERT = #ZZZ.ALLAPOT)
			ON Q334.ID = #ZZZ.DOLG_ID)
		ON Q296.KODERT = #ZZZ.OBJTIP
	ORDER BY
		#ZZZ.OBJTIP,
		#ZZZ.GYSZAM
	END
ELSE
	BEGIN
	SELECT
		#ZZZ.ID,
		#ZZZ.GYSZAM,
		#ZZZ.TIPUS,
		CONVERT(VARCHAR(10), #ZZZ.DATUMTOL, 102)+'.' AS DATUMTOL,--#ZZZ.DATUMTOL,
		Q367.KODENEV AS ALLAPOT,
		coalesce(rtrim(OE.UTCA),'-') + ' ' + coalesce(rtrim(OE.HSZ),'-') AS EPULET,
		OA.MEGNEV AS FUTOMU,
		CONVERT(VARCHAR(10), #ZZZ.HITIDO, 102)+'.' AS HITIDO,
		Q334.NEV AS DOLG_ID,
		#ZZZ.SZLEVEL_SZAM,
		#ZZZ.SZLEVEL_DATUM
	FROM
		Q334 RIGHT JOIN
			(Q367 RIGHT JOIN
				(OBJEKTUM OA RIGHT JOIN
					(OBJEKTUM OE RIGHT JOIN #ZZZ ON OE.ID = #ZZZ.EPULET_ID)
				ON OA.ID = #ZZZ.FUTOMU_ID)
			ON Q367.KODERT = #ZZZ.ALLAPOT)
		ON Q334.ID = #ZZZ.DOLG_ID
	ORDER BY
		#ZZZ.GYSZAM,
		#ZZZ.TIPUS,
		DATUMTOL,
		ALLAPOT,
		EPULET,
		FUTOMU,
		HITIDO,
		DOLG_ID,
		SZLEVEL_SZAM,
		SZLEVEL_DATUM
	END
	
DROP TABLE #ZZZ


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO










/****** Object:  Stored Procedure dbo.sp_LekerdSzerz    Script Date: 2000. 07. 04. 18:56:17 ******/
CREATE PROCEDURE sp_LekerdSzerz
@KEPVIS_ID INTEGER = NULL,
@SZOLG VARCHAR(2) = NULL,
@PAZ VARCHAR(8) = NULL,
@SZLA_CIKL VARCHAR(2) = NULL,
@UGYFN VARCHAR(100) = NULL,
@ERVENYES INTEGER,
@DATUMTOL DATETIME = NULL,
@DATUMIG DATETIME = NULL
AS
SELECT
	SZERZFEJ.ID,
	KEPVIS.KOZNEV,
	SZERZFEJ.PAZ,
	LEPCSOHAZ.CIM,
	Q338.KODENEV AS SZOLG,
	SZERZTEL.OSSZEG,
	SZERZFEJ.SZLA_CIKL,
	SZERZFEJ.UGYFN,
	SZERZTEL.SZ_MENNY,
	Q279.KODENEV AS MENNY_ME
FROM
	KEPVIS INNER JOIN
		(KEPV_TET RIGHT JOIN
			(Q279 RIGHT JOIN
				(Q338 RIGHT JOIN
					(ARVALT INNER JOIN
						(LEPCSOHAZ RIGHT JOIN
							(SZERZFEJ INNER JOIN SZERZTEL ON SZERZTEL.SZER_ID = SZERZFEJ.ID)
						ON LEPCSOHAZ.ID = SZERZTEL.OBJ_ID)
					ON ARVALT.ID = SZERZFEJ.SZOLG)
				ON Q338.KODERT = ARVALT.SZOLG)
			ON Q279.KODERT = SZERZTEL.MENNY_ME)
		ON KEPV_TET.SZERZ_ID = SZERZFEJ.ID)
	ON KEPVIS.ID = KEPV_TET.KEPVIS_ID
WHERE
	KEPVIS.ID = COALESCE(@KEPVIS_ID,KEPVIS.ID)
	AND (@SZOLG IS NULL OR (@SZOLG IS NOT NULL AND ARVALT.SZOLG = COALESCE(@SZOLG,ARVALT.SZOLG)))
	AND (@PAZ IS NULL OR (@PAZ IS NOT NULL AND SZERZFEJ.PAZ LIKE (COALESCE(@PAZ,SZERZFEJ.PAZ) + '%')))
	AND (@SZLA_CIKL IS NULL OR (@SZLA_CIKL IS NOT NULL AND SZLA_CIKL = COALESCE(@SZLA_CIKL,SZLA_CIKL)))
	AND (@UGYFN IS NULL OR (@UGYFN IS NOT NULL AND UGYFN LIKE COALESCE(@UGYFN,UGYFN) + '%'))
	AND
		--Érvényes?
		((@ERVENYES = 2 AND (SZERZFEJ.BEFDAT IS NULL OR (SZERZFEJ.BEFDAT IS NOT NULL AND SZERZFEJ.BEFDAT > GetDate())))
		--Lejárt?
		OR (@ERVENYES = 1 AND (SZERZFEJ.BEFDAT IS NOT NULL AND SZERZFEJ.BEFDAT < GetDate())))
		--Dátumszurés
	AND ((@DATUMTOL IS NULL OR @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL AND
			(
/*			(SZERZFEJ.BEFDAT IS NULL AND SZERZFEJ.ERVDAT >= @DATUMTOL AND SZERZFEJ.ERVDAT <= @DATUMIG)
			OR
			SZERZFEJ.BEFDAT IS NOT NULL AND
				(
				(SZERZFEJ.ERVDAT <= @DATUMTOL AND SZERZFEJ.BEFDAT >= @DATUMTOL)
				OR (SZERZFEJ.ERVDAT >= @DATUMTOL AND SZERZFEJ.BEFDAT <= @DATUMIG)
				OR (SZERZFEJ.ERVDAT >= @DATUMTOL AND SZERZFEJ.ERVDAT <= @DATUMIG))
				)
*/
			(SZERZFEJ.BEFDAT IS NULL AND SZERZFEJ.ERVDAT <= @DATUMIG) --A vegenel hamarabb kezd és nincs vége
			OR
			SZERZFEJ.BEFDAT IS NOT NULL AND
				(
				(SZERZFEJ.ERVDAT <= @DATUMTOL AND SZERZFEJ.BEFDAT >= @DATUMTOL)   -- Hamarabb kezd és késobb van vége
				OR (SZERZFEJ.ERVDAT >= @DATUMTOL AND SZERZFEJ.BEFDAT <= @DATUMIG) -- Késobb kezd és hamarabb van vége
				OR (SZERZFEJ.ERVDAT >= @DATUMTOL AND SZERZFEJ.ERVDAT <= @DATUMIG) -- Késobb kezd
				OR (SZERZFEJ.BEFDAT >= @DATUMTOL AND SZERZFEJ.BEFDAT <= @DATUMIG) -- Hamarabb van vége
				)
			)
		))

ORDER BY
	KEPVIS.KOZNEV,
	SZERZFEJ.PAZ,
	LEPCSOHAZ.CIM










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdSzerz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LekerdSzlaAlt    Script Date: 2000. 07. 04. 18:56:17 ******/
CREATE PROCEDURE sp_LekerdSzlaAlt
@EGYEDI INTEGER = 0,
@ZAROLT INTEGER = 0,
@KEPVIS VARCHAR(100) = NULL,
@SZOLG VARCHAR(2) = NULL,
@PAZ VARCHAR(8) = NULL,
@DATUMTOL DATETIME = NULL,
@DATUMIG DATETIME = NULL
AS

IF @EGYEDI = 1
	BEGIN
	SELECT
		SZLA_ALT.ID,
		SZLA_ALT.SZLASZ,
		SZLA_ALT.UGYFN,
		SZLA_ALT.UGYFC,
		SZLA_ALT.TDAT,
		SZLA_ALT.FDAT,
		SZLA_ALT_TET.SZ_MENNY,
		Q279.KODENEV AS MENNY_ME,
		Q338.KODENEV AS SZOLG,
		SZLA_ALT_TET.NOTERT AS NOTERT,
		SZLA_ALT_TET.OSSZEG AS OSSZEG
	FROM
		Q338 RIGHT JOIN
			(Q279 RIGHT JOIN
				(SZLA_ALT LEFT JOIN SZLA_ALT_TET ON SZLA_ALT_TET.SZLA_ID = SZLA_ALT.ID)
			ON Q279.KODERT = SZLA_ALT_TET.MENNY_ME)
		ON Q338.KODERT = SZLA_ALT_TET.CIKK
	WHERE
		(@SZOLG IS NULL OR (@SZOLG IS NOT NULL AND SZLA_ALT_TET.CIKK = COALESCE(@SZOLG,SZLA_ALT_TET.CIKK)))
		AND
		EGYEDI = @EGYEDI
		AND
		ZAROLT = @ZAROLT
	ORDER BY
		SZLASZ,
		PAZ,
		KOZNEV,
		UGYFN,
		TDAT,
		FDAT
	END
ELSE
	BEGIN
	SELECT
		SZLA_ALT.ID,
		SZLA_ALT.SZLASZ,
		SZLA_ALT.PAZ,
		SZLA_ALT.KOZNEV,
		SZLA_ALT.UGYFN,
		SZLA_ALT.TDAT,
		SZLA_ALT.FDAT,
		SZLA_ALT_TET.CIKK_MENNY,
		Q279.KODENEV AS MENNY_ME,
		Q338.KODENEV AS SZOLG,
		ARVALT.NOTERT AS NOTERT,
		SZLA_ALT_TET.OSSZEG AS OSSZEG
	FROM
		Q338 RIGHT JOIN
			(Q279 RIGHT JOIN
				(ARVALT RIGHT JOIN
					(SZLA_ALT LEFT JOIN SZLA_ALT_TET ON SZLA_ALT_TET.SZLA_ID = SZLA_ALT.ID)
				ON ARVALT.ID = SZLA_ALT.SZOLG)
			ON Q279.KODERT = SZLA_ALT_TET.MENNY_ME)
		ON Q338.KODERT = ARVALT.SZOLG
	WHERE
		(@KEPVIS IS NULL OR (@KEPVIS IS NOT NULL AND SZLA_ALT.KOZNEV LIKE (COALESCE(@KEPVIS,SZLA_ALT.KOZNEV) + '%')))
		AND (@SZOLG IS NULL OR (@SZOLG IS NOT NULL AND ARVALT.SZOLG = COALESCE(@SZOLG,ARVALT.SZOLG)))
		AND (@PAZ IS NULL OR (@PAZ IS NOT NULL AND SZLA_ALT.PAZ LIKE (COALESCE(@PAZ,SZLA_ALT.PAZ) + '%')))
		AND
		EGYEDI = @EGYEDI
		AND
		ZAROLT = @ZAROLT
		--Dátumszurés
		AND ((@DATUMTOL IS NULL OR @DATUMIG IS NULL)
			OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL AND
				(SZLA_ALT.TDAT BETWEEN @DATUMTOL AND @DATUMIG)))
	ORDER BY
		SZLASZ,
		PAZ,
		KOZNEV,
		UGYFN,
		TDAT,
		FDAT
	END







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdSzlaAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LekerdSzolg    Script Date: 2000. 07. 04. 18:56:17 ******/
CREATE PROCEDURE sp_LekerdSzolg
@LEPCSOHAZ INTEGER = NULL,
@FUTOMU INTEGER = NULL,
@SZOLG VARCHAR(2) = NULL
AS

SET NOCOUNT ON

CREATE TABLE #ZZZ
	(
	FUTOMU INTEGER NULL,
	LEPCSOHAZ INTEGER NULL,
	SZOLG INTEGER NULL,
	NOTERT REAL NULL,
	ERVDAT DATETIME NULL
	)

--Segédváltozók

DECLARE SZOLGcursor CURSOR FAST_FORWARD FOR
SELECT
	LEPCSOHAZ.ID,
	SZERZFEJ.SZOLG
FROM
	LEPCSOHAZ RIGHT JOIN
		(SZERZTEL INNER JOIN SZERZFEJ ON SZERZTEL.SZER_ID = SZERZFEJ.ID)
	ON LEPCSOHAZ.ID = SZERZTEL.OBJ_ID

DECLARE @LEPCSOHAZ_ID INTEGER
DECLARE @SZOLG_ID INTEGER
DECLARE @FUTOMU_ID INTEGER

--Megnyitjuk a kurzort
OPEN SZOLGcursor

--Lekérjük az elso rekordot
FETCH NEXT FROM SZOLGcursor
	INTO @LEPCSOHAZ_ID,@SZOLG_ID

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk, hogy az adott lépcsoház melyik futomuhöz tartozik.
	EXEC @FUTOMU_ID = sp_Rekurziv @LEPCSOHAZ_ID
	
	INSERT INTO #ZZZ(FUTOMU,LEPCSOHAZ,SZOLG)
	SELECT
		@FUTOMU_ID,
		@LEPCSOHAZ_ID,
		@SZOLG_ID

	FETCH NEXT FROM SZOLGcursor
		INTO @LEPCSOHAZ_ID,@SZOLG_ID
END

--Lezárjuk és töröljük a kurzort
CLOSE SZOLGcursor
DEALLOCATE SZOLGcursor

SET NOCOUNT OFF

		
SELECT
	FUTOMU AS ID1,
	MEGNEV,
	LEPCSOHAZ.CIM,
	Q338.KODENEV AS SZOLG,
	ARVALT.NOTERT,
	ARVALT.ERVDAT
FROM
	Q338 RIGHT JOIN
		(OBJEKTUM RIGHT JOIN
			(ARVALT RIGHT JOIN
				(#ZZZ INNER JOIN LEPCSOHAZ ON LEPCSOHAZ.ID = #ZZZ.LEPCSOHAZ)
			ON ARVALT.ID = #ZZZ.SZOLG)
		ON OBJEKTUM.ID = #ZZZ.FUTOMU)
	ON Q338.KODERT = ARVALT.SZOLG
WHERE
	ARVALT.SZOLG = coalesce(@SZOLG,ARVALT.SZOLG)
	AND #ZZZ.FUTOMU = coalesce(@FUTOMU,#ZZZ.FUTOMU)
	AND LEPCSOHAZ = coalesce(@LEPCSOHAZ,LEPCSOHAZ)
	
DROP TABLE #ZZZ









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LekerdSzolg]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_ListKapcsID    Script Date: 2000. 07. 04. 18:56:18 ******/

CREATE PROCEDURE sp_ListKapcsID
@pID INTEGER
AS
SELECT
	ID2,
	OBJTIP
FROM
	OBJEKTUM INNER JOIN KAPCSOLAT ON OBJEKTUM.ID = KAPCSOLAT.ID2
WHERE
	ID1 = @pID










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_ListKapcsID]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadBerRaktarDb
/*
Visszaadja az osszes olyan objektumot, ami
	a berendezes raktarban talahato (BERRAKTAR)
*/
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL,
@pDATUMTOL DATETIME=NULL,
@pDATUMIG DATETIME=NULL
AS
SELECT
	COUNT(BERRAKTAR.ID) AS TALALAT
FROM
	BERRAKTAR
WHERE
	BERRAKTAR.OBJTIP = coalesce(@pOBJTIP, BERRAKTAR.OBJTIP)
	AND OBJID = coalesce(@pOBJID, BERRAKTAR.OBJID)
	AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
		OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND BEKERUL_DAT BETWEEN @pDATUMTOL AND @pDATUMIG))


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadBerRaktarDb]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadBerRaktarSzDb
/*
Visszaadja az osszes olyan objektumot, ami
- nincs bekotve sehova
- nincs a berendezes raktarban (BERRAKTAR)
*/
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL
AS
SELECT
	COUNT(O.ID) AS TALALAT
FROM
	OBJEKTUM O
WHERE
	O.OBJTIP = coalesce(@pOBJTIP, O.OBJTIP)
	AND ID = coalesce(@pOBJID, O.ID)
	AND ((O.KAPCSOLT = 0)
		AND (NOT EXISTS(SELECT ID FROM BERRAKTAR WHERE OBJID=O.ID)))


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadBerRaktarSzDb]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_LoadDolgozo
@pID INTEGER
AS
SELECT
	*
FROM
	DOLGOZO
WHERE
	ID = @pID
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadDolgozo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LoadEpul    Script Date: 2000. 07. 04. 18:56:18 ******/











CREATE PROCEDURE sp_LoadEpul
@pID INTEGER
AS
SELECT
 MEGNEV as EPULNEV,
 VAROS,
 UTCA,
 HSZ,
 IRSZAM,
 EPULTIP,
 HELYR,
 EPULSZ,
 FUTESMOD,
 LEGTELTIP,
 LEGTHELY,
 EPULATAD,
 FUTOTIP,
 UZEMELT,
 KARBANTAR,
 EPULHOSZ,
 LAKTERF,
 LEPCSOTERF,
 KOZOSTERF,
 KOZULTERF,
 TERF_ARAM,
 HOLEPCSO,
 EPUL_ARAM,
 CIRK_ARAM,
 FUTBESZAB,
 CIRKUL,
 ATKOTES,
 HMVRENDS,
 NYOMKUL,
 CIRK_MOD,
 FOELZ,
 FELOSZT,
 UTEM
FROM
 OBJEKTUM,
 EPULET
WHERE
 EPULET.ID = @pID
 AND OBJEKTUM.ID = @pID




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadEpul]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadJegyz
@pID INTEGER
AS
SELECT
	*
FROM
	JEGYZ
WHERE
	JEGYZSZ = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadJegyz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadJegyzDb
@pJTIP VARCHAR(2)=NULL,
@pMUVEL VARCHAR(3)=NULL,
@pOBJTIP VARCHAR(2)=NULL,
@pOBJID INTEGER=NULL,
@pDATUMTOL DATETIME=NULL,
@pDATUMIG DATETIME=NULL
AS
DECLARE @iA INTEGER
DECLARE @iB INTEGER
IF @pJTIP IS NULL
	BEGIN
		SELECT @iA = COUNT(JEGYZSZ)
		FROM
			JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID
		WHERE
			OBJID = coalesce(@pOBJID, OBJID)
			AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
				OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND JDAT BETWEEN @pDATUMTOL AND @pDATUMIG))
		
		SELECT @iB = COUNT(LABOR.ID)
		FROM
			LABOR
		WHERE
			((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
			OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND MINTA_IDO BETWEEN @pDATUMTOL AND @pDATUMIG))
		SELECT @iA + @iB AS JEGYZDB
	END

ELSE IF @pJTIP = '8'
	BEGIN
		SELECT COUNT(ID) AS JEGYZDB
		FROM
			LABOR
		WHERE
			((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
			OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND MINTA_IDO BETWEEN @pDATUMTOL AND @pDATUMIG))
	END
	
ELSE
	BEGIN
		SELECT COUNT(JEGYZSZ) AS JEGYZDB
		FROM
			JEGYZ INNER JOIN KARBAN ON KARBAN.ID = JEGYZ.KARB_ID
		WHERE
			OBJID = coalesce(@pOBJID, OBJID)
			AND KARBAN.OBJTIP = coalesce(@pOBJTIP, KARBAN.OBJTIP)
			AND MUVEL = coalesce(@pMUVEL, MUVEL)
			AND JTIP = coalesce(@pJTIP, JTIP)
			AND ((@pDATUMTOL IS NULL AND @pDATUMIG IS NULL)
				OR (@pDATUMTOL IS NOT NULL AND @pDATUMIG IS NOT NULL AND JDAT BETWEEN @pDATUMTOL AND @pDATUMIG))
	END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadJegyzDb]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LoadKepvis    Script Date: 2000. 07. 04. 18:56:18 ******/
CREATE PROCEDURE sp_LoadKepvis
@pID INTEGER
AS
SELECT
	*
FROM
	KEPVIS
WHERE
	ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadKepvis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LoadKontir    Script Date: 2000. 07. 04. 18:56:18 ******/





CREATE PROCEDURE sp_LoadKontir
@pID VARCHAR(12)
AS
SELECT
	*
FROM
	KONTIR
WHERE
	FSZAM = @pID














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadKontir]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadLabor
@pID INTEGER
AS
SELECT
	*,
	CONVERT(varchar(10),MINTA_IDO,102) AS MINTA_DAT,
	CONVERT(varchar(10),MINTA_IDO,108) AS MINTA_TIM,
	CONVERT(varchar(10),MINTA_ATAD_IDO,102) AS MINTA_ATAD_DAT,
	CONVERT(varchar(10),MINTA_ATAD_IDO,108) AS MINTA_ATAD_TIM,
	CONVERT(varchar(10),VIZSG_KEZD,102) AS VIZSG_KEZD_DAT,
	CONVERT(varchar(10),VIZSG_KEZD,108) AS VIZSG_KEZD_TIM,
	CONVERT(varchar(10),VIZSG_VEGE,102) AS VIZSG_VEGE_DAT,
	CONVERT(varchar(10),VIZSG_VEGE,108) AS VIZSG_VEGE_TIM/*,
	CONVERT(VARCHAR(10),MUN_SORSZ) + ';' +
		COALESCE(CONVERT(VARCHAR(30),KIALLDAT,111),'-') + ';'
		AS MUN_SORSZ*/
FROM
	LABOR --INNER JOIN MUNKALAP ON MUNKALAP.ID = LABOR.MUN_SORSZ
WHERE
	LABOR.ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadLabor]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadMlapDb
@MLAPTIP VARCHAR(1)=NULL,
--@SZEREGYS VARCHAR(2)=NULL,
@SZOLGJELL VARCHAR(2)=NULL,
@TIPUSH VARCHAR(3)=NULL,
@FSZAM VARCHAR(12)=NULL,
@OBJTIP VARCHAR(2)=NULL,
@OBJID INTEGER=NULL,
--@EPULID INTEGER=NULL,
@DOLGID INTEGER=NULL,
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL,
@MUNDATTOL DATETIME=NULL,
@MUNDATIG DATETIME=NULL,
@ALLAPOT INTEGER=NULL,
@MUNKALAPID INTEGER=NULL,
@TELEPHSZ VARCHAR(20)=NULL,
@MUNELV DATETIME=NULL
AS

SELECT
	COUNT(DISTINCT MUNKALAP.ID) AS MLAPDB
FROM
	DOLGOZO RIGHT JOIN
		(TELJM RIGHT JOIN
			(OBJEKTUM RIGHT JOIN
				(Q291 RIGHT JOIN MUNKALAP ON Q291.KODERT = MUNKALAP.SZOLGJELL)
			ON OBJEKTUM.ID = MUNKALAP.OBJID)
		ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
	ON DOLGOZO.ID = TELJM.DOLG_ID
WHERE
	(@MUNKALAPID IS NULL OR (@MUNKALAPID IS NOT NULL AND MUNKALAP.ID = @MUNKALAPID)) AND
	((@MLAPTIP IS NULL) OR (@MLAPTIP IS NOT NULL AND MUNKALAP.MTIP=@MLAPTIP))
	--AND ((@SZEREGYS IS NULL) OR (@SZEREGYS IS NOT NULL AND MUNKALAP.SZEREGYS=@SZEREGYS))
	AND ((@SZOLGJELL IS NULL) OR (@SZOLGJELL IS NOT NULL AND SZOLGJELL=@SZOLGJELL))
	AND ((@TIPUSH IS NULL) OR (@TIPUSH IS NOT NULL AND TIPUSH=@TIPUSH))
	AND ((@FSZAM IS NULL) OR (@FSZAM IS NOT NULL AND MUNKALAP.FSZAM=@FSZAM))
	AND ((@OBJTIP IS NULL) OR (@OBJTIP IS NOT NULL AND OBJTIP=@OBJTIP))
	AND ((@OBJID IS NULL) OR (@OBJID IS NOT NULL AND OBJID=@OBJID))
	--AND ((@EPULID IS NULL) OR (@EPULID IS NOT NULL AND OBJID=@EPULID))
	AND ((@DOLGID IS NULL) OR (@DOLGID IS NOT NULL AND DOLGOZO.ID=@DOLGID))
	AND ((@ALLAPOT IS NULL) OR (@ALLAPOT IS NOT NULL AND (ALLAPOT=@ALLAPOT OR (@ALLAPOT=5 AND (ALLAPOT=1 OR ALLAPOT=2 OR ALLAPOT=4)))))
	AND ((@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL AND KIALLDAT BETWEEN @DATUMTOL AND @DATUMIG))
	AND ((@MUNDATTOL IS NULL AND @MUNDATIG IS NULL)
		OR (@MUNDATTOL IS NOT NULL AND @MUNDATIG IS NOT NULL AND MUNDAT BETWEEN @MUNDATTOL AND @MUNDATIG))
	--AND ((@TELEPHSZ IS NULL) OR (@TELEPHSZ IS NOT NULL AND OBJEKTUM.TELEPHSZ LIKE '%'+@TELEPHSZ+'%'))
	AND ((@TELEPHSZ IS NULL) OR (@TELEPHSZ IS NOT NULL AND OBJEKTUM.TELEPHSZ=@TELEPHSZ))
	AND ((@MUNELV IS NULL) OR (@MUNELV IS NOT NULL AND MUNELV=@MUNELV))


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadMlapDb]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_LoadMunkalap
@pID INTEGER
AS

SET NOCOUNT ON
DECLARE @OBJTIP VARCHAR(2)	--Lekérdezzük a munkalaphoz kapcsolt objektum típusát
SELECT
	@OBJTIP = OBJTIP
FROM
	OBJEKTUM RIGHT JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	MUNKALAP.ID = @pID

DECLARE @EPUL_ID INTEGER
IF @OBJTIP = '02'	--Lakás esetén EPUL_ID is kell
	BEGIN
		SELECT
			@EPUL_ID = EPULET.ID
		FROM
			EPULET RIGHT JOIN
				(KAPCSOLAT INNER JOIN
					(OBJEKTUM RIGHT JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID)
				ON KAPCSOLAT.ID2=OBJEKTUM.ID)
			ON EPULET.ID = KAPCSOLAT.ID1
		WHERE
			MUNKALAP.ID = @pID
	END
ELSE
	BEGIN
		SELECT @EPUL_ID = NULL
	END
SET NOCOUNT OFF

SELECT
	BEJDAT,
	BEJNEV,
	TIPUSH,
	HIBLEIR,
	SZEREGYS,
	MFDOLG,
	MUNELV,
	IDOTOL,
	IDOIG,
	SZOLGTIP,
	MUNVEGZ,
	SZOLGJELL,
	OBJTIP,
	OBJID,
	@EPUL_ID AS EPULID,
	KARBTIP,
	MUVEL,
	FELTIP,
	FELLEIR,
	JELENSTIP,
	JELENSLEIR,
	MUVLEIR,
	INTEZ,
	VONEV,
	MUNKALAP.ID AS SORSZ,
	NAPSZAM,
	KIALLDAT,
	MUNKALAP.FSZAM,
	SZOLTIP,
	MUNSZ,
	MKAP,
	ALLAPOT,
	MVDOLG,
	MVDAT,
	LAKAS,
	REF,
	PLOMBAZAS,
	UJ,
	FELUJITOTT
FROM
	OBJEKTUM RIGHT JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	MUNKALAP.ID = @pID

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadMunkalap]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_LoadObjAlt
@pID INTEGER
AS
SELECT
	*
FROM
	OBJEKTUM
WHERE
	ID = @pID



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadObjAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LoadObjEgyedi    Script Date: 2000. 07. 04. 18:56:18 ******/

CREATE PROCEDURE sp_LoadObjEgyedi
@pID INTEGER
AS

DECLARE @pOBJTIP VARCHAR(2)
SELECT
	@pOBJTIP = OBJTIP
FROM
	OBJEKTUM
WHERE
	ID = @pID

IF @pOBJTIP = '01'
BEGIN
SELECT
 *
FROM
 EPULET
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '02'
BEGIN
SELECT
 *
FROM
 LAKAS
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '03'
BEGIN
SELECT
 *
FROM
 FUTOMU
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '04'
BEGIN
SELECT
 *
FROM
 KAZAN
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '05'
BEGIN
SELECT
 *
FROM
 KAZANEGO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '06'
BEGIN
SELECT
 *
FROM
 SZIVATTYU
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '07'
BEGIN
SELECT
 *
FROM
 HOCSERELO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '08'
BEGIN
SELECT
 *
FROM
 VENTILLATOR
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '09'
BEGIN
SELECT
 *
FROM
 BOYLER
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '10'
BEGIN
SELECT
 *
FROM
 MELEGVIZ_TAROLO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '11'
BEGIN
SELECT
 *
FROM
 TARTALY
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '12'
BEGIN
SELECT
 *
FROM
 SZUROK
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '13'
BEGIN
SELECT
 *
FROM
 VIZLAGYITO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '14'
BEGIN
SELECT
 *
FROM
 KOMPRESSZOR
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '15'
BEGIN
SELECT
 *
FROM
 TERMELO_CSO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '16'
BEGIN
SELECT
 *
FROM
 DEMAG_EMELOGEP
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '17'
BEGIN
SELECT
 *
FROM
 HOKOZPONT
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '18'
BEGIN
SELECT
 *
FROM
 HOOSSZEGZO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '19'
BEGIN
SELECT
 *
FROM
 VIZORA
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '20'
BEGIN
SELECT
 *
FROM
 ERZEKELO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '21'
BEGIN
SELECT
 *
FROM
 FOKAPCSOLO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '22'
BEGIN
SELECT
 *
FROM
 FAZISJAVITO_KONDENZATOR
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '23'
BEGIN
SELECT
 *
FROM
 GAZVESZELY_JELZO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '24'
BEGIN
SELECT
 *
FROM
 MOTOR
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '25'
BEGIN
SELECT
 *
FROM
 SZINTKAPCSOLO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '26'
BEGIN
SELECT
 *
FROM
 SZABALYOZO_AUTOMATIKA
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '27'
BEGIN
SELECT
 *
FROM
 SZABALYOZO_SZELEP
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '28'
BEGIN
SELECT
 *
FROM
 BIZTONSAGI_SZELEP
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '29'
BEGIN
SELECT
 *
FROM
 FREKVENCIAVALTO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '30'
BEGIN
SELECT
 *
FROM
 ARAMKOR
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '31'
BEGIN
SELECT
 *
FROM
 KOLTSEGMEGOSZTO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '32'
BEGIN
SELECT
 *
FROM
 TARCSA
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '33'
BEGIN
SELECT
 *
FROM
 HAJTOMU
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '34'
BEGIN
SELECT
 *
FROM
 LANGOR
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '35'
BEGIN
SELECT
 *
FROM
 TERMALKUT
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '36'
BEGIN
SELECT
 *
FROM
 SZERELVENY
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '37'
BEGIN
	SELECT
		*
	FROM
		LEPCSOHAZ
	WHERE
		ID = @pID
END










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadObjEgyedi]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadRaktar
@pID INTEGER
AS
SELECT
	O.MEGNEV AS R_MEGNEV,
	O.TIPUS AS R_TIPUS,
	O.GYSZAM AS R_GYSZAM,
	O.TELEPHSZ AS R_TELEPHSZ
FROM
	OBJEKTUM O RIGHT JOIN BERRAKTAR ON O.ID = BERRAKTAR.OBJID
WHERE
	BERRAKTAR.ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadRaktar]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadRaktarInfo
@pID INTEGER
AS

SET NOCOUNT ON

DECLARE @HOOSSZEGZO_ID INTEGER
DECLARE @VIZORA_ID INTEGER
DECLARE @ERZEKELO_ID INTEGER

DECLARE @OBJID INTEGER
DECLARE @KEPVIS INTEGER
SELECT @OBJID = OBJID, @KEPVIS = KEPVIS FROM RAKTAR WHERE ID = @pID

DECLARE @EPULET_ID INTEGER
EXEC @EPULET_ID = sp_Rekurziv @OBJID, '01' --Épület
	--sp_Rekurziv @OBJID, '37'	--Lépcsoház

SELECT @HOOSSZEGZO_ID = ID2 FROM KAPCSOLAT INNER JOIN OBJEKTUM ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE KAPCSOLAT.ID1 = @EPULET_ID AND OBJEKTUM.OBJTIP = '18'	--Hoösszegzo

SELECT @VIZORA_ID = ID2 FROM KAPCSOLAT INNER JOIN OBJEKTUM ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE KAPCSOLAT.ID1 = @EPULET_ID AND OBJEKTUM.OBJTIP = '19'	--Vízóra

SELECT @ERZEKELO_ID = ID2 FROM KAPCSOLAT INNER JOIN OBJEKTUM ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE KAPCSOLAT.ID1 = @EPULET_ID AND OBJEKTUM.OBJTIP = '20'	--Érzékelo


CREATE TABLE #ZZZ
	(
	KEPVIS INTEGER,
	
	H_ID INTEGER,
	H_GYSZAM VARCHAR(15),
	H_HITIDO DATETIME,
	H_TIPUS VARCHAR(20),
	H_ELHELYEZ VARCHAR(25),
	H_IMPULZUS REAL,
	H_LEOLV VARCHAR(2),
	H_HELYZET VARCHAR(2),
	H_ELEKTRONIKA VARCHAR(2),
	H_PLOMBA VARCHAR(12),
	H_KULCS VARCHAR(50),
	H_KULCS_LAKTEL VARCHAR(20),
	H_KULCS_MOBTEL VARCHAR(20),
	H_KULCS_MUNTEL VARCHAR(20),
	H_TULAJDON VARCHAR(1),
	H_MEGJ VARCHAR(1024),

	V_ID INTEGER,
	V_GYSZAM VARCHAR(15),
	V_HITIDO DATETIME,
	V_TIPUS VARCHAR(20),
	V_ELHELYEZ VARCHAR(25),
	V_IMPULZUS REAL,
	V_ATMERO REAL,
	V_TOMEGARAM REAL,
	V_PLOMBA VARCHAR(12),
	V_KULCS VARCHAR(50),
	V_KULCS_LAKTEL VARCHAR(20),
	V_KULCS_MOBTEL VARCHAR(20),
	V_KULCS_MUNTEL VARCHAR(20),
	V_TULAJDON VARCHAR(1),
	V_MEGJ VARCHAR(1024),
	
	E_ID INTEGER,
	E_GYSZAM VARCHAR(15),
	E_HITIDO DATETIME,
	E_TIPUS VARCHAR(20),
	E_ELHELYEZ VARCHAR(25),
	E_BENYHOSSZ REAL,
	E_VEZHOSSZ REAL,
	E_PLOMBA VARCHAR(12),
	E_PLOMBA2 VARCHAR(12),
	E_KULCS VARCHAR(50),
	E_KULCS_LAKTEL VARCHAR(20),
	E_KULCS_MOBTEL VARCHAR(20),
	E_KULCS_MUNTEL VARCHAR(20),
	E_SZUKSHOSSZ REAL,
	E_TULAJDON VARCHAR(1),
	E_MEGJ VARCHAR(1024)
	)

INSERT INTO
	#ZZZ(KEPVIS, H_ID, H_GYSZAM, H_HITIDO, H_TIPUS, H_ELHELYEZ,
		H_IMPULZUS, H_LEOLV, H_HELYZET, H_ELEKTRONIKA, H_PLOMBA,
		H_KULCS, H_KULCS_LAKTEL, H_KULCS_MOBTEL, H_KULCS_MUNTEL,
		H_TULAJDON, H_MEGJ)
SELECT
	@KEPVIS,
	O.ID,
	O.GYSZAM,
	O.HITIDO,
	O.TIPUS,
	O.ELHELYEZ,
	H.IMPULZUS,
	H.LEOLVMOD,
	H.HELYZET,
	H.ELEKTRONIKA,
	H.PLOMBA,
	R.KULCS,
	R.KULCS_LAKTEL,
	R.KULCS_MOBTEL,
	R.KULCS_MUNTEL,
	O.TULAJDON,
	O.MEGJ
FROM
	RAKTAR R RIGHT JOIN
		(HOOSSZEGZO H INNER JOIN OBJEKTUM O ON H.ID = O.ID)
	ON R.OBJID = O.ID
WHERE
	H.ID = @HOOSSZEGZO_ID


UPDATE
	#ZZZ
SET
	V_ID = O.ID,
	V_GYSZAM = O.GYSZAM,
	V_HITIDO = O.HITIDO,
	V_TIPUS = O.TIPUS,
	V_ELHELYEZ = O.ELHELYEZ,
	V_IMPULZUS = V.IMPULZUS,
	V_ATMERO = V.ATMERO,
	V_TOMEGARAM = V.TOMEGARAM,
	V_PLOMBA = V.PLOMBA,
	V_KULCS = R.KULCS,
	V_KULCS_LAKTEL = R.KULCS_LAKTEL,
	V_KULCS_MOBTEL = R.KULCS_MOBTEL,
	V_KULCS_MUNTEL = R.KULCS_MUNTEL,
	V_TULAJDON = O.TULAJDON,
	V_MEGJ = O.MEGJ
FROM
	RAKTAR R RIGHT JOIN
		(VIZORA V INNER JOIN OBJEKTUM O ON V.ID = O.ID)
	ON R.OBJID = O.ID
WHERE
	V.ID = @VIZORA_ID


UPDATE
	#ZZZ
SET
	E_ID = O.ID,
	E_GYSZAM = O.GYSZAM,
	E_HITIDO = O.HITIDO,
	E_TIPUS = O.TIPUS,
	E_ELHELYEZ = O.ELHELYEZ,
	E_BENYHOSSZ = E.BENYHOSSZ,
	E_VEZHOSSZ = E.VEZHOSSZ,
	E_PLOMBA = E.PLOMBA,
	E_PLOMBA2 = E.PLOMBA,
	E_SZUKSHOSSZ = E.SZUKSHOSSZ,
	E_KULCS = R.KULCS,
	E_KULCS_LAKTEL = R.KULCS_LAKTEL,
	E_KULCS_MOBTEL = R.KULCS_MOBTEL,
	E_KULCS_MUNTEL = R.KULCS_MUNTEL,
	E_TULAJDON = O.TULAJDON,
	E_MEGJ = O.MEGJ
FROM
	RAKTAR R RIGHT JOIN
		(ERZEKELO E INNER JOIN OBJEKTUM O ON E.ID = O.ID)
	ON R.OBJID = O.ID
WHERE
	E.ID = @ERZEKELO_ID



/*Történelem lekérdezése
Mindhárom berendezés típusra külön-külön le kell futtatni a kurzort.
És sajnos nem elég lezárni és újranyitni, teljesen újra kell csinálni...
*/
DECLARE @HIST_ID INTEGER
DECLARE @ALLAPOT VARCHAR(1)
DECLARE @MEGJ VARCHAR(255)
DECLARE @DATUMIG DATETIME

DECLARE @FULLMEGJ VARCHAR(1024)
SELECT @FULLMEGJ = ''

DECLARE @I INTEGER
SELECT @I = 1

WHILE @I <= 3
	BEGIN
	IF @I = 1
		BEGIN
		DECLARE HISTcursor CURSOR FAST_FORWARD FOR
		SELECT
			RH.ID,
			RH.ALLAPOT,
			RH.MEGJ,
			RH.DATUMIG
		FROM
			RAKTHISTORY RH
		WHERE
			RH.OBJID = @HOOSSZEGZO_ID
		ORDER BY
			RH.DATUMIG
		END

	ELSE IF @I = 2
		BEGIN
		DECLARE HISTcursor CURSOR FAST_FORWARD FOR
		SELECT
			RH.ID,
			RH.ALLAPOT,
			RH.MEGJ,
			RH.DATUMIG
		FROM
			RAKTHISTORY RH
		WHERE
			RH.OBJID = @VIZORA_ID
		ORDER BY
			RH.DATUMIG
		END

	ELSE IF @I = 3
		BEGIN
		DECLARE HISTcursor CURSOR FAST_FORWARD FOR
		SELECT
			RH.ID,
			RH.ALLAPOT,
			RH.MEGJ,
			RH.DATUMIG
		FROM
			RAKTHISTORY RH
		WHERE
			RH.OBJID = @ERZEKELO_ID
		ORDER BY
			RH.DATUMIG
		END

	OPEN HISTcursor
	FETCH NEXT FROM HISTcursor
		INTO @HIST_ID,@ALLAPOT,@MEGJ,@DATUMIG
	
	--Amíg van következo rekord
	WHILE @@FETCH_STATUS = 0
		BEGIN

		IF @MEGJ IS NOT NULL
			BEGIN
			SELECT
				@FULLMEGJ = @FULLMEGJ + CONVERT(VARCHAR(10),@DATUMIG, 102) + '->' + Q367.KODENEV + ':' + @MEGJ + CHAR(13)+CHAR(10)
			FROM
				Q367
			WHERE
				Q367.KODERT = @ALLAPOT
			END

		FETCH NEXT FROM HISTcursor
			INTO @HIST_ID,@ALLAPOT,@MEGJ,@DATUMIG
		END	--WHILE FETCH

	IF @I = 1
		BEGIN
		UPDATE #ZZZ SET H_MEGJ = @FULLMEGJ
		END
	ELSE IF @I = 2
		BEGIN
		UPDATE #ZZZ SET V_MEGJ = @FULLMEGJ
		END
	ELSE IF @I = 2
		BEGIN
		UPDATE #ZZZ SET E_MEGJ = @FULLMEGJ
		END

	SELECT @FULLMEGJ = ''
	SELECT @I = @I + 1

	--Lezárjuk a kurzort
	CLOSE HISTcursor
	--és töröljük a kurzort
	DEALLOCATE HISTcursor
	END	--WHILE @I

--Itt a vége...

SET NOCOUNT OFF

SELECT
	*
FROM
	#ZZZ

DROP TABLE #ZZZ



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadRaktarInfo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadRaktarKepv
@pID INTEGER
AS
SELECT
	*
FROM
	RAKTKEPVIS
WHERE
	ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadRaktarKepv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_LoadRaktarSz
@pID INTEGER
AS
SELECT
	O.MEGNEV AS SZ_MEGNEV,
	O.TIPUS AS SZ_TIPUS,
	O.GYSZAM AS SZ_GYSZAM,
	O.TELEPHSZ AS SZ_TELEPHSZ
FROM
	OBJEKTUM O
WHERE
	O.ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadRaktarSz]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_LoadSzerzfej    Script Date: 2000. 07. 04. 18:56:19 ******/
CREATE PROCEDURE sp_LoadSzerzfej
@pID INTEGER
AS

DECLARE @LAST_KEPVIS_DATUM DATETIME
SELECT @LAST_KEPVIS_DATUM = MAX(KEZDATUM) FROM KEPV_TET WHERE SZERZ_ID = @pID
DECLARE @LAST_KEPVIS INTEGER
SELECT @LAST_KEPVIS = KEPVIS_ID FROM KEPV_TET WHERE SZERZ_ID = @pID AND KEZDATUM = @LAST_KEPVIS_DATUM

SELECT
	SZERZFEJ.ID,
	SZERZFEJ.PAZ,
	SZETIP,
	SZEJEL,
	SZEKELT,
	SZERZFEJ.ERVDAT,
	FIZMOD,
	SZERTAR,
	ARVALT.SZOLG,
	SZERZFEJ.BEFDAT,
	SZERSZ,
	SZLA_CIKL,
	JEL,
	SZJ,
	UGYFN,
	UGYFC,
	KEPVIS_ID AS KEPVIS,
	KEZDATUM,
	BEFDATUM
FROM
	ARVALT INNER JOIN
		(SZERZFEJ LEFT JOIN KEPV_TET ON KEPV_TET.SZERZ_ID = SZERZFEJ.ID)
	ON ARVALT.ID = SZERZFEJ.SZOLG
WHERE
	SZERZFEJ.ID = @pID
	AND (@LAST_KEPVIS IS NULL OR (@LAST_KEPVIS IS NOT NULL AND KEPVIS_ID = @LAST_KEPVIS))







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadSzerzfej]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_LoadSzlaEgyedi
@pID INTEGER
AS
SELECT
	*
FROM
	SZLA_ALT
WHERE
	ID = @pID







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_LoadSzlaEgyedi]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE Procedure sp_MakeCsekk
@EGYEDI INTEGER = 0
AS
BEGIN TRAN

TRUNCATE TABLE CSEKK

IF @EGYEDI = 1
	BEGIN
	INSERT INTO CSEKK(BRUTTO,KOZCIM,KOZNEV,/*KOZIRSZ,*/SZLASZ)
	SELECT
		SZLA_ALT.OSSZ_BRUTTO,
		SZLA_ALT.UGYFC,
		SZLA_ALT.UGYFN,
		--SZLA_ALT.KOZIRSZ,
		SZLA_ALT.SZLASZ
	FROM
		SZLA_ALT LEFT JOIN SZLA_ALT_TET ON SZLA_ALT_TET.SZLA_ID = SZLA_ALT.ID
	WHERE
		SZ_MENNY IS NOT NULL
		AND EGYEDI = 1
		AND ZAROLT = 0
	GROUP BY
		SZLA_ALT.SZLASZ,
		SZLA_ALT.UGYFN,
		SZLA_ALT.UGYFC,
		--SZLA_ALT.KOZIRSZ,
		SZLA_ALT.OSSZ_BRUTTO
	END
ELSE
	BEGIN
	INSERT INTO CSEKK(PAZ,BRUTTO,KOZCIM,KOZNEV,KOZIRSZ,SZLASZ)
	SELECT
		SZLA_ALT.PAZ,
		SZLA_ALT.OSSZ_BRUTTO,
		SZLA_ALT.KOZCIM,
		SZLA_ALT.KOZNEV,
		SZLA_ALT.KOZIRSZ,
		SZLA_ALT.SZLASZ
	FROM
		SZLA_ALT LEFT JOIN SZLA_ALT_TET ON SZLA_ALT_TET.SZLA_ID = SZLA_ALT.ID
	WHERE
		CIKK_MENNY IS NOT NULL
		AND EGYEDI = 0
		AND ZAROLT = 0
	GROUP BY
		SZLA_ALT.SZLASZ,
		SZLA_ALT.KOZNEV,
		SZLA_ALT.KOZCIM,
		SZLA_ALT.KOZIRSZ,
		SZLA_ALT.PAZ,
		SZLA_ALT.OSSZ_BRUTTO
	END
COMMIT TRAN







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeCsekk]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_MakeTAB403
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL,
@SZOLGJELL VARCHAR(2)=NULL
AS

SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB403
TRUNCATE TABLE TAB403_1
*/
DELETE FROM TAB403
DELETE FROM TAB403_1

--Feltöltjük a futomuvek neveit és azonosítóit
INSERT INTO
	TAB403(FUTOMU_ID,NEV)
SELECT
	ID,
	MEGNEV
FROM
	OBJEKTUM
WHERE
	OBJTIP='03'
ORDER BY
	MEGNEV

--Segédváltozók
DECLARE @OBJ_ID INTEGER
DECLARE @FUTOMU_ID INTEGER
DECLARE @FSZAM VARCHAR(12)
DECLARE @MUNORA INTEGER
DECLARE @OBJTIP VARCHAR(2)

--Csinálunk egy kurzort, ami azt mutatja meg,
--hogy az egyes objektumokon hány órát dolgoztak
--és milyen fokönyvi számon
DECLARE TAB403cursor CURSOR FAST_FORWARD FOR
SELECT
	MUNKALAP.OBJID,
	MUNKALAP.FSZAM,
	TELJM.MUNORA,
	OBJEKTUM.OBJTIP
FROM
	OBJEKTUM RIGHT JOIN
		(TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
	ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	((@SZOLGJELL IS NULL) OR (@SZOLGJELL IS NOT NULL AND SZOLGJELL = @SZOLGJELL))--SZOLGJELL=coalesce(@SZOLGJELL,SZOLGJELL)
	AND ((@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL
			AND TELJM.MUNDAT BETWEEN @DATUMTOL AND @DATUMIG))

--Megnyitjuk a kurzort
OPEN TAB403cursor

--Lekérjük az elso rekordot
FETCH NEXT FROM TAB403cursor
	INTO @OBJ_ID,@FSZAM,@MUNORA, @OBJTIP

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk, hogy az adott objektum melyik futomuhöz tartozik.
	IF @OBJTIP = '03'
		BEGIN
		SELECT @FUTOMU_ID = @OBJ_ID
		END
	ELSE
		BEGIN
		EXEC @FUTOMU_ID = sp_Rekurziv @OBJ_ID
		END
	
	
	--Növeljük a megfelelo futomu munkaóráinak számát az adott fokönyvi szám alatt
	IF @FSZAM = '62317'
		BEGIN
		UPDATE TAB403 SET C62317 = C62317 + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE IF @FSZAM = '62318'
		BEGIN
		UPDATE TAB403 SET C62318 = C62318 + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE IF @FSZAM = '62319'
		BEGIN
		UPDATE TAB403 SET C62319 = C62319 + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE IF @FSZAM = '62323'
		BEGIN
		UPDATE TAB403 SET C62323 = C62323 + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE IF @FSZAM = '62325'
		BEGIN
		UPDATE TAB403 SET C62325 = C62325 + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE IF @FSZAM = '722'
		BEGIN
		UPDATE TAB403 SET C722 = C722 + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE
		BEGIN
		IF EXISTS(SELECT * FROM TAB403_1 WHERE FSZAM = @FSZAM)
			BEGIN
			UPDATE TAB403_1 SET MUNORA = MUNORA + @MUNORA WHERE FSZAM = @FSZAM
			END
		ELSE
			BEGIN
			INSERT INTO TAB403_1 SELECT @FSZAM,KONTIR.FSZAM,@MUNORA FROM KONTIR WHERE KONTIR.FSZAM = @FSZAM
			END
		END
		
	--Lekérjük a következo rekordot
	FETCH NEXT FROM TAB403cursor
		INTO @OBJ_ID,@FSZAM,@MUNORA, @OBJTIP
END

--Lezárjuk és töröljük a kurzort
CLOSE TAB403cursor
DEALLOCATE TAB403cursor

SET NOCOUNT OFF





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB403]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_MakeTAB404    Script Date: 2000. 07. 04. 18:56:19 ******/
CREATE PROCEDURE sp_MakeTAB404
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL
AS

SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB404
*/
DELETE FROM TAB404

--Feltöltjük a futomuvek neveit és azonosítóit
INSERT INTO
	TAB404(FUTOMU_ID,NEV)
SELECT
	ID,
	MEGNEV
FROM
	OBJEKTUM
WHERE
	OBJTIP='03'
ORDER BY
	MEGNEV

INSERT INTO
	TAB404(FUTOMU_ID,NEV)
SELECT
	0,
	'736 & 737'

--Segédváltozók
DECLARE @OBJ_ID INTEGER
DECLARE @OBJTIP VARCHAR(2)
DECLARE @SZOLGJELL VARCHAR(2)
DECLARE @MUNORA INTEGER
DECLARE @FUTOMU_ID INTEGER
DECLARE @FSZAM VARCHAR(12)

--Csinálunk egy kurzort, ami azt mutatja meg, hogy az
--egyes objektumokon hány órát dolgoztak, és milyen fokönyvi számon,
--szolgáltatás jellege szerint csoportosítva
DECLARE TAB404cursor CURSOR FAST_FORWARD FOR
SELECT
	MUNKALAP.OBJID,
	MUNKALAP.SZOLGJELL,
	MUNKALAP.FSZAM,
	TELJM.MUNORA,
	OBJEKTUM.OBJTIP
FROM
	OBJEKTUM RIGHT JOIN
		(TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
	ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	(@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL
			AND TELJM.MUNDAT BETWEEN @DATUMTOL AND @DATUMIG)

--Megnyitjuk a kurzort
OPEN TAB404cursor

--Lekérjük az elso rekordot
FETCH NEXT FROM TAB404cursor
	INTO @OBJ_ID,@SZOLGJELL,@FSZAM,@MUNORA,@OBJTIP

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk, hogy az adott objektum melyik futomuhöz tartozik.
	IF @OBJTIP = '03'
		BEGIN
		SELECT @FUTOMU_ID = @OBJ_ID
		END
	ELSE
		BEGIN
		EXEC @FUTOMU_ID = sp_Rekurziv @OBJ_ID
		END

	IF @FUTOMU_ID <> 0	--IS NOT NULL
		BEGIN
			--Szolgáltatás jellege szerint növeljük a megfelelo oszlop értékét
			--annál a fokönyvi számnál, ahol kell
			IF @SZOLGJELL = 'EL'
				BEGIN
				UPDATE TAB404 SET E = E + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
				END
			ELSE IF @SZOLGJELL = 'FO'
				BEGIN
				UPDATE TAB404 SET F = F + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
				END
			ELSE IF substring(@SZOLGJELL,1,1) = 'G'
				BEGIN
				UPDATE TAB404 SET G = G + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
				END
			ELSE IF substring(@SZOLGJELL,1,1) = 'L'
				BEGIN
				UPDATE TAB404 SET L = L + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
				END
			ELSE IF @SZOLGJELL = 'VE'
				BEGIN
				UPDATE TAB404 SET V = V + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
				END
	
			--Növeljük a fokönyvi számhoz tartozó "összesen" oszlop értékét
			UPDATE TAB404 SET SZUM = SZUM + @MUNORA WHERE FUTOMU_ID = @FUTOMU_ID
		END
	ELSE
		BEGIN
			IF substring(@SZOLGJELL,1,1) = 'L'
				BEGIN
				IF @FSZAM = '736'
					BEGIN
					UPDATE TAB404 SET C736 = C736 + @MUNORA WHERE FUTOMU_ID = 0
					END
				ELSE IF @FSZAM = '737'
					BEGIN
					UPDATE TAB404 SET C737 = C737 + @MUNORA WHERE FUTOMU_ID = 0
					END
				END
		END
	--Lekérjük a következo rekordot
	FETCH NEXT FROM TAB404cursor
		INTO @OBJ_ID,@SZOLGJELL,@FSZAM,@MUNORA,@OBJTIP
END

DECLARE @C736 INTEGER
DECLARE @C737 INTEGER

SELECT @C736 = TAB404.C736 FROM TAB404 WHERE FUTOMU_ID = 0
SELECT @C737 = TAB404.C737 FROM TAB404 WHERE FUTOMU_ID = 0

UPDATE TAB404
SET
	C736 = @C736,
	C737 = @C737

--Lezárjuk és töröljük a kurzort
CLOSE TAB404cursor
DEALLOCATE TAB404cursor

SET NOCOUNT OFF















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB404]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_MakeTAB406    Script Date: 2000. 07. 04. 18:56:19 ******/
CREATE PROCEDURE sp_MakeTAB406
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL
AS

SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB406
*/
DELETE FROM TAB406

--Feltöltjük a dolgozó IDjét és nevét
INSERT INTO TAB406(DOLGID,NEV) SELECT ID,NEV FROM DOLGOZO ORDER BY NEV

--Segédváltozók
DECLARE @DOLG_ID INTEGER
DECLARE @SZOLGJELL VARCHAR(2)
DECLARE @MUNORA INTEGER

--Csinálunk egy kurzort, ami azt mutatja meg,
--hogy az egyes dolgozók hány órát dolgoztak
--az adott szolgáltatás jellegen belül
DECLARE TAB406cursor CURSOR FAST_FORWARD FOR
SELECT
	DOLGOZO.ID,
	MUNKALAP.SZOLGJELL,
	TELJM.MUNORA
FROM
	DOLGOZO INNER JOIN
		(TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
	ON DOLGOZO.ID = TELJM.DOLG_ID
WHERE
	(@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL
			AND TELJM.MUNDAT BETWEEN @DATUMTOL AND @DATUMIG)

--Megnyitjuk a kurzort
OPEN TAB406cursor

--Lekérjük az elso rekordot
FETCH NEXT FROM TAB406cursor
	INTO @DOLG_ID,@SZOLGJELL,@MUNORA

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--A szolgáltatás jellegétol függoen növeljük meg
	--az egyes dolgozók óráinak számát.
	IF @SZOLGJELL = 'EL'
		BEGIN
		UPDATE TAB406 SET EL = EL + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'FO'
		BEGIN
		UPDATE TAB406 SET FO = FO + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'GB'
		BEGIN
		UPDATE TAB406 SET GB = GB + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'GT'
		BEGIN
		UPDATE TAB406 SET GT = GT + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'LA'
		BEGIN
		UPDATE TAB406 SET LA = LA + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'LE'
		BEGIN
		UPDATE TAB406 SET LE = LE + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'LF'
		BEGIN
		UPDATE TAB406 SET LF = LF + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	ELSE IF @SZOLGJELL = 'VE'
		BEGIN
		UPDATE TAB406 SET VE = VE + @MUNORA WHERE DOLGID = @DOLG_ID
		END
	
	--Megnöveljük a dolgozó összmunkaóráinak számát is
	UPDATE TAB406 SET SZUM = SZUM + @MUNORA WHERE DOLGID = @DOLG_ID
	
	--Lekérjük a következo rekordot
	FETCH NEXT FROM TAB406cursor
		INTO @DOLG_ID,@SZOLGJELL,@MUNORA
END

--Lezárjuk és töröljük a kurzort
CLOSE TAB406cursor
DEALLOCATE TAB406cursor

SET NOCOUNT OFF















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB406]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_MakeTAB407    Script Date: 2000. 07. 04. 18:56:19 ******/
CREATE PROCEDURE sp_MakeTAB407
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL,
@DOLG_ID INTEGER=NULL,
@SZOLGJELL VARCHAR(2)=NULL
AS

SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB407
*/
DELETE FROM TAB407

--Feltöltjük a futomuvek neveit és azonosítóit
INSERT INTO
	TAB407(FUTOMU_ID,NEV)
SELECT
	ID,
	MEGNEV
FROM
	OBJEKTUM
WHERE
	OBJTIP='03'
ORDER BY
	MEGNEV

--Segédváltozók
DECLARE @OBJ_ID INTEGER
DECLARE @OBJTIP VARCHAR(2)
DECLARE @FUTOMU_ID INTEGER
DECLARE @MUNORA INTEGER

--Csinálunk egy kurzort, ami azt mutatja meg,
--hogy az egyes objektumokon hány órát dolgozott az adott dolgozó
DECLARE TAB407cursor CURSOR FAST_FORWARD FOR
SELECT
	MUNKALAP.OBJID,
	TELJM.MUNORA,
	OBJEKTUM.OBJTIP
FROM
	OBJEKTUM RIGHT JOIN
		(DOLGOZO RIGHT JOIN
			(TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
		ON DOLGOZO.ID = TELJM.DOLG_ID)
	ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	DOLG_ID=coalesce(@DOLG_ID,DOLG_ID)
	AND SZOLGJELL=coalesce(@SZOLGJELL,SZOLGJELL)
	AND ((@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL
			AND TELJM.MUNDAT BETWEEN @DATUMTOL AND @DATUMIG))

--Megnyitjuk a kurzort
OPEN TAB407cursor

--Lekérjük az elso rekordot
FETCH NEXT FROM TAB407cursor
	INTO @OBJ_ID,@MUNORA,@OBJTIP

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk, hogy az adott objektum melyik futomuhöz tartozik.
	IF @OBJTIP = '03'
		BEGIN
		SELECT @FUTOMU_ID = @OBJ_ID
		END
	ELSE
		BEGIN
		EXEC @FUTOMU_ID = sp_Rekurziv @OBJ_ID
		END
	
	--Növeljük a megfelelo futomu munkaóráinak számát
	UPDATE
		TAB407
	SET
		ORA = ORA + @MUNORA
	WHERE
		FUTOMU_ID = @FUTOMU_ID

	--Lekérjük a következo rekordot
	FETCH NEXT FROM TAB407cursor
		INTO @OBJ_ID,@MUNORA,@OBJTIP
END

--Lezárjuk és töröljük a kurzort
CLOSE TAB407cursor
DEALLOCATE TAB407cursor

SET NOCOUNT OFF















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB407]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_MakeTAB408    Script Date: 2000. 07. 04. 18:56:19 ******/
CREATE PROCEDURE sp_MakeTAB408
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL,
@FUTOMU INTEGER
AS

SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB408
*/
DELETE FROM TAB408

--Segédváltozók
DECLARE @SZOLGJELL VARCHAR(2)
DECLARE @MUNKALAP_ID INTEGER
DECLARE @DATUM DATETIME
DECLARE @HIBLEIR VARCHAR(1024)
DECLARE @DOLG VARCHAR(20)
DECLARE @MUNORA INTEGER
DECLARE @OBJ_ID INTEGER
DECLARE @OBJTIP VARCHAR(2)
DECLARE @FUTOMU_ID INTEGER

DECLARE TAB408cursor CURSOR FAST_FORWARD FOR
SELECT
	MUNKALAP.SZOLGJELL,
	MUNKALAP.ID,
	TELJM.MUNDAT,
	MUNKALAP.HIBLEIR,
	DOLGOZO.NEV,
	TELJM.MUNORA,
	MUNKALAP.OBJID,
	OBJEKTUM.OBJTIP
FROM
	OBJEKTUM RIGHT JOIN
		(DOLGOZO INNER JOIN
			(TELJM INNER JOIN MUNKALAP ON TELJM.MUNKALAP_ID = MUNKALAP.ID)
		ON DOLGOZO.ID = TELJM.DOLG_ID)
	ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	SZOLGJELL IS NOT NULL AND
	OBJID IS NOT NULL AND 
	((@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL
			AND TELJM.MUNDAT BETWEEN @DATUMTOL AND @DATUMIG))
/*GROUP BY
	MUNKALAP.SZOLGJELL,
	MUNKALAP.ID,
	TELJM.MUNDAT,
	DOLGOZO.NEV,
	MUNKALAP.HIBLEIR,
	TELJM.MUNORA,
	MUNKALAP.OBJID
*/
	
--Megnyitjuk a kurzort
OPEN TAB408cursor

--Lekérjük az elso rekordot
FETCH NEXT FROM TAB408cursor
	INTO @SZOLGJELL,@MUNKALAP_ID,@DATUM,@HIBLEIR,@DOLG,@MUNORA,@OBJ_ID,@OBJTIP

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	--Megállapítjuk, hogy az adott objektum melyik futomuhöz tartozik.
	IF @OBJTIP = '03'
		BEGIN
		SELECT @FUTOMU_ID = @OBJ_ID
		END
	ELSE
		BEGIN
		EXEC @FUTOMU_ID = sp_Rekurziv @OBJ_ID
		END
	
	IF @FUTOMU_ID = @FUTOMU OR
		(@FUTOMU_ID = 0 AND EXISTS(SELECT ID FROM OBJEKTUM WHERE OBJTIP='03' AND ID = @FUTOMU))
		BEGIN
		IF EXISTS(SELECT * FROM TAB408 WHERE SZOLGJELL_ID = @SZOLGJELL AND MUNKALAP_ID = @MUNKALAP_ID AND DOLG = @DOLG AND DATUM = @DATUM)
			BEGIN
			UPDATE TAB408 SET MUNORA = MUNORA + @MUNORA WHERE SZOLGJELL_ID = @SZOLGJELL AND MUNKALAP_ID = @MUNKALAP_ID AND DATUM = @DATUM AND DOLG = @DOLG
			END
		ELSE
			BEGIN
			INSERT INTO TAB408(SZOLGJELL_ID,SZOLGJELL,MUNKALAP_ID,DATUM,HIBLEIR,MUNORA,DOLG)
			SELECT
				@SZOLGJELL,
				@SZOLGJELL,--Q291.KODENEV AS SZOLGJELL,
				@MUNKALAP_ID,
				@DATUM,
				@HIBLEIR,
				@MUNORA,
				@DOLG
			FROM
				Q291
			WHERE
				Q291.KODERT = @SZOLGJELL
			END
		END
	
	--Lekérjük a következo rekordot
	FETCH NEXT FROM TAB408cursor
		INTO @SZOLGJELL,@MUNKALAP_ID,@DATUM,@HIBLEIR,@DOLG,@MUNORA,@OBJ_ID,@OBJTIP
END

--Lezárjuk és töröljük a kurzort
CLOSE TAB408cursor
DEALLOCATE TAB408cursor

SET NOCOUNT OFF










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB408]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_MakeTAB413
@DATUMTOL DATETIME = NULL,
@DATUMIG DATETIME = NULL
AS
BEGIN TRAN

/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB413
*/
DELETE FROM TAB413

INSERT INTO TAB413
SELECT
	SZLA_ALT.KOZNEV,
	SZLA_ALT.KOZCIM,
	SZLA_ALT.PAZ,
	SZLA_ALT.SZLASZ,
	sum(SZLA_ALT_TET.SZ_MENNY) AS MENNY,
	SZLA_ALT_TET.NOTERT AS NOTERT,
	sum(SZLA_ALT_TET.OSSZEG) AS TET_OSSZEG,
	CASE SZLA_ALT_TET.AFA
		WHEN '01' THEN 0
		WHEN '02' THEN 0
		WHEN '03' THEN sum(SZLA_ALT_TET.OSSZEG) * 0.12
		WHEN '04' THEN sum(SZLA_ALT_TET.OSSZEG) * 0.25
	END AS AFA,
	CASE SZLA_ALT_TET.AFA
		WHEN '01' THEN sum(SZLA_ALT_TET.OSSZEG)
		WHEN '02' THEN sum(SZLA_ALT_TET.OSSZEG)
		WHEN '03' THEN sum(SZLA_ALT_TET.OSSZEG) * 1.12
		WHEN '04' THEN sum(SZLA_ALT_TET.OSSZEG) * 1.25
	END AS BRUTTO
FROM
	SZLA_ALT LEFT JOIN SZLA_ALT_TET ON SZLA_ALT_TET.SZLA_ID = SZLA_ALT.ID
WHERE
	CIKK_MENNY IS NOT NULL
	AND EGYEDI = 0
	AND ZAROLT = 0
	--Dátumszurés
	AND ((@DATUMTOL IS NULL OR @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL AND
			(SZLA_ALT.TDAT BETWEEN @DATUMTOL AND @DATUMIG)))
GROUP BY
	KOZNEV,
	KOZCIM,
	PAZ,
	SZLASZ,
	SZ_MENNY,
	NOTERT,
	SZLA_ALT_TET.OSSZEG,
	AFA

COMMIT TRAN








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB413]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_MakeTAB_R01
AS
SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_R01
*/
DELETE FROM TAB_R01

INSERT INTO
	TAB_R01(OBJTIP, GYSZAM, TIPUS, HITIDO, ALLAPOT, DATUMTOL, MEGJ)
SELECT
	Q296.KODENEV,
	OBJEKTUM.GYSZAM,
	OBJEKTUM.TIPUS,
	OBJEKTUM.HITIDO,
	Q367.KODENEV,
	RAKTAR.DATUMTOL,
	RAKTAR.MEGJ
FROM
	Q367 RIGHT JOIN
		(Q296 RIGHT JOIN
			(RAKTAR INNER JOIN OBJEKTUM ON OBJEKTUM.ID = RAKTAR.OBJID)
		ON Q296.KODERT = OBJEKTUM.OBJTIP)
	ON Q367.KODERT = RAKTAR.ALLAPOT
WHERE
	RAKTAR.DATUMIG IS NULL
ORDER BY
	OBJEKTUM.OBJTIP
	
SET NOCOUNT OFF


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB_R01]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_MakeTAB_R03
@pOBJTIP VARCHAR(2)
AS
SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_R03
*/
DELETE FROM TAB_R03

INSERT INTO
	TAB_R03(OBJTIP, OBJID, GYSZAM, TIPUS, HITIDO, CIM, MEGJ)
SELECT
	O.OBJTIP,
	O.ID,
	O.GYSZAM,
	O.TIPUS,
	CONVERT(VARCHAR(4), DATEPART(year, O.HITIDO)) AS HITIDO,
	COALESCE(O.UTCA, '?') + CHAR(32) + COALESCE(O.HSZ, '?') AS CIM,
	R.MEGJ
FROM
	Q296 RIGHT JOIN
		(RAKTAR R INNER JOIN OBJEKTUM O ON O.ID = R.OBJID)
	ON Q296.KODERT = O.OBJTIP
WHERE
	R.ALLAPOT = 'E' OR R.ALLAPOT = 'J'
	AND R.SZLEVEL_DATUM IS NULL
	AND R.OBJTIP = @pOBJTIP


--Segédváltozók
DECLARE @OBJ_ID INTEGER
DECLARE @ARAMKOR_ID INTEGER

DECLARE TAB_R03cursor CURSOR FAST_FORWARD FOR
SELECT
	OBJID
FROM
	TAB_R03

--Megnyitjuk a kurzort
OPEN TAB_R03cursor

--Lekérjük az elso rekordot
FETCH NEXT FROM TAB_R03cursor
	INTO @OBJ_ID

--Amíg van következo rekord
WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC @ARAMKOR_ID = sp_Rekurziv @OBJ_ID,'30'

	UPDATE
		TAB_R03
	SET
		TERULET = OBJEKTUM.MEGNEV
	FROM
		OBJEKTUM
	WHERE
		OBJEKTUM.ID = @ARAMKOR_ID

	--Lekérjük a következo rekordot
	FETCH NEXT FROM TAB_R03cursor
		INTO @OBJ_ID
END

--Lezárjuk és töröljük a kurzort
CLOSE TAB_R03cursor
DEALLOCATE TAB_R03cursor

SET NOCOUNT OFF



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB_R03]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_MakeTAB_R04
@pID INTEGER
AS

SET NOCOUNT ON

--Töröljük a táblát, amibol a report táplálkozik
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_R04
*/
DELETE FROM TAB_R04

INSERT INTO
	TAB_R04(
		KEPVIS,
		H_ID, H_GYSZAM, H_HITIDO, H_TIPUS, H_ELHELYEZ, H_IMPULZUS,
		H_LEOLV, H_HELYZET, H_ELEKTRONIKA, H_PLOMBA, H_KULCS,
		H_KULCS_LAKTEL, H_KULCS_MOBTEL, H_KULCS_MUNTEL,	H_TULAJDON,
		H_MEGJ,
		
		V_ID, V_GYSZAM,	V_HITIDO, V_TIPUS, V_ELHELYEZ, V_IMPULZUS,
		V_ATMERO, V_TOMEGARAM, V_PLOMBA, V_KULCS, V_KULCS_LAKTEL,
		V_KULCS_MOBTEL, V_KULCS_MUNTEL,	V_TULAJDON,	V_MEGJ,
		
		E_ID, E_GYSZAM, E_HITIDO, E_TIPUS, E_ELHELYEZ, E_BENYHOSSZ,
		E_VEZHOSSZ,	E_PLOMBA, E_PLOMBA2, E_SZUKSHOSSZ, E_KULCS,
		E_KULCS_LAKTEL, E_KULCS_MOBTEL, E_KULCS_MUNTEL, E_TULAJDON,
		E_MEGJ
		)
EXEC
	sp_LoadRaktarInfo @pID


DECLARE @HOOSSZEGZO_ID INTEGER
DECLARE @VIZORA_ID INTEGER
DECLARE @ERZEKELO_ID INTEGER

DECLARE @OBJID INTEGER
DECLARE @KEPVIS INTEGER
SELECT @OBJID = OBJID, @KEPVIS = KEPVIS FROM RAKTAR WHERE ID = @pID

DECLARE @EPULET_ID INTEGER
DECLARE @FUTOMU_ID INTEGER
EXEC @EPULET_ID = sp_Rekurziv @OBJID, '01' --Épület
	--sp_Rekurziv @OBJID, '37'	--Lépcsoház
EXEC @FUTOMU_ID = sp_Rekurziv @OBJID, '03' --Futomu

SELECT @HOOSSZEGZO_ID = ID2 FROM KAPCSOLAT INNER JOIN OBJEKTUM ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE KAPCSOLAT.ID1 = @EPULET_ID AND OBJEKTUM.OBJTIP = '18'	--Hoösszegzo

SELECT @VIZORA_ID = ID2 FROM KAPCSOLAT INNER JOIN OBJEKTUM ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE KAPCSOLAT.ID1 = @EPULET_ID AND OBJEKTUM.OBJTIP = '19'	--Vízóra

SELECT @ERZEKELO_ID = ID2 FROM KAPCSOLAT INNER JOIN OBJEKTUM ON OBJEKTUM.ID = KAPCSOLAT.ID2
	WHERE KAPCSOLAT.ID1 = @EPULET_ID AND OBJEKTUM.OBJTIP = '20'	--Érzékelo
	
DECLARE @FUTOMU_NEV VARCHAR(50)
DECLARE @EPULET_NEV VARCHAR(50)
SELECT @FUTOMU_NEV = MEGNEV FROM OBJEKTUM WHERE OBJEKTUM.ID = @FUTOMU_ID
SELECT @EPULET_NEV = MEGNEV FROM OBJEKTUM WHERE OBJEKTUM.ID = @EPULET_ID

UPDATE
	TAB_R04
SET
	FUTOMU = @FUTOMU_NEV,
	EPULET = @EPULET_NEV,
	KEPVIS_NEV = K.NEV,
	KEPVIS_CIM = K.CIM,
	KEPVIS_LAKTEL = K.LAK_TEL,
	KEPVIS_MOBTEL = K.MOB_TEL,
	KEPVIS_MUNTEL = K.MUN_TEL,
	MEGB_NEV = K.MEGB_NEV,
	MEGB_LAKTEL = K.MEGB_LAK_TEL,
	MEGB_MOBTEL = K.MEGB_MOB_TEL,
	MEGB_MUNTEL = K.MEGB_MUN_TEL
FROM
	RAKTKEPVIS K
WHERE
	K.ID = @KEPVIS
	
UPDATE
	TAB_R04
SET
	H_LEOLV = Q316.KODENEV,
	H_HELYZET = Q365.KODENEV,
	H_ELEKTRONIKA = Q366.KODENEV
FROM
	Q316 RIGHT JOIN
		(Q365 RIGHT JOIN
			(Q366 RIGHT JOIN HOOSSZEGZO H ON Q366.KODERT = H.ELEKTRONIKA)
		ON Q365.KODERT = H.HELYZET)
	ON Q316.KODERT = H.LEOLVMOD
WHERE
	H.ID = @HOOSSZEGZO_ID	
	
SET NOCOUNT OFF

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTAB_R04]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_MakeTab_kint
@MLAPTIP VARCHAR(1)=NULL,
@SZOLGJELL VARCHAR(2)=NULL,
@TIPUSH VARCHAR(3)=NULL,
@FSZAM VARCHAR(12)=NULL,
@OBJTIP VARCHAR(2)=NULL,
@OBJID INTEGER=NULL,
@DATUMTOL DATETIME=NULL,
@DATUMIG DATETIME=NULL,
@TELEPHSZ VARCHAR(20)=NULL,
@MUNELV DATETIME=NULL
AS

DECLARE @ALLAPOT INTEGER
SELECT @ALLAPOT = 2	--Nyomtatott
BEGIN TRAN

/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE TAB_kint
*/
DELETE FROM TAB_kint

INSERT INTO TAB_kint
SELECT
	MUNKALAP.ID,--SORSZ,
	KIALLDAT,
	RTRIM(MUVLEIR) AS MUVLEIR,
	RTRIM(MEGNEV) AS MEGNEV,
	RTRIM(TELEPHSZ) AS TELEPHSZ
FROM
	OBJEKTUM RIGHT JOIN
		(Q291 RIGHT JOIN MUNKALAP ON Q291.KODERT = MUNKALAP.SZOLGJELL)
	ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	((@MLAPTIP IS NULL) OR (@MLAPTIP IS NOT NULL AND MUNKALAP.MTIP=@MLAPTIP))
	--AND ((@SZEREGYS IS NULL) OR (@SZEREGYS IS NOT NULL AND MUNKALAP.SZEREGYS=@SZEREGYS))
	AND ((@SZOLGJELL IS NULL) OR (@SZOLGJELL IS NOT NULL AND SZOLGJELL=@SZOLGJELL))
	AND ((@TIPUSH IS NULL) OR (@TIPUSH IS NOT NULL AND TIPUSH=@TIPUSH))
	AND ((@FSZAM IS NULL) OR (@FSZAM IS NOT NULL AND MUNKALAP.FSZAM=@FSZAM))
	AND ((@OBJTIP IS NULL) OR (@OBJTIP IS NOT NULL AND OBJTIP=@OBJTIP))
	AND ((@OBJID IS NULL) OR (@OBJID IS NOT NULL AND OBJID=@OBJID))
	--AND ((@EPULID IS NULL) OR (@EPULID IS NOT NULL AND OBJID=@EPULID))
	AND ((@ALLAPOT IS NULL) OR (@ALLAPOT IS NOT NULL AND (ALLAPOT=@ALLAPOT OR (@ALLAPOT=5 AND (ALLAPOT=1 OR ALLAPOT=2 OR ALLAPOT=4)))))
	AND ((@DATUMTOL IS NULL AND @DATUMIG IS NULL)
		OR (@DATUMTOL IS NOT NULL AND @DATUMIG IS NOT NULL AND KIALLDAT BETWEEN @DATUMTOL AND @DATUMIG))
	--AND ((@TELEPHSZ IS NULL) OR (@TELEPHSZ IS NOT NULL AND OBJEKTUM.TELEPHSZ LIKE '%'+@TELEPHSZ+'%'))
	AND ((@TELEPHSZ IS NULL) OR (@TELEPHSZ IS NOT NULL AND OBJEKTUM.TELEPHSZ=@TELEPHSZ))
	AND ((@MUNELV IS NULL) OR (@MUNELV IS NOT NULL AND MUNELV=@MUNELV))
ORDER BY
	MUNKALAP.ID DESC
COMMIT TRAN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MakeTab_kint]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





/****** Object:  Stored Procedure dbo.sp_MlapObjFeltolt    Script Date: 2000. 07. 04. 18:56:19 ******/
CREATE PROCEDURE sp_MlapObjFeltolt
@pOBJTIP VARCHAR(2)
AS

SET NOCOUNT ON

CREATE TABLE #ZZZ
	(
	ID INT NOT NULL,
	FUTOMU_ID INT NULL,
	FUTOMU_NEV VARCHAR(50) NULL
	)

INSERT INTO
	#ZZZ
SELECT
	ID,
	NULL,
	NULL
FROM
	OBJEKTUM
WHERE
	OBJTIP=@pOBJTIP

SET NOCOUNT OFF

SELECT
	OBJEKTUM.ID,
		COALESCE(MEGNEV, ' - ') + ';' +
		COALESCE(TIPUS, ' - ') + ';' +
		COALESCE(TELEPHSZ, ' - ') + ';'  +
		COALESCE(GYSZAM, ' - ') + ';'-- +
		--COALESCE(FUTOMU_NEV, ' - ') + ';'
		AS MEGNEV
FROM
	#ZZZ INNER JOIN OBJEKTUM ON OBJEKTUM.ID = #ZZZ.ID
ORDER BY
	MEGNEV --FUTOMU_NEV
	
DROP TABLE #ZZZ





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_MlapObjFeltolt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q271    Script Date: 2000. 07. 04. 18:56:19 ******/

CREATE PROCEDURE sp_Q271
AS
SELECT
	*
FROM
	Q271
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q271]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q272    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q272
AS
SELECT
 *
FROM
 Q272
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q272]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q274    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q274
AS
SELECT
 *
FROM
 Q274
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q274]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q275    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q275
AS
SELECT
 *
FROM
 Q275
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q275]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q276    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q276
AS
SELECT
 *
FROM
 Q276
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q276]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q277    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q277
AS
SELECT
 *
FROM
 Q277
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q277]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q278    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q278
AS
SELECT
 *
FROM
 Q278
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q278]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q279    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q279
AS
SELECT
 *
FROM
 Q279
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q279]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q281    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q281
AS
SELECT
 *
FROM
 Q281
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q281]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q282    Script Date: 2000. 07. 04. 18:56:20 ******/











CREATE PROCEDURE sp_Q282
AS
SELECT
 *
FROM
 Q282
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q282]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q283    Script Date: 2000. 07. 04. 18:56:21 ******/











CREATE PROCEDURE sp_Q283
AS
SELECT
 *
FROM
 Q283
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q283]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q284    Script Date: 2000. 07. 04. 18:56:21 ******/











CREATE PROCEDURE sp_Q284
AS
SELECT
 *
FROM
 Q284
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q284]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q285    Script Date: 2000. 07. 04. 18:56:21 ******/











CREATE PROCEDURE sp_Q285
AS
SELECT
 *
FROM
 Q285
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q285]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q288    Script Date: 2000. 07. 04. 18:56:21 ******/











CREATE PROCEDURE sp_Q288
AS
SELECT
 *
FROM
 Q288
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q288]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q289    Script Date: 2000. 07. 04. 18:56:21 ******/











CREATE PROCEDURE sp_Q289
AS
SELECT
 *
FROM
 Q289
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q289]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Q291
AS
SELECT
	*
FROM
	Q291
WHERE
	KODERT <> 'GB'
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q291]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Q291D
AS
SELECT
	*
FROM
	Q291
WHERE
	KODERT = 'LA' OR
	KODERT = 'LF' OR
	KODERT = 'HK'
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q291D]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q293    Script Date: 2000. 07. 04. 18:56:21 ******/







CREATE PROCEDURE sp_Q293
AS
SELECT
	*
FROM
	Q293
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q293]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q296    Script Date: 2000. 07. 04. 18:56:21 ******/

CREATE PROCEDURE sp_Q296
AS
SELECT
	*
FROM
	Q296
--WHERE
--	KODERT <> '37'	--Lépcsoház
ORDER BY
	KODENEV










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q296]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Q296_Diszp
AS
SELECT
	*
FROM
	Q296
WHERE
	KODERT = '01' OR	--Épület
	KODERT = '03' OR	--Futomu
	KODERT = '17' OR	--Hoközpont
	KODERT = '37'		--Lépcsoház
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q296_Diszp]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q297    Script Date: 2000. 07. 04. 18:56:22 ******/











CREATE PROCEDURE sp_Q297
AS
SELECT
 *
FROM
 Q297
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q297]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q298    Script Date: 2000. 07. 04. 18:56:22 ******/







CREATE PROCEDURE sp_Q298
AS
SELECT
	*
FROM
	Q298
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q298]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q299    Script Date: 2000. 07. 04. 18:56:22 ******/

CREATE PROCEDURE sp_Q299
AS
SELECT
	*
FROM
	Q299
ORDER BY
	KODENEV










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q299]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q300    Script Date: 2000. 07. 04. 18:56:22 ******/







CREATE PROCEDURE sp_Q300
AS
SELECT
	*
FROM
	Q300
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q300]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q302    Script Date: 2000. 07. 04. 18:56:22 ******/
CREATE PROCEDURE sp_Q302
AS
SELECT
	*
FROM
	Q302
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q302]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q304    Script Date: 2000. 07. 04. 18:56:22 ******/







CREATE PROCEDURE sp_Q304
AS
SELECT
	*
FROM
	Q304
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q304]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q305    Script Date: 2000. 07. 04. 18:56:22 ******/







CREATE PROCEDURE sp_Q305
AS
SELECT
	*
FROM
	Q305
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q305]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q306    Script Date: 2000. 07. 04. 18:56:22 ******/







CREATE PROCEDURE sp_Q306
AS
SELECT
	*
FROM
	Q306
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q306]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q307    Script Date: 2000. 07. 04. 18:56:22 ******/







CREATE PROCEDURE sp_Q307
AS
SELECT
	*
FROM
	Q307
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q307]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q308    Script Date: 2000. 07. 04. 18:56:23 ******/







CREATE PROCEDURE sp_Q308
AS
SELECT
	*
FROM
	Q308
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q308]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q309    Script Date: 2000. 07. 04. 18:56:23 ******/







CREATE PROCEDURE sp_Q309
AS
SELECT
	*
FROM
	Q309
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q309]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q310    Script Date: 2000. 07. 04. 18:56:23 ******/





CREATE PROCEDURE sp_Q310
AS
SELECT
	FSZAM AS KODERT,
	FSZAM + ';' + FSZNEV + ';' AS KODENEV
FROM
	Q310
ORDER BY
	FSZAM

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q310]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





Create Procedure sp_Q310A

AS
SELECT
	FSZAM AS KODERT,
	FSZAM + ';' + FSZNEV + ';' AS KODENEV
FROM
	Q310A
ORDER BY
	FSZAM







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q310A]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


Create Procedure sp_Q310D
AS
SELECT
	FSZAM AS KODERT,
	FSZAM + ';' + FSZNEV + ';' AS KODENEV
FROM
	Q310D
ORDER BY
	FSZAM


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q310D]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q311    Script Date: 2000. 07. 04. 18:56:23 ******/







CREATE PROCEDURE sp_Q311
AS
SELECT
	*
FROM
	Q311
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q311]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q312    Script Date: 2000. 07. 04. 18:56:23 ******/











CREATE PROCEDURE sp_Q312
AS
SELECT
 *
FROM
 Q312
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q312]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q313    Script Date: 2000. 07. 04. 18:56:23 ******/











CREATE PROCEDURE sp_Q313
AS
SELECT
 *
FROM
 Q313
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q313]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q314    Script Date: 2000. 07. 04. 18:56:23 ******/











CREATE PROCEDURE sp_Q314
AS
SELECT
 *
FROM
 Q314
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q314]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q315    Script Date: 2000. 07. 04. 18:56:23 ******/











CREATE PROCEDURE sp_Q315
AS
SELECT
 *
FROM
 Q315
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q315]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q316    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q316
AS
SELECT
 *
FROM
 Q316
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q316]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q317    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q317
AS
SELECT
 *
FROM
 Q317
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q317]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q318    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q318
AS
SELECT
 *
FROM
 Q318
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q318]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q319    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q319
AS
SELECT
 *
FROM
 Q319
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q319]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q320    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q320
AS
SELECT
 *
FROM
 Q320
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q320]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q321    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q321
AS
SELECT
 *
FROM
 Q321
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q321]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q322    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q322
AS
SELECT
 *
FROM
 Q322
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q322]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q323    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q323
AS
SELECT
 *
FROM
 Q323
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q323]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q324    Script Date: 2000. 07. 04. 18:56:24 ******/











CREATE PROCEDURE sp_Q324
AS
SELECT
 *
FROM
 Q324
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q324]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q325    Script Date: 2000. 07. 04. 18:56:25 ******/











CREATE PROCEDURE sp_Q325
AS
SELECT
 *
FROM
 Q325
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q325]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q326    Script Date: 2000. 07. 04. 18:56:25 ******/











CREATE PROCEDURE sp_Q326
AS
SELECT
 *
FROM
 Q326
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q326]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q327    Script Date: 2000. 07. 04. 18:56:25 ******/











CREATE PROCEDURE sp_Q327
AS
SELECT
 *
FROM
 Q327
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q327]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q328    Script Date: 2000. 07. 04. 18:56:25 ******/











CREATE PROCEDURE sp_Q328
AS
SELECT
 *
FROM
 Q328
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q328]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q329    Script Date: 2000. 07. 04. 18:56:25 ******/











CREATE PROCEDURE sp_Q329
AS
SELECT
 *
FROM
 Q329
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q329]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q330    Script Date: 2000. 07. 04. 18:56:25 ******/











CREATE PROCEDURE sp_Q330
AS
SELECT
 *
FROM
 Q330
ORDER BY
 KODENEV




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q330]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q331    Script Date: 2000. 07. 04. 18:56:25 ******/







CREATE PROCEDURE sp_Q331
AS
SELECT
	*
FROM
	Q331
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q331]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q332    Script Date: 2000. 07. 04. 18:56:25 ******/







CREATE PROCEDURE sp_Q332
AS
SELECT
	*
FROM
	Q332
ORDER BY
	KODENEV

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q332]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q333    Script Date: 2000. 07. 04. 18:56:25 ******/







CREATE PROCEDURE sp_Q333
AS
SELECT
	*
FROM
	Q333
ORDER BY
	KODENEV
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q333]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q334    Script Date: 2000. 07. 04. 18:56:26 ******/







CREATE PROCEDURE sp_Q334
AS
SELECT
	*
FROM
	Q334
ORDER BY
	NEV

















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q334]  TO [public]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q335    Script Date: 2000. 07. 04. 18:56:26 ******/





CREATE PROCEDURE sp_Q335
AS
SELECT
	*
FROM
	Q335
ORDER BY
	KODENEV














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q335]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q336    Script Date: 2000. 07. 04. 18:56:26 ******/

CREATE PROCEDURE sp_Q336
AS
SELECT
	*
FROM
	Q336
ORDER BY
	KODENEV














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q336]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q337    Script Date: 2000. 07. 04. 18:56:26 ******/

Create PROCEDURE sp_Q337
AS
SELECT
	*
FROM
	Q337
ORDER BY
	KODENEV










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q337]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q338    Script Date: 2000. 07. 04. 18:56:26 ******/
CREATE PROCEDURE sp_Q338
AS
SELECT
	*
FROM
	Q338
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q338]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q339    Script Date: 2000. 07. 04. 18:56:26 ******/
CREATE PROCEDURE sp_Q339
AS
SELECT
	*
FROM
	Q339
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q339]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q340    Script Date: 2000. 07. 04. 18:56:26 ******/
CREATE PROCEDURE sp_Q340
AS
SELECT
	*
FROM
	Q340
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q340]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q341    Script Date: 2000. 07. 04. 18:56:26 ******/
CREATE PROCEDURE sp_Q341
AS
SELECT
	*
FROM
	Q341
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q341]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q342    Script Date: 2000. 07. 04. 18:56:27 ******/
CREATE PROCEDURE sp_Q342
AS
SELECT
	*
FROM
	Q342
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q342]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q343    Script Date: 2000. 07. 04. 18:56:27 ******/
CREATE PROCEDURE sp_Q343
AS
SELECT
	*
FROM
	Q343
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q343]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q344    Script Date: 2000. 07. 04. 18:56:27 ******/
CREATE PROCEDURE sp_Q344
AS
SELECT
	*
FROM
	Q344
ORDER BY
	KODENEV









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q344]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q345    Script Date: 2000. 07. 04. 18:56:27 ******/
Create PROCEDURE sp_Q345
AS
SELECT
	*
FROM
	Q345
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q345]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q346    Script Date: 2000. 07. 04. 18:56:27 ******/
Create PROCEDURE sp_Q346
AS
SELECT
	*
FROM
	Q346
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q346]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Q346    Script Date: 2000. 07. 04. 18:56:27 ******/
Create PROCEDURE sp_Q347
AS
SELECT
	*
FROM
	Q347
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q347]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q348
AS
SELECT
	*
FROM
	Q348
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q348]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q349
AS
SELECT
	*
FROM
	Q349
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q349]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q350
AS
SELECT
	*
FROM
	Q350
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q350]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q351
AS
SELECT
	*
FROM
	Q351
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q351]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q352
AS
SELECT
	*
FROM
	Q352
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q352]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q353
AS
SELECT
	*
FROM
	Q353
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q353]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q354
AS
SELECT
	*
FROM
	Q354
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q354]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q355
AS
SELECT
	*
FROM
	Q355
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q355]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q356
AS
SELECT
	*
FROM
	Q356
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q356]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q357
AS
SELECT
	*
FROM
	Q357
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q357]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q358
AS
SELECT
	*
FROM
	Q358
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q358]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q359
AS
SELECT
	*
FROM
	Q359
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q359]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q360
AS
SELECT
	*
FROM
	Q360
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q360]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q361
AS
SELECT
	*
FROM
	Q361
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q361]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q362
AS
SELECT
	*
FROM
	Q362
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q362]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q363
AS
SELECT
	*
FROM
	Q363
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q363]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_Q364
AS
SELECT
	*
FROM
	Q364
ORDER BY
	KODENEV






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q364]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_Q365
AS
SELECT
	*
FROM
	Q365
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q365]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_Q366
AS
SELECT
	*
FROM
	Q366
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q366]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_Q367
AS
SELECT
	*
FROM
	Q367
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q367]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Q368
AS
SELECT
	*
FROM
	Q368
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q368]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Q369
AS
SELECT
	*
FROM
	Q369
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q369]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_Q370
AS
SELECT
	*
FROM
	Q370
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q370]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_Q371
AS
SELECT
	*
FROM
	Q371
ORDER BY
	KODENEV


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Q371]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_QueryParams
@QRYNAME VARCHAR(92)
AS
DECLARE @OBJID INT
SELECT @OBJID = OBJECT_ID(@QRYNAME)
SELECT
 C.NAME,
 T.NAME,
 C.LENGTH,
 C.COLID
FROM
 SYSCOLUMNS C,
 SYSTYPES T
WHERE
 C.ID = @OBJID
 AND C.USERTYPE *= T.USERTYPE
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_QueryParams]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_Rekurziv    Script Date: 2000. 07. 04. 18:56:27 ******/
CREATE PROCEDURE sp_Rekurziv
@pID INTEGER,	-- Melyik objektum felsobb kapcsolatát keressük
@pOBJTIP VARCHAR(2)='03'	--Milyen felsobb kapcsolatot keresünk. 03 - Futomu
AS

--Megállapítjuk, hogy a kérdéses objektum milyen berendezés
DECLARE @OBJTIP VARCHAR(2)
SELECT @OBJTIP = OBJTIP FROM OBJEKTUM WHERE ID = @pID

-- Ha o maga már a keresett típus, akkor 0-t adunk vissza.
IF @OBJTIP = @pOBJTIP
	BEGIN
	RETURN 0
	--RETURN @pID
	END
-- Ha nincs kapcsolva semmihez, akkor is 0-t adunk vissza.
ELSE IF not exists(select * from kapcsolat where id2=@pID)
	BEGIN
	RETURN 0
	END
-- Na nézzük, mihez kapcsolódik
ELSE
	BEGIN
	DECLARE @ID INTEGER
	DECLARE @ID1 INTEGER
	DECLARE @ID2 INTEGER
	DECLARE @SZINT INTEGER
	SELECT @SZINT = 0

	DECLARE @FUTOMU_ID INTEGER
	SELECT @FUTOMU_ID = -1

	SELECT @ID2 = @pID	--Amit keresünk, az valamihez kapcsolva van, ezért
						--a KAPCSOLAT táblában a második oszlopban keressük
						-- az o ID-jét.

	WHILE (@FUTOMU_ID = -1) AND (@SZINT < 40)
		BEGIN
		SELECT @SZINT = @SZINT + 1	-- Csak korlát, hogy ne szálljon el
if exists (		SELECT ID1 FROM KAPCSOLAT WHERE ID2=@ID2)	
begin
		SELECT @ID1=ID1 FROM KAPCSOLAT WHERE ID2=@ID2	-- Mihez kapcsolódik
		SELECT @OBJTIP = OBJTIP FROM OBJEKTUM WHERE ID = @ID1	-- és az milyen berendezés
		IF @OBJTIP = @pOBJTIP	-- Ha a megfelelo berendezés típus, a felsobb kapcsolat
			BEGIN
			SELECT @FUTOMU_ID = @ID1	-- Az ID-t adjuk vissza
			END
		ELSE
			BEGIN
			SELECT @ID2 = @ID1	-- Egyébként nézzük tovább, most már az elobb talált
			END	-- objektum felsobb kapcsolatát követve.
end
else	-- Legfelso szintre jutott			
	BEGIN
		SELECT @FUTOMU_ID = 0
	END

	END

RETURN @FUTOMU_ID

END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Rekurziv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







/****** Object:  Stored Procedure dbo.sp_SetMunkalapAllapot    Script Date: 2000. 07. 04. 18:56:27 ******/

CREATE PROCEDURE sp_SetMunkalapAllapot
@pID INTEGER, @pALLAPOT INTEGER
AS
UPDATE
	MUNKALAP
SET
	ALLAPOT = @pALLAPOT
WHERE
	ID = @pID










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_SetMunkalapAllapot]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_Szetkapcsol
@pID1 INTEGER,
@pID2 INTEGER
AS

BEGIN TRAN

DECLARE @ELOZOKAPCS INT

SELECT @ELOZOKAPCS = ID1 FROM KAPCSOLAT WHERE ID1 = @pID1 AND ID2 = @pID2

DELETE
FROM
	KAPCSOLAT
WHERE
	ID1 = @pID1
	AND ID2 = @pID2


UPDATE
	OBJEKTUM
SET
	KAPCSOLT = 0,
	ELOZOKAPCS = @ELOZOKAPCS,
	ELOZOKAPCSDATE = GETDATE()
WHERE
	ID = @pID2

COMMIT TRAN



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Szetkapcsol]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_TruncKapcsTab    Script Date: 2000. 07. 04. 18:56:27 ******/
CREATE PROCEDURE sp_TruncKapcsTab
AS
/*	Ez akkor muködik csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE KAPCSTAB
*/
DELETE FROM KAPCSTAB














GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_TruncKapcsTab]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_UpdDolgozo
@pID INTEGER,
@NEV VARCHAR(20) = NULL,
@SZEREGYS VARCHAR(2) = NULL,
@BEOSZT VARCHAR(2) = NULL,
@UFR VARCHAR(1),
@UFW VARCHAR(1),
@UER VARCHAR(1),
@UEW VARCHAR(1)
AS
UPDATE
	DOLGOZO
SET
	NEV = @NEV,
	SZEREGYS = @SZEREGYS,
	BEOSZT = @BEOSZT,
	UFR = @UFR,
	UFW = @UFW,
	UER = @UER,
	UEW = @UEW
WHERE
	ID = @pID
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdDolgozo]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_UpdEpul    Script Date: 2000. 07. 04. 18:56:28 ******/


CREATE PROCEDURE sp_UpdEpul
@pID INTEGER,
@IRSZAM INTEGER=NULL,
@VAROS VARCHAR(1)=NULL,
@UTCA VARCHAR(35)=NULL,
@HSZ VARCHAR(3)=NULL,
@EPULNEV VARCHAR(50)=NULL,
@EPULTIP VARCHAR(3)=NULL,
@HELYR VARCHAR(12)=NULL,
@EPULSZ VARCHAR(3)=NULL,
@FUTESMOD VARCHAR(3)=NULL,
@LEGTELTIP VARCHAR(3)=NULL,
@LEGTHELY VARCHAR(2)=NULL,
@EPULATAD VARCHAR(20)=NULL,
@FUTOTIP VARCHAR(3)=NULL,
@UZEMELT VARCHAR(2)=NULL,
@KARBANTAR VARCHAR(3)=NULL,
@EPULHOSZ REAL=NULL,
@LAKTERF REAL=NULL,
@LEPCSOTERF REAL=NULL,
@KOZOSTERF REAL=NULL,
@KOZULTERF REAL=NULL,
@TERF_ARAM REAL=NULL,
@HOLEPCSO VARCHAR(3)=NULL,
@EPUL_ARAM REAL=NULL,
@CIRK_ARAM REAL=NULL,
@FUTBESZAB VARCHAR(3)=NULL,
@CIRKUL VARCHAR(3)=NULL,
@ATKOTES VARCHAR(1)=NULL,
@HMVRENDS VARCHAR(3)=NULL,
@NYOMKUL REAL=NULL,
@CIRK_MOD VARCHAR(3)=NULL,
@FOELZ VARCHAR(2)=NULL,
@FELOSZT VARCHAR(3)=NULL,
@UTEM VARCHAR(2)=NULL
AS
UPDATE
 EPULET
SET
 /*IRSZAM = @IRSZAM,*/
 EPULTIP = @EPULTIP,
 HELYR = @HELYR,
 EPULSZ = @EPULSZ,
 FUTESMOD = @FUTESMOD,
 LEGTELTIP = @LEGTELTIP,
 LEGTHELY = @LEGTHELY,
 EPULATAD = CONVERT(datetime,@EPULATAD,20),
 FUTOTIP = @FUTOTIP,
 UZEMELT = @UZEMELT,
 KARBANTAR = @KARBANTAR,
 EPULHOSZ = @EPULHOSZ,
 LAKTERF = @LAKTERF,
 LEPCSOTERF = @LEPCSOTERF,
 KOZOSTERF = @KOZOSTERF,
 KOZULTERF = @KOZULTERF,
 TERF_ARAM = @TERF_ARAM,
 HOLEPCSO = @HOLEPCSO,
 EPUL_ARAM = @EPUL_ARAM,
 CIRK_ARAM = @CIRK_ARAM,
 FUTBESZAB = @FUTBESZAB,
 CIRKUL = @CIRKUL,
 ATKOTES = @ATKOTES,
 HMVRENDS = @HMVRENDS,
 NYOMKUL = @NYOMKUL,
 CIRK_MOD = @CIRK_MOD,
 FOELZ = @FOELZ,
 FELOSZT = @FELOSZT,
 UTEM = @UTEM
WHERE
 ID = @pID
UPDATE
 OBJEKTUM
SET
 VAROS = @VAROS,
 UTCA = @UTCA,
 HSZ = @HSZ,
 MEGNEV = @EPULNEV
WHERE
 ID = @pID




















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdEpul]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_UpdKepvis    Script Date: 2000. 07. 04. 18:56:28 ******/
CREATE PROCEDURE sp_UpdKepvis
@pID INTEGER,
@SZERNEV VARCHAR(50),
@SZERCIM VARCHAR(50),
@SZERIRSZ VARCHAR(4),
@KOZNEV VARCHAR(100),
@KOZCIM VARCHAR(100),
@KOZIRSZ VARCHAR(4),
@MEGJ VARCHAR(1024)
AS
UPDATE
	KEPVIS
SET
	SZERNEV = @SZERNEV,
	SZERCIM = @SZERCIM,
	SZERIRSZ = @SZERIRSZ,
	KOZNEV = @KOZNEV,
	KOZCIM = @KOZCIM,
	KOZIRSZ = @KOZIRSZ,
	MEGJ = @MEGJ
WHERE
	ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdKepvis]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_UpdKontir    Script Date: 2000. 07. 04. 18:56:28 ******/
CREATE PROCEDURE sp_UpdKontir
@pID VARCHAR(12),
@FSZNEV VARCHAR(30)=NULL,
@KIJELOLT VARCHAR(1)=NULL
AS
UPDATE KONTIR
SET
	FSZNEV = @FSZNEV,
	KIJELOLT = @KIJELOLT
WHERE
	FSZAM = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdKontir]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





/****** Object:  Stored Procedure dbo.sp_UpdMunkalap    Script Date: 2000. 07. 04. 18:56:28 ******/
CREATE PROCEDURE sp_UpdMunkalap
@pID INTEGER,
@BEJDAT DATETIME=NULL,
@BEJNEV VARCHAR(40)=NULL,
@TIPUSH VARCHAR(3)=NULL,
@HIBLEIR VARCHAR (1024)=NULL,
@SZEREGYS VARCHAR(2)=NULL,
@MFDOLG INTEGER=NULL,
@MUNELV DATETIME=NULL,
@IDOTOL VARCHAR(10)=NULL,
@IDOIG VARCHAR(10)=NULL,
@SZOLGTIP VARCHAR(2)=NULL,
@MUNVEGZ VARCHAR(2)=NULL,
@SZOLGJELL VARCHAR(2)=NULL,
@KARBTIP VARCHAR(1)=NULL,
@MUVEL VARCHAR(3)=NULL,
@FELTIP VARCHAR(2)=NULL,
@FELLEIR VARCHAR(1024)=NULL,
@JELENSTIP VARCHAR(2)=NULL,
@JELENSLEIR VARCHAR(1024)=NULL,
--@MUVLEIR VARCHAR(1024)=NULL,
@INTEZ VARCHAR(1024)=NULL,
@VONEV DATETIME=NULL,
@SORSZ VARCHAR(50)=NULL,
@NAPSZAM VARCHAR(50)=NULL,
@KIALLDAT DATETIME=NULL,
@FSZAM VARCHAR(12)=NULL,
@SZOLTIP VARCHAR(1)=NULL,
@MUNSZ VARCHAR(2)=NULL,
@MKAP INTEGER=NULL,
@ALLAPOT INTEGER=NULL,
@MVDOLG INTEGER=NULL,
@MVDAT DATETIME=NULL,
@LAKAS VARCHAR(50)=NULL,
@OBJID INTEGER=NULL,
@PLOMBAZAS VARCHAR(1)=NULL,
@UJ VARCHAR(10)=NULL,
@FELUJITOTT VARCHAR(10)=NULL
AS
UPDATE MUNKALAP
SET
	BEJDAT = @BEJDAT,
	BEJNEV = @BEJNEV,
	TIPUSH = @TIPUSH,
	HIBLEIR = @HIBLEIR,
	SZEREGYS = @SZEREGYS,
	MFDOLG = @MFDOLG,
	MUNELV = @MUNELV,
	IDOTOL = @IDOTOL,
	IDOIG = @IDOIG,
	SZOLGTIP = @SZOLGTIP,
	MUNVEGZ = @MUNVEGZ,
	SZOLGJELL = @SZOLGJELL,
	KARBTIP = @KARBTIP,
	MUVEL = @MUVEL,
	FELTIP = @FELTIP,
	FELLEIR = @FELLEIR,
	JELENSTIP = @JELENSTIP,
	JELENSLEIR = @JELENSLEIR,
	--MUVLEIR = @MUVLEIR,
	INTEZ = @INTEZ,
	VONEV = @VONEV,
	SORSZ = @SORSZ,
	NAPSZAM = @NAPSZAM,
	KIALLDAT = @KIALLDAT,
	FSZAM = @FSZAM,
	SZOLTIP = @SZOLTIP,
	MUNSZ = @MUNSZ,
	MKAP = @MKAP,
	ALLAPOT = @ALLAPOT,
	MVDOLG = @MVDOLG,
	MVDAT = @MVDAT,
	LAKAS = @LAKAS,
	OBJID = @OBJID,
	PLOMBAZAS = @PLOMBAZAS,
	UJ = @UJ,
	FELUJITOTT = @FELUJITOTT,
	ADATUM = GetDate(),
	AKOD = User_Name()
WHERE
	ID = @pID





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdMunkalap]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_UpdMunkalapVisszair
@pID INTEGER,
@MUVLEIR VARCHAR(1024)=NULL
AS
UPDATE MUNKALAP
SET
	MUVLEIR = @MUVLEIR,
	ADATUM  = GetDate(),
	AKOD = User_Name()
WHERE
	ID = @pID





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdMunkalapVisszair]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_UpdObjAlt
@pID INTEGER,
@AZON VARCHAR(8)=NULL,
@MEGNEV VARCHAR(50)=NULL,
@TIPUS VARCHAR(20)=NULL,
@VAROS VARCHAR(1)=NULL,
@UTCA VARCHAR(35)=NULL,
@HSZ VARCHAR(3)=NULL,
@ELHELYEZ VARCHAR(25)=NULL,
@GYSZAM VARCHAR(15)=NULL,
@GYARTO VARCHAR(3)=NULL,
@UZALL VARCHAR(1)=NULL,
@UZEMIDO VARCHAR(20)=NULL,
@HITIDO VARCHAR(20)=NULL,
@GYARTM VARCHAR(20)=NULL,
@TELEPHSZ VARCHAR(20)=NULL,
@VESZO VARCHAR(1)=NULL,
@FKOD VARCHAR(3)=NULL,
@ALAIR VARCHAR(3)=NULL,
@NEVLTELJ REAL=NULL,
@NEVLTELJME VARCHAR(3)=NULL,
@KATEG VARCHAR(2)=NULL,
@FSZAM VARCHAR(12)=NULL,
@MEGJ VARCHAR(255)=NULL,
@AKTIV VARCHAR(1)='y'
AS
UPDATE
	OBJEKTUM	
SET
	AZON = @AZON,
	MEGNEV = @MEGNEV,
	TIPUS = @TIPUS,
	VAROS = @VAROS,
	UTCA = @UTCA,
	HSZ = @HSZ,
	ELHELYEZ = @ELHELYEZ,
	GYSZAM = @GYSZAM,
	GYARTO = @GYARTO,
	UZALL = @UZALL,
	UZEMIDO = CONVERT(datetime, @UZEMIDO, 20),
	HITIDO = CONVERT(datetime, @HITIDO, 20),
	GYARTM = @GYARTM,
	TELEPHSZ = @TELEPHSZ,
	VESZO = @VESZO,
	FKOD = @FKOD,
	ALAIR = @ALAIR,
	NEVLTELJ = @NEVLTELJ,
	NEVLTELJME = @NEVLTELJME,
	KATEG = @KATEG,
	FSZAM = @FSZAM,
	MEGJ = @MEGJ,
	AKTIV = @AKTIV,
	AKOD = User_Name(),
	ADATUM = GetDate()
WHERE
	ID = @pID



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdObjAlt]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE sp_UpdObjGep
@pID INTEGER,
@MKHOM REAL=NULL,
@FAGYVED CHAR(1)=NULL,
@FELEP VARCHAR(1)=NULL,
@BOYTIP VARCHAR(2)=NULL,
@SZELTIP VARCHAR(3)=NULL,
@LEVNYOM REAL=NULL,
@VIZNYOM REAL=NULL,
@SZURTIP VARCHAR(2)=NULL,
@ELLENALL REAL=NULL,
@LEMSZAM INTEGER=NULL,
@UZEMINYOM REAL=NULL,
@BEVTELJ REAL=NULL,
@FORDSZ INTEGER=NULL,
@EMEL_MAG REAL=NULL,
@SZAL_KOZ VARCHAR(3)=NULL,
@SZAL_MENNY REAL=NULL,
@SZIVFOK VARCHAR(2)=NULL,
@MERET VARCHAR(50)=NULL,
@MERETME VARCHAR(3)=NULL,
@FUTOFEL REAL=NULL,
@DB INTEGER=NULL,
@HOTELJ REAL=NULL,
@GAZCSUCS REAL=NULL,
@HOHOR_KO VARCHAR(3)=NULL,
@BEEPCSOVDB INTEGER=NULL,
@PRIM_ARAM REAL=NULL,
@NYITNYOM REAL=NULL,
@ZARNYOM REAL=NULL,
@HOSSZ_NAGY REAL=NULL,
@HOSSZ_KICS REAL=NULL,
@FELUGY VARCHAR(1)=NULL,
@HOLEP VARCHAR(3)=NULL,
@TERFOGAT REAL=NULL,
@TERFARAM REAL=NULL,
@LEGSZAL REAL=NULL,
@SZABMOD VARCHAR(2)=NULL,
@VEGNYOM REAL=NULL,
@ATMERO REAL=NULL,
@BEALL_ERTEK VARCHAR(50)=NULL,
@IMPULZUS REAL=NULL,
@HOSSZ REAL=NULL,
@TERHEL REAL=NULL,
@VIZSZ REAL=NULL,
@FU_KOZ VARCHAR(3)=NULL,
@OSZLSZAM INTEGER=NULL,
@BECSOV INTEGER=NULL,
@GAZMIN VARCHAR(2)=NULL,
@GAZMAX VARCHAR(2)=NULL,
@EGMIN VARCHAR(2)=NULL,
@POROLAJ_MIN VARCHAR(2)=NULL,
@PORLEV_MIN VARCHAR(2)=NULL,
@PORGOZ_MIN VARCHAR(2)=NULL,
@GOZMAX VARCHAR(2)=NULL,
@VIZMAX VARCHAR(2)=NULL,
@VESZVIZ_MIN VARCHAR(2)=NULL,
@FUSTCSAP_RET VARCHAR(2)=NULL,
@EGYEB_RET VARCHAR(2)=NULL,
@KETPONTSZAB VARCHAR(2)=NULL,
@HAROMPONTSZAB VARCHAR(2)=NULL,
@FOLYSZAB VARCHAR(2)=NULL,
@EGYEB VARCHAR(2)=NULL,
@FUST_TOM VARCHAR(2)=NULL,
@LEOLVMOD VARCHAR(2)=NULL,
@PLOMBA VARCHAR(12)=NULL,
@PLOMBA2 VARCHAR(12)=NULL,
@TOMEGARAM REAL=NULL
AS
DECLARE @pOBJTIP AS VARCHAR(2)
SELECT
 @pOBJTIP = OBJTIP
FROM
 OBJEKTUM
WHERE
 ID = @pID
/*IF @pOBJTIP = '01'
BEGIN
UPDATE EPULET
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '02'
BEGIN
UPDATE LAKAS
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END
ELSE*/ IF @pOBJTIP = '03'
BEGIN
UPDATE FUTOMU
SET
 MKHOM = @MKHOM,
 HOTELJ = @HOTELJ,
 GAZCSUCS = @GAZCSUCS,
 HOHOR_KO = @HOHOR_KO,
 HOLEP = @HOLEP,
 TERFARAM = @TERFARAM
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '04'
BEGIN
UPDATE KAZAN
SET
	UZEMINYOM = @UZEMINYOM,
	HOHOR_KO = @HOHOR_KO,
	TERFARAM = @TERFARAM,
	SZABMOD = @SZABMOD
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '05'
	BEGIN
	UPDATE
		KAZANEGO
	SET
		BEVTELJ = @BEVTELJ,
		SZABMOD = @SZABMOD,
		GAZMIN = @GAZMIN,
		GAZMAX = @GAZMAX,
		EGMIN = @EGMIN,
		POROLAJ_MIN = @POROLAJ_MIN,
		PORLEV_MIN = @PORLEV_MIN,
		PORGOZ_MIN = @PORGOZ_MIN,
		GOZMAX = @GOZMAX,
		VIZMAX = @VIZMAX,
		VESZVIZ_MIN = @VESZVIZ_MIN,
		FUSTCSAP_RET = @FUSTCSAP_RET,
		EGYEB_RET = @EGYEB_RET,
		KETPONTSZAB = @KETPONTSZAB,
		HAROMPONTSZAB = @HAROMPONTSZAB,
		FOLYSZAB = @FOLYSZAB,
		EGYEB = @EGYEB,
		FUST_TOM = @FUST_TOM
	WHERE
		ID = @pID
	END
ELSE IF @pOBJTIP = '06'
BEGIN
UPDATE SZIVATTYU
SET
 FORDSZ = @FORDSZ,
 EMEL_MAG = @EMEL_MAG,
 SZAL_KOZ = @SZAL_KOZ,
 SZAL_MENNY = @SZAL_MENNY,
 SZIVFOK = @SZIVFOK
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '07'
BEGIN
UPDATE HOCSERELO
SET
 ELLENALL = @ELLENALL,
 LEMSZAM = @LEMSZAM,
 MERET = @MERET,
 MERETME = @MERETME,
 FUTOFEL = @FUTOFEL,
 DB = @DB,
 HOHOR_KO = @HOHOR_KO,
 HOSSZ_NAGY = @HOSSZ_NAGY,
 HOSSZ_KICS = @HOSSZ_KICS,
 FELUGY = @FELUGY,
 FU_KOZ = @FU_KOZ
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '08'
BEGIN
UPDATE VENTILLATOR
SET
 FAGYVED = @FAGYVED,
 FORDSZ = @FORDSZ,
 LEGSZAL = @LEGSZAL,
 FU_KOZ = @FU_KOZ
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '09'
BEGIN
UPDATE BOYLER
SET
 FELEP = @FELEP,
 BOYTIP = @BOYTIP,
 FUTOFEL = @FUTOFEL,
 TERFOGAT = @TERFOGAT,
 SZABMOD = @SZABMOD,
 FU_KOZ = @FU_KOZ
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '10'
BEGIN
UPDATE MELEGVIZ_TAROLO
SET
 FELEP = @FELEP,
 TERFOGAT = @TERFOGAT
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '11'
BEGIN
UPDATE TARTALY
SET
 FELEP = @FELEP,
 LEVNYOM = @LEVNYOM,
 VIZNYOM = @VIZNYOM,
 TERFOGAT = @TERFOGAT
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '12'
BEGIN
UPDATE SZUROK
SET
 SZURTIP = @SZURTIP
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP='13'
BEGIN
UPDATE VIZLAGYITO
SET
 SZABMOD = @SZABMOD,
 OSZLSZAM = @OSZLSZAM
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '14'
BEGIN
UPDATE KOMPRESSZOR
SET
 FORDSZ = @FORDSZ,
 SZAL_KOZ = @SZAL_KOZ,
 SZAL_MENNY = @SZAL_MENNY,
 VEGNYOM = @VEGNYOM
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '15'
BEGIN
UPDATE TERMELO_CSO
SET
 BEEPCSOVDB = @BEEPCSOVDB,
 ATMERO = @ATMERO,
 HOSSZ = @HOSSZ,
 VIZSZ = @VIZSZ,
 BECSOV = @BECSOV
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '16'
BEGIN
UPDATE DEMAG_EMELOGEP
SET
 FORDSZ = @FORDSZ,
 TERHEL = @TERHEL
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '17'
BEGIN
UPDATE HOKOZPONT
SET
 PRIM_ARAM = @PRIM_ARAM,
 HOLEP = @HOLEP
WHERE
 ID = @pID
END

ELSE IF @pOBJTIP = '18'	--Hoösszegzo
BEGIN
	UPDATE HOOSSZEGZO
SET
	IMPULZUS = @IMPULZUS,
	LEOLVMOD = @LEOLVMOD,
	PLOMBA = @PLOMBA
WHERE
	ID = @pID
END
ELSE IF @pOBJTIP = '19'	--Vízóra
BEGIN
	UPDATE
		VIZORA
	SET
		SZAL_KOZ = @SZAL_KOZ,
		SZAL_MENNY = @SZAL_MENNY,
		ATMERO = @ATMERO,
		IMPULZUS = @IMPULZUS,
		PLOMBA = @PLOMBA,
		TOMEGARAM = @TOMEGARAM
	WHERE
		ID = @pID
END

ELSE IF @pOBJTIP = '20'
BEGIN
	UPDATE
		ERZEKELO
	SET
		PLOMBA = @PLOMBA,
		PLOMBA2 = @PLOMBA2
	WHERE
	ID = @pID
END
/*ELSE IF @pOBJTIP = '21'
BEGIN
UPDATE FOKAPCSOLO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '22'
BEGIN
UPDATE FAZISJAVITO_KONDENZATOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '23'
BEGIN
UPDATE GAZVESZELY_JELZO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '24'
BEGIN
UPDATE MOTOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '25'
BEGIN
UPDATE SZINTKAPCSOLO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '26'
BEGIN
UPDATE SZABALYOZO_AUTOMATIKA
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '27'
BEGIN
UPDATE SZABALYOZO_SZELEP
SET
 MERET = @MERET,
 MERETME = @MERETME,
 ATMERO = @ATMERO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '28'
BEGIN
UPDATE BIZTONSAGI_SZELEP
SET
 SZELTIP = @SZELTIP,
 MERET = @MERET,
 MERETME = @MERETME,
 NYITNYOM = @NYITNYOM,
 ZARNYOM = @ZARNYOM
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '29'
BEGIN
UPDATE FREKVENCIAVALTO
SET
 MKHOM = @MKHOM
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '30'
BEGIN
UPDATE ARAMKOR
SET
 HOLEP = @HOLEP,
 TERFOGAT = @TERFOGAT,
 HOSSZ = @HOSSZ
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '31'
BEGIN
UPDATE KOLTSEGMEGOSZTO
SET
 VALAMI  = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '32'
BEGIN
UPDATE TARCSA
SET
 ATMERO = @ATMERO
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '33'
BEGIN
UPDATE HAJTOMU
SET
 ATMERO = @ATMERO,
 BEALL_ERTEK = @BEALL_ERTEK
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '34'
BEGIN
UPDATE LANGOR
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '35'
BEGIN
UPDATE TERMALKUT
SET
 SZAL_MENNY = @SZAL_MENNY
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '36'
BEGIN
UPDATE SZERELVENY
SET
 ATMERO = @ATMERO,
 BEALL_ERTEK = @BEALL_ERTEK
WHERE
 ID = @pID
END

UPDATE
	OBJEKTUM
SET
	ADATUM = GetDate(),
	AKOD = User_Name()
WHERE
	ID = @pID





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdObjGep]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_UpdObjUzem    Script Date: 2000. 07. 04. 18:56:28 ******/
CREATE PROCEDURE sp_UpdObjUzem
@pID INTEGER,
@FUR_ATM REAL=NULL,
@PRIMELL REAL=NULL,
@KAPCSOLAS REAL=NULL,
@TOLTESMOD VARCHAR(2)=NULL,
@FUTOTT VARCHAR(1)=NULL,
@SZABALYOZAS REAL=NULL,
@KUTFNYOM REAL=NULL,
@NYUGVIZSZ REAL=NULL,
@UZEMIVIZSZ REAL=NULL,
@CIRKTERFARAM REAL=NULL,
@HOMERS REAL=NULL,
@NYOMTARTTIP VARCHAR(50)=NULL,
@HMVHOMERS REAL=NULL,
@FUT_LAKAS INTEGER=NULL,
@HMV_LAKAS INTEGER=NULL,
@FUT_KOZULET INTEGER=NULL,
@HMV_KOZULET INTEGER=NULL,
@HOKOZP_SZAM INTEGER=NULL,
@SZEKU_TOM REAL=NULL,
@NYOMKUL REAL=NULL,
@TOMEGARAM REAL=NULL,
@NYOMAS_K REAL=NULL,
@HOMER_SZ REAL=NULL
AS
DECLARE @pOBJTIP AS VARCHAR(2)
SELECT
 @pOBJTIP = OBJTIP
FROM
 OBJEKTUM
WHERE
 ID = @pID
/*IF @pOBJTIP = '01'
UPDATE EPULET
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
ELSE IF @pOBJTIP = '02'
UPDATE LAKAS
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
ELSE*/ IF @pOBJTIP = '03'
BEGIN
UPDATE FUTOMU
SET
 CIRKTERFARAM = @CIRKTERFARAM,
 NYOMTARTTIP = @NYOMTARTTIP,
 HMVHOMERS = @HMVHOMERS,
 FUT_LAKAS = @FUT_LAKAS,
 HMV_LAKAS = @HMV_LAKAS,
 FUT_KOZULET = @FUT_KOZULET,
 HMV_KOZULET = @HMV_KOZULET
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '04'
BEGIN
UPDATE KAZAN
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '05'
BEGIN
UPDATE KAZANEGO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '06'
BEGIN
UPDATE SZIVATTYU
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '07'
BEGIN
UPDATE HOCSERELO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '08'
BEGIN
UPDATE VENTILLATOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '09'
BEGIN
UPDATE BOYLER
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '10'
BEGIN
UPDATE MELEGVIZ_TAROLO
SET
 KAPCSOLAS = @KAPCSOLAS,
 TOLTESMOD = @TOLTESMOD
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '11'
BEGIN
UPDATE TARTALY
SET
 FUTOTT = @FUTOTT,
 SZABALYOZAS = @SZABALYOZAS
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '12'
BEGIN
UPDATE SZUROK
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP='13'
BEGIN
UPDATE VIZLAGYITO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '14'
BEGIN
UPDATE KOMPRESSZOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '15'
BEGIN
UPDATE TERMELO_CSO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '16'
BEGIN
UPDATE DEMAG_EMELOGEP
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '17'
BEGIN
UPDATE HOKOZPONT
SET
 PRIMELL = @PRIMELL,
 FUT_LAKAS = @FUT_LAKAS,
 HMV_LAKAS = @HMV_LAKAS,
 FUT_KOZULET = @FUT_KOZULET,
 SZEKU_TOM = @SZEKU_TOM,
 NYOMAS_K = @NYOMAS_K,
 HOMER_SZ = @HOMER_SZ
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '18'
BEGIN
UPDATE HOOSSZEGZO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '19'
BEGIN
UPDATE VIZORA
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '20'
BEGIN
UPDATE ERZEKELO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '21'
BEGIN
UPDATE FOKAPCSOLO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '22'
BEGIN
UPDATE FAZISJAVITO_KONDENZATOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '23'
BEGIN
UPDATE GAZVESZELY_JELZO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '24'
BEGIN
UPDATE MOTOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '25'
BEGIN
UPDATE SZINTKAPCSOLO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '26'
BEGIN
UPDATE SZABALYOZO_AUTOMATIKA
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '27'
BEGIN
UPDATE SZABALYOZO_SZELEP
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '28'
BEGIN
UPDATE BIZTONSAGI_SZELEP
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '29'
BEGIN
UPDATE FREKVENCIAVALTO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '30'
BEGIN
UPDATE ARAMKOR
SET
 SZABALYOZAS = @SZABALYOZAS,
 FUT_LAKAS = @FUT_LAKAS,
 HMV_LAKAS = @HMV_LAKAS,
 FUT_KOZULET = FUT_KOZULET,
 HMV_KOZULET = HMV_KOZULET,
 HOKOZP_SZAM = HOKOZP_SZAM,
 NYOMKUL = @NYOMKUL,
 TOMEGARAM = @TOMEGARAM
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '31'
BEGIN
UPDATE KOLTSEGMEGOSZTO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '32'
BEGIN
UPDATE TARCSA
SET
 FUR_ATM = @FUR_ATM
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '33'
BEGIN
UPDATE HAJTOMU
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '34'
BEGIN
UPDATE LANGOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '35'
BEGIN
UPDATE TERMALKUT
SET
 KUTFNYOM = @KUTFNYOM,
 NYUGVIZSZ = @NYUGVIZSZ,
 UZEMIVIZSZ = @UZEMIVIZSZ,
 HOMERS = @HOMERS
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '36'
BEGIN
UPDATE SZERELVENY
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
UPDATE
 OBJEKTUM
SET
 ADATUM = GetDate(),
 AKOD = User_Name()
WHERE
 ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdObjUzem]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE sp_UpdObjVill
@pID INTEGER,
@ARAMFELV REAL=NULL,
@FESZULTS REAL=NULL,
@VEZHOSSZ REAL=NULL,
@BENYHOSSZ REAL=NULL,
@NYOMATEK REAL=NULL,
@ERZEKENY REAL=NULL,
@MUKMOD VARCHAR(3)=NULL,
@KVS REAL=NULL,
@KIMARAM REAL=NULL,
@FOGYMERHELY VARCHAR(50)=NULL,
@KIMENET VARCHAR(2)=NULL,
@CSATLMERET REAL=NULL,
@MEDDTELJ REAL=NULL,
@KISMEGSZAK REAL=NULL,
@LEKVILLTELJ REAL=NULL,
@VILLCSUCSNY REAL=NULL,
@VILLCSUCST REAL=NULL,
@VILLFORDSZ REAL=NULL,
@TELJT REAL=NULL
AS
DECLARE @pOBJTIP AS VARCHAR(2)
SELECT
 @pOBJTIP = OBJTIP
FROM
 OBJEKTUM
WHERE
 ID = @pID
/*IF @pOBJTIP = '01'
UPDATE EPULET
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
ELSE IF @pOBJTIP = '02'
UPDATE LAKAS
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
ELSE*/ IF @pOBJTIP = '03'
BEGIN
UPDATE FUTOMU
SET
 VILLCSUCSNY = @VILLCSUCSNY,
 VILLCSUCST = @VILLCSUCST
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '04'
BEGIN
UPDATE KAZAN
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '05'
BEGIN
UPDATE KAZANEGO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '06'
BEGIN
UPDATE SZIVATTYU
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '07'
BEGIN
UPDATE HOCSERELO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '08'
BEGIN
UPDATE VENTILLATOR
SET
 ARAMFELV = @ARAMFELV,
 FESZULTS = @FESZULTS
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '09'
BEGIN
UPDATE BOYLER
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '10'
BEGIN
UPDATE MELEGVIZ_TAROLO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '11'
BEGIN
UPDATE TARTALY
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '12'
BEGIN
UPDATE SZUROK
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP='13'
BEGIN
UPDATE VIZLAGYITO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '14'
BEGIN
UPDATE KOMPRESSZOR
SET
 ARAMFELV = @ARAMFELV,
 FESZULTS = @FESZULTS
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '15'
BEGIN
UPDATE TERMELO_CSO
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '16'
BEGIN
UPDATE DEMAG_EMELOGEP
SET
 ARAMFELV = @ARAMFELV,
 FESZULTS = @FESZULTS
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '17'
BEGIN
UPDATE HOKOZPONT
SET
 FOGYMERHELY = @FOGYMERHELY,
 KISMEGSZAK = @KISMEGSZAK,
 LEKVILLTELJ = @LEKVILLTELJ
WHERE
 ID = @pID
END

ELSE IF @pOBJTIP = '18'
BEGIN
	UPDATE HOOSSZEGZO
SET
	FESZULTS = @FESZULTS
WHERE
	ID = @pID
END

/*ELSE IF @pOBJTIP = '19'
BEGIN
UPDATE VIZORA
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '20'
BEGIN
	UPDATE
		ERZEKELO
	SET
		VEZHOSSZ = @VEZHOSSZ,
		BENYHOSSZ = @BENYHOSSZ,
		KIMENET = @KIMENET,
		CSATLMERET = @CSATLMERET
	WHERE
		ID = @pID
END
/*ELSE IF @pOBJTIP = '21'
BEGIN
UPDATE FOKAPCSOLO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '22'
BEGIN
UPDATE FAZISJAVITO_KONDENZATOR
SET
 MEDDTELJ = @MEDDTELJ
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '23'
BEGIN
UPDATE GAZVESZELY_JELZO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '24'
BEGIN
UPDATE MOTOR
SET
	ARAMFELV = @ARAMFELV,
	FESZULTS = @FESZULTS,
	VILLFORDSZ = @VILLFORDSZ,
	TELJT = @TELJT
WHERE
	ID = @pID
END
/*ELSE IF @pOBJTIP = '25'
BEGIN
UPDATE SZINTKAPCSOLO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '26'
BEGIN
UPDATE SZABALYOZO_AUTOMATIKA
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '27'
BEGIN
UPDATE SZABALYOZO_SZELEP
SET
 MUKMOD = @MUKMOD,
 KVS = @KVS
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '28'
BEGIN
UPDATE BIZTONSAGI_SZELEP
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '29'
BEGIN
UPDATE FREKVENCIAVALTO
SET
 KIMARAM = @KIMARAM
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '30'
BEGIN
UPDATE ARAMKOR
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '31'
BEGIN
UPDATE KOLTSEGMEGOSZTO
SET
 VALAMI = @VALAMI 
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '32'
BEGIN
UPDATE TARCSA
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
ELSE IF @pOBJTIP = '33'
BEGIN
UPDATE HAJTOMU
SET
 ARAMFELV = @ARAMFELV,
 FESZULTS = @FESZULTS
WHERE
 ID = @pID
END
ELSE IF @pOBJTIP = '34'
BEGIN
UPDATE LANGOR
SET
 ARAMFELV = @ARAMFELV,
 FESZULTS = @FESZULTS,
 VEZHOSSZ = @VEZHOSSZ,
 BENYHOSSZ = @BENYHOSSZ,
 NYOMATEK = @NYOMATEK,
 ERZEKENY = @ERZEKENY
WHERE
 ID = @pID
END
/*ELSE IF @pOBJTIP = '35'
BEGIN
UPDATE TERMALKUT
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
/*ELSE IF @pOBJTIP = '36'
BEGIN
UPDATE SZERELVENY
SET
 VALAMI = @VALAMI
WHERE
 ID = @pID
END*/
UPDATE
 OBJEKTUM
SET
 ADATUM = GetDate(),
 AKOD = User_Name()
WHERE
 ID = @pID









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdObjVill]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_UpdRaktarAllapot
@pID INTEGER,
@pALLAPOT VARCHAR(1),
@pMEGJ VARCHAR(255)=NULL,
@pDOLG_ID INTEGER=NULL,
@pSZLEVEL_SZAM VARCHAR(20)=NULL,
@pSZLEVEL_DATUM DATETIME=NULL
AS

BEGIN TRAN

--Lementjük a jelenlegi rekordot a historyba
INSERT INTO
	RAKTHISTORY(OBJTIP,OBJID,DATUMTOL,DATUMIG,MEGJ,ALLAPOT,
		SZLEVEL_SZAM,SZLEVEL_DATUM,DOLG_ID)
SELECT
	OBJTIP,
	OBJID,
	DATUMTOL,
	GetDate(),
	@pMEGJ,
	@pALLAPOT,
	SZLEVEL_SZAM,
	SZLEVEL_DATUM,
	DOLG_ID
FROM
	RAKTAR
WHERE
	ID = @pID
	
--Csak bizonyos állapotoknál kell elmenteni a paraméterek értékét
--Egyéb állapot esetén kinullázzuk oket
IF @pALLAPOT <> 'D'
	BEGIN
	SELECT @pDOLG_ID = NULL
	END
IF @pALLAPOT <> 'E' AND @pALLAPOT <> 'J'
	BEGIN
	SELECT @pSZLEVEL_SZAM = NULL
	SELECT @pSZLEVEL_DATUM = NULL
	END

--És mehet az update
UPDATE
	RAKTAR
SET
	ALLAPOT = @pALLAPOT,
	DOLG_ID = @pDOLG_ID,
	SZLEVEL_SZAM = @pSZLEVEL_SZAM,
	SZLEVEL_DATUM = @pSZLEVEL_DATUM,
	ADATUM = GetDate(),
	AKOD = User_Name()
	/*DOLG_ID = (@pALLAPOT='D' AND DOLG_ID) OR NULL,
	SZLEVEL_SZAM  = ((@pALLAPOT='E' OR @pALLAPOT='J') AND @pSZLEVEL_SZAM) OR NULL,
	SZLEVEL_DATUM = ((@pALLAPOT='E' OR @pALLAPOT='J') AND @pSZLEVEL_DATUM) OR NULL*/
WHERE
	ID = @pID

COMMIT TRAN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdRaktarAllapot]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_UpdRaktarKepv
@pID INTEGER,
@NEV VARCHAR(50),
@CIM VARCHAR(100)=NULL,
@LAK_TEL VARCHAR(20)=NULL,
@MOB_TEL VARCHAR(20)=NULL,
@MUN_TEL VARCHAR(20)=NULL,
@MEGB_NEV VARCHAR(50),
@MEGB_LAK_TEL VARCHAR(20)=NULL,
@MEGB_MOB_TEL VARCHAR(20)=NULL,
@MEGB_MUN_TEL VARCHAR(20)=NULL
AS
UPDATE
	RAKTKEPVIS
SET
	NEV = @NEV,
	CIM = @CIM,
	LAK_TEL = @LAK_TEL,
	MOB_TEL = @MOB_TEL,
	MUN_TEL = @MUN_TEL,
	MEGB_NEV = @MEGB_NEV,
	MEGB_LAK_TEL = @MEGB_LAK_TEL,
	MEGB_MOB_TEL = @MEGB_MOB_TEL,
	MEGB_MUN_TEL = @MEGB_MUN_TEL,
	ADATUM = GetDate(),
	AKOD = User_name()
WHERE
	ID = @pID


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdRaktarKepv]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sp_UpdRaktarObj
@KEPVIS INTEGER=NULL,
@KULCS INTEGER=NULL,

@H_ID INTEGER=NULL,
@H_IMPULZUS REAL=NULL,
@H_LEOLV VARCHAR(2)=NULL,
@H_HELYZET VARCHAR(2)=NULL,
@H_ELEKTRONIKA VARCHAR(2)=NULL,
@H_PLOMBA VARCHAR(12)=NULL,
@H_ELHELYEZ VARCHAR(25)=NULL,
@H_TULAJDON VARCHAR(1)=NULL,
@H_KULCS VARCHAR(50)=NULL,
@H_KULCS_LAKTEL VARCHAR(20)=NULL,
@H_KULCS_MOBTEL VARCHAR(20)=NULL,
@H_KULCS_MUNTEL VARCHAR(20)=NULL,
--@H_MEGJ VARCHAR(255)=NULL,

@V_ID INTEGER=NULL,
@V_IMPULZUS REAL=NULL,
@V_ATMERO REAL=NULL,
@V_TOMEGARAM REAL=NULL,
@V_PLOMBA VARCHAR(12)=NULL,
@V_ELHELYEZ VARCHAR(25)=NULL,
@V_TULAJDON VARCHAR(1)=NULL,
@V_KULCS VARCHAR(50)=NULL,
@V_KULCS_LAKTEL VARCHAR(20)=NULL,
@V_KULCS_MOBTEL VARCHAR(20)=NULL,
@V_KULCS_MUNTEL VARCHAR(20)=NULL,
--@V_MEGJ VARCHAR(255)=NULL,

@E_ID INTEGER=NULL,
@E_BENYHOSSZ REAL=NULL,
@E_VEZHOSSZ REAL=NULL,
@E_SZUKSHOSSZ REAL=NULL,
@E_PLOMBA VARCHAR(12)=NULL,
@E_PLOMBA2 VARCHAR(12)=NULL,
@E_ELHELYEZ VARCHAR(25)=NULL,
@E_TULAJDON VARCHAR(1)=NULL,
@E_KULCS VARCHAR(50)=NULL,
@E_KULCS_LAKTEL VARCHAR(20)=NULL,
@E_KULCS_MOBTEL VARCHAR(20)=NULL,
@E_KULCS_MUNTEL VARCHAR(20)=NULL
--@E_MEGJ VARCHAR(255)=NULL
AS

BEGIN TRAN

UPDATE
	HOOSSZEGZO
SET
	IMPULZUS = @H_IMPULZUS,
	LEOLVMOD = @H_LEOLV,
	HELYZET = @H_HELYZET,
	ELEKTRONIKA = @H_ELEKTRONIKA,
	PLOMBA = @H_PLOMBA
WHERE
	ID = @H_ID

UPDATE
	OBJEKTUM
SET
	ELHELYEZ = @H_ELHELYEZ,
	TULAJDON = @H_TULAJDON--,
--	MEGJ = @H_MEGJ
WHERE
	ID = @H_ID

UPDATE
	RAKTAR
SET
	KEPVIS = @KEPVIS,
	KULCS = @H_KULCS,
	KULCS_LAKTEL = @H_KULCS_LAKTEL,
	KULCS_MOBTEL = @H_KULCS_MOBTEL,
	KULCS_MUNTEL = @H_KULCS_MUNTEL
WHERE
	OBJID = @H_ID
	
--------------------------------------------------------------	
UPDATE
	VIZORA
SET
	IMPULZUS = @V_IMPULZUS,
	ATMERO = @V_ATMERO,
	TOMEGARAM = @V_TOMEGARAM,
	PLOMBA = @V_PLOMBA
WHERE
	ID = @V_ID
		
UPDATE
	OBJEKTUM
SET
	ELHELYEZ = @V_ELHELYEZ,
	TULAJDON = @V_TULAJDON--,
--	MEGJ = @V_MEGJ
WHERE
	ID = @V_ID
	
UPDATE
	RAKTAR
SET
	KEPVIS = @KEPVIS,
	KULCS = @V_KULCS,
	KULCS_LAKTEL = @V_KULCS_LAKTEL,
	KULCS_MOBTEL = @V_KULCS_MOBTEL,
	KULCS_MUNTEL = @V_KULCS_MUNTEL
WHERE
	OBJID = @V_ID
	
--------------------------------------------------------------	
	
UPDATE
	ERZEKELO
SET
	BENYHOSSZ = @E_BENYHOSSZ,
	VEZHOSSZ = @E_VEZHOSSZ,
	SZUKSHOSSZ = @E_SZUKSHOSSZ,
	PLOMBA = @E_PLOMBA,
	PLOMBA2 = @E_PLOMBA2
WHERE
	ID = @E_ID
		
UPDATE
	OBJEKTUM
SET
	ELHELYEZ = @E_ELHELYEZ,
	TULAJDON = @E_TULAJDON--,
--	MEGJ = @E_MEGJ
WHERE
	ID = @E_ID

UPDATE
	RAKTAR
SET
	KEPVIS = @KEPVIS,
	KULCS = @E_KULCS,
	KULCS_LAKTEL = @E_KULCS_LAKTEL,
	KULCS_MOBTEL = @E_KULCS_MOBTEL,
	KULCS_MUNTEL = @E_KULCS_MUNTEL
WHERE
	OBJID = @E_ID
	
--------------------------------------------------------------	
	
COMMIT TRAN



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdRaktarObj]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO












/****** Object:  Stored Procedure dbo.sp_UpdSzerzfej    Script Date: 2000. 07. 04. 18:56:29 ******/
CREATE PROCEDURE sp_UpdSzerzfej
@pID INTEGER,
@PAZ VARCHAR(8),
@SZETIP VARCHAR(1),
@SZEJEL VARCHAR(2),
@SZEKELT DATETIME,
@ERVDAT DATETIME,
@FIZMOD VARCHAR(1),
@SZERTAR VARCHAR(1024),
@SZOLG VARCHAR(2),
@BEFDAT DATETIME,
@SZERSZ VARCHAR(8),
@SZLA_CIKL INTEGER,
@JEL VARCHAR(1),
@SZJ VARCHAR(12),
@UGYFN VARCHAR(100),
@UGYFC VARCHAR(100),
@KEPVIS INTEGER=NULL,
@KEZDATUM DATETIME=NULL,
@BEFDATUM DATETIME=NULL
AS
BEGIN TRAN

DECLARE @ARVALT_ID INTEGER
DECLARE @PREV_DATE DATETIME	-- Elozo nettó ár felvitelének idopontja
-- Adott szolgáltatás alatt mi volt utoljára felvive
SELECT @PREV_DATE = MAX(ERVDAT) FROM ARVALT WHERE SZOLG = @SZOLG
-- Ahhoz a dátumhoz tartozó id
SELECT @ARVALT_ID = ID FROM ARVALT WHERE ERVDAT = @PREV_DATE AND SZOLG = @SZOLG

UPDATE
	SZERZFEJ
SET
	PAZ = @PAZ,
	SZETIP = @SZETIP,
	SZEJEL = @SZEJEL,
	SZEKELT = @SZEKELT,
	ERVDAT = @ERVDAT,
	FIZMOD = @FIZMOD,
	SZERTAR = @SZERTAR,
	SZOLG = @ARVALT_ID,
	BEFDAT = @BEFDAT,
	SZERSZ = @SZERSZ,
	SZLA_CIKL = @SZLA_CIKL,
	JEL = @JEL,
	SZJ = @SZJ,
	UGYFN = @UGYFN,
	UGYFC = @UGYFC
WHERE
	ID = @pID

IF @KEPVIS IS NOT NULL
	BEGIN
	IF EXISTS(SELECT KEPVIS_ID FROM KEPV_TET WHERE SZERZ_ID = @pID AND KEPVIS_ID = @KEPVIS)
		BEGIN
		UPDATE
			KEPV_TET
		SET
			BEFDATUM = @BEFDATUM
		WHERE
			SZERZ_ID = @pID
			AND KEPVIS_ID = @KEPVIS
		END
	ELSE
		BEGIN
		INSERT INTO
			KEPV_TET(SZERZ_ID,KEPVIS_ID,PAZ,KEZDATUM)
		SELECT
			@pID,
			@KEPVIS,
			@PAZ,
			@KEZDATUM
		END
	END
	
COMMIT TRAN










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdSzerzfej]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE PROCEDURE sp_UpdSzlaEgyedi
@pID INTEGER,
@SZERZSZ VARCHAR(8) = NULL,
@FIZMOD VARCHAR(1),
@TDAT DATETIME,
@KDAT DATETIME,
@FDAT DATETIME,
@JEL VARCHAR(1),
@SZJ VARCHAR(12) = NULL,
@SZERTAR VARCHAR(1024) = NULL,
@UGYFN VARCHAR(100) = NULL,
@UGYFC VARCHAR(100) = NULL
AS

UPDATE SZLA_ALT
SET
	SZERZSZ = @SZERZSZ,
	FIZMOD = @FIZMOD,
	TDAT = @TDAT,
	KDAT = @KDAT,
	FDAT = @FDAT,
	JEL = @JEL,
	SZJ = @SZJ,
	SZERTAR = @SZERTAR,
	UGYFN = @UGYFN,
	UGYFC = @UGYFC
WHERE
	ID = @pID







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdSzlaEgyedi]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.sp_WriteKapcsTab    Script Date: 2000. 07. 04. 18:56:29 ******/
CREATE PROCEDURE sp_WriteKapcsTab
@pID INTEGER,
@pOBJTIP VARCHAR(2)=NULL
AS

INSERT INTO
	KAPCSTAB
EXEC
	sp_GetKapcs @pID, @pOBJTIP
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_WriteKapcsTab]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
Feltolti a munkalap nyomtatasahoz hasznalt MLAPTAB tablat
az eppen nyomtatni kivant munkalap adataival.
*/

CREATE PROCEDURE sp_WriteMlapTab
@pMTIP VARCHAR(1),
@pID INTEGER
AS

--Lekérdezzük, hogy a munkalaphoz kapcsolt objektum milyen típusú
--és mi az ID-je
DECLARE @OBJTIP VARCHAR(2)
DECLARE @OBJID INT

SELECT
	@OBJTIP = OBJEKTUM.OBJTIP,
	@OBJID = OBJEKTUM.ID
FROM
	OBJEKTUM INNER JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID
WHERE
	MUNKALAP.ID = @pID

DECLARE @OBJNEV VARCHAR(200)	

--Melyik futomu alá van bekapcsolva az objektum?
DECLARE @FUTOMU_ID INT
DECLARE @FUTOMU_NEV VARCHAR(100)
EXEC @FUTOMU_ID = sp_Rekurziv @OBJID
SELECT @FUTOMU_NEV = MEGNEV FROM OBJEKTUM WHERE	ID = @FUTOMU_ID


IF @OBJTIP = '01'	--Ha épület, akkor utca+hsz kerül a munkalapra
BEGIN
SELECT @OBJNEV = UTCA + ' ' + HSZ + ' ' + coalesce(LAKAS, ' ') FROM OBJEKTUM INNER JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID WHERE MUNKALAP.ID = @pID
END
ELSE IF @OBJTIP = '02'	--Ha lakás, akkor a lépcsoház,emelet,ajtó is
BEGIN
SELECT @OBJNEV = UTCA + ' ' + HSZ + ' ' + LEPCS + ' lh.' + EM + ' em.' + AJTO + ' ajtó' FROM LAKAS INNER JOIN OBJEKTUM INNER JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID ON LAKAS.ID = OBJEKTUM.ID WHERE MUNKALAP.ID = @pID
END
ELSE IF @OBJTIP = '37'	--Ha lépcsoház, akkor a lépcsoház,emelet,ajtó is
BEGIN
SELECT @OBJNEV = CIM + ' ' + coalesce(LAKAS, ' ') FROM LEPCSOHAZ INNER JOIN MUNKALAP ON LEPCSOHAZ.ID = MUNKALAP.OBJID WHERE MUNKALAP.ID = @pID
END
ELSE	--Egyébként pedig a név, típus, gyári szám, telepítési helyszám
BEGIN
	SELECT @OBJNEV = coalesce(MEGNEV,'-') + CHAR(32) + CHAR(32) + CHAR(32)
			+ coalesce(TIPUS,'-') + CHAR(32) + CHAR(32) + CHAR(32)
			+ coalesce(TELEPHSZ,'-') + CHAR(32) + CHAR(32) + CHAR(32)
			+ coalesce(GYSZAM,'-') FROM OBJEKTUM INNER JOIN MUNKALAP ON OBJEKTUM.ID = MUNKALAP.OBJID WHERE MUNKALAP.ID = @pID

	DECLARE @HELY_ID INT
	DECLARE @HELY_NEV VARCHAR(100)
	EXEC @HELY_ID = sp_Rekurziv @OBJID, '01' --Épület
	IF @HELY_ID IS NULL --Ha nem talált hozzá épületet, akkor lépcsoházat keres
	BEGIN
		EXEC @HELY_ID = sp_Rekurziv @OBJID, '37' --Lépcsoház
	END
	
	SELECT @HELY_NEV = COALESCE(UTCA,'?') + COALESCE(HSZ,'?') FROM OBJEKTUM WHERE ID = @HELY_ID

	SELECT @OBJNEV = @OBJNEV + ' ' + COALESCE(@HELY_NEV,'-')
END

/*	Ez akkor muködne csak, ha a sysadmin csoport tagja hívja meg...
TRUNCATE TABLE MLAPTAB
*/
DELETE FROM MLAPTAB

IF @pMTIP = '1'
BEGIN
INSERT INTO
	MLAPTAB(ID,SORSZ,KIALLDAT,BEJDAT,BEJNEV,UTCA,LAKAS,FSZAM,HIBLEIR,MUNELV,IDOTOL,IDOIG,SZOLGJELL,MFDOLG)
SELECT
	MUNKALAP.ID,
	SORSZ,
	KIALLDAT,
	BEJDAT,
	BEJNEV,
	@OBJNEV AS UTCA,
	' ',
	MUNKALAP.FSZAM,
	HIBLEIR,
	MUNELV,
	IDOTOL,
	IDOIG,
	SZOLGJELL,
	DOLGOZO.NEV
FROM
	DOLGOZO RIGHT JOIN
		(MUNKALAP LEFT OUTER JOIN OBJEKTUM ON OBJEKTUM.ID = MUNKALAP.OBJID)
	ON DOLGOZO.ID = MUNKALAP.MFDOLG
WHERE
	MUNKALAP.ID = @pID
END
ELSE
BEGIN
INSERT INTO
	MLAPTAB(ID,SORSZ,KIALLDAT,BEJDAT,BEJNEV,UTCA,LAKAS,FSZAM,HIBLEIR,MUNELV,IDOTOL,IDOIG,SZOLGJELL,MFDOLG)
SELECT
	MUNKALAP.ID,
	SORSZ,
	KIALLDAT,
	BEJDAT,
	BEJNEV,
	@OBJNEV AS UTCA,
	' ',
	MUNKALAP.FSZAM,
	HIBLEIR,
	MUNELV,
	IDOTOL,
	IDOIG,
	SZOLGJELL,
	DOLGOZO.NEV
FROM
	DOLGOZO RIGHT JOIN
		(MUNKALAP LEFT OUTER JOIN OBJEKTUM ON OBJEKTUM.ID = MUNKALAP.OBJID)
	ON DOLGOZO.ID = MUNKALAP.MFDOLG
WHERE
	MUNKALAP.ID = @pID
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_WriteMlapTab]  TO [public]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









/****** Object:  Stored Procedure dbo.sp_Zarol    Script Date: 2000. 07. 04. 18:56:29 ******/
CREATE PROCEDURE sp_Zarol
@EGYEDI INTEGER = 0
AS
UPDATE
	SZLA_ALT
SET
	ZAROLT = 1
WHERE
	EGYEDI = @EGYEDI







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[sp_Zarol]  TO [public]
GO

