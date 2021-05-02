<#
Converts the given text to speech
#>

# named parameter passing from ps
param ($Txt = $(throw "Txt to say parameter is required."))
Write-Output "The text to say is: $Txt"

# create new instance of the speech object
$VoiceFromSpeech = New-Object System.Speech.Synthesis.SpeechSynthesizer

# get all the installed voices and use 1 by default
$InstalledVoices = $VoiceFromSpeech.GetInstalledVoices();
$SpecificVoice = $InstalledVoices[1].VoiceInfo.Name;
$VoiceFromSpeech.SelectVoice($SpecificVoice)

# actually speak the text provided 
$VoiceFromSpeech.Speak($Txt)

