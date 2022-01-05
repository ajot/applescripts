-- Learn More -> https://ajot.me/spotify-text-expander

if application "Spotify" is running then
    tell application "Spotify"
        if (get player state) is playing then
            set appProperties to properties
            set currentTrack to current track
            set songName to (get name of currentTrack)
            set songArtist to (get artist of currentTrack)
            set returnString to "\"" & songName & "\"" & " by " & "\"" & songArtist & "\""
            return returnString

        end if
        return (get player state)
    end tell
else
    return "Spotify is not running"
end if
