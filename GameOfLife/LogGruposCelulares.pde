
class LogGruposCelulares {
  int ancho;
  int alto;
  int profundidad;
  int finished;
  
  private int logIndex;
  private Celula[][][] logCelulas;
  
  
  public LogGruposCelulares(int ancho, int alto, int profundidad) {
    this.ancho = ancho;
    this.alto = alto;
    this.profundidad = profundidad;
    
    this.logIndex = 0;
    this.finished = -1;
    this.logCelulas = new Celula[profundidad][ancho][alto];
  }
  
  public void Clear() {
    this.logIndex = 0;
    this.finished = -1;
    this.logCelulas = new Celula[this.profundidad][this.ancho][this.alto];
  }
  
  public void AddLog(GrupoCelular grupo) {
    
      for(int i = min(this.profundidad-1, this.logIndex); i > 0; i--) {
        logCelulas[i] = logCelulas[i-1];
      }
      if(this.logIndex < this.profundidad) { this.logIndex++; }
      logCelulas[0] = grupo.ClonarCelulas();
  }
  
  
  
  public void Check() {
    this.finished = Repeticiones();
  }
  
  private int Repeticiones() {
    int tamanio = min(this.profundidad, this.logIndex);
    int[] saltos = new int[0];
    for(int i = floor(tamanio/2); i > 0; i--) {
      boolean add = true;
      for(int j = 0; j < saltos.length; j++) {
        if(saltos[j] % i == 0) {
          add = false;
          break;
        }
      }
      if(add) {
        int[] holder = new int[saltos.length+1];
        for(int j = 0; j < saltos.length; j++) {
          holder[j] = saltos[j];
        }
        holder[holder.length-1] = i;
        saltos = holder;
      }
    }
    
    for(int i = 0; i < saltos.length; i++) {
      boolean coincide = true;
      for(int j = 0; j+saltos[i] < tamanio ; j++) {
        if(!CompareLogs(j,j+saltos[i])) {
          coincide = false;
          break;
        }
      }
      if(coincide) {
        return saltos[i];
      }
    }
    return -1;
  }
  
  
  private boolean CompareLogs(int a, int b) {
    for(int i = 0; i < logCelulas[a].length; i++) {
      for(int j = 0; j < logCelulas[a][i].length; j++) {
        if(logCelulas[a][i][j].vivo != logCelulas[b][i][j].vivo) { 
          return false;
        }
      }
    }
    return true;
  }
}
