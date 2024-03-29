import peasy.*;
import processing.opengl.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

PeasyCam cam;
ControlIO control;
ControlDevice gpad;
float posx, posy, posz, viewx, viewy;
float tiempo, xcircle, ycircle;
float gatillos;
boolean btA;

float largo_flecha = 60;


void mainSetup(){
  stroke(100);
  colorMode(HSB, 100);
  background(10);
  xcircle = 0;
  ycircle = 0;
}

public void getUserInput() {
  if (gpad == null){
    posx = map(mouseX - width/2, -width/2, width/2, -1, 1);
    posy = map(mouseY - height/2, -height/2, height/2, -1, 1);
    viewx = 0;
    viewy = 0;
    posz = 0;
    
    if (mouseButton == LEFT){
      btA = true;
    } else {
      btA = false;}
    return;
  } 
  // Either button will dilate pupils
  //posx = map(gpad.getSlider("leftX").getValue(), -1, 1, -100, 100);
  posx = gpad.getSlider("leftX").getValue();
  //posy = map(gpad.getSlider("leftY").getValue(), -1, 1, -100, 100);
  posy = gpad.getSlider("leftY").getValue();
  posz = gpad.getSlider("axisZ").getValue();
  //print(abs(posz));
  viewx = map(gpad.getSlider("rightX").getValue(), -1, 1, -0.1, 0.1);
  viewy = map(gpad.getSlider("rightY").getValue(), -1, 1, -0.1, 0.1);
  btA = gpad.getButton("btA").pressed();
  
  //xcircle = constrain(xcircle + viewx, -width/2, width/2);
  
  if (abs(posx) < 0.05) {
    posx = 0;
  }
  if (abs(posy) < 0.05) {
    posy = 0;
  }
  if (posz > 0.05) {
    gatillos = (gatillos + posz)%100;
    slider1.setValue(gatillos/100);
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
  
  if (keyPressed && key == 'c') {
    background(0);
  }
  strokeWeight(2);
  
  
  getUserInput();
  
  fill(0,0,0);
  noStroke();
  circle(xcircle,ycircle, 200);
  stroke(gatillos,80,100);
  
  
  strokeWeight(5);
  line(0, 0, posx*largo_flecha, posy*largo_flecha);
  strokeWeight(10);
  float aangle = atan2(posy, posx);
  float arrowX1 = posx*largo_flecha - 10 * cos(aangle - PI / 6);
  float arrowY1 = posy*largo_flecha - 10 * sin(aangle - PI / 6);
  float arrowX2 = posx*largo_flecha - 10 * cos(aangle + PI / 6);
  float arrowY2 = posy*largo_flecha - 10 * sin(aangle + PI / 6);
  triangle(posx*largo_flecha, posy*largo_flecha, arrowX1, arrowY1, arrowX2, arrowY2);
  point(0,0);
  
  if (btA) {
    lanzarParticulas(10, posx * largo_flecha, posy * largo_flecha, sqrt(sq(posx)+sq(posy))*6);
  }
  if (tiempo > 20){
    limpiar_particulas();
    tiempo = 0;
  } else {
    tiempo += 0.1;
  }
}
