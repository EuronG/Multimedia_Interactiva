
void arrow(float x,float y,float z){
  float magnitud = sqrt(pow(x,2) + pow(y,2) + pow(z,2));
}

void lanzarParticulas(int cantidad, float x, float y){
  for (int i = 0; i < cantidad; i++) {
    particles.add(new Particle(x, y, tiempo%100));
  }
}
