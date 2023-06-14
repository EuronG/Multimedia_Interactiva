import g4p_controls.*;

GWindow guiWindow;
GSlider slider;
GButton button;

void segundaSetup(){
  // Crea la ventana de la GUI
  guiWindow = GWindow.getWindow(this, "GUI Window", 0, 0, 300, 300, P2D);
  guiWindow.addDrawHandler(this, "windowDraw"); // Llama a la función "drawGUI" para dibujar en la ventana de la GUI
  
  // Crea un slider en la ventana de la GUI
  slider = new GSlider(guiWindow, 50, 50, 200, 20, 10);
  
  // Crea un botón en la ventana de la GUI
  button = new GButton(guiWindow, 100, 100, 100, 40, "Click Me");
  button.addEventHandler(this, "buttonClicked"); // Llama a la función "buttonClicked" cuando se hace clic en el botón
  guiWindow.colorMode(HSB,100);
}

public void windowDraw(PApplet app, GWinData data){
  app.background(0);
  app.strokeWeight(2);
  app.fill(gatillos, 100, 100);
  app.rect(10,10,280,20);
  // draw black line to current mouse position
  app.stroke(0);
  app.line(app.width / 2, app.height/2, app.mouseX, app.mouseY);
}

public void windowMouse(PApplet app, GWinData data, MouseEvent event) {
    //if(event == MouseEvent.CLICK){
      //  app.background(33);
    //  }
}

void drawGUI(PGraphics pg) {
  pg.background(0);
  pg.fill(0);
  //pg.noStroke();
  pg.rect(50, 50, 100, 100);
  // Resto del código para la ventana de la GUI
}

void buttonClicked(GButton source, GEvent event) {
  if (source == button && event == GEvent.CLICKED) {
    println("Button Clicked!");
  }
}
