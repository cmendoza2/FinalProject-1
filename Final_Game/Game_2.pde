class Game2 {

  PImage mazeLevel1;
  PImage mazeLevel2;
  PImage mazeLevel3;
  boolean endScreen = false; 
  int x; 
  PImage LoadingScreenMaze;
  boolean INTROMAZE;
  int IntroMazeTime;

  Game2() {
    size(550, 500);
    mazeLevel1 = loadImage ("maze.png");
    mazeLevel2 = loadImage ("elephant.png");
    mazeLevel3 = loadImage ("lion.png");
    LoadingScreenMaze = loadImage("LoadingScreenMaze.png");
    INTROMAZE = true;
  }

  void intromaze() {
    if (INTROMAZE) {
      if (millis() < 10000) {
        background(LoadingScreenMaze);
      }
      else {
        IntroMazeTime = millis()+4000;
        INTROMAZE = false;
      }
    }
  }

  void display() {
    if (!INTROMAZE) { 
      if (x == 0) {
        background (mazeLevel1);
        fill (84, 160, 141); 
        rect (495, 280, 50, 40);
        if ( get (mouseX, mouseY) == color(133, 161, 84)) { //when you hit maze levels in level 1 (green)
          endScreen = true;
        }
        if (get (mouseX, mouseY) == color (84, 160, 141)) { //teal box
          x++;
        }
      }
      if (x==1) {
        background (mazeLevel2);
        fill (128, 128, 255); //lavender box
        rect ( 120, 0, 80, 30);
        if  (get (mouseX, mouseY) == color (84, 160, 141)) {
        }
      }
      if (get (mouseX, mouseY) == color (128, 128, 255)) {
        x++;
      }
      if (x == 2) {
        background (mazeLevel3);
      }
      if (get (mouseX, mouseY) == color (212, 153, 9)) {
        endScreen = true;
      }
      if (endScreen == true) {
        background (0);
        fill(255);
        textSize(50);
        textAlign(CENTER);
        text("Game Over", width/2, height/2);
      }
    }
    if (get (mouseX, mouseY) == color (46, 108, 164)) { //when you hit maze walls in level 2 (blue)
      endScreen = true;
    }
  }
}

