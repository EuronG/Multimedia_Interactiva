class ParticleInner extends Particle{
  PVector centro = new PVector(width/2, height/2);
  
  ParticleInner(){
    super(random(-10,10),random(-10,10), 0);
    maxspeed = 1;
  }
  
  void edges() {
    if (pos.dist(centro) >= 92){
      PVector normal = PVector.sub(pos, centro).normalize();
    
      // Calcular la componente de velocidad a lo largo del vector normal
      float velocityAlongNormal = PVector.dot(vel, normal);
    
      // Calcular la reflexión del vector de movimiento respecto al vector normal
      PVector reflection = PVector.mult(normal, 2 * velocityAlongNormal);
      vel.sub(reflection);
      
      //vel = vel.mult(-1);
    }
  }
  
  void show() {
     stroke(gatillos, 100, 100);
     strokeWeight(1);
     line(pos.x, pos.y, prevPos.x, prevPos.y);
     updatePrev();
  }
  
  void applyForce(PVector force) {
    acc.add(force.mult(0.5));
  }
}
