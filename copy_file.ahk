; Set the path to your source file
SourceFile := "C:\Users\madou\OneDrive - UCLA IT Services\3)_SOC-Honors\NLRB_R_Petitions\CSVs\NLRB contacts.xlsx"

; Set the path to your destination file
DestFile := "C:\Users\madou\OneDrive - UCLA IT Services\3)_SOC-Honors\NLRB_R_Petitions\CSVs\NLRB contacts (1).xlsx"

; Check for changes in a loop
Loop
{
    ; Get the current modification time of the source file
    FileGetTime, SourceModTime, %SourceFile%, M

    ; Get the new modification time of the destination file
    FileGetTime, DestModTime, %DestFile%, M
    ; MsgBox, SourceModTime: %SourceModTime%`nDestModTime: %DestModTime% ; Add this line for debugging

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

    Sleep, 10000
}
