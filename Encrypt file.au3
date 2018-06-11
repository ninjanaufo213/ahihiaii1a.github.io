#include <GuiEdit.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Crypt.au3>
Global $pathf,$key,$newfile,$data,$newdata
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Ccrypt file by vinh dz", 611, 400, 196, 124,-1,$WS_EX_ACCEPTFILES)
GUISetBkColor(0x374D59)
$Label1 = GUICtrlCreateLabel("Drop File to here", 280, 16, 233, 20)
GUICtrlSetState(-1,$GUI_DROPACCEPTED)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlSetBkColor(-1, 0x3C3C3C)
$Label2 = GUICtrlCreateLabel("File :", 176, 16, 96, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x0B0F11)
$Label3 = GUICtrlCreateLabel("Key :", 176, 48, 97, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x282828)
$Input1 = GUICtrlCreateInput("key", 280, 48, 233, 21)
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlSetBkColor(-1, 0x3C3C3C)
$Label4 = GUICtrlCreateLabel("New File name :", 176, 80, 99, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x282828)
$Input2 = GUICtrlCreateInput("", 280, 80, 233, 21)
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlSetBkColor(-1, 0x3C3C3C)
$Pic1 = GUICtrlCreatePic("E:\hep lai\cstrike\PODADAD\8c876ed0976c074a8e7664fc21422fb0.jpg", 8, 16, 129, 113)
$Edit1 = GUICtrlCreateEdit("", 40, 168, 465, 137)
GUICtrlSetData(-1, "")
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$button1= GUICtrlCreateButton("Start",240,350,70,30)
GUICtrlSetBkColor(-1,0x000000)
GUICtrlSetColor(-1,0xffffff)
GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $GUI_EVENT_DROPPED
          if (@GUI_DropId=$Label1) Then
	      $paths=splitpath(@GUI_DragFile)
		  GUICtrlSetData($Label1,$paths)
		  $pathf=$paths
		  EndIf
		Case $button1
			$newfile=GUICtrlRead($Input2)
			$key=GUICtrlRead($Input1)
			if ($newfile="") Then
				MsgBox(0,0,"Con cặc chưa điền new file name")
			Elseif ($key="") Then
			MsgBox(0,0,"Địt mẹ cháu chưa nhập key ?? :D ??")
		    Else
			$data=StringToBinary(FileRead($pathf),$SB_UTF8)
			 $iAlgorithm = $CALG_3DES
 $g_hKey = _Crypt_DeriveKey($key, $iAlgorithm)
			$newdata=_Crypt_EncryptData($data,$g_hKey, $CALG_USERKEY)
			$open=FileOpen($newfile,1)
			FileWrite($open,BinaryToString($newdata,$SB_UTF8))
			EndIf
	EndSwitch
WEnd
Func splitpath($path)
   $split=StringSplit($path,"\")
   $length= UBound($split)
   Return $split[$length-1]
   EndFunc