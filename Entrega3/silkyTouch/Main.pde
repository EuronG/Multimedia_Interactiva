void setup(){
  cam = new PeasyCam(this, distanciaCam);
  control = ControlIO.getInstance(this);
  ControlIO control = ControlIO.getInstance(this);
 
  gpad = control.getMatchedDevice("gamepadXbox");  
  
  size(1000, 800, OPENGL);
  
  mainSetup();
  //touchSetup();
}

void draw(){
  mainDraw();
  //translate(-width/2,-height/2);
  //touchDraw();
  //translate(width/2,height/2);
}
