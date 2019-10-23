class Ball {
  PVector pos;
  PVector vel;
  float size;
  
  
  Ball(int speed) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-speed, speed), random(-speed, speed));
    size = random(60);
  }
  
  void draw() {
    stroke(255);
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void run(Ball[] balls) {
    if (pos.x > width || pos.x < 0) {
      vel.x = - vel.x;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y = - vel.y;
    }
    for (int i = 0; i < balls.length; i++) {
      float distance = dist(pos.x, pos.y, balls[i].pos.x, balls[i].pos.y);
      if (distance < 200 && distance > 1) {
        PVector gravity = balls[i].pos.copy().sub(pos).div(distance * distance * 20).mult(balls[i].size);
        vel.add(gravity);
      }
    }
    pos.add(vel.div(fraction));
  }
}

int count = 30;
Ball[] balls = new Ball[count];
float maxSpeed = 5;
float fraction = 1.1;

void setup() {
  size(1000, 1000, P2D);
  //fullScreen(P2D);
  background(0);
  for (int i = 0; i < count; i++) {
    balls[i] = new Ball(2);
  }
}

void draw() {
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  fill(255);
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
