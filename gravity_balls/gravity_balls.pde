class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float size;
  float volume;
  
  
  Ball(int speed) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-speed, speed), random(-speed, speed));
    acc = new PVector(0, 0);
    size = random(60);
    
    float r = (size / 2);
    volume = (4 / 3) * PI * r * r * r;
  }
  
  void draw() {
    stroke(255);
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void run() {
    if (pos.x > width || pos.x < 0) {
      vel.x = - vel.x;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y = - vel.y;
    }
    vel.add(acc);
    acc.mult(0);
    pos.add(vel.div(fraction));
  }
  
  void applyForce(PVector f) {
    acc.add(f);
  }
}

int count = 2;
Ball[] balls = new Ball[count];
float maxSpeed = 5;
float fraction = 1.0;

void setup() {
  size(300, 300, P2D);
  //fullScreen(P2D);
  background(0);
  for (int i = 0; i < count; i++) {
    balls[i] = new Ball(2);
  }
}

void draw() {
  fill(0, 0, 0, 20);
  strokeWeight(0);
  rect(0, 0, width, height);
  
  fill(255);
  
  for (Ball a: balls) {
    for (Ball b: balls) {
      float d = dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
      
      if (d < 200 && d > 1) {
        PVector gravity = b.pos.copy().sub(a.pos).div(d * d * 10).mult(b.size);
        a.applyForce(gravity);
      }
    }
    a.run(); 
  }
  
  for (int i = 0; i < count; i++) {
    balls[i].draw();
  }
}

void mouseClicked() {
  background(0);
}
