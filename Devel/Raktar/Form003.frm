VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form003 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5730
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11910
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5730
   ScaleWidth      =   11910
   StartUpPosition =   1  'CenterOwner
   Begin TabDlg.SSTab TabForm03 
      Height          =   5160
      Left            =   105
      TabIndex        =   0
      Top             =   0
      Width           =   11775
      _ExtentX        =   20770
      _ExtentY        =   9102
      _Version        =   393216
      Tab             =   2
      TabHeight       =   520
      TabCaption(0)   =   "Hõösszegzõ"
      TabPicture(0)   =   "Form003.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "lblH_GYSZAM"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "lblH_MEGJ"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "lblH_KULCS"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "lblH_PLOMBA"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "lblH_ELEKTRONIKA"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "lblH_HELYZET"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "lblH_LEOLV"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "lblH_IMPULZUS"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "lblH_ELHELYEZ"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "lblH_HITIDO"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "lblH_TIPUS"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "txtH_GYSZAM"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "txtH_TIPUS"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "txtH_HITIDO"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "Text1txtH_ELHELYEZ"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "txtH_IMPULZUS"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "cmbH_LEOLV"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "cmbH_KULCS"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "txtH_PLOMBA"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "cmbH_ELEKTRONIIKA"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "cmbH_HELYZET"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "txtH_MEGJ"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "txtH_ID"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).ControlCount=   23
      TabCaption(1)   =   "Vízmérõ"
      TabPicture(1)   =   "Form003.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "lblV_TIPUS"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "lblV_HITIDO"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "lblV_ELHELYEZ"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "lblV_IMPULZUS"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "lblV_TOMEGARAM"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "lblV_PLOMBA"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "lblV_KULCS"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "lblV_MEGJ"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "lblV_GYSZAM"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "lblV_ATMERO"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "txtV_MEGJ"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).Control(11)=   "txtV_PLOMBA"
      Tab(1).Control(11).Enabled=   0   'False
      Tab(1).Control(12)=   "cmbV_KULCS"
      Tab(1).Control(12).Enabled=   0   'False
      Tab(1).Control(13)=   "txtV_IMPULZUS"
      Tab(1).Control(13).Enabled=   0   'False
      Tab(1).Control(14)=   "txtV_ELHELYEZ"
      Tab(1).Control(14).Enabled=   0   'False
      Tab(1).Control(15)=   "txtV_HITIDO"
      Tab(1).Control(15).Enabled=   0   'False
      Tab(1).Control(16)=   "txtV_TIPUS"
      Tab(1).Control(16).Enabled=   0   'False
      Tab(1).Control(17)=   "txtV_GYSZAM"
      Tab(1).Control(17).Enabled=   0   'False
      Tab(1).Control(18)=   "txtV_TOMEGARAM"
      Tab(1).Control(18).Enabled=   0   'False
      Tab(1).Control(19)=   "txtV_ATMERO"
      Tab(1).Control(19).Enabled=   0   'False
      Tab(1).Control(20)=   "txtV_ID"
      Tab(1).Control(20).Enabled=   0   'False
      Tab(1).ControlCount=   21
      TabCaption(2)   =   "Érzékelõ"
      TabPicture(2)   =   "Form003.frx":0038
      Tab(2).ControlEnabled=   -1  'True
      Tab(2).Control(0)=   "lblE_TIPUS"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).Control(1)=   "lblE_HITIDO"
      Tab(2).Control(1).Enabled=   0   'False
      Tab(2).Control(2)=   "lblE_ELHELYEZ"
      Tab(2).Control(2).Enabled=   0   'False
      Tab(2).Control(3)=   "lblE_BENYHOSSZ"
      Tab(2).Control(3).Enabled=   0   'False
      Tab(2).Control(4)=   "lblE_SZUKSHOSSZ"
      Tab(2).Control(4).Enabled=   0   'False
      Tab(2).Control(5)=   "lblE_PLOMBA2"
      Tab(2).Control(5).Enabled=   0   'False
      Tab(2).Control(6)=   "lblE_KULCS"
      Tab(2).Control(6).Enabled=   0   'False
      Tab(2).Control(7)=   "lblE_MEGJ"
      Tab(2).Control(7).Enabled=   0   'False
      Tab(2).Control(8)=   "lblE_GYSZAM"
      Tab(2).Control(8).Enabled=   0   'False
      Tab(2).Control(9)=   "lblE_VEZHOSSZ"
      Tab(2).Control(9).Enabled=   0   'False
      Tab(2).Control(10)=   "lblE_PLOMBA"
      Tab(2).Control(10).Enabled=   0   'False
      Tab(2).Control(11)=   "txtE_MEGJ"
      Tab(2).Control(11).Enabled=   0   'False
      Tab(2).Control(12)=   "txtE_PLOMBA2"
      Tab(2).Control(12).Enabled=   0   'False
      Tab(2).Control(13)=   "cmbE_KULCS"
      Tab(2).Control(13).Enabled=   0   'False
      Tab(2).Control(14)=   "txtE_BENYHOSSZ"
      Tab(2).Control(14).Enabled=   0   'False
      Tab(2).Control(15)=   "txtE_ELHELYEZ"
      Tab(2).Control(15).Enabled=   0   'False
      Tab(2).Control(16)=   "txtE_HITIDO"
      Tab(2).Control(16).Enabled=   0   'False
      Tab(2).Control(17)=   "txtE_TIPUS"
      Tab(2).Control(17).Enabled=   0   'False
      Tab(2).Control(18)=   "txtE_GYSZAM"
      Tab(2).Control(18).Enabled=   0   'False
      Tab(2).Control(19)=   "txtE_SZUKSHOSSZ"
      Tab(2).Control(19).Enabled=   0   'False
      Tab(2).Control(20)=   "txtE_VEZHOSSZ"
      Tab(2).Control(20).Enabled=   0   'False
      Tab(2).Control(21)=   "txtE_ID"
      Tab(2).Control(21).Enabled=   0   'False
      Tab(2).Control(22)=   "txtE_PLOMBA"
      Tab(2).Control(22).Enabled=   0   'False
      Tab(2).ControlCount=   23
      Begin VB.TextBox txtE_PLOMBA 
         Height          =   330
         Left            =   1470
         TabIndex        =   68
         Top             =   3885
         Width           =   2325
      End
      Begin VB.TextBox txtE_ID 
         Height          =   315
         Left            =   10395
         TabIndex        =   67
         TabStop         =   0   'False
         Top             =   105
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.TextBox txtE_VEZHOSSZ 
         Height          =   330
         Left            =   1470
         TabIndex        =   65
         Top             =   3045
         Width           =   2325
      End
      Begin VB.TextBox txtE_SZUKSHOSSZ 
         Height          =   330
         Left            =   1470
         TabIndex        =   64
         Top             =   3465
         Width           =   2325
      End
      Begin VB.TextBox txtE_GYSZAM 
         Height          =   330
         Left            =   1470
         TabIndex        =   54
         Top             =   735
         Width           =   2325
      End
      Begin VB.TextBox txtE_TIPUS 
         Height          =   330
         Left            =   1470
         TabIndex        =   53
         Top             =   1155
         Width           =   2325
      End
      Begin VB.TextBox txtE_HITIDO 
         Height          =   330
         Left            =   1470
         TabIndex        =   52
         Top             =   1575
         Width           =   2325
      End
      Begin VB.TextBox txtE_ELHELYEZ 
         Height          =   330
         Left            =   1470
         TabIndex        =   51
         Top             =   1995
         Width           =   2325
      End
      Begin VB.TextBox txtE_BENYHOSSZ 
         Height          =   330
         Left            =   1470
         TabIndex        =   50
         Top             =   2625
         Width           =   2325
      End
      Begin VB.ComboBox cmbE_KULCS 
         Height          =   330
         Left            =   5145
         TabIndex        =   49
         Top             =   735
         Width           =   2325
      End
      Begin VB.TextBox txtE_PLOMBA2 
         Height          =   330
         Left            =   1470
         TabIndex        =   48
         Top             =   4305
         Width           =   2325
      End
      Begin VB.TextBox txtE_MEGJ 
         Height          =   4215
         Left            =   8610
         MultiLine       =   -1  'True
         TabIndex        =   47
         Top             =   735
         Width           =   3060
      End
      Begin VB.TextBox txtV_ID 
         Height          =   315
         Left            =   -67755
         TabIndex        =   46
         TabStop         =   0   'False
         Top             =   105
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.TextBox txtH_ID 
         Height          =   315
         Left            =   -71640
         TabIndex        =   45
         TabStop         =   0   'False
         Top             =   105
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.TextBox txtV_ATMERO 
         Height          =   330
         Left            =   -73530
         TabIndex        =   17
         Top             =   3045
         Width           =   2325
      End
      Begin VB.TextBox txtV_TOMEGARAM 
         Height          =   330
         Left            =   -73530
         TabIndex        =   18
         Top             =   3465
         Width           =   2325
      End
      Begin VB.TextBox txtV_GYSZAM 
         Height          =   330
         Left            =   -73530
         TabIndex        =   12
         Top             =   735
         Width           =   2325
      End
      Begin VB.TextBox txtV_TIPUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   13
         Top             =   1155
         Width           =   2325
      End
      Begin VB.TextBox txtV_HITIDO 
         Height          =   330
         Left            =   -73530
         TabIndex        =   14
         Top             =   1575
         Width           =   2325
      End
      Begin VB.TextBox txtV_ELHELYEZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   15
         Top             =   1995
         Width           =   2325
      End
      Begin VB.TextBox txtV_IMPULZUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   16
         Top             =   2625
         Width           =   2325
      End
      Begin VB.ComboBox cmbV_KULCS 
         Height          =   330
         Left            =   -69855
         TabIndex        =   20
         Top             =   735
         Width           =   2325
      End
      Begin VB.TextBox txtV_PLOMBA 
         Height          =   330
         Left            =   -73530
         TabIndex        =   19
         Top             =   4305
         Width           =   2325
      End
      Begin VB.TextBox txtV_MEGJ 
         Height          =   4215
         Left            =   -66390
         MultiLine       =   -1  'True
         TabIndex        =   21
         Top             =   735
         Width           =   3060
      End
      Begin VB.TextBox txtH_MEGJ 
         Height          =   4215
         Left            =   -66390
         MultiLine       =   -1  'True
         TabIndex        =   11
         Top             =   735
         Width           =   3060
      End
      Begin VB.ComboBox cmbH_HELYZET 
         Height          =   330
         Left            =   -73530
         TabIndex        =   7
         Tag             =   "365"
         Top             =   3465
         Width           =   2325
      End
      Begin VB.ComboBox cmbH_ELEKTRONIIKA 
         Height          =   330
         Left            =   -73530
         TabIndex        =   8
         Tag             =   "366"
         Top             =   3885
         Width           =   2325
      End
      Begin VB.TextBox txtH_PLOMBA 
         Height          =   330
         Left            =   -73530
         TabIndex        =   9
         Top             =   4305
         Width           =   2325
      End
      Begin VB.ComboBox cmbH_KULCS 
         Height          =   330
         Left            =   -69855
         TabIndex        =   10
         Top             =   735
         Width           =   2325
      End
      Begin VB.ComboBox cmbH_LEOLV 
         Height          =   330
         Left            =   -73530
         TabIndex        =   6
         Tag             =   "316"
         Top             =   3045
         Width           =   2325
      End
      Begin VB.TextBox txtH_IMPULZUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   5
         Top             =   2625
         Width           =   2325
      End
      Begin VB.TextBox Text1txtH_ELHELYEZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   4
         Top             =   1995
         Width           =   2325
      End
      Begin VB.TextBox txtH_HITIDO 
         Height          =   330
         Left            =   -73530
         TabIndex        =   3
         Top             =   1575
         Width           =   2325
      End
      Begin VB.TextBox txtH_TIPUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   2
         Top             =   1155
         Width           =   2325
      End
      Begin VB.TextBox txtH_GYSZAM 
         Height          =   330
         Left            =   -73530
         TabIndex        =   1
         Top             =   735
         Width           =   2325
      End
      Begin VB.Label lblE_PLOMBA 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma:"
         Height          =   225
         Left            =   210
         TabIndex        =   69
         Top             =   3945
         Width           =   1170
      End
      Begin VB.Label lblE_VEZHOSSZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Vez. hossz:"
         Height          =   225
         Left            =   210
         TabIndex        =   66
         Top             =   3105
         Width           =   1170
      End
      Begin VB.Label lblE_GYSZAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Gyári szám:"
         Height          =   225
         Left            =   210
         TabIndex        =   63
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblE_MEGJ 
         Alignment       =   1  'Right Justify
         Caption         =   "Megjegyzés:"
         Height          =   225
         Left            =   7350
         TabIndex        =   62
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblE_KULCS 
         Alignment       =   1  'Right Justify
         Caption         =   "Kulcs található:"
         Height          =   225
         Left            =   3885
         TabIndex        =   61
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblE_PLOMBA2 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma 2:"
         Height          =   225
         Left            =   105
         TabIndex        =   60
         Top             =   4365
         Width           =   1275
      End
      Begin VB.Label lblE_SZUKSHOSSZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Szüks. hossz:"
         Height          =   225
         Left            =   210
         TabIndex        =   59
         Top             =   3525
         Width           =   1170
      End
      Begin VB.Label lblE_BENYHOSSZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Beny. hossz:"
         Height          =   225
         Left            =   210
         TabIndex        =   58
         Top             =   2685
         Width           =   1170
      End
      Begin VB.Label lblE_ELHELYEZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Elhelyezkedés:"
         Height          =   225
         Left            =   210
         TabIndex        =   57
         Top             =   2055
         Width           =   1170
      End
      Begin VB.Label lblE_HITIDO 
         Alignment       =   1  'Right Justify
         Caption         =   "Hitelesítési idõ:"
         Height          =   225
         Left            =   210
         TabIndex        =   56
         Top             =   1635
         Width           =   1170
      End
      Begin VB.Label lblE_TIPUS 
         Alignment       =   1  'Right Justify
         Caption         =   "Típus:"
         Height          =   225
         Left            =   210
         TabIndex        =   55
         Top             =   1215
         Width           =   1170
      End
      Begin VB.Label lblV_ATMERO 
         Alignment       =   1  'Right Justify
         Caption         =   "Átmérõ:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   44
         Top             =   3105
         Width           =   1170
      End
      Begin VB.Label lblV_GYSZAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Gyári szám:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   43
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblV_MEGJ 
         Alignment       =   1  'Right Justify
         Caption         =   "Megjegyzés:"
         Height          =   225
         Left            =   -67650
         TabIndex        =   42
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblV_KULCS 
         Alignment       =   1  'Right Justify
         Caption         =   "Kulcs található:"
         Height          =   225
         Left            =   -71115
         TabIndex        =   41
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblV_PLOMBA 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   40
         Top             =   4365
         Width           =   1170
      End
      Begin VB.Label lblV_TOMEGARAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Tömegáram:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   39
         Top             =   3525
         Width           =   1170
      End
      Begin VB.Label lblV_IMPULZUS 
         Alignment       =   1  'Right Justify
         Caption         =   "l / impulzus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   38
         Top             =   2685
         Width           =   1170
      End
      Begin VB.Label lblV_ELHELYEZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Elhelyezkedés:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   37
         Top             =   2055
         Width           =   1170
      End
      Begin VB.Label lblV_HITIDO 
         Alignment       =   1  'Right Justify
         Caption         =   "Hitelesítési idõ:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   36
         Top             =   1635
         Width           =   1170
      End
      Begin VB.Label lblV_TIPUS 
         Alignment       =   1  'Right Justify
         Caption         =   "Típus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   35
         Top             =   1215
         Width           =   1170
      End
      Begin VB.Label lblH_TIPUS 
         Alignment       =   1  'Right Justify
         Caption         =   "Típus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   34
         Top             =   1215
         Width           =   1170
      End
      Begin VB.Label lblH_HITIDO 
         Alignment       =   1  'Right Justify
         Caption         =   "Hitelesítési idõ:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   33
         Top             =   1635
         Width           =   1170
      End
      Begin VB.Label lblH_ELHELYEZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Elhelyezkedés:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   32
         Top             =   2055
         Width           =   1170
      End
      Begin VB.Label lblH_IMPULZUS 
         Alignment       =   1  'Right Justify
         Caption         =   "l / impulzus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   31
         Top             =   2685
         Width           =   1170
      End
      Begin VB.Label lblH_LEOLV 
         Alignment       =   1  'Right Justify
         Caption         =   "Leolvasás:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   30
         Top             =   3105
         Width           =   1170
      End
      Begin VB.Label lblH_HELYZET 
         Alignment       =   1  'Right Justify
         Caption         =   "Helyzet:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   29
         Top             =   3525
         Width           =   1170
      End
      Begin VB.Label lblH_ELEKTRONIKA 
         Alignment       =   1  'Right Justify
         Caption         =   "Elektronika:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   28
         Top             =   3945
         Width           =   1170
      End
      Begin VB.Label lblH_PLOMBA 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   27
         Top             =   4365
         Width           =   1170
      End
      Begin VB.Label lblH_KULCS 
         Alignment       =   1  'Right Justify
         Caption         =   "Kulcs található:"
         Height          =   225
         Left            =   -71115
         TabIndex        =   26
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblH_MEGJ 
         Alignment       =   1  'Right Justify
         Caption         =   "Megjegyzés:"
         Height          =   225
         Left            =   -67650
         TabIndex        =   25
         Top             =   795
         Width           =   1170
      End
      Begin VB.Label lblH_GYSZAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Gyári szám:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   24
         Top             =   795
         Width           =   1170
      End
   End
   Begin VB.CommandButton cmdCLOSE 
      Caption         =   "Mégsem"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   10710
      TabIndex        =   23
      ToolTipText     =   "E S C"
      Top             =   5220
      Width           =   1135
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Rendben"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   105
      TabIndex        =   22
      ToolTipText     =   "F 5"
      Top             =   5220
      Width           =   1135
   End
End
Attribute VB_Name = "Form003"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public lOBJID As Integer

Private Sub cmdCLOSE_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Screen.MousePointer = vbHourglass
    util.Save Me
    Screen.MousePointer = vbDefault
    Unload Me
End Sub

Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    util.setcombo Me
    If lOBJID > 0 Then
        util.loadinfo Me, lOBJID
    End If
    Screen.MousePointer = vbDefault
End Sub
