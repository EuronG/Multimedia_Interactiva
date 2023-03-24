let monoSynth, frame, playing1, playing2, playing3, playing4, text1, interval, button1, button2, button3, button4, forma0, forma1, forma2, forma3, forma4, div1, div2;

function setup() {
  let cnv = createCanvas(880, 450);
  //cnv.mousePressed(playSynth);


  frame = 0;
  interval = 20;
  monoSynth = new p5.MonoSynth();
  let p1 = createP("1");
  let p2 = createP("2");
  let p3 = createP("3");
  let p4 = createP("4");
  div2 = createDiv();
  div1 = createDiv();
  button1 = createButton("Off");
  button2 = createButton("Off");
  button3 = createButton("Off");
  button4 = createButton("Off");
  div2.child(p1);
  div2.child(p2);
  div2.child(p3);
  div2.child(p4);
  div1.child(button1);
  div1.child(button2);
  div1.child(button3);
  div1.child(button4);

  button1.mousePressed(toggle1);
  button2.mousePressed(toggle2);
  button3.mousePressed(toggle3);
  button4.mousePressed(toggle4);
  forma0 = formas(100, 200);
  forma1 = formas(12, 200);
  forma2 = formas(6, 200);
  forma3 = formas(4, 200);
  forma4 = formas(3, 200);
}

function draw() {
  background('#1b003a');
  stroke('FFFFFF')
  translate(width / 2, height / 2);

  if (playing1) {
    fill('#650099');
    drawShape(forma1);}
  if (playing2) {
    fill('#7f00b2');
    drawShape(forma2);}
  if (playing3) {
    fill('#ab3ed8');
    drawShape(forma3);}
  if (playing4) {
    fill('#d86aff');
    drawShape(forma4);}
  
  noFill();
  drawShape(forma0);
  let x = map(sin((frame/interval)*(PI/6)), -1, 1, -200, 200);
  let y = map(cos((frame/interval)*(PI/6)), -1, 1, -200, 200);
  fill('FFFFFF');
  circle(x, y, 10);
  

  if (((frame/interval)%(1) == 0) && playing1) {
    monoSynth.play('C4', 1, 0, 1/6);
    //playSynth();
    circle(x, y, 15);
  }
  if (((frame/interval)%(2) == 0) && playing2) {
    monoSynth.play('D#4', 1, 0, 1/6);
    //playSynth();
    circle(x, y, 15);
  }
  if (((frame/interval)%(3) == 0) && playing3) {
    monoSynth.play('G4', 1, 0, 1/6);
    //playSynth();
    circle(x, y, 15);
  }
  if (((frame/interval)%(4) == 0) && playing4) {
    monoSynth.play('Bb4', 1, 0, 1/6);
    //playSynth();
    circle(x, y, 15);
  }
  

  frame++;
}

function playSynth() {
  userStartAudio();
  //monoSynth.play('G4', 1, 0, 1/6);
  playing1 = true;
  playing2 = true;
  playing3 = true;
  playing4 = true;
}

function toggle1() {
  userStartAudio();
  if (playing1){
    playing1 = false;
    button1.html("Off")
  } else {
    playing1 = true;
    button1.html("On")
  }
}

function toggle2() {
  userStartAudio();
  if (playing2){
    playing2 = false;
    button2.html("Off")
  } else {
    playing2 = true;
    button2.html("On")
  }
}

function toggle3() {
  userStartAudio();
  if (playing3){
    playing3 = false;
    button3.html("Off")
  } else {
    playing3 = true;
    button3.html("On")
  }
}

function toggle4() {
  userStartAudio();
  if (playing4){
    playing4 = false;
    button4.html("Off")
  } else {
    playing4 = true;
    button4.html("On")
  }
}

function formas(n, radio){
  let forma = []
  let angulo, x, y;
  for (let index = 0; index < n; index++) {
    angulo = 2 * Math.PI / n * index + HALF_PI;
    x = radio * Math.cos(angulo);
    y = radio * Math.sin(angulo);
    forma.push([x,y]);
  }
  return forma;
}

function drawShape(forma){
  beginShape();
  for (let i = 0; i < forma.length; i++) {
    vertex(forma[i][0], forma[i][1]);
  }
  endShape(CLOSE);
}

function rotor(){
  let x = map(sin(frame),-1,1);
  let y = Math.sqrt(200 - x ** 2);
  fill(255,0,0);
  circle(x, y, 50);
}