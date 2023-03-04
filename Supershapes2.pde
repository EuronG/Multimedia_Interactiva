import peasy.*;

PeasyCam cam;
float frame = 0;
int total = 10;
int total_esfera = 15;
PVector[][] puntos;
PVector[][] puntos_esfera;
float[] shape2 = {0, 1, 1, 1, 3, 1, 1, 1};
float[] shape1 = {7, 0.2, 1.7, 1.7, 7, 0.2, 1.7, 1.7};
float[][] punto_linea = new float[total_esfera][total_esfera];

float a = 1;
float b = 1;

float supershape(float theta, float m, float n1, float n2, float n3){
  float t1 = abs((1/a) * cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((a/b) * sin(m * theta / 4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, -1 / n1);
  return r;
}

void setup() {
  size(1000,1000,P3D);
  colorMode(HSB,100);
  cam = new PeasyCam(this, 500);
  puntos = new PVector[total+1][total+1];
  puntos_esfera = new PVector[total_esfera+1][total_esfera+1];
  
  float r = 200;
 for (int i = 0; i < total_esfera+1; i++) {
   float lat = map(i, 0, total_esfera, -HALF_PI, HALF_PI);
   float r2 = supershape(lat, 0, 1, 1, 1);
   for(int j = 0; j < total_esfera+1; j++) {
     float lon = map(j, 0, total_esfera, -PI, PI);
     float r1 = supershape(lon, 0, 1, 1, 1);
     float x = r * r1  * cos(lon) * r2 * cos (lat);
     float y = r * r1  * sin(lon) * r2 * cos (lat);
     float z = r * r1  * sin(lat);
     puntos_esfera[i][j] = new PVector(x, y, z);
   }
 }
 

}

void draw() {
 background(0);
 //noFill();
 rotateY(frameCount / 100.0);
 rotateX(frameCount / 300.0);
 rotateZ(frameCount / 500.0);
 lights();
 //fill(map(cos(frame/10),-1,1,0,100), 100, map(sin(frame),-1,1,0,100));
 stroke(200,0,100);
 stroke(map(cos(frame/10),-1,1,0,100), 100, 100);
 strokeWeight(0.1);
 float[] shape0 = {map(sin(frame), -1, 1, shape1[0], shape2[0]),
                   map(sin(frame), -1, 1, shape1[1], shape2[1]),
                   map(sin(frame), -1, 1, shape1[2], shape2[2]),
                   map(sin(frame), -1, 1, shape1[3], shape2[3]),
                   map(sin(frame), -1, 1, shape1[4], shape2[4]),
                   map(sin(frame), -1, 1, shape1[5], shape2[5]),
                   map(sin(frame), -1, 1, shape1[6], shape2[6]),
                   map(sin(frame), -1, 1, shape1[7], shape2[7])};
 //noStroke();
 
 float r = map(sin(frame), -1, 1, 100, 350);
 for (int i = 0; i < total+1; i++) {
   float lat = map(i, 0, total, -HALF_PI, HALF_PI);
   float r2 = supershape(lat, shape0[4], shape0[5], shape0[6], shape0[7]);
   for(int j = 0; j < total+1; j++) {
     float lon = map(j, 0, total, -PI, PI);
     float r1 = supershape(lon, shape0[0], shape0[1], shape0[2], shape0[3]);
     float x = r * r1  * cos(lon) * r2 * cos (lat);
     float y = r * r1  * sin(lon) * r2 * cos (lat);
     float z = r * r1  * sin(lat);
     puntos[i][j] = new PVector(x, y, z);
   }
 }
 
 if (r < 200){
   fill(map(cos(frame/10),-1,1,0,100), 100, 100);
   stroke(map(cos(frame/10),-1,1,0,100), 100, 100);
 } else {
   noFill();
 }

//FIGURA
  for (int i = 0; i<total; i++){
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j<total+1; j++) {
      PVector v1 = puntos[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = puntos[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
  
//Puntos figura
  strokeWeight(3);
  for (int i = 0; i<total; i++){
    for (int j = 0; j<total; j++) {
      PVector v = puntos[i][j];

      point(v.x, v.y, v.z);

    }
  }
  
//Puntos efera
stroke(0,0,100);
strokeWeight(3);
  for (int i = 0; i<total_esfera; i++){
    for (int j = 0; j<total_esfera; j++) {
      PVector v2 = puntos_esfera[i][j];
      
      point(v2.x, v2.y, v2.z);
    }
  }
  
//Lineas

  
  frame += 0.01;
  if (frame > 9999*PI){
  frame = 0;
  }
}
