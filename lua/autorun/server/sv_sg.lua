AddCSLuaFile( "sg_config.lua" )

util.AddNetworkString( "SG:Start" )

hook.Add( "PlayerInitialSpawn", "SG:StartNet", function( ply )
    timer.Simple( 2 / ply:Ping(), function()
        if not IsValid( ply ) then return end
        
        net.Start( "SG:Start" )
        net.Send( ply )
    end )
end )