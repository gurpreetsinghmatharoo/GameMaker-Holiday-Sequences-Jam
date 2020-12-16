/// @description 
inputX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
inputJump = keyboard_check_pressed(vk_space);

// Grounded?
grounded = bbox_bottom >= floorY;

// Reset jumps
if (grounded) {
	jumpCount = maxJumps;
}