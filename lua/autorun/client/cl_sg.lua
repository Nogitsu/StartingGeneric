include( "sg_config.lua" )
local actual, show_time = 0, 0

function SG_Start()
    actual = 1
    show_time = CurTime()
    
    timer.Create( "SG", StartingGeneric.TimePerContent + 0.2, #StartingGeneric.Content, function()
        actual = actual + 1
        show_time = CurTime()
    end )
end

net.Receive( "SG:Start", SG_Start )
concommand.Add( "sg_start", SG_Start )

concommand.Add( "sg_stop", function()
    timer.Remove( "SG" )
    actual = 0
end )

function LoadSGFonts()
    surface.CreateFont( "SG:TitleFont", {
        font = StartingGeneric.Font,
        size = ScreenScale( StartingGeneric.TitleSize )
    } )

    surface.CreateFont( "SG:SubtitleFont", {
        font = StartingGeneric.Font,
        size = ScreenScale( StartingGeneric.SubtitleSize )
    } )
end
LoadSGFonts()

local alpha, toshow = 0, false
hook.Add( "HUDPaint", "SG:Draw", function()
    if not StartingGeneric.Content[ actual ] then return end
    local dt = CurTime() - show_time

    local title = StartingGeneric.Content[ actual ][ 1 ]
    local subtitle = StartingGeneric.Content[ actual ][ 2 ]
    
    local speed = FrameTime() * 4
    alpha = toshow and Lerp( speed, alpha, 255 ) or Lerp( speed, alpha, 0 )
    surface.SetTextColor( 255, 255, 255, alpha )

    toshow = dt < StartingGeneric.TimePerContent * 0.75

    --  > Title
    surface.SetFont( "SG:TitleFont" )
    local title_w, title_h = surface.GetTextSize( title )

    draw.SimpleText( title, "SG:TitleFont", StartingGeneric.x, StartingGeneric.y, surface.GetTextColor(), StartingGeneric.xAlign, StartingGeneric.yAlign )

    --  > Subtitle
    surface.SetFont( "SG:SubtitleFont" )
    local subtitle_w, subtitle_h = surface.GetTextSize( subtitle )

    --local space = (StartingGeneric.yAlign == TEXT_ALIGN_CENTER) and (title_h * 1.5) or (title_h * 0.9)

    local space = (StartingGeneric.yAlign == TEXT_ALIGN_CENTER) and (StartingGeneric.TitleSize < StartingGeneric.SubtitleSize) and (title_h * 1.5) or (title_h * 0.2)

    draw.SimpleText( subtitle, "SG:SubtitleFont", StartingGeneric.x, StartingGeneric.y + space + StartingGeneric.ySpace, surface.GetTextColor(), StartingGeneric.xAlign, StartingGeneric.yAlign )
end )