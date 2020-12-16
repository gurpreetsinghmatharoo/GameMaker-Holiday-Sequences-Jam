/// @description 
// Gravity
if (moveY < 20) moveY += gravSpeed;

// States
switch (state) {
	case STATE.IDLE: case STATE.RUN: case STATE.JUMP:
		// Movement
		moveX = lerp(moveX, inputX * moveSpeed, (1 / moveSmooth));

		// Jump
		if (inputJump && jumpCount < maxJumps) {
			moveY = -jumpSpeed;
			jumpCount ++;
		}
		
		// Set state
		if (bbox_bottom < floorY) {
			state_set(STATE.JUMP);
		}
		else if (abs(moveX) > 0.5) {
			state_set(STATE.RUN);
		}
		else {
			state_set(STATE.IDLE);
		}
		
		// Attack
		if (inputAttack) {
			state_set(STATE.ATTACK);
		}
	break;
	
	case STATE.ATTACK:
		
	break;
}

// General state data
stateTime ++;
var _maxTime = stateData[state].duration;
if (_maxTime > 0 && stateTime >= _maxTime) {
	state_set(previousState);
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

// Sprite
sprite_index = stateData[state].sprite;
if (moveX != 0) image_xscale = sign(moveX);