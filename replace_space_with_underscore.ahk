#SingleInstance Force
;~ #Persistent
;~ SetTimer, ReplaceSpacesWithUnderscore, 800
;~ return

^!v:: ; ctrl alt v (remove spaces only)
	global inputString
	inputString := clipboard
    Gosub, ReplaceSpacesWithUnderscore
	Sleep, 300
	Send %out%
return

^!+v:: ; ctrl alt shift v (remove dashes and spaces)
	global inputString
	inputString := clipboard
    Gosub, ReplaceDashesWithUnderscore
	Sleep, 300
	Send %out%
return

^!x:: ; ctrl alt x (replace spaces and underscore with capital letters)
	global inputString
	inputString := clipboard
    Gosub, ReplaceUnderscoreWithUppercase
	Sleep, 300
	Send %capitalLetters%
return

ReplaceDashesWithUnderscore:
	global out
	; Replace dash with underscore
	StringReplace, out, inputString, -, _, All
	inputString := out
	GoSub, ReplaceSpacesWithUnderscore
return

ReplaceSpacesWithUnderscore:
    ; Replace space with underscore
    StringReplace, out, inputString, %A_SPACE%, _, All
	inputString := out
return

ReplaceUnderscoreWithUppercase:
	GoSub, ReplaceDashesWithUnderscore
	StringSplit, out, inputString, _
	global capitalLetters
	capitalLetters := "" ; Initialize to an empty string
    Loop, % out0
    {
        currentWord := out%A_Index%
        StringUpper, firstLetter, currentWord, T
		; MsgBox, %firstLetter%
        capitalLetters := capitalLetters firstLetter ; SubStr(currentWord, 1)
    }
return


