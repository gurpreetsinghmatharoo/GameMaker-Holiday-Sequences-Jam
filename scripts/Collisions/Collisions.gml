/// @func		collision
/// @desc
/// @arg		x
/// @arg		y
/// @arg		[floorY]
/// @return
function collision (_x, _y, _floorY) {
	// Optional args
	if (_floorY == undefined) _floorY = room_height;
	
	// Coords
	var _hsp = _x - x;
	var _vsp = _y - y;
	
	var _x1 = bbox_left + _hsp;
	var _y1 = bbox_top + _vsp;
	var _x2 = bbox_right + _hsp;
	var _y2 = bbox_bottom + _vsp;
	
	// Out of bounds
	if (_x1 < 0 || _x2 > room_width || _y1 < 0 || _y2 > _floorY) {
		return true;
	}
	
	// End
	return false;
}