class Ball {
  float x;
  float y;
  float size;
  
  float xSpeed;
  float ySpeed;
  
  Ball(int speed) {
    x = random(width);
    y = random(height);
    size = random(20);
    xSpeed = random(-speed, speed);
    ySpeed = random(-speed, speed);
  }
  
  void draw() {
    stroke(255);
    fill(255);
    ellipse(x, y, size, size);
  }
  
  void run(Ball[] balls) {
    if (x > width || x < 0) {
      xSpeed = -xSpeed;
    }
    if (y > height || y < 0) {
      ySpeed = -ySpeed;
    }
    for (int i = 0; i < balls.length; i++) {
      float distance = dist(x, y, balls[i].x, balls[i].y);
      if (distance < 150 && distance > 0) {
        float dirX = balls[i].x - x;
        float dirY = balls[i].y - y;
        xSpeed = xSpeed + dirX / ((float) Math.floor(distance) * 300/ balls[i].size);
        ySpeed = ySpeed + dirY / ((float) Math.floor(distance) * 300/ balls[i].size);
      }
    }
    if (xSpeed > maxSpeed) {
      xSpeed = maxSpeed;
    }
    if (ySpeed > maxSpeed) {
      ySpeed = maxSpeed;
    }
    x += xSpeed;
    y += ySpeed;
  }
}

int count = 10;
Ball[] balls = new Ball[count];
float maxSpeed = 5;

void setup() {
  fullScreen(P2D);
  background(0);
  for (int i = 0; i < count; i++) {
    balls[i] = new Ball(1);
  }
}

void draw() {
  //background(0);
  for (int i = 0; i < count; i++) {
    balls[i].run(balls);
  }
  
  for (int i = 0; i < count; i++) {
    balls[i].draw();
  }
}

void mouseClicked() {
  background(0);
}
