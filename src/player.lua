function make_player()
	p={
		x=60,
		y=60,
		dx=0,
		dy=0,
		sprite=1,
		thrust=0.05
	}
end

function draw_player()
	spr(p.sprite,p.x,p.y)
end