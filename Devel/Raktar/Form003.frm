VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form003 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Berendezések adatai"
   ClientHeight    =   7290
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
   ScaleHeight     =   7290
   ScaleWidth      =   11910
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdKEPV 
      Caption         =   "Új/Módosít"
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
      Left            =   5880
      TabIndex        =   56
      ToolTipText     =   "F 5"
      Top             =   6795
      Width           =   1135
   End
   Begin VB.TextBox txtMEGB_MUN_TEL 
      Enabled         =   0   'False
      Height          =   330
      Left            =   9975
      TabIndex        =   53
      Top             =   6300
      Width           =   1065
   End
   Begin VB.TextBox txtMEGB_MOB_TEL 
      Enabled         =   0   'False
      Height          =   330
      Left            =   8820
      TabIndex        =   52
      Top             =   6300
      Width           =   1065
   End
   Begin VB.TextBox txtMEGB_LAK_TEL 
      Enabled         =   0   'False
      Height          =   330
      Left            =   7655
      TabIndex        =   51
      Top             =   6300
      Width           =   1065
   End
   Begin VB.TextBox txtMEGB_NEV 
      Enabled         =   0   'False
      Height          =   330
      Left            =   7655
      TabIndex        =   50
      Top             =   5250
      Width           =   3375
   End
   Begin VB.TextBox txtMUN_TEL 
      Enabled         =   0   'False
      Height          =   330
      Left            =   4410
      TabIndex        =   49
      Top             =   6300
      Width           =   1065
   End
   Begin VB.TextBox txtMOB_TEL 
      Enabled         =   0   'False
      Height          =   330
      Left            =   3255
      TabIndex        =   48
      Top             =   6300
      Width           =   1065
   End
   Begin VB.TextBox txtLAK_TEL 
      Enabled         =   0   'False
      Height          =   330
      Left            =   2140
      TabIndex        =   47
      Top             =   6300
      Width           =   1065
   End
   Begin VB.TextBox txtCIM 
      Enabled         =   0   'False
      Height          =   330
      Left            =   2140
      TabIndex        =   46
      Top             =   5670
      Width           =   3375
   End
   Begin TabDlg.SSTab TabForm03 
      Height          =   5160
      Left            =   105
      TabIndex        =   0
      Top             =   0
      Width           =   11775
      _ExtentX        =   20770
      _ExtentY        =   9102
      _Version        =   393216
      TabHeight       =   520
      TabCaption(0)   =   "Hõösszegzõ"
      TabPicture(0)   =   "Form003.frx":0000
      Tab(0).ControlEnabled=   -1  'True
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
      Tab(0).Control(11)=   "lblH_KULCS_TEL"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "lbH_TULAJDON"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "Label4"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "Label5"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "Label6"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "txtH_GYSZAM"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "txtH_TIPUS"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "txtH_HITIDO"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "Text1txtH_ELHELYEZ"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "txtH_IMPULZUS"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "cmbH_LEOLV"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "txtH_PLOMBA"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).Control(23)=   "cmbH_ELEKTRONIKA"
      Tab(0).Control(23).Enabled=   0   'False
      Tab(0).Control(24)=   "cmbH_HELYZET"
      Tab(0).Control(24).Enabled=   0   'False
      Tab(0).Control(25)=   "txtH_MEGJ"
      Tab(0).Control(25).Enabled=   0   'False
      Tab(0).Control(26)=   "txtH_ID"
      Tab(0).Control(26).Enabled=   0   'False
      Tab(0).Control(27)=   "txtH_KULCS"
      Tab(0).Control(27).Enabled=   0   'False
      Tab(0).Control(28)=   "txtH_KULCS_LAKTEL"
      Tab(0).Control(28).Enabled=   0   'False
      Tab(0).Control(29)=   "txtH_KULCS_MOBTEL"
      Tab(0).Control(29).Enabled=   0   'False
      Tab(0).Control(30)=   "txtH_KULCS_MUNTEL"
      Tab(0).Control(30).Enabled=   0   'False
      Tab(0).Control(31)=   "cmbH_TULAJDON"
      Tab(0).Control(31).Enabled=   0   'False
      Tab(0).ControlCount=   32
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
      Tab(1).Control(6)=   "lblV_MEGJ"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "lblV_GYSZAM"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "lblV_ATMERO"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "lblV_TULAJDON"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "Label7"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).Control(11)=   "lblV_KULCS"
      Tab(1).Control(11).Enabled=   0   'False
      Tab(1).Control(12)=   "Label9"
      Tab(1).Control(12).Enabled=   0   'False
      Tab(1).Control(13)=   "Label10"
      Tab(1).Control(13).Enabled=   0   'False
      Tab(1).Control(14)=   "Label11"
      Tab(1).Control(14).Enabled=   0   'False
      Tab(1).Control(15)=   "txtV_MEGJ"
      Tab(1).Control(15).Enabled=   0   'False
      Tab(1).Control(16)=   "txtV_PLOMBA"
      Tab(1).Control(16).Enabled=   0   'False
      Tab(1).Control(17)=   "txtV_IMPULZUS"
      Tab(1).Control(17).Enabled=   0   'False
      Tab(1).Control(18)=   "txtV_ELHELYEZ"
      Tab(1).Control(18).Enabled=   0   'False
      Tab(1).Control(19)=   "txtV_HITIDO"
      Tab(1).Control(19).Enabled=   0   'False
      Tab(1).Control(20)=   "txtV_TIPUS"
      Tab(1).Control(20).Enabled=   0   'False
      Tab(1).Control(21)=   "txtV_GYSZAM"
      Tab(1).Control(21).Enabled=   0   'False
      Tab(1).Control(22)=   "txtV_TOMEGARAM"
      Tab(1).Control(22).Enabled=   0   'False
      Tab(1).Control(23)=   "txtV_ATMERO"
      Tab(1).Control(23).Enabled=   0   'False
      Tab(1).Control(24)=   "txtV_ID"
      Tab(1).Control(24).Enabled=   0   'False
      Tab(1).Control(25)=   "cmbV_TULAJDON"
      Tab(1).Control(25).Enabled=   0   'False
      Tab(1).Control(26)=   "txtV_KULCS_MUNTEL"
      Tab(1).Control(26).Enabled=   0   'False
      Tab(1).Control(27)=   "txtV_KULCS_MOBTEL"
      Tab(1).Control(27).Enabled=   0   'False
      Tab(1).Control(28)=   "txtV_KULCS_LAKTEL"
      Tab(1).Control(28).Enabled=   0   'False
      Tab(1).Control(29)=   "txtV_KULCS"
      Tab(1).Control(29).Enabled=   0   'False
      Tab(1).ControlCount=   30
      TabCaption(2)   =   "Érzékelõ"
      TabPicture(2)   =   "Form003.frx":0038
      Tab(2).ControlEnabled=   0   'False
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
      Tab(2).Control(6)=   "lblE_MEGJ"
      Tab(2).Control(6).Enabled=   0   'False
      Tab(2).Control(7)=   "lblE_GYSZAM"
      Tab(2).Control(7).Enabled=   0   'False
      Tab(2).Control(8)=   "lblE_VEZHOSSZ"
      Tab(2).Control(8).Enabled=   0   'False
      Tab(2).Control(9)=   "lblE_PLOMBA"
      Tab(2).Control(9).Enabled=   0   'False
      Tab(2).Control(10)=   "lblE_TULAJDON"
      Tab(2).Control(10).Enabled=   0   'False
      Tab(2).Control(11)=   "Label12"
      Tab(2).Control(11).Enabled=   0   'False
      Tab(2).Control(12)=   "lblE_KULCS"
      Tab(2).Control(12).Enabled=   0   'False
      Tab(2).Control(13)=   "Label14"
      Tab(2).Control(13).Enabled=   0   'False
      Tab(2).Control(14)=   "Label15"
      Tab(2).Control(14).Enabled=   0   'False
      Tab(2).Control(15)=   "Label16"
      Tab(2).Control(15).Enabled=   0   'False
      Tab(2).Control(16)=   "txtE_MEGJ"
      Tab(2).Control(16).Enabled=   0   'False
      Tab(2).Control(17)=   "txtE_PLOMBA2"
      Tab(2).Control(17).Enabled=   0   'False
      Tab(2).Control(18)=   "txtE_BENYHOSSZ"
      Tab(2).Control(18).Enabled=   0   'False
      Tab(2).Control(19)=   "txtE_ELHELYEZ"
      Tab(2).Control(19).Enabled=   0   'False
      Tab(2).Control(20)=   "txtE_HITIDO"
      Tab(2).Control(20).Enabled=   0   'False
      Tab(2).Control(21)=   "txtE_TIPUS"
      Tab(2).Control(21).Enabled=   0   'False
      Tab(2).Control(22)=   "txtE_GYSZAM"
      Tab(2).Control(22).Enabled=   0   'False
      Tab(2).Control(23)=   "txtE_SZUKSHOSSZ"
      Tab(2).Control(23).Enabled=   0   'False
      Tab(2).Control(24)=   "txtE_VEZHOSSZ"
      Tab(2).Control(24).Enabled=   0   'False
      Tab(2).Control(25)=   "txtE_ID"
      Tab(2).Control(25).Enabled=   0   'False
      Tab(2).Control(26)=   "txtE_PLOMBA"
      Tab(2).Control(26).Enabled=   0   'False
      Tab(2).Control(27)=   "cmbE_TULAJDON"
      Tab(2).Control(27).Enabled=   0   'False
      Tab(2).Control(28)=   "txtE_KULCS_MUNTEL"
      Tab(2).Control(28).Enabled=   0   'False
      Tab(2).Control(29)=   "txtE_KULCS_MOBTEL"
      Tab(2).Control(29).Enabled=   0   'False
      Tab(2).Control(30)=   "txtE_KULCS_LAKTEL"
      Tab(2).Control(30).Enabled=   0   'False
      Tab(2).Control(31)=   "txtE_KULCS"
      Tab(2).Control(31).Enabled=   0   'False
      Tab(2).ControlCount=   32
      Begin VB.TextBox txtE_KULCS 
         Height          =   330
         Left            =   -69855
         TabIndex        =   40
         Top             =   525
         Width           =   2325
      End
      Begin VB.TextBox txtE_KULCS_LAKTEL 
         Height          =   330
         Left            =   -69855
         TabIndex        =   41
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtE_KULCS_MOBTEL 
         Height          =   330
         Left            =   -68700
         TabIndex        =   42
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtE_KULCS_MUNTEL 
         Height          =   330
         Left            =   -67545
         TabIndex        =   43
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtV_KULCS 
         Height          =   330
         Left            =   -69855
         TabIndex        =   25
         Top             =   525
         Width           =   2325
      End
      Begin VB.TextBox txtV_KULCS_LAKTEL 
         Height          =   330
         Left            =   -69855
         TabIndex        =   26
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtV_KULCS_MOBTEL 
         Height          =   330
         Left            =   -68700
         TabIndex        =   27
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtV_KULCS_MUNTEL 
         Height          =   330
         Left            =   -67545
         TabIndex        =   28
         Top             =   1155
         Width           =   1065
      End
      Begin VB.ComboBox cmbE_TULAJDON 
         Height          =   330
         Left            =   -73530
         TabIndex        =   39
         Tag             =   "368"
         Top             =   4515
         Width           =   2325
      End
      Begin VB.ComboBox cmbV_TULAJDON 
         Height          =   330
         Left            =   -73530
         TabIndex        =   24
         Tag             =   "368"
         Top             =   4515
         Width           =   2325
      End
      Begin VB.ComboBox cmbH_TULAJDON 
         Height          =   330
         Left            =   1470
         TabIndex        =   10
         Tag             =   "368"
         Top             =   4515
         Width           =   2325
      End
      Begin VB.TextBox txtH_KULCS_MUNTEL 
         Height          =   330
         Left            =   7455
         TabIndex        =   14
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtH_KULCS_MOBTEL 
         Height          =   330
         Left            =   6300
         TabIndex        =   13
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtH_KULCS_LAKTEL 
         Height          =   330
         Left            =   5145
         TabIndex        =   12
         Top             =   1155
         Width           =   1065
      End
      Begin VB.TextBox txtH_KULCS 
         Height          =   330
         Left            =   5145
         TabIndex        =   11
         Top             =   525
         Width           =   2325
      End
      Begin VB.TextBox txtE_PLOMBA 
         Height          =   330
         Left            =   -73530
         TabIndex        =   37
         Top             =   3675
         Width           =   2325
      End
      Begin VB.TextBox txtE_ID 
         Height          =   315
         Left            =   -64605
         TabIndex        =   88
         TabStop         =   0   'False
         Top             =   105
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.TextBox txtE_VEZHOSSZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   35
         Top             =   2835
         Width           =   2325
      End
      Begin VB.TextBox txtE_SZUKSHOSSZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   36
         Top             =   3255
         Width           =   2325
      End
      Begin VB.TextBox txtE_GYSZAM 
         Height          =   330
         Left            =   -73530
         TabIndex        =   30
         Top             =   525
         Width           =   2325
      End
      Begin VB.TextBox txtE_TIPUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   31
         Top             =   945
         Width           =   2325
      End
      Begin VB.TextBox txtE_HITIDO 
         Height          =   330
         Left            =   -73530
         TabIndex        =   32
         Top             =   1365
         Width           =   2325
      End
      Begin VB.TextBox txtE_ELHELYEZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   33
         Top             =   1785
         Width           =   2325
      End
      Begin VB.TextBox txtE_BENYHOSSZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   34
         Top             =   2415
         Width           =   2325
      End
      Begin VB.TextBox txtE_PLOMBA2 
         Height          =   330
         Left            =   -73530
         TabIndex        =   38
         Top             =   4095
         Width           =   2325
      End
      Begin VB.TextBox txtE_MEGJ 
         Height          =   4215
         Left            =   -66390
         MultiLine       =   -1  'True
         TabIndex        =   44
         Top             =   525
         Width           =   3060
      End
      Begin VB.TextBox txtV_ID 
         Height          =   315
         Left            =   -67755
         TabIndex        =   78
         TabStop         =   0   'False
         Top             =   105
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.TextBox txtH_ID 
         Height          =   315
         Left            =   3360
         TabIndex        =   77
         TabStop         =   0   'False
         Top             =   105
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.TextBox txtV_ATMERO 
         Height          =   330
         Left            =   -73530
         TabIndex        =   21
         Top             =   2835
         Width           =   2325
      End
      Begin VB.TextBox txtV_TOMEGARAM 
         Height          =   330
         Left            =   -73530
         TabIndex        =   22
         Top             =   3255
         Width           =   2325
      End
      Begin VB.TextBox txtV_GYSZAM 
         Height          =   330
         Left            =   -73530
         TabIndex        =   16
         Top             =   525
         Width           =   2325
      End
      Begin VB.TextBox txtV_TIPUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   17
         Top             =   945
         Width           =   2325
      End
      Begin VB.TextBox txtV_HITIDO 
         Height          =   330
         Left            =   -73530
         TabIndex        =   18
         Top             =   1365
         Width           =   2325
      End
      Begin VB.TextBox txtV_ELHELYEZ 
         Height          =   330
         Left            =   -73530
         TabIndex        =   19
         Top             =   1785
         Width           =   2325
      End
      Begin VB.TextBox txtV_IMPULZUS 
         Height          =   330
         Left            =   -73530
         TabIndex        =   20
         Top             =   2415
         Width           =   2325
      End
      Begin VB.TextBox txtV_PLOMBA 
         Height          =   330
         Left            =   -73530
         TabIndex        =   23
         Top             =   4095
         Width           =   2325
      End
      Begin VB.TextBox txtV_MEGJ 
         Height          =   4215
         Left            =   -66390
         MultiLine       =   -1  'True
         TabIndex        =   29
         Top             =   525
         Width           =   3060
      End
      Begin VB.TextBox txtH_MEGJ 
         Height          =   4215
         Left            =   8610
         MultiLine       =   -1  'True
         TabIndex        =   15
         Top             =   525
         Width           =   3060
      End
      Begin VB.ComboBox cmbH_HELYZET 
         Height          =   330
         Left            =   1470
         TabIndex        =   7
         Tag             =   "365"
         Top             =   3255
         Width           =   2325
      End
      Begin VB.ComboBox cmbH_ELEKTRONIKA 
         Height          =   330
         Left            =   1470
         TabIndex        =   8
         Tag             =   "366"
         Top             =   3675
         Width           =   2325
      End
      Begin VB.TextBox txtH_PLOMBA 
         Height          =   330
         Left            =   1470
         TabIndex        =   9
         Top             =   4095
         Width           =   2325
      End
      Begin VB.ComboBox cmbH_LEOLV 
         Height          =   330
         Left            =   1470
         TabIndex        =   6
         Tag             =   "316"
         Top             =   2835
         Width           =   2325
      End
      Begin VB.TextBox txtH_IMPULZUS 
         Height          =   330
         Left            =   1470
         TabIndex        =   5
         Top             =   2415
         Width           =   2325
      End
      Begin VB.TextBox Text1txtH_ELHELYEZ 
         Height          =   330
         Left            =   1470
         TabIndex        =   4
         Top             =   1785
         Width           =   2325
      End
      Begin VB.TextBox txtH_HITIDO 
         Height          =   330
         Left            =   1470
         TabIndex        =   3
         Top             =   1365
         Width           =   2325
      End
      Begin VB.TextBox txtH_TIPUS 
         Height          =   330
         Left            =   1470
         TabIndex        =   2
         Top             =   945
         Width           =   2325
      End
      Begin VB.TextBox txtH_GYSZAM 
         Height          =   330
         Left            =   1470
         TabIndex        =   1
         Top             =   525
         Width           =   2325
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         Caption         =   "Lakás:"
         Height          =   225
         Left            =   -69855
         TabIndex        =   117
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         Caption         =   "Mobil:"
         Height          =   225
         Left            =   -68700
         TabIndex        =   116
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         Caption         =   "Munkahely:"
         Height          =   225
         Left            =   -67545
         TabIndex        =   115
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label lblE_KULCS 
         Alignment       =   1  'Right Justify
         Caption         =   "Kulcs található:"
         Height          =   225
         Left            =   -71115
         TabIndex        =   114
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label Label12 
         Alignment       =   1  'Right Justify
         Caption         =   "Telefon:"
         Height          =   225
         Left            =   -71115
         TabIndex        =   113
         Top             =   1215
         Width           =   1170
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         Caption         =   "Lakás:"
         Height          =   225
         Left            =   -69855
         TabIndex        =   112
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         Caption         =   "Mobil:"
         Height          =   225
         Left            =   -68700
         TabIndex        =   111
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         Caption         =   "Munkahely:"
         Height          =   225
         Left            =   -67545
         TabIndex        =   110
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label lblV_KULCS 
         Alignment       =   1  'Right Justify
         Caption         =   "Kulcs található:"
         Height          =   225
         Left            =   -71115
         TabIndex        =   109
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         Caption         =   "Telefon:"
         Height          =   225
         Left            =   -71115
         TabIndex        =   108
         Top             =   1215
         Width           =   1170
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "Lakás:"
         Height          =   225
         Left            =   5145
         TabIndex        =   107
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         Caption         =   "Mobil:"
         Height          =   225
         Left            =   6300
         TabIndex        =   106
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         Caption         =   "Munkahely:"
         Height          =   225
         Left            =   7455
         TabIndex        =   105
         Top             =   945
         Width           =   1065
      End
      Begin VB.Label lblE_TULAJDON 
         Alignment       =   1  'Right Justify
         Caption         =   "Tulajdon:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   104
         Top             =   4575
         Width           =   1170
      End
      Begin VB.Label lblV_TULAJDON 
         Alignment       =   1  'Right Justify
         Caption         =   "Tulajdon:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   103
         Top             =   4575
         Width           =   1170
      End
      Begin VB.Label lbH_TULAJDON 
         Alignment       =   1  'Right Justify
         Caption         =   "Tulajdon:"
         Height          =   225
         Left            =   210
         TabIndex        =   102
         Top             =   4575
         Width           =   1170
      End
      Begin VB.Label lblH_KULCS_TEL 
         Alignment       =   1  'Right Justify
         Caption         =   "Telefon:"
         Height          =   225
         Left            =   3885
         TabIndex        =   90
         Top             =   1215
         Width           =   1170
      End
      Begin VB.Label lblE_PLOMBA 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   89
         Top             =   3735
         Width           =   1170
      End
      Begin VB.Label lblE_VEZHOSSZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Vez. hossz:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   87
         Top             =   2895
         Width           =   1170
      End
      Begin VB.Label lblE_GYSZAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Gyári szám:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   86
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label lblE_MEGJ 
         Alignment       =   1  'Right Justify
         Caption         =   "Megjegyzés:"
         Height          =   225
         Left            =   -67650
         TabIndex        =   85
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label lblE_PLOMBA2 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma 2:"
         Height          =   225
         Left            =   -74895
         TabIndex        =   84
         Top             =   4155
         Width           =   1275
      End
      Begin VB.Label lblE_SZUKSHOSSZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Szüks. hossz:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   83
         Top             =   3315
         Width           =   1170
      End
      Begin VB.Label lblE_BENYHOSSZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Beny. hossz:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   82
         Top             =   2475
         Width           =   1170
      End
      Begin VB.Label lblE_ELHELYEZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Elhelyezkedés:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   81
         Top             =   1845
         Width           =   1170
      End
      Begin VB.Label lblE_HITIDO 
         Alignment       =   1  'Right Justify
         Caption         =   "Hitelesítési idõ:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   80
         Top             =   1425
         Width           =   1170
      End
      Begin VB.Label lblE_TIPUS 
         Alignment       =   1  'Right Justify
         Caption         =   "Típus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   79
         Top             =   1005
         Width           =   1170
      End
      Begin VB.Label lblV_ATMERO 
         Alignment       =   1  'Right Justify
         Caption         =   "Átmérõ:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   76
         Top             =   2895
         Width           =   1170
      End
      Begin VB.Label lblV_GYSZAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Gyári szám:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   75
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label lblV_MEGJ 
         Alignment       =   1  'Right Justify
         Caption         =   "Megjegyzés:"
         Height          =   225
         Left            =   -67650
         TabIndex        =   74
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label lblV_PLOMBA 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   73
         Top             =   4155
         Width           =   1170
      End
      Begin VB.Label lblV_TOMEGARAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Tömegáram:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   72
         Top             =   3315
         Width           =   1170
      End
      Begin VB.Label lblV_IMPULZUS 
         Alignment       =   1  'Right Justify
         Caption         =   "l / impulzus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   71
         Top             =   2475
         Width           =   1170
      End
      Begin VB.Label lblV_ELHELYEZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Elhelyezkedés:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   70
         Top             =   1845
         Width           =   1170
      End
      Begin VB.Label lblV_HITIDO 
         Alignment       =   1  'Right Justify
         Caption         =   "Hitelesítési idõ:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   69
         Top             =   1425
         Width           =   1170
      End
      Begin VB.Label lblV_TIPUS 
         Alignment       =   1  'Right Justify
         Caption         =   "Típus:"
         Height          =   225
         Left            =   -74790
         TabIndex        =   68
         Top             =   1005
         Width           =   1170
      End
      Begin VB.Label lblH_TIPUS 
         Alignment       =   1  'Right Justify
         Caption         =   "Típus:"
         Height          =   225
         Left            =   210
         TabIndex        =   67
         Top             =   1005
         Width           =   1170
      End
      Begin VB.Label lblH_HITIDO 
         Alignment       =   1  'Right Justify
         Caption         =   "Hitelesítési idõ:"
         Height          =   225
         Left            =   210
         TabIndex        =   66
         Top             =   1425
         Width           =   1170
      End
      Begin VB.Label lblH_ELHELYEZ 
         Alignment       =   1  'Right Justify
         Caption         =   "Elhelyezkedés:"
         Height          =   225
         Left            =   210
         TabIndex        =   65
         Top             =   1845
         Width           =   1170
      End
      Begin VB.Label lblH_IMPULZUS 
         Alignment       =   1  'Right Justify
         Caption         =   "l / impulzus:"
         Height          =   225
         Left            =   210
         TabIndex        =   64
         Top             =   2475
         Width           =   1170
      End
      Begin VB.Label lblH_LEOLV 
         Alignment       =   1  'Right Justify
         Caption         =   "Leolvasás:"
         Height          =   225
         Left            =   210
         TabIndex        =   63
         Top             =   2895
         Width           =   1170
      End
      Begin VB.Label lblH_HELYZET 
         Alignment       =   1  'Right Justify
         Caption         =   "Helyzet:"
         Height          =   225
         Left            =   210
         TabIndex        =   62
         Top             =   3315
         Width           =   1170
      End
      Begin VB.Label lblH_ELEKTRONIKA 
         Alignment       =   1  'Right Justify
         Caption         =   "Elektronika:"
         Height          =   225
         Left            =   210
         TabIndex        =   61
         Top             =   3735
         Width           =   1170
      End
      Begin VB.Label lblH_PLOMBA 
         Alignment       =   1  'Right Justify
         Caption         =   "Plomba száma:"
         Height          =   225
         Left            =   210
         TabIndex        =   60
         Top             =   4155
         Width           =   1170
      End
      Begin VB.Label lblH_KULCS 
         Alignment       =   1  'Right Justify
         Caption         =   "Kulcs található:"
         Height          =   225
         Left            =   3885
         TabIndex        =   59
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label lblH_MEGJ 
         Alignment       =   1  'Right Justify
         Caption         =   "Megjegyzés:"
         Height          =   225
         Left            =   7350
         TabIndex        =   58
         Top             =   585
         Width           =   1170
      End
      Begin VB.Label lblH_GYSZAM 
         Alignment       =   1  'Right Justify
         Caption         =   "Gyári szám:"
         Height          =   225
         Left            =   210
         TabIndex        =   57
         Top             =   585
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
      TabIndex        =   55
      ToolTipText     =   "E S C"
      Top             =   6795
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
      TabIndex        =   54
      ToolTipText     =   "F 5"
      Top             =   6795
      Width           =   1135
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Munkahely:"
      Height          =   225
      Left            =   9975
      TabIndex        =   101
      Top             =   6090
      Width           =   1065
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Mobil:"
      Height          =   225
      Left            =   8820
      TabIndex        =   100
      Top             =   6090
      Width           =   1065
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Lakás:"
      Height          =   225
      Left            =   7665
      TabIndex        =   99
      Top             =   6090
      Width           =   1065
   End
   Begin VB.Label lblKEPV_TEL3 
      Alignment       =   2  'Center
      Caption         =   "Munkahely:"
      Height          =   225
      Left            =   4410
      TabIndex        =   98
      Top             =   6090
      Width           =   1065
   End
   Begin VB.Label lblKEPV_TEL2 
      Alignment       =   2  'Center
      Caption         =   "Mobil:"
      Height          =   225
      Left            =   3255
      TabIndex        =   97
      Top             =   6090
      Width           =   1065
   End
   Begin VB.Label lblKEPV_TEL1 
      Alignment       =   2  'Center
      Caption         =   "Lakás:"
      Height          =   225
      Left            =   2140
      TabIndex        =   96
      Top             =   6090
      Width           =   1065
   End
   Begin VB.Label lblMEGB_TEL 
      Alignment       =   1  'Right Justify
      Caption         =   "Telefon:"
      Height          =   225
      Left            =   6485
      TabIndex        =   95
      Top             =   6360
      Width           =   1170
   End
   Begin VB.Label lblKEPVIS_TEL 
      Alignment       =   1  'Right Justify
      Caption         =   "Telefon:"
      Height          =   225
      Left            =   970
      TabIndex        =   94
      Top             =   6360
      Width           =   1170
   End
   Begin VB.Label lblMEGB 
      Alignment       =   1  'Right Justify
      Caption         =   "Megbízott:"
      Height          =   225
      Left            =   6485
      TabIndex        =   93
      Top             =   5310
      Width           =   1170
   End
   Begin MSForms.ComboBox cmbKEPVIS 
      Height          =   330
      Left            =   2140
      TabIndex        =   45
      Tag             =   "KEPVIS"
      Top             =   5250
      Width           =   3375
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5953;582"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label lblCIM 
      Alignment       =   1  'Right Justify
      Caption         =   "Cím:"
      Height          =   225
      Left            =   970
      TabIndex        =   92
      Top             =   5730
      Width           =   1170
   End
   Begin VB.Label lblKEPVIS 
      Alignment       =   1  'Right Justify
      Caption         =   "Közös képv.:"
      Height          =   225
      Left            =   970
      TabIndex        =   91
      Top             =   5310
      Width           =   1170
   End
