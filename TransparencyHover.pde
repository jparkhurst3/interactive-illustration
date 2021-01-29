////CLASS: TRANSPARENCYHOVER
class TransparencyHover {
  //Variables
  int currentMouseXLocation; //global variable for tracking mouse location
  int currentMouseYLocation;
  color currentColor; //Variable for storing a color from the background color image to the transparency shape
  color[] shapeColorValues; //Array of colors for the shape, a 1D array of length width*width
  int shapeWidth;
  int xStart, xEnd, yStart, yEnd; //Trackers for where the shape should start and end, stored globally so only needs to be calculated once
  
  //Constructor
  TransparencyHover(int sWidth) {
    //Load the image and individual pixel values
    border_color = loadImage("Border_Color.PNG");
    border_color.loadPixels();
    //Create initial values for the object's variables
    currentMouseXLocation = 0;
    currentMouseYLocation = 0;
    currentColor = color(0, 0, 0);
    shapeWidth = sWidth;
    shapeColorValues = new color[shapeWidth*shapeWidth]; //create array for shape color values
    //Set initial values for the array
    for(int i=0; i<2500; i++) {
      shapeColorValues[i] = currentColor;
    }
  }
  
  ////Functions
  
  //Check whether the mouse is on screen, called update/draw functions if so
  void checkUpdate(int mX, int mY) { //mX & mY is the current X, Y location of the mouse
    if(mX>0 && mX<800 && mY>0 && mY<800) {
      //Update current mouse location variables
      this.currentMouseXLocation = mX;
      this.currentMouseYLocation = mY;
      updateTransparencyShape();
      drawTransparencyShape();
    }
  }
  
  //Update shape    
  void updateTransparencyShape() {
    //Based on where mouse currently is, define where the shape should start & end
    //We want the mouse to be in the center of a square, so using shapeWidth/2 to calculate a start and end values for both X and Y
    this.xStart = this.currentMouseXLocation-(this.shapeWidth/2);
    this.xEnd = this.currentMouseXLocation+(this.shapeWidth/2);
    this.yStart = this.currentMouseYLocation-(this.shapeWidth/2);
    this.yEnd = this.currentMouseYLocation+(this.shapeWidth/2);
    
    //Initialize counters for traversing through array of both the background image and shape, starting with the top-left corner
    int currentX = xStart;
    int currentY = yStart; 
    
    //For each pixel in the shape area, update the shape colors to the background image colors
    for (int i=0; i<(this.shapeWidth*this.shapeWidth); i++) {
      //For each row...
      if(currentY < yEnd) {
        //For each column...
        if(currentX < xEnd) {
          this.currentColor = border_color.get(currentX, currentY); //set the current color to the background image color at that point
          shapeColorValues[i] = this.currentColor; //update the color array with that new value
          currentX++; //move counter to next column
        } else { //once hit end of row
          this.currentColor = border_color.get(currentX, currentY); //get the value for the last column
          shapeColorValues[i] = this.currentColor; //set to the color array
          currentX = xStart; //move counter to start of next column
          currentY++; //move down a row
        }
      }
    }
  }
  
  //Draw each color in the shapeColorValues array as a point, creating a square shape through individual points
  void drawTransparencyShape() {
    //Create tracking variables to map the shapeColorValue index to an X and Y value
    int currentX = this.xStart;
    int currentY = this.yStart;
    
    //For each value in shapeColorValues...
    for(int i=0; i<(this.shapeWidth*this.shapeWidth); i++) {
      //Set the current color to that color
      this.currentColor = shapeColorValues[i];
      
      //Draw a point with that color value at the current X, Y values
      stroke(this.currentColor); 
      point(currentX, currentY);
      
      //Update the tracking pointers
      currentX++; //move to the next column
      if(currentX > this.xEnd) { //once we've reached the end of a row
        currentX = this.xStart; //loop the x value back to the start
        currentY++; //increment the row
      }
    }
  }
}
