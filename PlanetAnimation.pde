////CLASS: PLANET ANIMATION
class PlanetAnimation {
  ////Animation Variables
  boolean inProgress = false;
  int currentPlanetFrame;
  
  ////Animation Constructor
  PlanetAnimation() {
  }
  
  ////Animation Functions
  void drawRestingAnimation() {
    sun.draw_planet();
  }
  
  //Update function manages how individual planets move to set the sun, raise the moon, set the moon, and then raise the sun
  void update(int frame) {
    if (frame == 0) this.inProgress=true;
    if(frame%5==0) currentPlanetFrame++; //Only increment the current frame every 5 frames to slow down the animation
    if(currentPlanetFrame <10) { 
      sun.draw_updated_planet(currentPlanetFrame, true); //Lower the sun
    } else if (currentPlanetFrame <20) {
      //Pause animation, neither moon or sun drawn
    } else if (currentPlanetFrame <30) { 
      moon.draw_updated_planet(currentPlanetFrame-20, false); //Raise the moon
    } else if (currentPlanetFrame <40) {
      moon.draw_planet(); //Pause animation, draw the moon at rest
    } else if (currentPlanetFrame <50) { 
      moon.draw_updated_planet(currentPlanetFrame-40, true); //Lower the moon
    } else if (currentPlanetFrame <60) { 
      sun.draw_updated_planet(currentPlanetFrame-50, false); //Raise the sun
    } else {
      inProgress = false;
    }
  }
}