End
Attribute VB_Name = "Form003"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public lOBJID As Integer
Public iRet As Integer

Private Sub cmbKEPVIS_Change()
    If cmbKEPVIS.ListIndex <> -1 Then
        util.Load Me, util.getComboErtek(cmbKEPVIS), "KEP"
    End If
End Sub

Private Sub cmdCLOSE_Click()
    Unload Me
End Sub

Private Sub cmdKEPV_Click()
    If cmbKEPVIS.ListIndex <> -1 Then
        Form004.lKEPVID = util.getComboErtek(cmbKEPVIS)
    Else
        Form004.lKEPVID = 0
    End If
    
    Form004.Show vbModal
    
    If iRet = vbOK Then
        Screen.MousePointer = vbHourglass
        util.RefreshCombo Form003.cmbKEPVIS
        util.setCombo Form003
        txtCIM = ""
        txtLAK_TEL = ""
        txtMOB_TEL = ""
        txtMUN_TEL = ""
        txtMEGB_NEV = ""
        txtMEGB_LAK_TEL = ""
        txtMEGB_MOB_TEL = ""
        txtMEGB_MUN_TEL = ""
        Screen.MousePointer = vbDefault
    End If
End Sub

Private Sub cmdOK_Click()
    Screen.MousePointer = vbHourglass
    util.Save Me, "BER"
    Screen.MousePointer = vbDefault
    Unload Me
End Sub

Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    util.setCombo Me
    If lOBJID > 0 Then
        util.Load Me, lOBJID, "BER"
    End If
    Screen.MousePointer = vbDefault
End Sub
