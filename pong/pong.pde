
class Pelota
{
  float x;
  float y;
  float w;
  float spdx = 0;
  float spdy = 0;
  float acc = 0.02;
  float friction = 0.01;
  
  public Pelota(float _x, float _y, float _w)
  {
    this.x = _x;
    this.y = _y;
    this.w = _w;
  }
  
  public void move(float fx, float fy, float boundx, float boundy)
  {
    this.spdx += fx * this.acc;
    this.spdy += fy * this.acc;
    this.spdx = this.spdx * (1.0 - this.friction);
    this.spdy = this.spdy * (1.0 - this.friction);
    this.x += this.spdx;
    this.y += this.spdy;
    while(this.x < 0) { this.x += boundx; }
    while(this.y < 0) { this.y += boundy; }
    this.x = this.x % boundx;
    this.y = this.y % boundy;
  }
  
}



Pelota mipelota;
int timer;


void setup()
{
  size(600, 400);
  frameRate(60);
  stroke(255,0,0);
  fill(255,0,0);
  
  mipelota = new Pelota(width/2, height/2, 20);
}



void draw()
{
  background(0);
  rect(mipelota.x, mipelota.y, mipelota.w, mipelota.w);
  int fx = 0, fy = 0;
  if(keyPressed)
  {
    if(key == CODED)
    {
      if(keyCode == LEFT) { fx--; }
      else if(keyCode == RIGHT) { fx++; }
      else if(keyCode == UP) { fy--; }
      else if(keyCode == DOWN) { fy++; }
    }
    else
    {
      if(key == 'a') { fx--; }
      else if(key == 'd') { fx++; }
      else if(key == 'w') { fy--; }
      else if(key == 's') { fy++; }
    }
  }
  mipelota.move(fx, fy, width, height);
  
  if(millis() - timer >= 2000)
  {
    println("Speed [ " + mipelota.spdx + " , " + mipelota.spdy + " ]");
  }
}
