int type;
class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxspeed, weight, colore, tamano;
  PVector prevPos;
  boolean active;
  
  Particle(float x, float y, float colorsito) {
    //x = x + width/2 + random(10);
    //y = y + height/2 + random(10);
    pos = new PVector(x + width/2 + random(5), y + height/2 + random(5));
    vel = new PVector(0, 0);
    acc = new PVector(x, y);
    weight = 100;
    colore = colorsito;
    tamano = 0.15;
    maxspeed = sqrt(sq(posx)+sq(posy))*7;
    active = true;
    prevPos = pos.copy();
  }

  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
    
    if (type==1) {
      oscillate(4,2.1);
      tamano = 0.25;
    }
    if (type==2) {
      oscillate(6,30);
      tamano = 0.5;
    }if (type==999) {
      oscillate(aud,5);
      tamano = 0.9;
    }
    
    if (weight >= 0.5){
      weight -= random(1);
    } else {
      weight = 0;
      active = false;
    }
  }

  void follow(PVector[] vectors, float scl, int cols) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = constrain(x + y * cols, 0, 72000-1);
    PVector force = vectors[index];
    applyForce(force);
  }

  void applyForce(PVector force) {
    acc.add(force);
    PVector analogo_derecho = new PVector(viewx, viewy);
    acc.add(analogo_derecho);
  }

  void show() {
    if (active){
      stroke(colore, 100, 100);
      strokeWeight(tamano);
      line(pos.x, pos.y, prevPos.x, prevPos.y);
      updatePrev();
    }
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
  void oscillate(float amplitude, float frequency) {
    float angle = sin(frameCount * frequency) * amplitude;
    PVector offset = PVector.fromAngle(angle);
    offset.mult(amplitude);
    pos.add(offset);
  }

}
