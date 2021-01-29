////CLASS: PLANET
class Planet {
  ////Planet Variables
  float xCoordinate; //Where the planet should be initially placed (and at rest)
  float yTop;
  float yBottom; //Where the planet should move down to when it's 'setting'
  boolean current;
  float[] yTop2Bottom; //Array of y values for lowering planet given a number of frames - initialized within lowering_raising_init()
  float[] yBottom2Top; //Array of y valudes for raising planet given a number of frames - initialized within lowering_raising_init()
  PImage planetImageAtRest;
  PImage planetImageInColor;
  
  ////Planet Constructor: takes in xCoordinate, yTop, yBottom, size, color
  Planet(float xCoord, float yT, float yB, boolean curr, PImage planetRest, PImage planetInColor) {
    xCoordinate = xCoord;
    yTop = yT;
    yBottom = yB;
    current = curr;
    lowering_raising_init(10);
    planetImageAtRest = planetRest;
    planetImageInColor = planetInColor;
  }
  
  ////Planet Functions
  //Draw planet when it's at rest (not being animated)
  void draw_planet() {
    image(planetImageAtRest, this.xCoordinate, this.yTop);
  }
  
  //Create an array of x values for where the planet should move at each frame based on number of frames and distance to move
  void lowering_raising_init(int frames) {
    
    float distance = this.yBottom - this.yTop;
    float distancePerFrame = distance/frames;
    
    //Set values for Top2Bottom array - used for lowering a planet
    this.yTop2Bottom = new float[frames];
    float current = this.yTop;
    for(int i=0; i<frames; i++) {
      this.yTop2Bottom[i] = current+distancePerFrame;
      current = this.yTop2Bottom[i];
    }
    
    //Set values for Bottom2Top array - used for raising a planet
    this.yBottom2Top = new float[frames];
    current = this.yBottom;
    for(int i=0; i<frames; i++) {
      this.yBottom2Top[i] = current-distancePerFrame;
      current = this.yBottom2Top[i];
    }
  }
  
  void draw_updated_planet(int currFrame, boolean lowering) {
    float currentYValue = 0;
    if(lowering) {
      currentYValue = this.yTop2Bottom[currFrame];
    } else {
      currentYValue = this.yBottom2Top[currFrame];
    }
    //fill(this.planetColor);
    //circle(this.xCoordinate, currentYValue, this.size);
    
    
    image(planetImageInColor, this.xCoordinate, currentYValue);
  }
}
