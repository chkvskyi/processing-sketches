float x;
float y;

void setup() {
  size(600, 600);
  background(0);
  x = 300;
  y = 300;
  stroke(255);
  fill(255);
  rect(x, y, 1, 1);
}

void draw() {
  int rand = int(random(4));
  if (rand == 0) {
    //up
    y = y + 1;
  } else if (rand == 1) {
    //right
    x = x + 1;
  } else if (rand == 2) {
    // bottom
    y = y - 1;
  } else {
    //left
    x = x - 1;
  }
  if (x > width) {
    x = x - width;
  }
  if (y > height) {
    y = y - height;
  }
  ellipse(x, y, 1, 1);
}
