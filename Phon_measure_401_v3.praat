### This script extracts parameters for all phones.
### The result files will be saved under the current folder.
### Author: Shuju Shi
### Date: 09-10-2020
### Last Updated (by SS): 11-02-2020

#### Form to enter directory
form Settings
    sentence Directory ./mycorpus/
	positive Maximum_formant_(Hz) 5500(=female, 5000=male)
	positive Maximum_number_of_formants 5
	integer pitchFloor 75
	integer pitchCeiling 600
endform

#############################################################################################################################
### Prepare all the arrays of different sounds: 
### vowels(Number=28), approximants(Number=),
 stringVowel$ = "ɑæɐəɵɘɛɜɪɨɔœɒøʊʉʌɯɤʏaoeiuyʙɶ"
 stringApproximant$ = "ʋɹɻjɰlɭʎʟwɥ"

### voiced/voiceless fricatives,
 stringVoicedFricative$ = "βvðzʒʐʑʝɣʁʕɦɬɮ"
 stringVoicelessFricative$ = "ɸfθsʃʂçɕxχħh"
### voiced/voiceless plosives
 stringVoicelessPlosive$ = "ptʈckqʔ"
 stringVoicedPlosive$ = "bdɖɟgɢ"
### voiced/voiceless afficates
 numberOfAffricates = 11
 stringVoicelessAffricate$[1] = "ts"
 stringVoicelessAffricate$[2] = "t͡s"
 stringVoicelessAffricate$[3] = "tʃ"
 stringVoicelessAffricate$[4] = "t͡ʃ"
 stringVoicelessAffricate$[5] = "tɕ"
 stringVoicelessAffricate$[6] = "t͡ɕ"
 stringVoicelessAffricate$[7] = "tɬ"
 stringVoicelessAffricate$[8] = "t͡ɬ"

 stringVoicedAffricate$[1] = "dz"
 stringVoicedAffricate$[2] = "d͡z"
 stringVoicedAffricate$[3] = "dʒ"
 stringVoicedAffricate$[4] = "d͡ʒ"
 stringVoicedAffricate$[5] = "dʑ"
 stringVoicedAffricate$[6] = "d͡ʑ"
 stringVoicedAffricate$[7] = "dɮ"
 stringVoicedAffricate$[8] = "d͡ɮ"
    ### affricates: monographic symbols
 stringVoicelessAffricate$[9] = "ʦ"
 stringVoicelessAffricate$[10] = "ʧ"
 stringVoicelessAffricate$[11] = "ʨ"

 stringVoicedAffricate$[9] = "ʤ"
 stringVoicedAffricate$[10] = "ʣ"
 stringVoicedAffricate$[11] = "ʥ"

### flip/taps, 
 stringFlap$ = "ɾɽⱱ"
 
### trills, 
 stringTrill$="ʙrʀ"
### nasals
 stringNasal$="mɱnŋɲɳɴ"

