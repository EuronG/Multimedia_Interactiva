let frame, variframe, total, total_esfera, variacion, variacion1, variacion2, puntos, puntos_esfera, puntos_linea, shapes1, shapes2, shape1, shape2, a, b

function setup() {
  createCanvas(700, 700, WEBGL);
  colorMode(HSB, 100);
  noFill();

  //Zona antes del setup
  frame = random(0, 10*PI);
  variframe = random(0.01, 0.05);
  total = 10
  total_esfera = 9;
  variacion = 20; //variacion puntos de esfera
  variacion1 = random(0, 40); //variacion de la curva, 0 es recta y 40 es muy curva
  variacion2 = [];
  puntos = [];
  puntos_esfera = [];
  puntos_linea = [];
  shapes1 = [[7, 0.2, 1.7, 1.7, 7, 0.2, 1.7, 1.7],
                 [5, 0.1, 1.7, 1.7, 1, 0.3, 0.5, 0.5],
                 [5.2, 0.04, 1.7, 1.7, 0, 1, 1, 1],
                 [1.167, 0.3, 0.3, 0.3, 0, 1, 1, 1]];

  shapes2 = [[8, 60, 100, 30, 2, 10, 10, 10],
                 [1, 37.41, -0.24, 19, 4, 100, 100, 100],
                 [4, 100, 1, 1, 4, 1, 1, 1],
                 [4, 100, 100, 100, 4, 100, 100, 100]]

  shape1 = random(shapes1);
  shape2 = random(shapes2);
  a = 1;
  b = 1;

  //Creacion de la esfera
  let r = 200;
  for (let i = 0; i < total_esfera + 1; i++) {
    puntos_esfera.push([]);
    let lat = map(i, 0, total_esfera, -HALF_PI, HALF_PI);
    let r2 = supershape(lat, 0, 1, 1, 1);
    for (let j = 0; j < total_esfera; j++) {
      let lon = map(j, 0, total_esfera, -PI, PI)
      let r1 = supershape(lon, 0, 1, 1, 1);
      let x = r * r1 * cos(lon) * r2 * cos(lat);
      let y = r * r1 * sin(lon) * r2 * cos(lat);
      let z = r * r1 * sin(lat);
      //x = random(x-variacion, x+variacion);
      //y = random(y-variacion, y+variacion);
      //z = random(z-variacion, z+variacion);
      puntos_esfera[i].push(createVector(x,y,z));
    }
  }

  for (let i = 0; i < total + 1; i++) {
    puntos_linea.push([]);
    variacion2.push([]);
    for (let j = 0; j < total + 1; j++) {
      puntos_linea[i].push(createVector(map(i, 0, total, 0, total_esfera -1), map(j, 0, total, 0, total_esfera -1)));
      variacion2[i].push(createVector(random(-variacion1, variacion1), random(-variacion1, variacion1), random(-variacion1, variacion1)));
    }
  }
}

function draw() {
  background(0);
  //translate(width / 2, height / 2);
  rotateY(frameCount / 100.0);
  rotateX(frameCount / 300.0);
  rotateZ(frameCount / 500.0);
  lights();
  stroke(map(cos(frame/10), -1, 1, 0, 100), 100, 100);
  strokeWeight(map(sin(frame), -1, 1, 5, 0));

  let shape0 = [ 
    map(sin(frame), -1, 1, shape1[0], shape2[0]),
    map(sin(frame), -1, 1, shape1[1], shape2[1]),
    map(sin(frame), -1, 1, shape1[2], shape2[2]),
    map(sin(frame), -1, 1, shape1[3], shape2[3]),
    map(sin(frame), -1, 1, shape1[4], shape2[4]),
    map(sin(frame), -1, 1, shape1[5], shape2[5]),
    map(sin(frame), -1, 1, shape1[6], shape2[6]),
    map(sin(frame), -1, 1, shape1[7], shape2[7])]

  let r = map(sin(frame), -1, 1, 100, 350);
  for (let i = 0; i < total + 1; i++) {
    puntos.push([])
    let lat = map(i, 0, total, -HALF_PI, HALF_PI);
    let r2 = supershape(lat, shape0[4], shape0[5], shape0[6], shape0[7]);
    for (let j = 0; j < total + 1; j++) {
      let lon = map(j, 0, total, -PI, PI);
      let r1 = supershape(lon, shape0[0], shape0[1], shape0[2], shape0[3]);
      let x = r * r1  * cos(lon) * r2 * cos (lat);
      let y = r * r1  * sin(lon) * r2 * cos (lat);
      let z = r * r1  * sin(lat);
      puntos[i].push(createVector(x,y,z));
    }
  }

  //Conexion de la figura
  for (let i = 0; i < total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (let j = 0; j < total + 1; j++) {
      let v1 = puntos[i][j];
      vertex(v1.x, v1.y, v1.z);
      let v2 = puntos[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }

  //Puntos esfera
  strokeWeight(3);
  stroke(0,0,100);
  for (let i = 0; i < total_esfera; i++) {
    for (let j = 0; j < total_esfera; j++) {
      let v = puntos_esfera[i][j];
      //point(v.x, v.y, v.z);
    }
  }

  //Curvas
  stroke(0,0,100);
  for (let i = 0; i < total + 1; i++) {
    for (let j = 0; j < total + 1; j++) {
      let v = puntos[i][j];
      let v2 = puntos_esfera[int(puntos_linea[i][j].x)][int(puntos_linea[i][j].y)];
      let va2 = variacion2[i][j];
      strokeWeight(0.5);
      noFill();
      console.log(puntos_esfera)
      line(v.x, v.y, v.z, v2.x, v2.y, v2.z);
      //bezier(v.x, v.y, v.z, v.x + va2.x, v.y + va2.y, v.z + va2.z, v2.x + va2.x, v2.y + va2.y, v2.z + va2.z, v2.x, v2.y, v2.z);
    }
  }

  frame += variframe;
  if (frame > 9999*PI) {
    frame = 0;
  }
}

function supershape (theta, m, n1, n2, n3){
  let t1 = abs(cos(m * theta / 4));
  t1 = pow(t1, n2);
  let t2 = abs(sin(m * theta / 4));
  t2 = pow(t2, n3);
  let t3 = t1 + t2;
  let r = pow(t3, -1 / n1);
  return r;
}