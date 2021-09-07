//Collision
global.collisionMap = -1;
global.mp_map = -1;

//Camera
global.camera = instance_create_layer(0,0,layer,oCamera);

//Other
global.gameState = "Overworld";

//Initialize players and manager
instance_create_depth(0,0,0,oPlayerMain);
instance_create_depth(0,0,0,oPlayerFollow);