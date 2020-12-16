/// @description 
// Movement multiplier
var _moveMul = 1;

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
		if (inputAttack && attackCooldown <= 0) {
			state_set(STATE.ATTACK);
			
			attackCooldown = attackTime;
		}
		
		attackCooldown -= attackCooldown > 0;
	break;
	
	case STATE.ATTACK:
		_moveMul = 0.2;
	break;
}

// General state data
stateTime ++;
var _maxTime = stateData[state].duration;
if (_maxTime > 0 && stateTime >= _maxTime) {
	state_set(previousState);
}

// Collisions
var _moveX = moveX * _moveMul;
var _moveY = moveY * _moveMul;

if (collision(x + _moveX, y, floorY)) {
	repeat (abs(_moveX)) {
		if (collision(x + sign(_moveX), y, floorY)) {
			break;
		}
		x += sign(_moveX);
	}
	_moveX = 0;
	moveX = 0;
}

if (collision(x, y + _moveY, floorY)) {
	repeat (abs(_moveY)) {
		if (collision(x, y + sign(_moveY), floorY)) {
			break;
		}
		y += sign(_moveY);
	}
	_moveY = 0;
	moveY = 0;
}

// Movement
x += _moveX;
y += _moveY;

// Sprite
sprite_index = stateData[state].sprite;
if (moveX != 0) image_xscale = sign(moveX);