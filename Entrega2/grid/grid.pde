import processing.sound.*;
import peasy.*;
PeasyCam cam;
SoundFile file;
Amplitude amp;
float ampsuma;
float frameGrid = random(0,100);
int cantidadx = 8;
int cantidady = 5;
PVector[][]coords = new PVector[cantidadx][cantidady];

void setup() {
  setupSuperShapes();
  setupCam3D();
  triggerSetup();
  background(0);
  fullScreen(P3D);
  //size(displayWidth,displayHeight,P3D);
  //size(500, 300, P3D);
  colorMode(HSB, 100);
  
  //cam = new PeasyCam(this, 700);
  file = new SoundFile(this, "CalleLlama.mp3");
  
  float widthi = width/(cantidadx + 1);
  float heighti = height/(cantidady + 1);
  
  for (int i = 0; i < cantidadx; i++){
    for (int j = 0; j < cantidady; j++){
      coords[i][j] = new PVector(widthi*(i+1), heighti*(j+1));
    }
  }
  amp = new Amplitude(this);
  amp.input(note);
  //file.play();
}

void draw() {

  background(0);
  stroke(100);
  strokeWeight(5);

  stroke(0,100,100);
  translate(-width/2, -height/2, 0);
  for (int i = 0; i < cantidadx; i++){
    for (int j = 0; j < cantidady; j++){
      PVector c = coords[i][j];
      line(c.x -30, c.y, c.x +30, c.y);
      line(c.x, c.y -30, c.x, c.y +30);
    }
  }
  
  circle(mouseX, mouseY, 20);
  
  //colorMode(RGB,100);
  drawCam3D();
  //colorMode(HSB,100);
  stroke(color(0,0,100));
  ampsuma = trigger();
  translate(width / 2, height / 2);
  
  rotateX(HALF_PI);
  
  drawSuperShapes(constrain(map(ampsuma, 0, cantidadx*cantidady/20, 0, 1), 0, 1), frameGrid);
  
  //translate(-width/2, -height/2, 0);
  
  
  frameGrid = frameGrid + 0.05;
}
