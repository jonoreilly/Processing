
GrupoCelular celulas;
LogGruposCelulares logCelulas;

boolean checksActiv = true;
int checksMin = 1000;
int checksMod = 10;


void setup() {  
  size(3500, 1750);
  frameRate(60);
  noSmooth();
  textSize(32);
  fill(200, 0, 100);
  celulas = new GrupoCelular(width, height, (width*height)/3);
  logCelulas = new LogGruposCelulares(width, height, 12);
  //noLoop();
}




void draw() {
  
  background(color(255));
  celulas.Step();
  
  loadPixels();
  for (int i = 0; i < celulas.ancho; i++) {
    for (int j = 0; j < celulas.alto; j++) {
      if(celulas.celulas[i][j].vivo) {
        pixels[i+(j*width)] = color(0);
      }
    }
  }
  updatePixels();
  
  if(checksActiv && frameCount > checksMin) {
    logCelulas.AddLog(celulas);
    if(frameCount % checksMod == 0) {
      logCelulas.Check();
    }
  }
  
  if(keyCode == UP) {
    checksActiv = true;
  }
  else if(keyCode == DOWN) {
    checksActiv = false;
    logCelulas.Clear();
  }
  
  if(logCelulas.finished >= 0) {
    text("Terminado: " + frameCount, 10, height/2);
    noLoop();
    return;
  }
  else {
    text("FR: " + frameRate, 10, 80);
    text("FC: " + frameCount, 10, 180);
    text("Logging: " + checksActiv, 10, 280);
  }
}
