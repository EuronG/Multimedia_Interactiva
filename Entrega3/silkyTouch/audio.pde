import processing.sound.*;

AudioIn input;
Amplitude analyzer;
float aud;
SoundFile note;
Amplitude noteA;

void audioSetup() {
  input = new AudioIn(this, 0);

  input.start();

  // create a new Amplitude analyzer
  analyzer = new Amplitude(this);
  note = new SoundFile(this, "fuegos.mp3");
  noteA = new Amplitude(this);

  analyzer.input(input);
}

void audioDraw() {
  float vol = map(analyzer.analyze(),0,0.5,0,1);
  
  if (vol>0.7) {
    for (int i = -1; i <= 1; i++){
        lanzarParticulas(100, i , i, vol*random(25));
    }
  }
}
