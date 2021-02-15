littoral.bubble = function(pos, tex)
    local smoke = tex == "smote1.png"
    local nx,ny = math.random(-5,5)/10,math.random(-5,5)/10
    minetest.add_particlespawner({
        amount = 10,
        time = 1,
        minpos = {x=pos.x-0.2, y=pos.y+0.4, z=pos.z-0.2},
        maxpos = {x=pos.x+0.2, y=pos.y+2.1, z=pos.z+0.2},
        minvel = {x=0, y=0.2, z=0},
        maxvel = {x=nx, y=0.4, z=ny},
        minacc = {x=0, y=0, z=0},
        maxacc = {x=0, y=1, z=0},
        minexptime = 0.2,
        maxexptime = 1.2,
        minsize = smoke and 6 or 1,
        maxsize = smoke and 8 or 1.6,
    
        collisiondetection = false,
        collision_removal = false,
        vertical = true,
        texture = tex,
        animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.5},
            {
                type = "sheet_2d",
                frames_w = 1,
                frames_h = 26,
                frame_length = 1,
            },
        glow = 12
    })
    --return function() dir = math.random(-5,5) return dir end
end