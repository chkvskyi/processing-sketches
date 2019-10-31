float r = 0;
float t = 0;

void setup() {
  size(1000, 1000);
  background(0);
  fill(255);
  stroke(255);
  translate(width / 2, height / 2);
}

void draw() {
  float x = sin(t) * r;
  float y = cos(t) * r;
  pushMatrix();
  translate(width / 2, height / 2);
  ellipse(x, y, 1, 1);
  popMatrix();
     
  r += 0.01;
  t += 0.001;
}
