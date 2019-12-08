StartingGeneric = {}

--  > Restart needed
StartingGeneric.Font = "Calibri"

-- Changing the font size may require to adjust StartingGeneric.ySpace
StartingGeneric.TitleSize = 25
StartingGeneric.SubtitleSize = 15

--  > If this line is uncommented, restart isn't needed, just use this one for getting the font right
--LoadSGFonts()

--  > No restart needed
StartingGeneric.TimePerContent = 5 -- in seconds

StartingGeneric.Content = {
    { "StartingGeneric", "A better start for all" },
    { "An addon by:", "Nogitsu" },
    { "Remembers the feel of TV ♥", "Like series or movies ? Or both ?" },
    { "Easy to configure !", "The sg_config.lua is really short and easy to use" },
    { "Can contain a lot of sentences ^^", "Of course, it will take more time" },
    { "Want it ?", "Just wait and see" },
    { "Well okay..", "It will be available soon" },
    { "Where ?", "On the workshop and on github" },
    { "Oh and,", "Join discord.gg/gca to see more and better addons" },
    --{ "Insert your title here", "Insert your subtitles here" },
}

--  > For advanced users
StartingGeneric.x = 25
StartingGeneric.y = ScrH() / 2 - 25

StartingGeneric.ySpace = 30

StartingGeneric.xAlign = TEXT_ALIGN_LEFT
StartingGeneric.yAlign = TEXT_ALIGN_CENTER