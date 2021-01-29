////CLASS: ANIMATION MANAGER
class AnimationManager {
  ////Animation Manager Variables
  boolean inProgress; //In progress variable helps determine interaction rules
  int currentInProgressAnimation; //Variable for which animation is currently in progress
  int currentFrame; //Counter for the current frame of the animation - passed down to individual animation when update() is called
  
  ////Animation Manager Constructor
  AnimationManager() {
  }
  
  ////Animation Manager Functions
  //Start Animation is called when the mouse is clicked - animation number is based on where the mouse is clicked
  void startAnimation(int animationNumber) {
    currentFrame = 0; //Reset current frame counter
    this.inProgress = true; //Set animation manager variable to in progress
    this.currentInProgressAnimation = animationNumber; //Set which animation is in progress
    switch(animationNumber) {
      case 0:
        sky.update(0); //Start SKY animation
        break;
      case 1:
        space.update(0); //Start SPACE animation
        break;
      case 2:
        tree.update(0); //Start TREE animation
        break;
      case 3:
        water.update(0); //Start WATER animation
        break;
      case 4:
        wheat.update(0); //Start WHEAT animation
        break;
      default: //Error case
        println("Animation number not found - cannot start animation.");
        break;
    }
    currentFrame++; //Increment current frame counter since .update has just been called for the first time
  }
  
  //If there's an animation in progress, call which one is in progress to update
  void updateAnimation() {
    background(255); //Clear background
    //Draw updated animation
    switch(this.currentInProgressAnimation) {
      case 0: //SKY ANIMATION
        if(sky.inProgress == false) { //Check if animation has just ended, and updated to in progress = false...
          this.inProgress = false; //If so, Update the animation manager to also be false
        } else {
          sky.update(currentFrame); //Otherwise, update the sky animation & increment the currentFrame counter
          currentFrame++;
        }
        break;
      case 1: //SPACE ANIMATION
        if(space.inProgress == false) { //Check if animation has just ended, and updated to in progress = false...
          this.inProgress = false; //If so, Update the animation manager to also be false
        } else {
          space.update(currentFrame); //Otherwise, update the space animation & increment the currentFrame counter
          currentFrame++;
        }
        break;
      case 2: //TREE ANIMATION
        if(tree.inProgress == false) { //Check if animation has just ended, and updated to in progress = false...
          this.inProgress = false; //If so, Update the animation manager to also be false
        } else {
          tree.update(currentFrame); //Otherwise, update the tree animation & increment the currentFrame counter
          currentFrame++;
        }
        break;
      case 3: //WATER ANIMATION
        if(water.inProgress == false) { //Check if animation has just ended, and updated to in progress = false...
          this.inProgress = false; //If so, Update the animation manager to also be false
        } else {
          water.update(currentFrame); //Otherwise, update the water animation & increment the currentFrame counter
          currentFrame++;
        }
        break;
      case 4: //WHEAT ANIMATION
        if(wheat.inProgress == false) { //Check if animation has just ended, and updated to in progress = false...
          this.inProgress = false; //If so, Update the animation manager to also be false
        } else {
          wheat.update(currentFrame); //Otherwise, update the wheat animation & increment the currentFrame counter
          currentFrame++; 
        }
        break;
    }
    
    //Draw all other animations at rest after the inProgress animation has been updated and drawn
    if(this.currentInProgressAnimation != 0) sky.drawRestingAnimation();  
    if(this.currentInProgressAnimation != 1) space.drawRestingAnimation();
    if(this.currentInProgressAnimation != 2) tree.drawRestingAnimation();
    if(this.currentInProgressAnimation != 3) water.drawRestingAnimation();
    if(this.currentInProgressAnimation != 4) wheat.drawRestingAnimation();
  }
  
  void drawRestingAnimations() {
    background(255);
    sky.drawRestingAnimation();
    space.drawRestingAnimation();
    tree.drawRestingAnimation();
    water.drawRestingAnimation();
    wheat.drawRestingAnimation();
  }
}
