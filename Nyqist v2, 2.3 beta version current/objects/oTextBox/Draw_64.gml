//Draw face box
SetText(font,halign,valign,color);
NineSliceStretch(sTextBox,x1,y1,x2,y2,0);
NineSliceStretch(sTextBox,0,y1,x1,y2,1);
var _slice = sprite_get_width(sTextBox)/3;
draw_sprite_ext(face,-1,_slice,RES_HEIGHT-_slice,2,2,0,-1,1);