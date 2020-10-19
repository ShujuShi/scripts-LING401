### This script creates TextGrid files for all sound files under a specified folder.
### The resulting TextGrid files will have the same name as the corresponding sound wav files.
### Author: Shuju Shi
### Date: 09-01-2020
### Laste updated (by SS): 10-17-2020

#### Form to enter directory
form Enter director
    sentence Directory .\mycorpus\
endform

pauseScript: "Warning: Your current TextGrids under this directory might be modified or deleted."
#### Get files under the specified directory
Create Strings as file list... listwav 'directory$'
nfile = Get number of strings

#### loop through all files and create the corresponding TextGrid files
idx = 0
for i from 1 to nfile
    select Strings listwav
    current_file$ = Get string... i
    if endsWith(current_file$, ".wav") or endsWith(current_file$, ".WAV")
        Read from file... 'directory$''current_file$'
        object_name$ = selected$("Sound")
		gridName$ = directory$ + object_name$ + ".TextGrid"
		if not fileReadable(gridName$)
            idx += 1
            To TextGrid: "syll phon VOT", "VOT"
            Write to text file... 'directory$''object_name$'.TextGrid
        endif
        select all
        minus Strings listwav
        Remove
    endif
endfor

select Strings listwav
Remove
printline 'idx' TextGrid file(s) have been created for wave files in 'directory$'
