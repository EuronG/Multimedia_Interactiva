void setup(){
  //cam = new PeasyCam(this, distanciaCam);
  control = ControlIO.getInstance(this);
  ControlIO control = ControlIO.getInstance(this);
 
  gpad = control.getMatchedDevice("gamepadXbox");  
  if (gpad == null) {
    exit();
  }
  
  size(1800, 1000);
  
  mainSetup();
  touchSetup();
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
}
