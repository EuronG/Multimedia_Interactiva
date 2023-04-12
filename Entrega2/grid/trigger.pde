float amplitudSuma = 0;
float retorno = 0;
SoundFile note;
SoundFile[][] notes;
Amplitude[][] amps;
Boolean[][] boolCoords;
float[][] circleSizes;

void triggerSetup(){
  note = new SoundFile(this, "12g.wav");
  boolCoords = new Boolean[cantidadx][cantidady];
  circleSizes = new float[cantidadx][cantidady];
  amps = new Amplitude[cantidadx][cantidady];
  notes = new SoundFile[cantidadx][cantidady];
  for (int i = 0; i < cantidadx; i++) {
    for (int j = 0; j < cantidady; j++){
      boolCoords[i][j] = false;
      circleSizes[i][j] = 0;
      amps[i][j] = new Amplitude(this);
    }
  }
  loads();
}

float trigger(){
  
  for (int i = 0; i < cantidadx; i++) {
    for (int j = 0; j < cantidady; j++){
      if (boolCoords[i][j]){
          float circlesize = circleSizes[i][j];
          if (circlesize <= 0){
            notes[i][j].play();
            circleSizes[i][j] = circlesize +60;
          }
          else if (circlesize <= 200){
            stroke(map(circlesize, 0, 200, 100, 0));
            circle(coords[i][j].x, coords[i][j].y, circlesize);
            circleSizes[i][j] = circlesize +0.5;
          }
          else{
            boolCoords[i][j] = false;
            circleSizes[i][j] = 0;
            notes[i][j].stop();
          }
          amplitudSuma = amplitudSuma + amps[i][j].analyze();
      }
    }
  }
  retorno = amplitudSuma;
  amplitudSuma = 0;
  return retorno;
}

void loads(){
    notes[0][0] = new SoundFile(this, "sounds/g1.wav");
    notes[0][1] = new SoundFile(this, "sounds/p1.wav");
    notes[0][2] = new SoundFile(this, "sounds/b1.wav");
    notes[0][3] = new SoundFile(this, "sounds/plash.wav");
    notes[0][4] = new SoundFile(this, "sounds/drum.wav");
    notes[1][0] = new SoundFile(this, "sounds/g2.wav");
    notes[1][1] = new SoundFile(this, "sounds/p2.wav");
    notes[1][2] = new SoundFile(this, "sounds/b2.wav");
    notes[1][3] = new SoundFile(this, "sounds/plash.wav");
    notes[1][4] = new SoundFile(this, "sounds/drum.wav");
    notes[2][0] = new SoundFile(this, "sounds/g3.wav");
    notes[2][1] = new SoundFile(this, "sounds/p3.wav");
    notes[2][2] = new SoundFile(this, "sounds/b3.wav");
    notes[2][3] = new SoundFile(this, "sounds/plash.wav");
    notes[2][4] = new SoundFile(this, "sounds/drum.wav");
    notes[3][0] = new SoundFile(this, "sounds/g4.wav");
    notes[3][1] = new SoundFile(this, "sounds/p4.wav");
    notes[3][2] = new SoundFile(this, "sounds/b4.wav");
    notes[3][3] = new SoundFile(this, "sounds/plash.wav");
    notes[3][4] = new SoundFile(this, "sounds/drum.wav");
    notes[4][0] = new SoundFile(this, "sounds/g5.wav");
    notes[4][1] = new SoundFile(this, "sounds/p5.wav");
    notes[4][2] = new SoundFile(this, "sounds/b5.wav");
    notes[4][3] = new SoundFile(this, "sounds/plash.wav");
    notes[4][4] = new SoundFile(this, "sounds/drum.wav");
    notes[5][0] = new SoundFile(this, "sounds/g6.wav");
    notes[5][1] = new SoundFile(this, "sounds/p6.wav");
    notes[5][2] = new SoundFile(this, "sounds/b6.wav");
    notes[5][3] = new SoundFile(this, "sounds/plash.wav");
    notes[5][4] = new SoundFile(this, "sounds/drum.wav");
    notes[6][0] = new SoundFile(this, "sounds/g7.wav");
    notes[6][1] = new SoundFile(this, "sounds/p7.wav");
    notes[6][2] = new SoundFile(this, "sounds/b7.wav");
    notes[6][3] = new SoundFile(this, "sounds/plash.wav");
    notes[6][4] = new SoundFile(this, "sounds/drum.wav");
    notes[7][0] = new SoundFile(this, "sounds/g8.wav");
    notes[7][1] = new SoundFile(this, "sounds/p8.wav");
    notes[7][2] = new SoundFile(this, "sounds/b8.wav");
    notes[7][3] = new SoundFile(this, "sounds/plash.wav");
    notes[7][4] = new SoundFile(this, "sounds/drum.wav");
    amps[0][0].input(notes[0][0]);
    amps[0][1].input(notes[0][1]);
    amps[0][2].input(notes[0][2]);
    amps[0][3].input(notes[0][3]);
    amps[0][4].input(notes[0][4]);
    amps[1][0].input(notes[1][0]);
    amps[1][1].input(notes[1][1]);
    amps[1][2].input(notes[1][2]);
    amps[1][3].input(notes[1][3]);
    amps[1][4].input(notes[1][4]);
    amps[2][0].input(notes[2][0]);
    amps[2][1].input(notes[2][1]);
    amps[2][2].input(notes[2][2]);
    amps[2][3].input(notes[2][3]);
    amps[2][4].input(notes[2][4]);
    amps[3][0].input(notes[3][0]);
    amps[3][1].input(notes[3][1]);
    amps[3][2].input(notes[3][2]);
    amps[3][3].input(notes[3][3]);
    amps[3][4].input(notes[3][4]);
    amps[4][0].input(notes[4][0]);
    amps[4][1].input(notes[4][1]);
    amps[4][2].input(notes[4][2]);
    amps[4][3].input(notes[4][3]);
    amps[4][4].input(notes[4][4]);
    amps[5][0].input(notes[5][0]);
    amps[5][1].input(notes[5][1]);
    amps[5][2].input(notes[5][2]);
    amps[5][3].input(notes[5][3]);
    amps[5][4].input(notes[5][4]);
    amps[6][0].input(notes[6][0]);
    amps[6][1].input(notes[6][1]);
    amps[6][2].input(notes[6][2]);
    amps[6][3].input(notes[6][3]);
    amps[6][4].input(notes[6][4]);
    amps[7][0].input(notes[7][0]);
    amps[7][1].input(notes[7][1]);
    amps[7][2].input(notes[7][2]);
    amps[7][3].input(notes[7][3]);
    amps[7][4].input(notes[7][4]);
}
