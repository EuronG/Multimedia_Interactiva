void setup(){
  //cam = new PeasyCam(this, distanciaCam);
  control = ControlIO.getInstance(this);
  ControlIO control = ControlIO.getInstance(this);
 
  gpad = control.getMatchedDevice("gamepadXbox");  

  
  //size(1800, 1000);
  fullScreen();
  audioSetup();
  mainSetup();
  touchSetup();
  segundaSetup();
}

void draw(){
  mainDraw();
  translate(-width/2,-height/2);
  touchDraw();
  translate(width/2,height/2);
  
  if (keyPressed && key == 's') {
    guardarPantalla();
  }
  if (keyPressed && key == '1') {
    type=1;
  }
  if (keyPressed && key == '2') {
    type=2;
  }
  if (keyPressed && key == '3') {
    type=3;
  }
  if (keyPressed && key == '4') {
    type=4;
  }
  if (keyPressed && key == '5') {
    type=5;
  }
  if (keyPressed && key == '6') {
    type=6;
  }
  if (keyPressed && key == '7') {
    type=7;
  }
  audioDraw();
}
void mousePressed() {
  if (mouseButton == RIGHT) {
     lanzarParticulas2(100, mouseX-width/2 , mouseY-height/2, random(10));
     if (type==2){
            note2.play();
     }else{
      note.play(); 
     }
  }
}
