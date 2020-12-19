boolean isFrame = false;
  
void setup() {
  frameRate(60);
  size(220, 160);
}

void draw() {
  background(153);
  if(isFrame) {
    square(20,20,80);
  } else {
    square(120,20,80);
  }
  isFrame = !isFrame;
  text("Rendered FPS: " + frameRate, 20, 140);
}
