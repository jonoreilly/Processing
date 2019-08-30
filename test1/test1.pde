


public class miPixel
{
  public float x;
  public float y;
  public int r;
  public int g;
  public int b;
  
  public miPixel(float _x, float _y, int _r, int _g, int _b)
  {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.g = _g;
    this.b = _b;
  }
}


miPixel[] pixeles;

void setup ()
{
  size(500, 300);
  frameRate(60);
  background(0);
  
  pixeles = new miPixel[width];
  
  for (int i = 0; i < width; i++)
  {
    pixeles[i] = new miPixel(i, 0, floor(random(255)), floor(random(255)), floor(random(255)));
    //println("Color " + i + ": " + pixeles[i].x + " " + pixeles[i].y);
  }
}



int counter = 0;


void draw ()
{
  background(0);
  for(int i = 0; i < width; i++)
  {
    stroke(color(map(sin(pixeles[i].r + counter/10.0), -1, 1, 0, 255), map(sin(pixeles[i].g + counter/10.0), -1, 1, 0, 255), map(sin(pixeles[i].b + counter/10.0), -1, 1, 0, 255)));
    line(pixeles[i].x, 0, pixeles[i].x, height); 
  }
  counter++;
  counter = counter % 628;
  println(frameRate);
}
