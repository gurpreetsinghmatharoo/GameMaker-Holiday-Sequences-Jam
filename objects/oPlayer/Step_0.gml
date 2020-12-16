/// @description 
// Movement
moveX += inputX * moveSpeed;

// Gravity
if (moveY < 10) moveY += gravSpeed;

// Jump
if (inputJump && jumpCount < maxJumps) {
	moveY = -jumpSpeed;
	jumpCount ++;
}

// Collisions
if (collision(x + moveX, y, floorY)) {
	repeat (abs(moveX)) {
		if (collision(x + sign(moveX), y, floorY)) {
			break;
		}
		x += sign(moveX);
	}
	moveX = 0;
}

if (collision(x, y + moveY, floorY)) {
	repeat (abs(moveY)) {
		if (collision(x, y + sign(moveY), floorY)) {
			break;
		}
		y += sign(moveY);
	}
	moveY = 0;
}

// Movement
x += moveX;
y += moveY;