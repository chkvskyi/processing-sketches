class Ball {
  float x;
  float y;
  float w;
  float h;
  
  float xSpeed;
  float ySpeed;
  
  Ball(int speed) {
    x = random(width);
    y = random(height);
    w = 6;
    h = 6;
    xSpeed = random(-speed, speed);
    ySpeed = random(-speed, speed);
  }
  
  void draw() {
    stroke(255);
    fill(255);
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
  
  void connect(Ball[] balls) {
    for (int i = 0; i < balls.length; i++) {
      float distance = dist(x, y, balls[i].x, balls[i].y);
      if (distance < 150) {
        stroke(255, 150 * 50 / distance);
        line(x, y, balls[i].x, balls[i].y);
      }
    }
  }
}

int count = 400;
Ball[] balls = new Ball[count];

void setup() {
  fullScreen(P2D);
  background(0);
  for (int i = 0; i < count; i++) {
    balls[i] = new Ball(10);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < count; i++) {
    balls[i].run();
  }
  
  for (int i = 0; i < count; i++) {
    balls[i].draw();
    balls[i].connect(balls);
  }
}
