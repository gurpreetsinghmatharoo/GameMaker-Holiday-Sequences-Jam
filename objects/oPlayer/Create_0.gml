/// @description 
// World
floorY = bbox_bottom+2;

// States
state = STATE.IDLE;
stateTime = 0;

previousState = STATE.IDLE;

// State data
stateData = array_create(STATE._LENGTH);

stateData[STATE.IDLE] = new StateData(sPlayerIdle, -1);
stateData[STATE.RUN] = new StateData(sPlayerRun, -1);
stateData[STATE.JUMP] = new StateData(sPlayerJump, -1);
stateData[STATE.ATTACK] = new StateData(sPlayerAttack, 20);

// Movement
moveX = 0;
moveY = 0;
moveSpeed = 8;
moveSmooth = 4;

inputX = 0;
inputJump = 0;
inputAttack = 0;

jumpSpeed = 20;
gravSpeed = 1;

grounded = false;

// Jumps
maxJumps = 2;
jumpCount = 0;