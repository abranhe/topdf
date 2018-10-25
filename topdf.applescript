on run {input, parameters}

	repeat with theFile in input
		tell application "Finder"
			set theFilesFolder to folder of theFile as text
			set theFilesName to name of theFile as text
			set theFilesExtension to name extension of theFile as text
			set theFilesNameWithoutExtension to text 1 thru ((offset of "." in theFilesName) - 1) of theFilesName
		end tell

		if theFilesExtension is equal to "numbers" then
			tell application "Numbers"
				set theDoc to open theFile
				export theDoc as PDF to file ((theFilesFolder & theFilesNameWithoutExtension & ".pdf") as text)
				close theDoc
			end tell
		else if theFilesExtension is equal to "pages" then
			tell application "Pages"
				set theDoc to open theFile
				export theDoc as PDF to file ((theFilesFolder & theFilesNameWithoutExtension & ".pdf") as text)
				close theDoc
			end tell
		else
			display dialog "Unsupported format " & theFilesExtension
		end if

	end repeat

	return input
end run
