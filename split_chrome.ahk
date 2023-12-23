#NoEnv
#SingleInstance Force

; Set the title of the Chrome window that contains the tabs to be split.
ChromeWindow := "Google Chrome"

; Wait for the Chrome window to become active.
WinWaitActive, %ChromeWindow%

; Set the hotkey to trigger the tab-splitting action.
^!#s::
{
    ; Get the IDs of the two selected tabs.
    ControlGet, Tab1, Hwnd,, Chrome_RenderWidgetHostHWND1, %ChromeWindow%
    ControlGet, Tab2, Hwnd,, Chrome_RenderWidgetHostHWND1, %ChromeWindow%, T2

    ; Get the position and size of the Chrome window.
    WinGetPos, ChromeX, ChromeY, ChromeWidth, ChromeHeight, %ChromeWindow%

    ; Calculate the position and size of the two new windows.
    NewWidth := ChromeWidth / 2
    NewHeight := ChromeHeight
    LeftX := ChromeX
    LeftY := ChromeY
    RightX := ChromeX + NewWidth
    RightY := ChromeY

    ; Move the first tab to the left window.
    WinMove, ahk_id %Tab1%, , %LeftX%, %LeftY%, %NewWidth%, %NewHeight%

    ; Move the second tab to the right window.
    WinMove, ahk_id %Tab2%, , %RightX%, %RightY%, %NewWidth%, %NewHeight%
    
    ; Wait for the windows to be moved before continuing.
    Sleep 1000
    return
}
