/// @description 
// Gravity
moveY += gravSpeed;

// Jump
if (inputJump && jumpCount < maxJumps) {
	moveY = -jumpSpeed;
	jumpCount ++;
}

// Collisions


// Movement
x += moveX;
y += moveY;