--[=[
INSTRUCTIONS for MyMedia - using SharedMedia with your own stuff
================================================================
By doing this step, you may register your own textures, fonts, sounds, etc.
with LibSharedMedia-3.0 to choose from in-game, without fear of your edits being
overwritten when updating SharedMedia!

WARNING: Some updaters seem to wipe your addon's folder before updating it.
         If you choose the manual method below, make sure to backup your MyMedia.lua
		 
CONTENTS:
---------
	- Instructions on using MyMedia
		- automatic method
		- manual method
	- Examples for registering media
	- Problems
	- FAQ
	- Section to edit if following manual method for MyMedia

============================================================================================


Instructions on how to use MyMedia:
===================================

  I. The automatic way
  --------------------

    a) WINDOWS

      1. rename MyMedia.bat.txt to MyMedia.bat (make sure to have Windows set to show all file extensions)

      2. run MyMedia.bat to create the folders

      3. put your media files into the subfolders found at World of Warcraft\Interface\Addons\SharedMedia_MyMedia

      4. run MyMedia.bat again to create the MyMedia.lua file, registering your files

      5. ???

      6. PROFIT!!

    b) MAC

      Using a Mac you most likely know what you're doing so write your own script. ;)

  II. The manual way:
  ------------------

    1. Create a folder named SharedMedia_MyMedia inside your addons folder
       (World of Warcraft\Interface\Addons\SharedMedia_MyMedia)

    2. Create subfolders named background, border, font, sound and statusbar

    3. Make a copy of this file called MyMedia.lua and put it in the SharedMedia_MyMedia folder

    4. Place your media files into the corresponding folders

    5. Use the examples below to add information about your newly added media.
       You should only need to change anything between the lines marked "START"
       and "END" at the bottom of this file.

    6. Each item of media that you want to add should have its own line that
       uses the relevant example as a template. To add details about more than
       one item, just add another line to that section, changing the specific
       details (eg, the font name and path).


Examples:
---------
	background-
		LSM:Register("background", "my background's name", [[Interface\Addons\SharedMedia_MyMedia\background\mybackground.tga]])
	border-
		LSM:Register("border", "my border's name", [[Interface\Addons\SharedMedia_MyMedia files\myborder.tga]])
	font-
		LSM:Register("font", "my font's name", [[Interface\Addons\SharedMedia_MyMedia\font\myfont.ttf]])
		LSM:Register("font", "my friend's font", [[Interface\Addons\SharedMedia_MyMedia\font\friendsfont.ttf]])
	sound-
		LSM:Register("sound", "my sound's name", [[Interface\Addons\SharedMedia_MyMedia\sound\mysound.mp3]])
	statusbar-
		LSM:Register("statusbar", "my statusbar texture's name", [[Interface\Addons\SharedMedia_MyMedia\statusbar\mytexture.tga]])


Problems:
---------
If you have any issues, let us know on the WoWAce forums in the MyMedia
thread. --Seerah & Elkano


FAQ:
------
How do I create my own textures?
	This is a very good guide on creating textures compatible with WoW:
	http://forums.wowace.com/showthread.php?t=15439

How can I create a custom border?
	Border textures need to follow the same guidelines as those at the link above.
	Additionally, borders need to follow this format: http://www.wowwiki.com/EdgeFiles

Where can I find more fonts and sounds?
	There are plenty of websites that offer free fonts and sound clips/effects
	for download.  As with usual when downloading things from the internet,
	download from sites you trust, be smart, and run virus scans.
		NOTE: When distributing your MyMedia files with a UI compilation, be aware of any
		redistribution restrictions set in the licenses of your fonts and sounds.  Some
		are ALL RIGHTS RESERVED or are only for personal use, with no permission to share
		with others!

What can I use to view/edit a .lua file?
	If you are using the manual method for MyMedia, you'll need to edit the .lua
	file yourself.  But .lua files are just plain text, and can be opened in
	any text editor, such as Notepad or Wordpad.

]=]



----------------------------------------------------------------------------
-- Copy this section of the file to a file called MyMedia.lua, and enter 
-- your media's information below, using the examples shown above.
----------------------------------------------------------------------------

local LSM = LibStub("LibSharedMedia-3.0")

-- START of the section that you should be editing
--
--    NB: any line beginning with "--" is ignored - so the lines
--    below are just comments!
--

--background:

--border:

--font:
LSM:Register("font", "Expressway", [[Interface\Addons\SharedMedia_MyMedia\fonts\Expressway.ttf]])

--sound:

--statusbar:
LSM:Register("statusbar", "ToxiUI Clean", [[Interface\Addons\SharedMedia_MyMedia\statusbar\ToxiUI-clean.tga]])

-- END of the section that you should be editing
