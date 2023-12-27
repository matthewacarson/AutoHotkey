;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Remove carriage returns and formatting from text string AHK v1.0 ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#SingleInstance Force

; #Persistent
; SetTimer, RemoveCarriageReturns, 500
; return

; ctrl alt shift r
^+!r::
    Clipboard := StrReplace(Clipboard, "`r`n", " ") ; Replace carriage return and line feed with space
    Clipboard := StrReplace(Clipboard, "`r", " ")   ; Replace remaining carriage returns with space
    Clipboard := RegExReplace(Clipboard, "[ \t]+", " ") ; Replace consecutive spaces and tabs with a single space
	Send ^v
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
