class Ball {
  float x;
  float y;
  float w;
  float h;
  
  float xSpeed;
  float ySpeed;
  
  Ball() {
    x = random(width);
    y = random(height);
    w = 20;
    h = 20;
    xSpeed = random(2, 8);
    ySpeed = random(2, 8);
  }
  
  void draw() {
    float r = 255 * x / width;
    float b = 255 * y / height;
    //stroke(r, 255, b);
    fill(r, 255, b);
    ellipse(x, y, w, h);
  }
  
  void run() {
    if (x > width || x < 0) {
      xSpeed = -xSpeed;
    }
    if (y > height || y < 0) {
      ySpeed = -ySpeed;
    }
    x += xSpeed;
    y += ySpeed;
  }
}

int count = 30;
Ball[] balls = new Ball[count];

void setup() {
  size(1900, 1200);
  background(0);
  for (int i = 0; i < count; i = i + 1) {
    balls[i] = new Ball();
  }
}

void draw() {
  //background(0);
  for (int i = 0; i < count; i = i + 1) {
    balls[i].draw();
    balls[i].run();
  }
}
