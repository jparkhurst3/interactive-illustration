//ITGM719 - Final Project | Joanna Parkhurst | Fall 2020

//Import library for using sounds
import processing.sound.*;

//Initialize Objects
AnimationManager animations; //Parent class for all animations
SkyAnimation sky;
Planet sun, moon;
PlanetAnimation space;
TreeAnimation tree;
WaterAnimation water;
WheatAnimation wheat;
TransparencyHover colorHover;
SoundFile natureSounds;
PFont garamondFont;

//Image variables
PImage sun_image_grey, sun_image_color, moon_image;
PImage bird1, bird2, bird3, bird4, bird5;
PImage tree1, tree2, tree3, tree4, tree5, tree6, tree7, tree8, tree9, tree10, tree11, tree12, tree13, tree14;
PImage wave1_grey, wave2_grey, wave3_grey, wave4_grey, wave1_color, wave2_color, wave3_color, wave4_color;
PImage wheat1, wheat2, wheat3, wheat4, wheat5, wheat6;
PImage border, border_color;

void setup() {
  //Setup sketch file
  size(800, 800);
  background(255);
  println("Setting things up...");
  
  //Load music file for nature/background sounds
  natureSounds = new SoundFile(this, "bird_chirping_sound.mp3");
  natureSounds.play();
  
  //Load Border Images
  border = loadImage("Border_WithText.PNG");
  
  //Load font
  garamondFont = loadFont("AGaramondPro-Regular-24.vlw");
  
  //Initialize objects within animations
  animations = new AnimationManager();
  sky = new SkyAnimation();
  space = new PlanetAnimation();
  tree = new TreeAnimation();
  water = new WaterAnimation();
  wheat = new WheatAnimation();
  colorHover = new TransparencyHover(50);
  
  //Load sun & moon images to initialize planets
  sun_image_grey = loadImage("Sun_Grey.PNG");
  sun_image_color = loadImage("Sun_Color.PNG");
  moon_image = loadImage("Moon.PNG");
  sun = new Planet(598, 80, 200, true, sun_image_grey, sun_image_color);
  moon = new Planet(598, 80, 200, false, moon_image, moon_image);
}

void draw() { 
  if(animations.inProgress) { //If there's an animation in progress, update the animation
    background(255);
    animations.updateAnimation();
    image(border, 0, 0); //Draw border detailing over the background
    //drawText(250, 66);
  } else {
    animations.drawRestingAnimations(); //If not, just draw the animations at rest
    image(border, 0, 0); //Draw border detailing over the background
    colorHover.checkUpdate(mouseX, mouseY);
    //drawText(250, 66);
  }
}

//Function for kicking off an animation given where the mouse is clicked
void mouseClicked() {
  println("X Position: " + mouseX + " & Y Position: " + mouseY);
  if (mouseX>50 && mouseX <235 && mouseY>50 && mouseY<235) { //If user clicks in top-left circle, start sky animation
    println("Starting sky animation!");
    animations.startAnimation(0);
  } else if (mouseX>565 && mouseX <750 && mouseY>50 && mouseY<235) { //if user clicks in top-right corner, start space animation
    println("Starting space animation!");
    animations.startAnimation(1);
  } else if (mouseX>270 && mouseX<530 && mouseY>270 && mouseY<530) { //If user clicks in center, start tree animation
    println("Starting tree animation!");
    animations.startAnimation(2);
  } else if (mouseX>50 && mouseX<235 && mouseY>565 && mouseY<750) { //If user clicks in bottom-left, start water animation
    println("Starting water animation!");
    animations.startAnimation(3);
  } else if (mouseX>565 && mouseX<750 && mouseY>565 && mouseY<750) { //If user clicks in bottom-right, start wheat animation
    println("Starting wheat animation!");
    animations.startAnimation(4);
  }
}

void drawText(int x, int y) {
  textFont(garamondFont, 24);
  fill(13, 29, 53);
  text("THE SACRAMENTO DELTA", x, y);
  //pushMatrix();
  //translate(x, y);
  //rotate(PI/2);
  //translate(-x, -y);
  //textFont(garamondFont, 24);
  //fill(255, 0, 0);
  //text("THE SACRAMENTO DELTA", x, y);
  //popMatrix();
}
