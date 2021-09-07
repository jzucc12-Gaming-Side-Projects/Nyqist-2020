draw_sprite_ext(sprite,2,x,y,2,2,0,-1,1);

draw_set_color(c_white);
draw_text(x_name,y_name,player.info.nickname);
var _hp_string = string(body_stat.hp) + "/" + string(body_stat.hp_max);
draw_text(x_hp,y_hp,_hp_string);
