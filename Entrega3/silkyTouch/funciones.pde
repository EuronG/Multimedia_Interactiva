void lanzarParticulas(int cantidad, float x, float y, float maxSpeed){
  for (int i = 0; i < cantidad; i++) {
    particles.add(new Particle(x, y, gatillos, maxSpeed));
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

void limpiar_particulas(){
  for (int i = particles.size() - 1; i >= 0; i--){
    if (!particles.get(i).active) {
    particles.remove(i);
  }
