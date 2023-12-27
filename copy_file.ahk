#SingleInstance Force
; Set the path to your source file
SourceFile := "C:\Users\madou\OneDrive - UCLA IT Services\3)_SOC-Honors\NLRB_R_Petitions\CSVs\NLRB_contacts_edit_this.xlsx"

; Set the path to your destination file
DestFile := "C:\Users\madou\OneDrive - UCLA IT Services\3)_SOC-Honors\NLRB_R_Petitions\CSVs\NLRB_contacts_do_not_edit.xlsx"

; Check for changes in a loop
Loop
{
        ;Debugging
    ; MsgBox, SourceModTime: %SourceModTime%`nDestModTime: %DestModTime% ; Add this line for debugging
/*     if(FileExist(SourceFile))
 *         MsgBox, Source file exists.
 *     if(FileExist(DestFile))
 *         MsgBox, Destination file exists.
 *     if(!FileExist(DestFile))
 *         MsgBox, "Destination file DOES NOT exist."
 */

    ; Get the current modification time of the source file
    FileGetTime, SourceModTime, %SourceFile%, M

    if(!FileExist(DestFile))
        FileCopy, %SourceFile%, %DestFile%

    ; Get the new modification time of the destination file
    FileGetTime, DestModTime, %DestFile%, M

    ; Compare modification times to detect changes
    if (SourceModTime > DestModTime)
    {
        ; MsgBox, Activated

        ; Delete the destination file if it exists
        if (FileExist(DestFile))
            FileDelete, %DestFile%

        ; File has changed, so copy it to the destination folder
        FileCopy, %SourceFile%, %DestFile%
    }

    Sleep, 2000
}
