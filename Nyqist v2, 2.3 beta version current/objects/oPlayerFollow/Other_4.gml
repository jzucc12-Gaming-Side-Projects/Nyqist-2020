if(global.newX != -1)
{
	direction = global.newDir;
	switch(DIRECTION_FACING)
	{
		case 0:
		case 4:
			x = global.newX - boundary;
			y = global.newY;
			break;
		case 1:
			x = global.newX;
			y = global.newY + boundary;
			break;
		case 2:
			x = global.newX +  boundary;
			y = global.newY;
			break;
		case 3:
			x = global.newX;
			y = global.newY - boundary;
			break;
	}
}