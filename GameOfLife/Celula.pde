
class Celula {
  int vecinos;
  boolean vivo;
  
  public Celula() {
    this.vivo = false;
    vecinos = 0;
  }
  public Celula(boolean vivo, int vecinos) {
    this.vivo = vivo;
    this.vecinos = vecinos;
  }
  
  public boolean NextState() {
    return ((this.vecinos == 3) || (this.vivo && this.vecinos == 2));
  }
  
  public Celula Clone() {
    return new Celula(this.vivo, this.vecinos); 
  }
}
