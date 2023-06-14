float inc = 0.5;
float scl = 5;
int cols, rows;
float zoff = 0;

PFont fr;

ArrayList<Particle> particles;
ArrayList<ParticleInner> inicial_particles;
PVector[] flowfield;

void touchSetup() {
  cols = floor(width / scl);
  rows = floor(height / scl);
  fr = createFont("Arial", 14, true);
  particles = new ArrayList<Particle>();
  inicial_particles = new ArrayList<ParticleInner>();

  flowfield = new PVector[cols * rows];

  
  background(0);
  particulasIniciales(355, 0, 0);
}

void touchDraw() {
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = x + y * cols;
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.2);
      flowfield[index] = v;
      xoff += inc;
      stroke(0, 50, 100);
      // pushMatrix();
      // translate(x * scl, y * scl);
      // rotate(v.heading());
      //strokeWeight(1000);
      // line(0, 0, scl, 0);
      // popMatrix();
    }
    yoff += inc;

    zoff += 0.3;
  }

  for (int i = 0; i < particles.size(); i++) {
    Particle particle = particles.get(i);
    particle.follow(flowfield, scl, cols);
    particle.update();
    //particle.edges();
    particle.show();
  }
  
  //strokeWeight(10);
  for (int i = 0; i < inicial_particles.size(); i++) {
    ParticleInner particle = inicial_particles.get(i);
    particle.follow(flowfield, scl, cols);
    particle.update();
    particle.edges();
    particle.show(); //<>// //<>//
  }

  // textFont(fr);
  // fill(255);
  // text(floor(frameRate), 10, height - 10);
}
