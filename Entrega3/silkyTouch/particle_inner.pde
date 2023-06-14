import java.util.LinkedList;
int largo_lista = 10;

class ParticleInner extends Particle{
  PVector centro = new PVector(width/2, height/2);
  LinkedList<PVector> lista = new LinkedList<PVector>();
  
  ParticleInner(){
    super(random(-10,10),random(-10,10), 0, sqrt(sq(posx)+sq(posy))*6, random(-10,10), random(-10,10));
    lista.add(pos);
    for (int i=0; i<largo_lista-1;i++){
      lista.add(centro);
    }
    maxspeed = 1.3;
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
    } else {
      applyForce(new PVector(posx, posy).mult(0.1));
    }
  }
   //<>//
  void show() {
     stroke(gatillos, 100, 100);
     strokeWeight(0.5);
     lista.removeLast();
     lista.addFirst(pos);
     
     PVector prev = lista.removeFirst(); //<>//
     lista.addLast(prev.copy());
     for (int i = 0; i < lista.size() -1; i++){
      stroke(gatillos, 100, 100 - i*(100/largo_lista));
      PVector actual = lista.removeFirst();
      lista.addLast(actual);
      line(prev.x, prev.y, actual.x, actual.y);
      prev = actual;
     }
     //strokeWeight(1);
     //line(pos.x, pos.y, prevPos.x, prevPos.y);
     //updatePrev();
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    //PVector direccion = new PVector(posx, posy);
    acc.add(force.mult(0.7));
  }
}
