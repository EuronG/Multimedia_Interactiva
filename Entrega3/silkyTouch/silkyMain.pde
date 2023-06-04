import peasy.*;

PeasyCam cam;
ControlIO control;
ControlDevice gamepad;


void setup(){
  //cam = new PeasyCam(this, 700);
  control = ControlIO.getInstance(this);
  ControlIO control = ControlIO.getInstance(this);
  //print(control.getDevices());
  
 
  gamepad = control.getMatchedDevice("gamepadXbox");
  
  
  size(1000, 800, P3D);
  stroke(100);
  colorMode(HSB, 100);
  background(10);
}

void draw(){
  line(100,100,100,500,500,500);
}
