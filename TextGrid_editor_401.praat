# Script for automatically opening and modifying Text Grids associated with sound files.
# Ryan Shosted 10-01-2020
# LAST edited (by SS): 10-19-2020

form Input
  comment Name the directory where your sound files are kept:
  sentence DirName .\mycorpus\
 # Make sure you don't delete any of the backslashes when you 
 # fill in this part of the form. You can rewrite the code
 # so that a different backslash pattern is acceptable, but
 # a good rule of thumb is just to copy the format of whatever
 # appears in the script's input form.
  comment Serial number of the sound file where you want to start
 # Note that Praat will open up files in a directory alphabetically
 # So you're probably best off recording somewhere the number of the 
 # file you left off on, or just start on 1 every time
  positive start_on_file 1
  positive Spectrogram_ceiling 5000(=Male, 5500=Female)
  positive Pitch_ceiling 300(=Male, 400=Female)
 endform

 Create Strings as file list... list 'dirName$'*.wav
 numberOfFiles = Get number of strings
 myInts = 1
 for ifile from start_on_file to numberOfFiles                         
    select Strings list
    fileName$ = Get string... ifile
    name$ = fileName$ - ".wav"
    textgrid_file$ = name$ + ".TextGrid"                     
       if ifile >= start_on_file
         Read from file... 'dirName$''fileName$'
         Read from file... 'dirName$''textgrid_file$'
         select Sound 'name$'
         select TextGrid 'name$'
         plus Sound 'name$'
         Edit
         editor TextGrid 'name$'
         Spectrogram settings... 70 spectrogram_ceiling 0.025 50
         Pitch settings... 60 pitch_ceiling Hertz Autocorrelation automatic
         endeditor
   
         pause Ready to save? 'ifile'
         select TextGrid 'name$'
	 Write to text file... 'dirName$''textgrid_file$'


         select Sound 'name$'
         plus TextGrid 'name$'
         Remove
       endif
 endfor
