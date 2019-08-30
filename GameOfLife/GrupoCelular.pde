
 import java.util.Set;
 import java.util.HashSet;


class GrupoCelular {
  Celula[][] celulas;
  int ancho;
  int alto;
  
  
  public GrupoCelular(int ancho, int alto, int cantidadInicio) {
    this.ancho = ancho;
    this.alto = alto;
    Clear();
    FillRandom(cantidadInicio);
  }
  
  
  
  
  public void Clear() {
    this.celulas = new Celula[this.ancho][this.alto];
    for(int i = 0; i < this.ancho; i++) {
      for(int j = 0; j < this.alto; j++) {
        this.celulas[i][j] = new Celula();
      }
    }
  }
  
  
  public void FillRandom(int cantidad) {
    int contador = 0;
    while(contador < cantidad) {
      int x = floor(random(this.ancho));
      int y = floor(random(this.alto));
      if(!this.celulas[x][y].vivo) {
        this.AddCelula(x,y);
        contador++;
      }
    }
  }
  
  
  public void Step() {
    Celula[][] holder = ClonarCelulas();
    this.Clear();
    for(int i = 0; i < this.ancho; i++) {
      for(int j = 0; j < this.alto; j++) {
        if(holder[i][j].NextState()) {
          this.AddCelula(i,j);
        }
      }
    }
  }
  
  public Celula[][] ClonarCelulas() {
    Celula[][] holder = new Celula[this.ancho][this.alto];
    for(int i = 0; i < this.ancho; i++) {
      for(int j = 0; j < this.alto; j++) {
        holder[i][j] = this.celulas[i][j].Clone();
      }
    }
    return holder;
  }
  
  
  public void AddCelula(int x, int y) {
    if(this.celulas[x][y].vivo) { return; }
    this.celulas[x][y].vivo = true;
    
    int[][] posiciones = {{x-1,y-1},{x-1,y},{x-1,y+1},{x,y-1},{x,y+1},{x+1,y-1},{x+1,y},{x+1,y+1}};
    for(int i = 0; i < posiciones.length; i++) {
      this.AddVecino(posiciones[i][0], posiciones[i][1]);
    }
  }
  
  
  
  public void AddVecino(int x, int y) {
    if(x >= 0 && x < this.ancho && y >= 0 && y < this.alto) {
      this.celulas[x][y].vecinos++;
    }
  }
  
  
}
