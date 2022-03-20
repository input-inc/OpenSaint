#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Add_Constants=n
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
;; ----------------------------------------
;; Includes
;; ----------------------------------------
#include <file.au3>
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "RecFileListToArray.au3"
;; ----------------------------------------
;; Variables
;; ----------------------------------------
Global $Path
Global $FilterType
Global $Recursive
Global $FileListArrayReadOnly
Global $FileListArray
Global $PathListArrayReadOnly
Global $PathListArray
Global $PrefixArray
Global $TotalNumberOfFiles
Global $FormattedPrefix
Global $Suffix
Global $FolderDepth
Global $Cancel = 0
;; ----------------------------------------
;; Main GUI
;; ----------------------------------------
$MainFORM = GUICreate("Input-Inc Batch File Renamer v1.0", 546, 261, -1, -1)
$Group1 = GUICtrlCreateGroup("Folder to be run upon", 8, 16, 529, 81)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$FolderINPUT = GUICtrlCreateInput("", 16, 40, 417, 21)
$BrowseBTN = GUICtrlCreateButton("Browse", 440, 40, 91, 25)
$PartRADIO = GUICtrlCreateRadio("Part models", 16, 72, 89, 17)
GUICtrlSetState($PartRADIO, $GUI_CHECKED)
$AssmRADIO = GUICtrlCreateRadio("Assembly models", 112, 72, 113, 17)
$DrawRADIO = GUICtrlCreateRadio("Drawings", 232, 72, 81, 17)
$SubfoldersCHKBOX = GUICtrlCreateCheckbox("Include subfolders", 320, 72, 113, 17)
GUICtrlSetState($SubfoldersCHKBOX, $GUI_CHECKED)
$RunBTN = GUICtrlCreateButton("Run", 224, 112, 107, 33)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
$RemoveAllPrefixesBTN = GUICtrlCreateButton("Remove All Prefixes", 184, 160, 187, 33)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetTip(-1, "Using this will remove all prefixes from folders and files." & @CRLF & _
		"This functions irrespective of the ""Include subfolders"" option and the type of file you have selected." & @CRLF & _
		"This function is irreversible and will break assemblies, but produce a directory structure akin to the previous CAD.")
$Label1 = GUICtrlCreateLabel("This program is made to work with the Input-Inc folder structure ONLY.", 112, 216, 335, 17)
$Label2 = GUICtrlCreateLabel("Any other use is potentially dangerous to your CAD files. Use appropriately!", 104, 232, 354, 17)
GUISetState(@SW_SHOW)
;; ----------------------------------------
;; Run GUI
;; ----------------------------------------
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BrowseBTN
			$Path = FileSelectFolder("Select the top-level folder containing your CAD files.", "")
			GUICtrlSetData($FolderINPUT, $Path)
		Case $RunBTN
			ReadGUI()
			MainLoop()
		Case $RemoveAllPrefixesBTN
			ReadGUI()
			RemoveLoop()
	EndSwitch
