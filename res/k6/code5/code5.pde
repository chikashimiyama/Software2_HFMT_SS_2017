import processing.sound.*;

AudioIn in;  // Mikrofon
Amplitude amp; // Analyzator

int index = 1; // x
float previous = 0.0; // der letzte Wert

void setup() {
  size(600, 400);
  background(0);
  in = new AudioIn(this, 0);
  in.start();
  
  amp = new Amplitude(this);
  amp.input(in);
}      

void draw(){
  float result = amp.analyze() * -10000.0; // Y Skalierung
  
  line(index-1, previous+350, index, result+350);
  stroke(255);
  previous = result;
  index++;
  if(index > 600){
     index = 0;
     clear();
  }
}