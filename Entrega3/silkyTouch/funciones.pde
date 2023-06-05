
void arrow(float x,float y,float z){
  float magnitud = sqrt(pow(x,2) + pow(y,2) + pow(z,2));
}

void lanzarParticulas(int cantidad, float x, float y){
  for (int i = 0; i < cantidad; i++) {
    particles.add(new Particle(x, y, tiempo%100));
  }
}
void guardarPantalla(){
    String timestamp = year() + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    save("captura_" + timestamp + ".png");
    println("Captura de pantalla guardada.");
}
