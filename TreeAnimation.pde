////CLASS: TREE 
class TreeAnimation {
  //Variables
  boolean inProgress;
  int currentTreeFrame;
  float treeX; //X value for where the tree images should be placed
  float treeY; //Y value for where tree images should be placed
  
  //Constructor
  TreeAnimation() {
    //Set X and Y values for the tree images to be placed
    treeX = 261;
    treeY = 271;
    //Load images
    tree1 = loadImage("Tree_1.PNG");
    tree2 = loadImage("Tree_2.PNG");
    tree3 = loadImage("Tree_3.PNG");
    tree4 = loadImage("Tree_4.PNG");
    tree5 = loadImage("Tree_5.PNG");
    tree6 = loadImage("Tree_6.PNG");
    tree7 = loadImage("Tree_7.PNG");
    tree8 = loadImage("Tree_8.PNG");
    tree9 = loadImage("Tree_9.PNG");
    tree10 = loadImage("Tree_Final.PNG"); //Final color image
    tree11 = loadImage("Tree_Grey.PNG"); //Grey-scale final/resting image
  }
  
  ////Tree Functions
  
  //Draw final tree image when animation isn't in progress
  void drawRestingAnimation() { 
    image(tree11, this.treeX, this.treeY);
  }
   
  //Loop through tree animation images based on what the current frame is
  void update(int frame) {
    if (frame == 0) this.inProgress=true; //Set object variable 'in progress' to true when first called
    if(frame <10) {
      image(tree1, treeX, treeY); //1
    } else if (frame <20) {
      image(tree2, treeX, treeY); //2
    } else if (frame <30) {
      image(tree3, treeX, treeY); //3
    } else if (frame <40) {
      image(tree4, treeX, treeY); //4
    } else if (frame <50) {
      image(tree5, treeX, treeY); //5
    } else if (frame <60) {
      image(tree6, treeX, treeY); //6
    } else if (frame <70) {
      image(tree7, treeX, treeY); //7
    } else if (frame <80) {
      image(tree8, treeX, treeY); //8
    } else if (frame <90) {
      image(tree9, treeX, treeY); //9
    } else if (frame <100) {
      image(tree10, treeX, treeY); //10
    } else if (frame <110) {
      image(tree11, treeX, treeY); //11
    } else if (frame >110) {
      this.inProgress = false; //Update animation to NOT in progress when it's looped through all images
    }
  }
}
