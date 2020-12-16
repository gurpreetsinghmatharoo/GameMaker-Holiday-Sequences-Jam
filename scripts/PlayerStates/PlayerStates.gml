enum STATE {
	IDLE,
	RUN,
	JUMP,
	ATTACK,
	
	_LENGTH
}

function state_set (_state) {
	previousState = state;
	state = _state;
	image_index = 0;
	stateTime = 0;
}

function StateData (_sprite, _duration) constructor {
	sprite = _sprite;
	duration = _duration;
}