writeFileLine: "vowels.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "F1_1", tab$, "F1_2", tab$, "F1_3", tab$, "F2_1", tab$, "F2_2", tab$, "F2_3"
writeFileLine: "approximants.txt", "File", tab$, "Syllable", tab$, "Tone/Stress",tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "F1_1", tab$, "F1_2", tab$, "F1_3", tab$, "F2_1", tab$, "F2_2", tab$, "F2_3"
writeFileLine: "Nasals.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "F1_1", tab$, "F1_2", tab$, "F1_3", tab$, "F2_1", tab$, "F2_2", tab$, "F2_3"
writeFileLine: "flaps.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "F1_1", tab$, "F1_2", tab$, "F1_3", tab$, "F2_1", tab$, "F2_2", tab$, "F2_3"
writeFileLine: "trills.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "F1_1", tab$, "F1_2", tab$, "F1_3", tab$, "F2_1", tab$, "F2_2", tab$, "F2_3"
writeFileLine: "voicelessPlosives.txt", "File", tab$, "Syllable", tab$, "Tone/Stress",tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "Closure", tab$, "VOT"
#writeFileLine: "voicedPlosives.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "Closure", tab$, "VOT"
writeFileLine: "voicedPlosives.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "Closure", tab$, "VOT"
writeFileLine: "voicedFricatives.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "F0_1", tab$, "F0_2", tab$, "F0_3", tab$, "CoG"
writeFileLine: "voicelessFricatives.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$,  "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "CoG"
writeFileLine: "voicelessAffricates.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$,  "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "Dur1", tab$, "Dur2", tab$, "CoG"
writeFileLine: "voicedAffricates.txt", "File", tab$, "Syllable", tab$, "Tone/Stress", tab$, "Phone", tab$, "left_context",tab$, "right_context", tab$, "Duration", tab$, "Dur1", tab$,"Dur2", tab$, "CoG"
#### Get files under the specified directory
Create Strings as file list... listwav 'directory$'*.wav
nfile = Get number of strings
#### loop through all files and extract the parameters
for i from 1 to nfile
    select Strings listwav
    Write to text file... cert.txt
    current_file$ = Get string... i
    sound = Read from file... 'directory$''current_file$'
    Shift times to: "start time", 0
    object_name$ = selected$("Sound")
	textGrid = Read from file... 'directory$''object_name$'.TextGrid
    selectObject: textGrid
    Shift times to: "start time", 0
    nOfIntervals = Get number of intervals: 2
    # converts Praat trigrphs to unicode in order to get one character for making the match
    Convert to Unicode
    # get the pitch and formant object ready
    selectObject: sound
    formant = To Formant (burg): 0.01, maximum_number_of_formants, maximum_formant, 0.025, 50
    selectObject: sound
    pitch = To Pitch: 0, pitchFloor, pitchCeiling

    for nInterval from 1 to nOfIntervals
        selectObject: textGrid
        labelOfInterval$ = Get label of interval: 2, nInterval
		########
		# if labelOfInterval is not empty, get the basic information first
		if labelOfInterval$ <> ""
			endPoint = Get end point: 2, nInterval
			startPoint = Get starting point: 2, nInterval
			durInterval = endPoint- startPoint
			midInterval = startPoint +(durInterval/2)
			#fix decimals
			durInterval$ = fixed$(durInterval, 3)

            #Get the neiboring contexts for each label
            right_phone$ = "last"
            left_phone$ = "first"
            if nInterval > 1
                left_label$ = Get label of interval: 2, nInterval-1
                if left_label$ <> ""
                    left_phone$ = left_label$
                endif
            endif
            if nInterval < nOfIntervals - 1
                right_label$ = Get label of interval: 2, nInterval + 1
                if right_label$ <> ""
                    right_phone$ = right_label$
                endif
            endif

			#Get the syllable on the first tier
            interval_syl = Get interval at time: 1, midInterval
            label_syl$ = Get label of interval: 1, interval_syl
                ##### Get tone symbol from syllabel symbol if any
            tone$ = "NA"
            if length(label_syl$) > 3
                if number(right$(label_syl$, 3)) <> undefined
                    tone$ = right$(label_syl$, 3) 
                endif
            endif
            appendInfoLine: object_name$, tab$, label_syl$, tab$, labelOfInterval$
    ####### check if the label is a vowel
            @checkLabel: labelOfInterval$, stringVowel$
            @checkVoicelessAffricate: labelOfInterval$
            @checkVoicedAffricate: labelOfInterval$
            if checkLabel.inLabel <> 0
                #writes interval in the output
                appendFile: "vowels.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$,left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                #F0
                start = startPoint + 0.1 * (endPoint - startPoint)
                end  = endPoint - 0.1 * (endPoint - startPoint)
                @getF0: pitch, start, midInterval, end, "vowels.txt"
                #look for formants
                @getFormants: formant, start, midInterval, end, "vowels.txt"
                appendFile: "vowels.txt", newline$
            else

        ####### check if the label is an approximant
                @checkLabel: labelOfInterval$, stringApproximant$
                if checkLabel.inLabel <> 0
                    #writes interval in the output
                    appendFile: "approximants.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$, left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #F0
                    start = startPoint + 0.1 * (endPoint - startPoint)
                    end  = endPoint - 0.1 * (endPoint - startPoint)
                    @getF0: pitch, start, midInterval, end, "approximants.txt"
                    #look for formants
                    @getFormants: formant, start, midInterval, end, "approximants.txt"
                    appendFile: "approximants.txt", newline$
                else
        ####### check if the label is a nasal
                @checkLabel: labelOfInterval$, stringNasal$
                if checkLabel.inLabel <> 0
                    #writes interval in the output
                    appendFile: "nasals.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$,left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #F0
                    start = startPoint + 0.1 * (endPoint - startPoint)
                    end  = endPoint - 0.1 * (endPoint - startPoint)
                    @getF0: pitch, start, midInterval, end, "nasals.txt"
                    #look for formants
                    @getFormants: formant, start, midInterval, end, "nasals.txt"
                    appendFile: "nasals.txt", newline$
                else
    ####### check if the label is a flap
                @checkLabel: labelOfInterval$, stringFlap$
                if checkLabel.inLabel <> 0
                    #writes interval in the output
                    appendFile: "flaps.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$,left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #F0
                    start = startPoint + 0.1 * (endPoint - startPoint)
                    end  = endPoint - 0.1 * (endPoint - startPoint)
                    @getF0: pitch, start, midInterval, end, "flaps.txt"
                    #look for formants
                    @getFormants: formant, start, midInterval, end, "flaps.txt"
                    appendFile: "flaps.txt", newline$
                else
        ####### check if the label is a trill
                @checkLabel: labelOfInterval$, stringTrill$
                if checkLabel.inLabel <> 0
                   #writes interval in the output
                    appendFile: "trills.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$, left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #F0
                    start = startPoint + 0.1 * (endPoint - startPoint)
                    end  = endPoint - 0.1 * (endPoint - startPoint)
                    @getF0: pitch, start, midInterval, end, "trills.txt"
                    #look for formants
                    @getFormants: formant, start, midInterval, end, "trills.txt"
                    appendFile: "trills.txt", newline$
                else
    ####### check if the label is a voiced plosive
                @checkLabel: labelOfInterval$, stringVoicedPlosive$
                if checkLabel.inLabel <> 0 and checkVoicelessAffricate.inLabel + checkVoicedAffricate.inLabel = 0
                   #writes interval in the output
                    appendFile: "voicedPlosives.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$, left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #F0
                    start = startPoint + 0.1 * (endPoint - startPoint)
                    end  = endPoint - 0.1 * (endPoint - startPoint)
                    #@getF0: pitch, start, midInterval, end, "voicedPlosives.txt"
                    #VOT
                    @getVOT: textGrid, startPoint, endPoint, "voicedPlosives.txt"
                    appendFile: "voicedPlosives.txt", newline$
                else
        ####### check if the label is a voiceless plosive
                @checkLabel: labelOfInterval$, stringVoicelessPlosive$
                if checkLabel.inLabel <> 0 and checkVoicelessAffricate.inLabel + checkVoicedAffricate.inLabel = 0
                   #writes interval in the output
                    appendFile: "voicelessPlosives.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$, left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #VOT
                    @getVOT: textGrid, startPoint, endPoint, "voicelessPlosives.txt"
                    appendFile: "voicelessPlosives.txt", newline$
                else
        ####### check if the label is a voiceless fricative
                @checkLabel: labelOfInterval$, stringVoicelessFricative$
                if checkLabel.inLabel <> 0 and checkVoicelessAffricate.inLabel + checkVoicedAffricate.inLabel = 0
                   #writes interval in the output
                    appendFile: "voicelessFricatives.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$, left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #VOT
                    @getCoG: sound, textGrid, startPoint, endPoint, "voicelessFricatives.txt"
                    appendFile: "voicelessFricatives.txt", newline$
                else
        ####### check if the label is a voiced fricative
                @checkLabel: labelOfInterval$, stringVoicedFricative$
                if checkLabel.inLabel <> 0 and checkVoicelessAffricate.inLabel + checkVoicedAffricate.inLabel = 0
                   #writes interval in the output
                    appendFile: "voicedFricatives.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$, left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
