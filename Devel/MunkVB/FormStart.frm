VERSION 5.00
Begin VB.Form FormStart 
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
   Begin VB.CommandButton cmdJEGYZ 
      Caption         =   "Jegyzõkönyvek"
      Height          =   645
      Left            =   4980
      TabIndex        =   1
      Top             =   2115
      Width           =   1800
   End
   Begin VB.CommandButton cmdMunkalap 
      Caption         =   "Munkalapok"
      Height          =   645
      Left            =   1305
      TabIndex        =   0
      Top             =   2115
      Width           =   1800
   End
End
Attribute VB_Name = "FormStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdJEGYZ_Click()
    Form003.Show 1
End Sub

Private Sub cmdMunkalap_Click()
    Form001.Show 1
End Sub
