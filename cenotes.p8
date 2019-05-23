pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--cenotes
--A cave diving adventure
function _init()
  game_over=false
	g=0.005
	make_cave()
	make_player()
end

function _update()
 if (not game_over) then
		update_cave()
		move_player()
		check_hit()
	end
end

function _draw()
  cls()
	draw_cave()
	draw_player()
end
-->8
--cave
function make_cave()
  cave={{["top"]=25,["btm"]=80}}
  top=45 --how low can the ceiling go?
  btm=85 --how high can the floor get?
end

function draw_cave()
  top_color=5 --play with these!
  btm_color=5 --choose your own colors!
  for i=1,#cave do
    line(i-1,0,i-1,cave[i].top,top_color)
    line(i-1,127,i-1,cave[i].btm,btm_color)
  end
end

function update_cave()
  while (#cave<128) do
    local col={}
    local up=flr(rnd(7)-3)
    local dwn=flr(rnd(7)-3)
    col.top=mid(3,cave[#cave].top+up,top)
    col.btm=mid(btm,cave[#cave].btm+dwn,124)
    add(cave,col)
  end
end
-->8
--movement
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
-->8
--player
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
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000db0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000080aaadd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000080000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008000000f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