#                    #F0
#                    start = startPoint + 0.1 * (endPoint - startPoint)
#                    end  = endPoint - 0.1 * (endPoint - startPoint)
#                    @getF0: pitch, start, midInterval, end, "voicedFricatives.txt"
                    #VOT
                    @getCoG: sound, textGrid, startPoint, endPoint, "voicedFricatives.txt"
                    appendFile: "voicedFricatives.txt", newline$
                else
        ####### check if the label is a voiceless affricate
                if checkVoicelessAffricate.inLabel <> 0
                   #writes interval in the output
                    appendFile: "voicelessAffricates.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$,left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #VOT and CoG
                    @getdur2affricates: textGrid, startPoint, endPoint, "voicelessAffricates.txt"
                    @getCoG_A: sound, textGrid, startPoint, endPoint, "voicelessAffricates.txt"
                    appendFile: "voicelessAffricates.txt", newline$
    ####### check if the label is a voiced affricate
                else
                if checkVoicedAffricate.inLabel <> 0
                   #writes interval in the output
                    appendFile: "voicedAffricates.txt", object_name$, tab$, label_syl$, tab$, tone$, tab$, labelOfInterval$, tab$,left_phone$, tab$, right_phone$, tab$, durInterval$, tab$
                    #F0
                    start = startPoint + 0.1 * (endPoint - startPoint)
                    end  = endPoint - 0.1 * (endPoint - startPoint)
                    #@getF0: pitch, start, midInterval, end, "voicedAffricates.txt"
                    #VOT + CoG
                    @getdur2affricates: textGrid, startPoint, endPoint, "voicedAffricates.txt"
                    @getCoG_A: sound,textGrid, startPoint, endPoint, "voicedAffricates.txt"
                    appendFile: "voicedAffricates.txt", newline$
                else
                    appendInfoLine: labelOfInterval$, " is not an IPA label."
                    ### append to a new file
            endif
            endif
            endif
            endif
            endif
            endif
            endif
            endif
            endif
            endif
            endif
        endif
	endfor
    select all
    minusObject: "Strings listwav"
    Remove
