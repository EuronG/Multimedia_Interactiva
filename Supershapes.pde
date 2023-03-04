/*import peasy.*;

PeasyCam cam;
float frame = 0;
int total = 50;
PVector[][] puntos; */
/*int totalsq = total*total;
float[] xs = new float[totalsq];
float[] ys = new float[totalsq];
float[] zs = new float[totalsq];*/
/*
void setup() {
  size(800,800,P3D);
  colorMode(HSB,100);
  cam = new PeasyCam(this, 2500);
  puntos = new PVector[total+1][total+1];
  
  //CORDENADAS ESFERA
  float r = 700;
  float vari = 0;
  for (int i = 0; i<total+1; i++){
    float lon = map(i, 0, total, 0, PI);
    for (int j = 0; j<total+1; j++) {
      float lat = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);
      puntos[i][j] = new PVector(random(x-vari, x+vari), random(y-vari, y+vari), random(z-vari, z+vari));
    }
  }
}

void draw() {
  background(0);
  //noFill();
  fill(map(cos(frame/10),-1,1,0,100), 100, map(sin(frame),-1,1,0,100));
  //translate(width/2, height/2);
  rotateY(frameCount / 100.0);
  rotateX(frameCount / 300.0);
  rotateZ(frameCount / 500.0);
  lights();
  stroke(200,0,100);
  stroke(map(cos(frame/10),-1,1,0,100), 100, map(sin(frame),-1,1,0,100));
  
  
  //PUNTOS
  strokeWeight(2);
  for (int i = 0; i<total; i++){
    for (int j = 0; j<total; j++) {
      PVector v = puntos[i][j];
      point(v.x, v.y, v.z);
    }
  }
  
  //triangle strips
  strokeWeight(2);
  for (int i = 0; i<total; i++){
    beginShape(LINES);
    for (int j = 0; j<total+1; j++) {
      PVector v1 = puntos[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = puntos[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
  
  //LINEAS
  strokeWeight(0.5);
  for (int i = 0; i<total; i++){
    for (int j = 0; j<(total); j++){
      for (int i2 = 0; i2<(total); i2++){
        for (int j2 = 0; j2<(total); j2++){
          PVector v = puntos[i][j];
          PVector v2 = puntos[i2][j2];
          float distancia = sqrt(pow(v2.x - v.x, 2) + pow(v2.y - v.y, 2) + pow(v2.z - v.z, 2) );
          if (distancia > 1350 && distancia < 1251){
            line(v.x, v.y, v.z, v2.x, v2.y, v2.z);
          }
        }
      }
    }
  }
  
  frame += 0.01;
  if (frame > 9999*PI){
  frame = 0;
  }
}*/
