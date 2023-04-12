import processing.video.*;

//SoundFile music;
Capture video;
PeasyCam cam2;

void setupCam3D(){
  //music = new SoundFile(this, "sounds/FL_80NL_Kit01_90_E/FL_80NL_Kit01_90_Drum_Loops/FL_80NL_Kit01_90_Drum_Loop_Kick.wav");
  //music.play();
  
  cam2 = new PeasyCam(this, 1000);
  cam2.setMinimumDistance(5);
  cam2.setMaximumDistance(1300);
  //frameRate(30);
  String[] devices = Capture.list();
  video = new Capture(this, devices[0]);
  video.start();
}

void drawCam3D() {
  
  
  noFill();
  lights();
  strokeWeight(2);
  background(0);

  pushMatrix();
  //translate(width/2, height/2, 0);

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
      float distance=dist(r, g, b, 0, 100, 100);
      if (r<20 || r>200){
         stroke(pixelValue);
      }else{
         stroke(180,100,100);
      }
      vertex(x, y, bright / 1.2 + 100);
    }
    endShape();
  }

  popMatrix();

}
