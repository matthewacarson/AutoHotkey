#SingleInstance Force
; #Persistent
; SetTimer, ReplaceSlashes, 800
; return

^!v:: ; ctrl alt v
    Gosub, ReplaceSlashes
return

ReplaceSlashes:

    ; Assign clipboard contents to a variable
    ; - This prevents overwriting the original clipboard -
    clipboardVar := clipboard

    ; ;;;;;;;;;;;;; diagnostics ;;;;;;;;;;;;;;;;;; ;
    ; MsgBox, initial: %clipboardVar%
    ; out := SubStr(clipboardVar, -0) = "\"
    ; out := SubStr(clipboardVar, 1, StrLen(clipboardVar) - 1)
    ; MsgBox, %out%

    ; ;;;;;;;;;;;;;; subroutine starts here ;;;;;;;; ;
    if InStr(clipboardVar, """") {
        ; remove any double quotes
        StringReplace, clipboardVar2, clipboardVar, ", , All
    } else {
        clipboardVar2 := clipboardVar
    }

    ; MsgBox, no quotes: %clipboardVar2% ; diagnostic purposes

    if (SubStr(clipboardVar2, -0) = "\") {
        ; Remove the trailing backslash
        clipboardVar3 := SubStr(clipboardVar2, 1, StrLen(clipboardVar2) - 1)
    } else {
        clipboardVar3 := clipboardVar2
    }

    ; MsgBox, remove last back slash: %clipboardVar3% ; diagnostic purposes

    if InStr(clipboardVar3, ".") {
        ; Split the clipboard content using backslashes
        StringSplit, parts, clipboardVar3, \

        ; Reconstruct the path without the last part
        newPath := {}
        ; MsgBox, %parts0% ; check the length/number of values in the array
        Loop, % parts0 - 1
            if (A_Index > 1) {
                newPath := newPath "/" parts%A_Index%
            } else {
                newPath := newPath parts%A_Index%
            }
    } else {
        ; Replace backslashes with forward slashes
        StringReplace, newPath, clipboardVar3, \, /, All
    }
    ; MsgBox, final: %newPath% ; diagnostic purposes
    Send %newPath%
return


; C:\Users\madou\OneDrive - UCLA IT Services\PS-Honors\Summer23 R Code and Plots\urban_displacement

; "C:\Users\madou\OneDrive - UCLA IT Services\PS-Honors\Summer23 R Code and Plots\urban_displacement\UDP_initial_plot_ordered.png"
; "C:\Users\madou\OneDrive - UCLA IT Services\PS-Honors\Summer23 R Code and Plots\urban_displacement\"
; C:\Program Files\AutoHotkey\SciTE\tools\WindowSpy.ahk