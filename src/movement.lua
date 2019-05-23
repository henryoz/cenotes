function move_player()
	p.dy+=g --add gravity
	
	thrust()
	
	p.x+=p.dx
	p.y+=p.dy
end

function thrust()
	if (btn(0)) p.dx-=p.thrust
	if (btn(1)) p.dx+=p.thrust
	if (btn(2)) p.dy-=p.thrust
	if (btn(3)) p.dy+=p.thrust
end

function check_hit()
end