void lanzarParticulas(int cantidad, float x, float y){
  for (int i = 0; i < cantidad; i++) {
    particles.add(new Particle(x, y, gatillos));
  }
}

void particulasIniciales(int cantidad, float x, float y){
  for (int i = 0; i < cantidad; i++) {
    inicial_particles.add(new ParticleInner());
  }
}

void guardarPantalla(){
    String timestamp = year() + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    save("captura_" + timestamp + ".png");
    println("Captura de pantalla guardada.");
}
