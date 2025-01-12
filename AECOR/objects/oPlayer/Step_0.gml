var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A")); //left-right movement
var jump = keyboard_check_pressed(vk_space); //jump movement
var onTheGround = place_meeting(x, y + 1, oWall); //check if player is on ground


if (xDirection != 0) image_xscale = xDirection;

xSpeed = xDirection * spd;
ySpeed++; //gravity
if (ySpeed > 10) ySpeed = 10;


if (onTheGround) {
	ySpeed = 0;
	if (xDirection != 0) { sprite_index = sPlayerRun; } //running animation
	else { sprite_index = sPlayerIdle; } //idle animation

	if (jump) {
		ySpeed = -15;
	}
} else {
	sprite_index = sPlayerJump; //jumping animation in air
}

if (place_meeting(x + xSpeed, y, oWall)) {  //wall collision handling
	
	while (!place_meeting(x + sign(xSpeed), y, oWall)) { 
		x += sign(xSpeed);
	}
	xSpeed = 0; 
}

x += xSpeed;

//vertical collision handling
if (place_meeting(x, y + ySpeed, oWall)) { 
	
	while (!place_meeting(x, y + sign(ySpeed), oWall)) {
		y += sign(ySpeed);
	}
	
	ySpeed = 0; 
}

y += ySpeed;

