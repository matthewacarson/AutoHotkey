; #Persistent
; SetTimer, ReplaceSlashes, 800
; return

^!v:: ; ctrl alt c
    Gosub, ReplaceSlashes
return

ReplaceSlashes:
    clipboardVar := clipboard

    ; ;;;;;;;;;;;;; diagnostics ;;;;;;;;;;;;;;;;;; ;
    ; MsgBox, currently: %clipboardVar%
    ; out := SubStr(clipboardVar, -0) = "\"
    ; out := SubStr(clipboardVar, 1, StrLen(clipboardVar) - 1)
    ; MsgBox, %out%

    ; ;;;;;;;;;;;;;; subroutine starts here ;;;;;;;; ;
    if InStr(clipboardVar, """") {
        ; remove any doublequotes
        StringReplace, clipboardVar, clipboardVar, ", , All
        ; MsgBox, removed double quotes ; for diagnostic purposes
    }
    if (SubStr(clipboardVar, -0) = "\") {
        ; Remove the trailing backslash
        clipboardVar := SubStr(clipboardVar, 1, StrLen(clipboardVar) - 1)
        ; MsgBox, removed backslash ; for diagnostic purposes
    }
    if InStr(clipboardVar, ".") {
        ; Split the clipboard content using backslashes
        StringSplit, parts, clipboardVar, \

        ; Reconstruct the path without the last part
        newPath := {}
        Loop, % parts0 - 1
            if (A_Index > 1) {
                newPath := newPath "/" parts%A_Index%
            } else {
                newPath := newPath parts%A_Index%
            }
    } else {
        ; Replace backslashes with forward slashes
        StringReplace, newPath, clipboardVar, \, /, All
    }
    Send %newPath%
    ; MsgBox, %newPath% ; for diagnostic purposes
return


; C:\Users\madou\OneDrive - UCLA IT Services\PS-Honors\Summer23 R Code and Plots\urban_displacement

; "C:\Users\madou\OneDrive - UCLA IT Services\PS-Honors\Summer23 R Code and Plots\urban_displacement\UDP_initial_plot_ordered.png"
; "C:\Users\madou\OneDrive - UCLA IT Services\PS-Honors\Summer23 R Code and Plots\urban_displacement\"
; C:\Program Files\AutoHotkey\SciTE\tools\WindowSpy.ahk