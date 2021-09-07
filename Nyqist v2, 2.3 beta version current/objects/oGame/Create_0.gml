//randomize();

//Room transitions
global.newX = 80;
global.newY = 85;
global.newRoom = rStart;
global.newDir = 0;
room_goto(global.newRoom);

//Size rooms
surface_resize(application_surface,RES_WIDTH,RES_HEIGHT);
scale = 2;
d_scale = 1.5;

//Other
draw_set_font(fText);
global.debug = true;
global.paused = false;
global.LunaMain = true;

//Game state info
global.gameState = "Overworld"; //"Overworld", "Combat", "Menu"
global.combatData = new CombatData(-1,-1,-1,-1,-1);
global.combatDespawnList = ds_list_create();

//Create Luna
var _luna_info = CharacterInfo("Lunavelle","Luna",1);
var _luna_sprite = CharacterSpritePackage(sCaper,sCaperWalk,-1,-1,-1,-1);
var _luna_face = CharacterSpriteFace(sCaperFace,-1,-1,-1,-1);
var _luna_text = CharacterText(_luna_face,c_pink);
var _luna_equipped = CharacterEquipped(1,2,0,-1,-1,-1,-1,-1);
var _luna_base_stat = CharacterStat(100,10,5,5,10,10,10,5,5,5,10,10);
global.Luna = new CharacterBuild(_luna_info,_luna_sprite,_luna_text,_luna_base_stat,_luna_equipped);

//Create Oscar
var _oscar_info = CharacterInfo("Orzeg","Oscar",1);
var _oscar_sprite = CharacterSpritePackage(sCapey,sCapeyWalk,-1,-1,-1,-1);
var _oscar_face = CharacterSpriteFace(sCapeyFace,-1,-1,-1,-1);
var _oscar_text = CharacterText(_oscar_face,c_lime);
var _oscar_equipped = CharacterEquipped(1,0,-1,0,-1,-1,-1,-1);
var _oscar_base_stat = CharacterStat(50,10,10,10,5,5,5,10,10,10,10,10);
global.Oscar = new CharacterBuild(_oscar_info,_oscar_sprite,_oscar_text,_oscar_base_stat,_oscar_equipped);

global.Recall = false;