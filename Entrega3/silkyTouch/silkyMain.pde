import peasy.*;
import processing.opengl.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

PeasyCam cam;
ControlIO control;
ControlDevice gpad;
float posx, posy, posz, viewx, viewy;
float inct;
float[] actualView;

float largo_flecha = 300;
float distanciaCam = 700;


void mainSetup(){
  stroke(100);
  colorMode(HSB, 100);
  background(10);
  inct = 0;
  actualView = cam.getPosition();
  print(actualView[0],actualView[1],actualView[2]);
}

public void getUserInput() {
  // Either button will dilate pupils
  //posx = map(gpad.getSlider("leftX").getValue(), -1, 1, -100, 100);
  posx = gpad.getSlider("leftX").getValue();
  //posy = map(gpad.getSlider("leftY").getValue(), -1, 1, -100, 100);
  posy = gpad.getSlider("leftY").getValue();
  //posz = map(gpad.getSlider("axisZ").getValue(), -1, 1, 0, 1000);
  viewx = map(gpad.getSlider("rightX").getValue(), -1, 1, -0.1, 0.1);
  viewy = map(gpad.getSlider("rightY").getValue(), -1, 1, -0.1, 0.1);
  
  if (abs(posx) < 0.05) {
    posx = 0;
  }
  if (abs(posy) < 0.05) {
    posy = 0;
  }
  if (abs(viewx) < 0.01) {
    viewx = 0;
  }
  if (abs(viewy) < 0.01) {
    viewy = 0;
  }
}

void mainDraw(){
  background(0);
  strokeWeight(2);
  actualView = cam.getPosition();
  
  //EJES
  stroke(0,100,100);
  line(-100,0,0,100,0,0);
  stroke(30,100,100);
  line(0,-100,0,0,100,0);
  stroke(70,100,100);
  line(0,0,-100,0,0,100);
  stroke(100,0,100);
  getUserInput();

  strokeWeight(5);
  line(0, 0, 0, posx*largo_flecha*actualView[2]/distanciaCam, posy*largo_flecha, -posx*actualView[0]*largo_flecha/distanciaCam);
  strokeWeight(10);
  point(posx*largo_flecha*actualView[2]/distanciaCam, posy*largo_flecha, -posx*actualView[0]*largo_flecha/distanciaCam);
  
  print("\n");
  print(posx*100+actualView[2]/distanciaCam);
  
  cam.rotateY(viewx);
  
  inct += 0.01;
  print(actualView[0],actualView[1],actualView[2]);
}
