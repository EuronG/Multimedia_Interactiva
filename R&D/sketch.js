let osc1, osc2, osc3, osc4, playing1, playing2, playing3, playing4, freq, amp, frame, delay, tog1, tog2, tog3, tog4, monoSynth;

function setup() {
  let cnv = createCanvas(500, 500);
  delay = 10;
  frame = 0;
  tog1 = true;
  tog2 = true;
  tog3 = true;
  tog4 = true;
  button1 = createButton("On");
  button2 = createButton("On");
  button3 = createButton("On");
  button4 = createButton("On");
  button1.mousePressed(toggleOsc1);
  button2.mousePressed(toggleOsc2);
  button3.mousePressed(toggleOsc3);
  button4.mousePressed(toggleOsc4);
  cnv.mousePressed(playOscillator);
  osc1 = new p5.Oscillator('sine');
  osc2 = new p5.Oscillator('sine');
  osc3 = new p5.Oscillator('sine');
  osc4 = new p5.Oscillator('sine');
  monoSynth = new p5.MonoSynth();
}

function draw() {
  background(220);
  freq = constrain(map(mouseX, 0, width, 100, 500), 100, 500);
  //amp = constrain(map(mouseY, height, 0, 0, 1), 0, 1);
  amp = 1;

  text('tap to play', 20, 20);
  text('freq: ' + freq, 20, 40);
  text('amp: ' + amp, 20, 60);


  if (((frame/delay) % 1 == 0) && tog1) {
    
    //osc1.freq(map(freq, 100, 500, 100, 200));
    //osc1.freq(freq, 0.1);
    //osc1.amp(amp, 0.1);
    playing1 = true;
  } else {
    if (playing1) {
        osc1.amp(0, 0.5);
        playing1 = false;
}

  }
  if (((frame/delay) % 2 == 0) && tog2) {
    //osc2.freq(map(freq, 100, 500, 200, 300));
    //osc2.freq(freq, 0.1);
    //osc2.amp(amp, 0.1);
    playing2 = true;
  } else {
    if (playing2) {
        osc2.amp(0, 0.5);
        playing2 = false;
}

  }
  if (((frame/delay) % 3 == 0) && tog3) {
    //osc3.freq(map(freq, 100, 500, 300, 400));
    //osc3.freq(freq, 0.1);
    //osc3.amp(amp, 0.1);
    playing3 = true;
  } else {
    if (playing3) {
        osc3.amp(0, 0.5);
        playing3 = false;
}
  }
  if (((frame/delay) % 4 == 0) && tog4) {
    monoSynth.play('G4', 0.1, 0, 0.0001);
    //osc4.freq(map(freq, 100, 500, 400, 500));
    //osc4.freq(freq, 0.1);
    //osc4.amp(amp, 0.1);
    //playing4 = true;
  } else {
    if (playing4) {
        osc4.amp(0, 0.5);
        playing4 = false;
}

  }
  frame += 1;
}

function playOscillator() {
  // starting an oscillator on a user gesture will enable audio
  // in browsers that have a strict autoplay policy.
  // See also: userStartAudio();
  userStartAudio();
  //osc1.start();
  //osc1.start();
  //osc2.start();
  //osc3.start();
  playing1 = true;
  playing2 = true;
  playing3 = true;
  playing4 = true;
}

function mouseReleased() {
  // ramp amplitude to 0 over 0.5 seconds
  //osc1.amp(0, 0.5);
  //osc2.amp(0, 0.6);
  //osc3.amp(0, 0.7);
  //osc4.amp(0, 0.8);
}

function toggleOsc1() {
  if (tog1){
    tog1 = false;
    button1.html("Off")
  } else {
    tog1 = true;
    button1.html("On")
  }
}

function toggleOsc2() {
  if (tog2){
    tog2 = false;
    button2.html("Off")
  } else {
    tog2 = true;
    button2.html("On")
  }
}

function toggleOsc3() {
  if (tog3){
    tog3 = false;
    button3.html("Off")
  } else {
    tog3 = true;
    button3.html("On")
  }
}

function toggleOsc4() {
  if (tog4){
    tog4 = false;
    button4.html("Off")
  } else {
    tog4 = true;
    button4.html("On")
  }
}