/*int amount = 50;
int[] x = new int[amount];
int[] y = new int[amount];
int[] z = new int[amount];
int[] x1 = new int[amount];
int[] y1 = new int[amount];
int[] z1 = new int[amount];
int[] x2 = new int[amount];
int[] y2 = new int[amount];
int[] z2 = new int[amount];
int[] x3 = new int[amount];
int[] y3 = new int[amount];
int[] z3 = new int[amount];
float c = 0;
float c1 = 0;
float c2 = 0;
float c3 = 0;

void setup() {
  size(700, 600, P3D);
  background(0);
  noFill();
  stroke(255);
  colorMode(HSB, 100);
  strokeWeight(2);
  for(int i = 0; i<amount; i++) {
    x[i] = int(random(c-150, c-120));
    y[i] = int(random(130, 150));
    z[i] = int(random(-150, -120));
    x1[i] = int(random(-150, -120));
    y1[i] = int(random(130, 150));
    z1[i] = int(random(c-150, c-120));
    x2[i] = int(random((-1)*(c-150), (-1)*(c-120)));
    y2[i] = int(random(130, 150));
    z2[i] = int(random(c-150, c-120));
    x3[i] = int(random(-85, -65));
    y3[i] = int(random(-150, -130));
    z3[i] = int(random(-85, -65));
    c += 6;
  }
}
void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  rotateY(frameCount / 100.0);
  
  box(300);
  for(int i = 0; i < amount; i++) {
    point(x[i], y[i], z[i]);
    point(x1[i], y1[i], z1[i]);
    point(x2[i], y2[i], z2[i]);
    point(x3[i], y3[i], z3[i]);
    //line(x[i], y[i], z[i], x3[i], y3[i], z3[i]);
    //line(x1[i], y1[i], z1[i], x3[i], y3[i], z3[i]);
    //line(x2[i], y2[i], z2[i], x3[i], y3[i], z3[i]);
    //line(x[i], y[i], z[i], x1[i], y1[i], z1[i]);
  }
  
  c2 = 0;
  for(int i = 0; i < c1; i++) {
    //stroke(c2, 80, 80, 20);
    line(x[i], y[i], z[i], x3[i], y3[i], z3[i]);
    line(x1[i], y1[i], z1[i], x3[i], y3[i], z3[i]);
    line(x2[i], y2[i], z2[i], x3[i], y3[i], z3[i]);
    line(x[i], y[i], z[i], x1[i], y1[i], z1[i]);
    stroke(c2, 80, 80, 20);
    //c2 += 1;
    if (c2 < 100) {
    c2 += 1;
    }
  }
  
  
  if (c1 < 50){
  c1 += 1;
  }
  
  if (c3 < amount){
    c3 += 1;
  }
}*/
