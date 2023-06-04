class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxspeed;
  PVector prevPos;

  Particle(float x, float y, float z) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxspeed = 4;
    prevPos = pos.copy();
  }

  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }

  void follow(PVector[] vectors, float scl, int cols) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = constrain(x + y * cols, 0, 2399);
    PVector force = vectors[index];
    applyForce(force);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void show() {
    stroke(0, 100, 100);
    strokeWeight(5);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    updatePrev();
  }

  void updatePrev() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePrev();
    }
    if (pos.x < 0) {
      pos.x = width;
      updatePrev();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePrev();
    }
    if (pos.y < 0) {
      pos.y = height;
      updatePrev();
    }
  }
}
