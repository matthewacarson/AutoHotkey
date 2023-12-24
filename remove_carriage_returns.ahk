;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Remove carriage returns and formatting from text string AHK v1.0 ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#SingleInstance Force

#Persistent
SetTimer, RemoveCarriageReturns, 500
return


RemoveCarriageReturns:

    runs := runs + 1
	; Remove formatting
	Clipboard=%Clipboard%
	; Replace carriage returns with spaces
	StringReplace Clipboard, Clipboard, %A_Space% `r`n, %A_Space%, All
	StringReplace Clipboard, Clipboard, `r`n, %A_Space%, All
	;    if elapsed >= duration
    ;    ExitApp
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #Requires AutoHotkey v2.0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Assign the script to Alt + Win + C
;!#c::
;    Clipboard := "" ; Clear the clipboard

    ; Send Ctrl + C to copy the selected text
;    SendInput, ^c
;    Sleep 50 ; Wait for the text to be copied

    ; Get the copied text from the clipboard
;    CopiedText := Clipboard

    ; Remove carriage returns from the copied text
;    CopiedText := StrReplace(CopiedText, "`r`n", " ") ; Replace carriage returns with spaces
;    CopiedText := StrReplace(CopiedText, "`r", " ") ; Replace remaining carriage returns with spaces

    ; Copy the modified text back to the clipboard
;    Clipboard := CopiedText

    ; Optional: Display a tooltip to indicate that the text has been modified
;    ToolTip, Text copied and carriage returns removed
;    Sleep 1500 ; Show the tooltip for 1.5 seconds
;    ToolTip

;    return

; Function to replace text in a string
;StrReplace(str, search, replace) {
;    return RegExReplace(str, search, replace)
;}
