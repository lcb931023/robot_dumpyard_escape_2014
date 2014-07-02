/* Movement
 * The players each handles a key: left ctrl and right ctrl.
 * When one of the key is pressed, the robot starts waddling 
 * by rotating its whole body around the other end of the pressed direction.
 * Whenever player releases that key or whenever the other player presses,
 * the waddle will stop/change


 */


// Check for release   
if keyboard_check_released(vk_control)
   {
   canOverrideStep = true;
   //show_debug_message("RELEASE");
   }
   
// Check for press
if keyboard_check_direct(vk_lcontrol)
   {
   if (stepping_lc)
       {
       // If it's already stepping, keep going.
       if (torque_l<torque_max) {torque_l += torque_accel;}
       playerStep("l");
       } else if (canOverrideStep)
       {
       // If it's not, check if it can interrupt the other's step
       canOverrideStep = false;
       stepping_lc = true;
       stepping_rc = false;
       // reset the torque to 0, then start stepping
       torque_l = 0;
       playerStep("l");
       }
   
}
   
if keyboard_check_direct(vk_rcontrol)
   {
   if (stepping_rc)
       {
       if (torque_r<torque_max) {torque_r += torque_accel;}
       playerStep("r");
       } else if (canOverrideStep)
       {
       canOverrideStep = false;
       stepping_rc = true;
       stepping_lc = false;
       torque_r = 0;
       playerStep("r");
       }
   }
   
