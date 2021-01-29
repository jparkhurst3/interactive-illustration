////CLASS: SKY ANIMATION
class SkyAnimation {
  //Sky Animation Variables
  boolean inProgress = false;
  int currentSkyFrame;
  float birdX; //Coordinates for where the images should be placed
  float birdY;
  int birdLoops; //How many time the images should loop for the animation to be 'complete'
  
  //Sky Animation Constructor
  SkyAnimation() {
    birdX = 50;
    birdY = 50;
    birdLoops = 0;//TODO: Is this needed??
    //load images
    bird1 = loadImage("Sky_Grey.png"); //Resting - greyscale illustra
    bird2 = loadImage("Sky_Final.PNG"); //Resting in color
    bird3 = loadImage("Sky_1.PNG"); //Frame 1 of animation
    bird4 = loadImage("Sky_2.PNG"); //Frame 2 of animation
    bird5 = loadImage("Sky_3.PNG"); //Frame 3 of animation
  }
  
  //Sky Animation Functions
  void drawRestingAnimation() {
    image(bird1, birdX, birdY);
  }
  
  //Based on what the current frame is, show a certain bird image
  void update(int frame) {
    if (frame == 0) this.inProgress=true;
    if (this.birdLoops < 4) {
      this.currentSkyFrame++;
      if(currentSkyFrame <10) {
        image(bird2, birdX, birdY); //Image 1
      } else if (currentSkyFrame <17) {
        image(bird3, birdX, birdY); //Image 2
      } else if (currentSkyFrame <24) {
        image(bird4, birdX, birdY); //Image 3
      } else if (currentSkyFrame <32) {
        image(bird5, birdX, birdY); //Image 4
      } else if (currentSkyFrame == 32) {
        //Once the images have looped, increment the birdLoops counter and reset sky frame counter to zero
        this.birdLoops++;
        currentSkyFrame=0;
      }
    } else {
      this.inProgress = false; //Mark as false when complete so animation manager class knows it's also done
    } 
  }
}
