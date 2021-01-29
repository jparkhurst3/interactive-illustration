////CLASS: WHEAT
class WheatAnimation {
  //Variables
  boolean inProgress;
  float wheatX; //Coordinates for wheat images
  float wheatY;
  
  //Constructor
  WheatAnimation() { 
    wheatX = 575;
    wheatY = 580;
    inProgress = false;
    //Load Images
    wheat1 = loadImage("Wheat_1.PNG");
    wheat2 = loadImage("Wheat_2.PNG");
    wheat3 = loadImage("Wheat_3.PNG");
    wheat4 = loadImage("Wheat_4.PNG");
    wheat5 = loadImage("Wheat_Color.PNG"); //Final color wheat
    wheat6 = loadImage("Wheat_Grey.PNG"); //Blue / at rest wheat
  }
  
  //Draw final wheat image
  void drawRestingAnimation() {
    image(wheat6, wheatX, wheatY);
  }
  
  //Loop through wheat animations based on current frame
  void update(int frame) {
    if (frame == 0) this.inProgress=true;
    if (frame<10) {
      image(wheat1, wheatX, wheatY); //1
    } else if (frame<20) {
      image(wheat2, wheatX, wheatY); //2
    } else if (frame<30) {
      image(wheat3, wheatX, wheatY); //3
    } else if (frame<40) {
      image(wheat4, wheatX, wheatY); //4
    } else if (frame<50) {
      image(wheat5, wheatX, wheatY); //5
    } else if (frame<60) {
      image(wheat6, wheatX, wheatY); //6 - final
    } else {
      this.inProgress = false;
    }
  }
}