endfor


#### procedures for checking if it is vowel, approximant, fricative, plosive, trill, Tap/Flap.
procedure checkLabel: .label$, .stringSound$
    .inLabel = 0
    for nlabel from 1 to length(.stringSound$)
        if index(.label$, mid$(.stringSound$, nlabel, 1)) <> 0
            .inLabel = 1
		endif
	endfor
endproc

#### procedures for checking if it is a voiceless affricate.
procedure checkVoicelessAffricate: .label$
    .inLabel = 0
    for nlabel from 1 to numberOfAffricates
        if index(.label$, stringVoicelessAffricate$[nlabel]) <> 0
            .inLabel = 1
		endif
	endfor
endproc

#### procedures for checking if it is a voiced affricate.
procedure checkVoicedAffricate: .label$
    .inLabel = 0
    for nlabel from 1 to numberOfAffricates
        if index(.label$, stringVoicedAffricate$[nlabel]) <> 0
            .inLabel = 1
		endif
	endfor
endproc

#### procedures for getting f0s of a given interval
procedure getF0: .pitch, .startPoint, .midPoint, .endPoint, .filename$
    selectObject: .pitch
    .f0_1 = Get value at time: .startPoint, "Hertz", "Linear"
    .f0_2 = Get value at time: .midPoint, "Hertz", "Linear"
    .f0_3 = Get value at time: .endPoint, "Hertz", "Linear"
    .f0_1$ = fixed$(.f0_1, 0)
    .f0_2$ = fixed$(.f0_2, 0)
    .f0_3$ = fixed$(.f0_3, 0)

    appendFile: .filename$, .f0_1$, tab$, .f0_2$, tab$, .f0_3$, tab$
endproc
#### procedures for getting formants of a given interval
procedure getFormants: .formant, .startPoint, .midInterval, .endPoint, .filename$
    selectObject: .formant
    .f1_1 = Get value at time: 1, .startPoint, "Hertz", "Linear"
    .f2_1 = Get value at time: 2, .startPoint, "Hertz", "Linear"
    .f1_2 = Get value at time: 1, .midInterval, "Hertz", "Linear"
    .f2_2 = Get value at time: 2, .midInterval, "Hertz", "Linear"
    .f1_3 = Get value at time: 1, .endPoint, "Hertz", "Linear"
    .f2_3 = Get value at time: 2, .endPoint, "Hertz", "Linear"
    .f1_1$ = fixed$(.f1_1, 0)
    .f2_1$ = fixed$(.f2_1, 0)
    .f1_2$ = fixed$(.f1_2, 0)
    .f2_2$ = fixed$(.f2_2, 0)
    .f1_3$ = fixed$(.f1_3, 0)
    .f2_3$ = fixed$(.f2_3, 0)
    appendFile: .filename$, .f1_1$, tab$, .f1_2$, tab$, .f1_3$, tab$, .f2_1$, tab$, .f2_2$, tab$, .f2_3$, tab$
