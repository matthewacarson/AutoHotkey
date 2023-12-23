#NoEnv
#SingleInstance force

InputBox, numbers, Enter Numbers, Please enter a list of comma separated numbers:

; Split the input string into an array
StringSplit, number_array, numbers, `,

; Calculate the mean
sum := 0
Loop %number_array0%
{
    sum += number_array%A_Index%
}
mean := sum / %number_array0%

; Calculate the standard deviation
sd_sum := 0
Loop %number_array0%
{
    diff := number_array%A_Index% - mean
    sd_sum += diff * diff
}
sd := Sqrt(sd_sum / %number_array0%)

; Calculate the skewness coefficient
skew_sum := 0
Loop %number_array0%
{
    diff := number_array%A_Index% - mean
    skew_sum += diff * diff * diff
}
skew := skew_sum / (%number_array0% * sd * sd * sd)

; Output the skewness coefficient
MsgBox, The skewness coefficient is %skew%
