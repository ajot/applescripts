using terms from application "Mail"
	on perform mail action with messages theMessages for rule theRule
		
		-- set up the attachment folder path
		tell application "Finder"
			set folderName to "Attachments"
			set homePath to (path to home folder as text) as text
			set attachmentsFolder to (homePath & folderName) as text
		end tell
		
		tell application "Mail"
			set counter to 0
			repeat with eachMessage in theMessages
				
				set attachCount to count of (mail attachments of eachMessage)
				if attachCount is not equal to 0 then
					try
						-- Save the attachment
						
						repeat with theAttachment in eachMessage's mail attachments
							set counter to counter + 1
							set s_counter to counter as string
							set originalName to (name of theAttachment)
							
							--Renaming the file name, so the filenames are always unique when saving multiple emails with same attachment names
							set filename to rich text 1 thru ((length of originalName) - 4) of originalName
							set ext_name to rich text -1 thru -4 of originalName
							
							set new_filename to filename & "-" & s_counter & ext_name
							set savePath to attachmentsFolder & ":" & new_filename
							try
								save theAttachment in file (savePath)
							end try
						end repeat
						--on error msg
						--display dialog msg
					end try
					
				end if
			end repeat
			display dialog "Saved " & s_counter & " attachments to the Attachments folder"
		end tell
	end perform mail action with messages
end using terms from