endproc

#### procedure for getting VOT for plosives
procedure getVOT: .textGrid, .startPoint, .endPoint, .filename$
    selectObject: .textGrid
    .pointOne = Get high index from time: 3, .startPoint
    .pointTwo = Get low index from time: 3, .endPoint
    .labelOne$ = Get label of point: 3, .pointOne
    .labelTwo$ = Get label of point: 3, .pointTwo
    .timeOne = Get time of point: 3, .pointOne
    .timeTwo = Get time of point: 3, .pointTwo
    if .labelOne$ = "r"
        .closure = .timeOne - .startPoint
        .vot = .timeTwo - .timeOne
    else
        .closure = .timeTwo - .startPoint
        .vot = .timeOne - .timeTwo
    endif
    .closure$ = fixed$(.closure, 3)
    .vot$ = fixed$(.vot, 3)
    appendFile: .filename$, .closure$, tab$, .vot$, tab$
endproc

#### procedure for getting 1-r, v-2 for affricates
procedure getdur2affricates: .textGrid, .startPoint, .endPoint, .filename$
    selectObject: .textGrid
    .pointOne = Get high index from time: 3, .startPoint
    .pointTwo = Get low index from time: 3, .endPoint
    .labelOne$ = Get label of point: 3, .pointOne
    .labelTwo$ = Get label of point: 3, .pointTwo
    .timeOne = Get time of point: 3, .pointOne
    .timeTwo = Get time of point: 3, .pointTwo
    if .labelOne$ = "r"
        .dur1 = .timeOne - .startPoint
        .dur2 = .endPoint - .timeTwo
    else
        .dur1 = .timeTwo - .startPoint
        .dur2 = .endPoint - .timeOne
    endif
    .dur1$ = fixed$(.dur1, 3)
    .dur2$ = fixed$(.dur2, 3)
    appendFile: .filename$, .dur1$, tab$, .dur2$, tab$
endproc
### procedure for getting CoG for fricatives
procedure getCoG: .sound,.textGrid, .startPoint, .endPoint, .filename$
    selectObject: .sound
    Extract part: .startPoint, .endPoint, "Hanning", 1, "no"
    .partSound = selected("Sound")
    selectObject: .partSound
    To Spectrum: "yes"
    .spectrum = selected("Spectrum")
    selectObject: .spectrum
    .cog = Get centre of gravity: 2
    .cog$ = fixed$(.cog, 0)
    appendFile: .filename$, .cog$, tab$
endproc
### procedure for getting CoG for affricates
procedure getCoG_A: .sound,.textGrid, .startPoint, .endPoint, .filename$
    selectObject: .textGrid
    .pointOne = Get nearest index from time: 3, .startPoint
    .pointTwo = Get nearest index from time: 3, .endPoint
    .labelOne$ = Get label of point: 3, .pointOne
    .labelTwo$ = Get label of point: 3, .pointTwo
    .timeOne = Get time of point: 3, .pointOne
    .timeTwo = Get time of point: 3, .pointTwo
    if .labelOne$ = "r"
        .time_b = .timeOne
    else
        .time_b = .timeTwo
    endif
    selectObject: .sound
    Extract part: .time_b, .endPoint, "Hanning", 1, "no"
    .partSound = selected("Sound")
    selectObject: .partSound
    To Spectrum: "yes"
    .spectrum = selected("Spectrum")
    selectObject: .spectrum
    .cog = Get centre of gravity: 2
    .cog$ = fixed$(.cog, 0)
    appendFile: .filename$, .cog$, tab$
endproc

appendFile ("cert.txt", info$ ())
#clearinfo
