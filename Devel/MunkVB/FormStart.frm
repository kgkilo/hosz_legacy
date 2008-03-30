VERSION 5.00
Begin VB.Form FormStart 
   Caption         =   "Szegedi Hõszolgáltató Kft."
   ClientHeight    =   4875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8085
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   Moveable        =   0   'False
   ScaleHeight     =   4875
   ScaleWidth      =   8085
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdRAKTAR 
      Caption         =   "Raktár"
      Height          =   645
      Left            =   1305
      TabIndex        =   2
      Top             =   2527
      Visible         =   0   'False
      Width           =   1800
   End
   Begin VB.CommandButton cmdJEGYZ 
      Caption         =   "Jegyzõkönyvek"
      Height          =   645
      Left            =   4980
      TabIndex        =   1
      Top             =   1702
      Width           =   1800
   End
   Begin VB.CommandButton cmdMunkalap 
      Caption         =   "Munkalapok"
      Height          =   645
      Left            =   1305
      TabIndex        =   0
      Top             =   1702
      Width           =   1800
   End
   Begin VB.Label lblFormel 
      Alignment       =   2  'Center
      Caption         =   "(C) 2000-2008 Formel Kft."
      Height          =   255
      Left            =   1035
      TabIndex        =   3
      Top             =   4560
      Width           =   6015
   End
End
Attribute VB_Name = "FormStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' $Id$

Private Sub cmdJEGYZ_Click()
    Form003.Show 1
End Sub

Private Sub cmdMunkalap_Click()
    Form001.Show 1
End Sub

Private Sub cmdRAKTAR_Click()
    Form004.Show 1
End Sub
