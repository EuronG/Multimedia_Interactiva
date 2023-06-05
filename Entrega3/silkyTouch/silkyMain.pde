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

float largo_flecha = 100;


void mainSetup(){
  stroke(100);
  colorMode(HSB, 100);
  background(10);
  inct = 0;
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
  translate(width/2, height/2);
  background(0);
  strokeWeight(2);
  
  //EJES
  //stroke(0,100,100);
  //line(-100,0,100,0);
  //stroke(30,100,100);
  //line(0,-100,0,100);
  stroke(0,0,100);
  getUserInput();

  strokeWeight(5);
  line(0, 0, posx*largo_flecha, posy*largo_flecha);
  strokeWeight(10);
  float aangle = atan2(posy, posx);
  float arrowX1 = posx*100 - 10 * cos(aangle - PI / 6);
  float arrowY1 = posy*100 - 10 * sin(aangle - PI / 6);
  float arrowX2 = posx*100 - 10 * cos(aangle + PI / 6);
  float arrowY2 = posy*100 - 10 * sin(aangle + PI / 6);
  triangle(posx*largo_flecha, posy*largo_flecha, arrowX1, arrowY1, arrowX2, arrowY2);
  point(0,0);
  noFill();
  strokeWeight(1);
  circle(0,0, 100*2);
  
  
  inct += 0.01;

}
