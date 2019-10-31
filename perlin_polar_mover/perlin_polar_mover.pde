float r = 20;
float t = 0;

void setup() {
  size(1500, 1500);
  background(0);
  fill(255);
  stroke(255);
  translate(width / 2, height / 2);
}

void draw() {
  float nr = noise(t) * r;
  float x = sin(t) * nr;
  float y = cos(t) * nr;
  pushMatrix();
  translate(width / 2, height / 2);
  ellipse(x, y, 1, 1);
  popMatrix();
     
  r += 0.01;
  t += 0.001;
}
