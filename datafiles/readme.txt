this readme will Fucking suck. i am unfortunately really lazy to do a proper good one. just use it and hopefully you'll learn the ropes
either way this is open-source so just read the code :grin: at
https://github.com/raf13lol/musicplayer2

this is a remake of my music player (hence the 2)

put your Full directories path into recursivedirs.txt / nonrecursivedirs.txt
recursivedirs.txt will search recursively, as in search sub-directories as well (go figure)
and nonrecursivedirs.txt won't

so for the record i'll be using the default keybinds but you can change them in settings.json (generated after opening mp once)

Note: if you change the panel keybinds to something like 1, 2, 3, ...
you will want to change in settings.json "search_lock_panel" to true !!!
this means that you have to ctrl + shift + s to toggle searching until you aren't
to change panel if you are on the search panel
but this means you can change the panel keybinds and still search for that key

any of the panel keys causes the respective panel to be focused
shift + any of the panel keys toggle visibility

except the plays panel where the panel key toggles the visibility of it and shift does nothing

the currently playing panel:
displays filename and relative path
has a playback bar where you can use arrow keys to move position by 10 secs (1 sec if ctrl is held)
volume and pitch both are altered by arrows keys by 5% or 0.05 (1% or 0.01 if ctrl is held)

if you press space/enter on volume or pitch with a song playing it will save that setting to that file (will overwrite when you open thing)
to clear this overwriting thingy just save whilst holding ctrl
if you press space/enter with no song playing / whilst holding shift it will save the settings for when you open the music player

the buttons at the bottom of the panel do certain things:
previous track goes to previous track or restarts song if position is past 10 secs
play/pause toggles pause
next track goes to next track
the AB repeat button clears the AB repeat
the A says where AB repeat will start
the B says where AB repeat will end

the queue panel:

the buttons:
if you hold shift you can go back

controls what happens after song is finished -> start, start but paused, stop (clear queue)
the queue loop -> loop queue, loop current song, just move queue pointer back to start
the queue shuffle -> no shuffle, initial shuffle (as in doesn't reshuffle when queue loops), reshuffle
the stop button clears queue
the playlist button opens the playlist creation prompt (playlists are just a snapshot of the current queue)

if you go down onto the queue you can jump via enter and backspace to remove currently selected song (ctrl affects this)

the playlist panel:
you can press enter to load the playlist into the queue (if shift is held it will add the songs from the playlist onto the queue)

the search panel:
type to search your songs
you can press ctrl + shift + s to toggle if you're searching (useful for people with weird panel keys ig idk)
press enter to add song to queue and play (hold shift if you don't wanna play)
ctrl+enter will add all the listed songs (as in what the search has filtered) to the queue

the plays panel:
will show how much you played songs in time periods
the month text (titled that because it's default on month) -> month, year, all-time
the time period text will either increment the month, year or nothing that you're looking thru depending on the "month" text
not much more to say

there's also rich presence btw
-> options are for it:
none
open
playing
playingwithrelative

more details as you go down

keybinds support most things (just use common sense lol)

Hope you enjoy !
