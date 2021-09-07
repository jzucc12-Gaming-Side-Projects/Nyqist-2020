//Box Position
box_edge_W = sprite_get_width(sTextBox)/3;
box_edge_H = sprite_get_height(sTextBox)/3;
x1 = 120;
x2 = RES_WIDTH;
box_width = x2 - x1 - 2*box_edge_W;
y1 = RES_HEIGHT - 130;
y2 = RES_HEIGHT;
box_height = y2 - y1 - 2*box_edge_H;

//Text Position
font = fText;
halign = fa_left;
valign = fa_top;
xbuff = 10;
text_height = string_height("M");
rows = floor(box_height/text_height);
ybuff = box_edge_H + (box_height - text_height*rows)*0.5;

//Properties
speaker = -1;
color = c_white;
face = -1;

//Text
text_original = 
	"Default text. So much of this text, it's " +
	"going to drive me so very crazy. Like " +
	"really. It's alooot. Cant believe it. Like " +
	
	"really. It's absolutely insane. I just can " +
	"not believe how much text one can fit into " +
	"some boxes containing nothing but sweet " +
	
	"sweet text. Just that sweet sweet text. Oh " +
	"yeah.";
text_broken = -1;
text = -1;
