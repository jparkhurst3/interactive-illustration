////CLASS: WATER
class WaterAnimation {
  //Variables
  boolean inProgress;
  int currentWaterAnimationFrame;
  float waveX;
  float waveY;
  float waveMovement; //How far the waves should move one way or the other
  float distancePerFrame; //How far the waves should move each frame, based on number of frames and distance to move (waveMovement)
  
  //Constructor
  WaterAnimation() {
    waveX = 20;
    waveY = 535;
    waveMovement = 30;
    currentWaterAnimationFrame = 0;
    //Load images
    wave1_grey = loadImage("Wave4_Grey.PNG");
    wave2_grey = loadImage("Wave3_Grey.PNG");
    wave3_grey = loadImage("Wave2_Grey.PNG");
    wave4_grey = loadImage("Wave1_Grey.PNG");
    wave1_color = loadImage("Wave4_Color.PNG"); //furthest wave
    wave2_color = loadImage("Wave3_Color.PNG"); 
    wave3_color = loadImage("Wave2_Color.PNG");
    wave4_color = loadImage("Wave1_Color.PNG"); //closest wave
    //Set how far waves should move each frame
    distancePerFrame = this.waveMovement/30;
  }
  
  ////Water Functions
  
  void drawRestingAnimation() {
    //Draw all four waves at their initial position
    image(wave1_grey, this.waveX, this.waveY);
    image(wave2_grey, this.waveX, this.waveY);
    image(wave3_grey, this.waveX, this.waveY);
    image(wave4_grey, this.waveX, this.waveY);
  }
  
  //Given the current frame, draw the images based on where 
  void update(int frame) {
    if (frame == 0) this.inProgress=true;
    if(frame < 30) {
      //calculate how much to move waves
      float distanceToMove = frame*this.distancePerFrame;
      image(wave1_color, this.waveX+distanceToMove, this.waveY); //move wave1 right
      image(wave2_color, this.waveX-distanceToMove, this.waveY); //move wave2 left
      image(wave3_color, this.waveX+distanceToMove, this.waveY); //move wave3 right
      image(wave4_color, this.waveX-distanceToMove, this.waveY); //move wave4 left
    } else if (frame < 60) {
      currentWaterAnimationFrame = 30-(frame-30);
      float distanceToMove = currentWaterAnimationFrame*this.distancePerFrame;
      image(wave1_color, this.waveX+distanceToMove, this.waveY); //move wave1 center from right
      image(wave2_color, this.waveX-distanceToMove, this.waveY); //move wave2 center from left
      image(wave3_color, this.waveX+distanceToMove, this.waveY); //move wave3 center from right
      image(wave4_color, this.waveX-distanceToMove, this.waveY); //move wave4 center from left
    } else if (frame < 90) {
      currentWaterAnimationFrame = 60-frame;
      float distanceToMove = currentWaterAnimationFrame*this.distancePerFrame;
      image(wave1_color, this.waveX-distanceToMove, this.waveY); //move wave1 left
      image(wave2_color, this.waveX+distanceToMove, this.waveY); //move wave2 right
      image(wave3_color, this.waveX-distanceToMove, this.waveY); //move wave3 left
      image(wave4_color, this.waveX+distanceToMove, this.waveY); //move wave4 right
    } else if (frame <120) {
      currentWaterAnimationFrame = 30 -(frame-90);
      float distanceToMove = currentWaterAnimationFrame*this.distancePerFrame;
      image(wave1_color, this.waveX+distanceToMove, this.waveY); //move wave1 center from right
      image(wave2_color, this.waveX-distanceToMove, this.waveY); //move wave2 center from left
      image(wave3_color, this.waveX+distanceToMove, this.waveY); //move wave3 center from right
      image(wave4_color, this.waveX-distanceToMove, this.waveY); //move wave4 center from left
    } else {
      this.inProgress = false;
    }
  }
}
