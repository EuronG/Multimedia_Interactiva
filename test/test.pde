import processing.sound.*;
import processing.video.*;
import peasy.*;

SoundFile music;
Capture video;
PeasyCam cam;

void setup(){
  size(1080, 720, P3D);
  music = new SoundFile(this, "3d.wav");
  //music.play();
  
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(1000);
  frameRate(30);
  String[] devices = Capture.list();
  video = new Capture(this, devices[0]);
  video.start();
}

void draw() {
  noFill();
  lights();
  strokeWeight(2);
  background(100, 5, 45);

  pushMatrix();
  translate(-width/2, -height/2, 0);

  if (video.available()) {
    video.read();
    video.loadPixels();
  }
  tint(255, 0);
  image(video,0,0);
  for (int y = 0; y < video.height; y += 4) {
    beginShape();
    for (int x = 0; x < video.width; x++) {
      
      int index = (x + y * video.width);
      color pixelValue = video.pixels[index];
      int r = (int) red(pixelValue);
      int g = (int) green(pixelValue);
      int b = (int) blue(pixelValue);
      
      int bright = (r + g + b) / 3;

      
      stroke(0, bright, 924, 390);
      vertex(x, y, bright / 1.2 - 100);
    }
    endShape();
  }

  popMatrix();
}
