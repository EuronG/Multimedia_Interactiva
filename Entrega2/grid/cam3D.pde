import processing.video.*;

//SoundFile music;
Capture video;
PeasyCam cam2;

void setupCam3D(){
  //music = new SoundFile(this, "sounds/FL_80NL_Kit01_90_E/FL_80NL_Kit01_90_Drum_Loops/FL_80NL_Kit01_90_Drum_Loop_Kick.wav");
  //music.play();
  
  cam2 = new PeasyCam(this, 1000);
  cam2.setMinimumDistance(5);
  cam2.setMaximumDistance(1500);
  //frameRate(30);
  String[] devices = Capture.list();
  video = new Capture(this, width, height, devices[0]);
  video.start();
}

void drawCam3D() {
  
  
  noFill();
  lights();
  strokeWeight(2);
  //background(0);

  pushMatrix();
  //translate(width/2, height/2, 0);

  if (video.available()) {
    video.read();
    video.loadPixels();
  }
  tint(255, 0);
  image(video,0,0);
  for (int y = 0; y < video.height; y += 15) {
    beginShape();
    for (int x = 0; x < video.width; x++) {
      
      int index = (x + y * video.width);
      color pixelValue = video.pixels[index];
      
      color hsbColor = color(hue(pixelValue), saturation(pixelValue), brightness(pixelValue)); // Convertir a formato HSB

      //float distance=dist(r, g, b, 0, 100, 100);
      if ((hue(hsbColor)<10 || hue(hsbColor)>340) && saturation(hsbColor)>60 && brightness(hsbColor)>60) {
         stroke(frameGrid ,100,100);
         for (int i = 0; i < cantidadx; i++) {
            if (x > coords[i][0].x -50 && x< coords[i][0].x +50){
              for (int j = 0; j < cantidady; j++){
                if (y > coords[i][j].y -50 && y < coords[i][j].y +50){
                  boolCoords[i][j] = true;
                }
              }
            }
          }
      }else{
         stroke(hsbColor);
      }
      vertex(x, y, brightness(pixelValue) * 1.3 + 100);
    }
    endShape();
  }

  popMatrix();

}