WEnd
;; ----------------------------------------
;; ReadGUI
;; ----------------------------------------
Func ReadGUI()
	$Path = GUICtrlRead($FolderINPUT)
	If BitOR(GUICtrlRead($PartRADIO), $GUI_CHECKED) = $GUI_CHECKED Then
		$FilterType = "*.SLDPRT"
	ElseIf BitOR(GUICtrlRead($AssmRADIO), $GUI_CHECKED) = $GUI_CHECKED Then
		$FilterType = "*.SLDASM"
	ElseIf BitOR(GUICtrlRead($DrawRADIO), $GUI_CHECKED) = $GUI_CHECKED Then
		$FilterType = "*.SLDDRW"
	EndIf
	If BitOR(GUICtrlRead($SubfoldersCHKBOX), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		$Recursive = 0
	ElseIf BitOR(GUICtrlRead($SubfoldersCHKBOX), $GUI_CHECKED) = $GUI_CHECKED Then
		$Recursive = 1
	EndIf
EndFunc   ;==>ReadGUI
;; ----------------------------------------
;; MainLoop
;; ----------------------------------------
Func MainLoop()
	If Not StringInStr(FileGetAttrib($Path), "D") Then
		MsgBox(16, "Error", "This is not a valid path.")
	Else
		FormatPath()
		FindFiles()
		CreatePathListArray()
		CreateFileListArray()
		ApplyPrefix()
		CleanVariables()
	EndIf
EndFunc   ;==>MainLoop
;; ----------------------------------------
;; RemoveLoop
;; ----------------------------------------
Func RemoveLoop()
	If Not StringInStr(FileGetAttrib($Path), "D") Then
		MsgBox(16, "Error", "This is not a valid path.")
	Else
		FormatPath()
		CreateRemovalArrays("Folders")
		FindDepth()
		RemoveAllPrefixes()
		CleanVariables()
	EndIf
EndFunc   ;==>RemoveLoop
;; ----------------------------------------
;; FormatPath
;; ----------------------------------------
Func FormatPath()
	$Length = StringLen($Path)
	If Not StringInStr($Path, "\", 0, 1, $Length) Then
		$Path = $Path & "\" ;If the path does not have a trailing backslash, add one.
	EndIf
EndFunc   ;==>FormatPath
;; ----------------------------------------
;; FindFiles
;; ----------------------------------------
Func FindFiles()
	If $Recursive = 0 Then
		$FileListArrayReadOnly = _RecFileListToArray($Path, $FilterType, 1, 0, 1, 2, "", "Resources;Work-in-Progress") ;List the files of the type selected into a one-dimensional array.
	ElseIf $Recursive = 1 Then
		$FileListArrayReadOnly = _RecFileListToArray($Path, $FilterType, 0, 1, 1, 2, "", "Resources;Work-in-Progress") ;List the files of the type selected into a one-dimensional array.
	EndIf
	_ArrayDelete($FileListArrayReadOnly, 0) ;Delete the first element, it contains the number of strings returned from the above _RecFileListToArray.
	If $Recursive = 1 Then
		For $Index = UBound($FileListArrayReadOnly) - 1 To 0 Step -1
			If Not StringInStr($FileListArrayReadOnly[$Index], StringTrimLeft($FilterType, 1)) Then
				_ArrayDelete($FileListArrayReadOnly, $Index) ;If the element is not of the file type selected, delete it.
			EndIf
		Next
	EndIf
	$TotalNumberOfFiles = UBound($FileListArrayReadOnly)
	;_ArrayDisplay($FileListArrayReadOnly, $TotalNumberOfFiles)
	If $FileListArrayReadOnly = "" Then
		MsgBox(48, "Notification", "The folder you have selected does not contain any " & StringTrimLeft($FilterType, 1) & " files.")
		$Cancel = 1
	EndIf
EndFunc   ;==>FindFiles
;; ----------------------------------------
;; CreatePathListArray
;; ----------------------------------------
Func CreatePathListArray()
	If $Cancel = 0 Then
		$PathListArray = $FileListArrayReadOnly
		For $Index = 0 To $TotalNumberOfFiles - 1
			$PathListArray[$Index] = StringTrimRight($PathListArray[$Index], (StringLen($PathListArray[$Index])) - (StringInStr($PathListArray[$Index], "\", 0, -1)))
		Next
		;_ArrayDisplay($PathListArray)
	EndIf
EndFunc   ;==>CreatePathListArray
;; ----------------------------------------
;; CreateFileListArray
;; ----------------------------------------
Func CreateFileListArray()
	If $Cancel = 0 Then
		$FileListArray = $FileListArrayReadOnly
		For $Index = 0 To $TotalNumberOfFiles - 1
			If StringInStr($FileListArray[$Index], "\") Then
				$FileListArray[$Index] = StringTrimLeft($FileListArray[$Index], StringInStr($FileListArray[$Index], "\", 0, -1))
			EndIf
			If StringInStr($FileListArray[$Index], "[") And StringInStr($FileListArray[$Index], "]") Then
				$RightBracketLoc = StringInStr($FileListArray[$Index], "]", 0, -1)
				$FileListArray[$Index] = StringTrimLeft($FileListArray[$Index], $RightBracketLoc + 1)
			EndIf
		Next
		;_ArrayDisplay($FileListArray)
	EndIf
EndFunc   ;==>CreateFileListArray
;; ----------------------------------------
;; CreatePrefix
;; ----------------------------------------
Func CreatePrefix($Index)
	If $Cancel = 0 Then
		$PrefixArray = StringSplit($PathListArray[$Index], "\") ;Split the formatted path into a one dimensional array, delimited by the backslashes. It will produce the top level prefixes.
		_ArrayDelete($PrefixArray, 0) ;Delete the first element, it contains the number of strings returned from the above StringSplit.
		;_ArrayDisplay($PrefixArray)
		If $PrefixArray[UBound($PrefixArray) - 1] = "" Then
			_ArrayDelete($PrefixArray, UBound($PrefixArray) - 1) ;Delete the last element if it is empty.
		EndIf
		For $Index = UBound($PrefixArray) - 1 To 0 Step -1
			If Not StringInStr($PrefixArray[$Index], "[") And Not StringInStr($PrefixArray[$Index], "]") Then
				_ArrayDelete($PrefixArray, $Index) ;If the array element is a string that does not contain brackets, it is deleted.
			EndIf
		Next
		For $Index = 0 To UBound($PrefixArray) - 1
			$StringLength = StringLen($PrefixArray[$Index])
			$LeftBracketLoc = StringInStr($PrefixArray[$Index], "[")
			$RightBracketLoc = StringInStr($PrefixArray[$Index], "]")
			$PrefixArray[$Index] = StringTrimLeft($PrefixArray[$Index], $LeftBracketLoc) ;Remove the left bracket.
			$PrefixArray[$Index] = StringTrimRight($PrefixArray[$Index], ($StringLength - $RightBracketLoc) + 1) ;Remove the right bracket.
			If StringRegExp($PrefixArray[$Index], "\d\d\s") Then ;If the prefix contains two digits and a space... (ex: "17 ELEC")
				$Count = 0
				Do
					$PrefixArray[$Index] = StringTrimLeft($PrefixArray[$Index], $Count) ;Delete each number one by one...
					$Count += 1
				Until StringIsAlpha($PrefixArray[$Index]) ;Until the prefix is alphabetic only.
			EndIf
			$FormattedPrefix = _ArrayToString($PrefixArray, "-")
		Next
		;_ArrayDisplay($PrefixArray)
	EndIf
EndFunc   ;==>CreatePrefix
;; ----------------------------------------
;; CreateSuffix
;; ----------------------------------------
Func CreateSuffix($Index)
	;FRNT REAR L R LH RH UPR LWR INNR OUTR LONG SHRT FEML MALE SPKT
	$ParenthesesText = StringTrimRight(StringTrimLeft($FileListArray[$Index], StringInStr($FileListArray[$Index], "(", 0, -1)), 8)
	Select
		Case $ParenthesesText = "Front"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "FRNT" Then $Suffix = "-FRNT"
		Case $ParenthesesText = "Rear"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "REAR" Then $Suffix = "-REAR"
		Case $ParenthesesText = "Left"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "LEFT" Then $Suffix = "-L"
		Case $ParenthesesText = "Right"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "RGHT" Then $Suffix = "-R"
		Case $ParenthesesText = "Left-Handed"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "LH" Then $Suffix = "-LH"
		Case $ParenthesesText = "Right-Handed"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "RH" Then $Suffix = "-RH"
		Case $ParenthesesText = "Upper"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "UPR" Then $Suffix = "-UPR"
		Case $ParenthesesText = "Lower"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "LWR" Then $Suffix = "-LWR"
		Case $ParenthesesText = "Inner"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "INNR" Then $Suffix = "-INNR"
		Case $ParenthesesText = "Outer"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "OUTR" Then $Suffix = "-OUTR"
		Case $ParenthesesText = "Long"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "LONG" Then $Suffix = "-LONG"
		Case $ParenthesesText = "Short"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "SHRT" Then $Suffix = "-SHRT"
		Case $ParenthesesText = "Female"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "FEML" Then $Suffix = "-FEML"
		Case $ParenthesesText = "Male"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "MALE" Then $Suffix = "-MALE"
		Case $ParenthesesText = "Sprocket"
			If $PrefixArray[UBound($PrefixArray) - 1] <> "SPKT" Then $Suffix = "-SPKT"
		Case Else
			$Suffix = ""
	EndSelect
EndFunc   ;==>CreateSuffix
;; ----------------------------------------
;; ApplyPrefix
;; ----------------------------------------
Func ApplyPrefix()
	If $Cancel = 0 Then
		Local $LastFolder
		Local $LastFile
		Local $LastPrefix
		$Count = 0
		For $Index = 0 To $TotalNumberOfFiles - 1
			;_ArrayDisplay($FileListArray)
			CreatePrefix($Index)
			If StringRegExp($FileListArray[$Index], "\((.*?)\)") Then
				CreateSuffix($Index)
				If StringLeft($FileListArray[$Index], StringInStr($FileListArray[$Index], "(", 0, -1) - 2) <> StringLeft($LastFile, StringInStr($LastFile, "(", 0, -1) - 2) Then $Count += 1
			Else
				$Suffix = ""
				$Count += 1
			EndIf
			If $LastFolder <> $PathListArray[$Index] Then
				$Count = 0
			EndIf
			Select
				Case $FilterType = "*.SLDPRT" Or $FilterType = "*.SLDDRW" ;Part & drawing handling.
					If $PrefixArray[0] = "HDWR" Or $PrefixArray[0] = "ELEC" And $PrefixArray[UBound($PrefixArray) - 1] = "COMN" Then
						Switch $Count
							Case 0 To 9
								FileMove($FileListArrayReadOnly[$Index], $PathListArray[$Index] & "[" & $FormattedPrefix & "-" & "0" & $Count & $Suffix & "] " & $FileListArray[$Index])
							Case 10 To $TotalNumberOfFiles
								FileMove($FileListArrayReadOnly[$Index], $PathListArray[$Index] & "[" & $FormattedPrefix & "-" & $Count & $Suffix & "] " & $FileListArray[$Index])
						EndSwitch
					ElseIf $PrefixArray[0] = "HDWR" Or $PrefixArray[0] = "ELEC" And $PrefixArray[UBound($PrefixArray) - 1] <> "COMN" Then
						FileMove($FileListArrayReadOnly[$Index], $PathListArray[$Index] & "[" & $FormattedPrefix & $Suffix & "] " & $FileListArray[$Index])
					Else
						Switch $Count
							Case 0 To 9
								FileMove($FileListArrayReadOnly[$Index], $PathListArray[$Index] & "[" & $FormattedPrefix & "-" & "0" & $Count & $Suffix & "] " & $FileListArray[$Index])
							Case 10 To $TotalNumberOfFiles
								FileMove($FileListArrayReadOnly[$Index], $PathListArray[$Index] & "[" & $FormattedPrefix & "-" & $Count & $Suffix & "] " & $FileListArray[$Index])
						EndSwitch
					EndIf
				Case $FilterType = "*.SLDASM" ;Assembly handling.
					FileMove($FileListArrayReadOnly[$Index], $PathListArray[$Index] & "[" & $FormattedPrefix & "] " & $FileListArray[$Index])
			EndSelect
			$LastFolder = $PathListArray[$Index]
			$LastFile = $FileListArray[$Index]
			$LastPrefix = $FormattedPrefix
			If $Count = 100 Then MsgBox(48, "Notification", "This folder contains more than 99 files:" & @CR & @CR & $PathListArray[$Index] & @CR)
		Next
		MsgBox(64, "Information", "Operation completed successfully.")
	EndIf
EndFunc   ;==>ApplyPrefix
;; ----------------------------------------
;; CreateRemovalArrays
;; ----------------------------------------
Func CreateRemovalArrays($aType)
	Select
		Case $aType = "Folders"
			$FileListArrayReadOnly = _RecFileListToArray($Path, "*", 2, 1, 1, 2, "", "Resources;Work-in-Progress") ;List all folders into a one-dimensional array.
		Case $aType = "All"
			$FileListArrayReadOnly = _RecFileListToArray($Path, "*", 0, 1, 1, 2, "", "Resources;Work-in-Progress") ;List all files and folders into a one-dimensional array.
	EndSelect
	_ArrayDelete($FileListArrayReadOnly, 0) ;Delete the first element, it contains the number of strings returned from the above _RecFileListToArray.
	$TotalNumberOfFiles = UBound($FileListArrayReadOnly)
	;_ArrayDisplay($FileListArrayReadOnly, $TotalNumberOfFiles)
	CreatePathListArray()
	$PathListArrayReadOnly = $PathListArray
	;_ArrayDisplay($PathListArrayReadOnly)
	CreateFileListArray()
	;_ArrayDisplay($FileListArray)
EndFunc   ;==>CreateRemovalArrays
;; ----------------------------------------
;; RemoveAllPrefixes
;; ----------------------------------------
Func RemoveAllPrefixes()
	Local $LastFolder
	$Count = 0
	Do
		For $Index = 0 To $TotalNumberOfFiles - 1
			If StringRight($PathListArray[$Index], 2) = "]\" Then
				If $LastFolder <> $PathListArray[$Index] Then
					MsgBox(48, "Notification", "This folder had a prefix but no trailing description:" & @CR & @CR & $PathListArray[$Index] & @CR & @CR & _
							"The folder """ & StringTrimRight(StringTrimLeft($PathListArray[$Index], StringInStr($PathListArray[$Index], "[", 0, -1) - 1), 1) & """ will be renamed to ""Unknown.""")
				EndIf
				$LastFolder = $PathListArray[$Index]
				$PathListArray[$Index] = StringTrimRight($PathListArray[$Index], 1) & " Unknown"
			EndIf
			If StringInStr($PathListArray[$Index], "[") And StringInStr($PathListArray[$Index], "]") Then
				$PathListArray[$Index] = StringRegExpReplace($PathListArray[$Index], "\[(.*?)\] ", "", 1)
			EndIf
			DirMove($PathListArrayReadOnly[$Index], $PathListArray[$Index])
		Next
		CreateRemovalArrays("Folders")
		$Count += 1
	Until $Count = $FolderDepth
	CreateRemovalArrays("All")
	For $Index = 0 To $TotalNumberOfFiles - 1
		FileMove($FileListArrayReadOnly[$Index], $PathListArrayReadOnly[$Index] & $FileListArray[$Index])
	Next
	MsgBox(64, "Information", "Operation completed successfully.")
EndFunc   ;==>RemoveAllPrefixes
;; ----------------------------------------
;; FindDepth
;; ----------------------------------------
Func FindDepth()
	Local $DepthArray = $PathListArrayReadOnly
	For $Index = 0 To $TotalNumberOfFiles - 1
		StringReplace($PathListArrayReadOnly[$Index], "\", "")
		$DepthArray[$Index] = (@extended - 1)
	Next
	$FolderDepth = _ArrayMax($DepthArray)
EndFunc   ;==>FindDepth
;; ----------------------------------------
;; CleanVariables
;; ----------------------------------------
Func CleanVariables()
	$Path = ""
	$FileListArrayReadOnly = ""
	$FileListArray = ""
	$PathListArrayReadOnly = ""
	$PathListArray = ""
	$PrefixArray = ""
	$TotalNumberOfFiles = ""
	$FormattedPrefix = ""
	$Suffix = ""
	$FolderDepth = ""
	$Cancel = 0
EndFunc   ;==>CleanVariables
