/*int iniciales = 10;
int[] x0 = new int[iniciales];
int[] y0 = new int[iniciales];
int[] z0 = new int[iniciales];
int c = 1;

void setup() {
  size(1600, 1000, P3D);
  noFill();
  smooth();
  stroke(255);
  colorMode(HSB, 100);
  strokeWeight(1);
  for(int i = 0; i<iniciales; i++) {
    x0[i] = int(random(-240, 240));
    y0[i] = 250;
    z0[i] = int(random(-240, 240));
  }
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  rotateY(frameCount / 100.0);
  
  box(500);
  
  for(int i = 0; i<iniciales; i++) {
    point(x0[i], y0[i], z0[i]);
  }
  
  if(c < iniciales-2){
    c = c+1;
  }
}*/
