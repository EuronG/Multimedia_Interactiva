import g4p_controls.*;

GWindow guiWindow;
GSlider slider1;
GButton button;
float slider1Value;

void segundaSetup(){
  // Crea la ventana de la GUI
  guiWindow = GWindow.getWindow(this, "GUI Window", 0, 0, 300, 300, P2D);
  guiWindow.addDrawHandler(this, "windowDraw"); // Llama a la función "drawGUI" para dibujar en la ventana de la GUI
  
  // Crea un slider en la ventana de la GUI
  slider1 = new GSlider(guiWindow, 50, 50, 200, 20, 10);
  
  // Crea un botón en la ventana de la GUI
  button = new GButton(guiWindow, 100, 100, 100, 40, "Click Me");
  button.addEventHandler(this, "buttonClicked"); // Llama a la función "buttonClicked" cuando se hace clic en el botón
  guiWindow.colorMode(HSB,100);
}

public void windowDraw(PApplet app, GWinData data){
  slider1Value = slider1.getValueF() * 100;
  gatillos = slider1Value;
  app.background(0);
  app.strokeWeight(2);
  app.fill(slider1Value, 100, 100);
  app.rect(10,10,280,20);
}


void buttonClicked(GButton source, GEvent event) {
  if (source == button && event == GEvent.CLICKED) {
    println("Button Clicked!");
  }
}
