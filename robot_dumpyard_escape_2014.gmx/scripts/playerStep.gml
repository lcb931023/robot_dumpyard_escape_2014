// Takes string argument0 to determine which direction to rotate
rotType = argument0; // "l" or "r"
r = sprite_width/2;
dir_rad = degtorad(direction);

if (rotType=="l")
{
    // Use right edge as pivot
    pivotX = x + cos(dir_rad) * r;
    pivotY = y - sin(dir_rad) * r;
    // rot
    direction -= torque_l;
    dir_rad = degtorad(direction); //update
    x = pivotX - cos(dir_rad) * r;
    y = pivotY + sin(dir_rad) * r;
}

if (rotType=="r")
{
    // Use left edge as pivot
    pivotX = x - cos(dir_rad) * r;
    pivotY = y + sin(dir_rad) * r;
    // rot
    direction += torque_r;
    dir_rad = degtorad(direction); //update
    x = pivotX + cos(dir_rad) * r;
    y = pivotY - sin(dir_rad) * r;
}

image_angle = direction;
