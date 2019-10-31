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
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector f) {
    acc.add(f);
  }
}

int count = 100;
Ball[] balls = new Ball[count];
float maxSpeed = 5;
// drag force
float Cd = 0.01;

// gravity
float Cg = 0.1;

void setup() {
  size(1200, 1200, P2D);
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
  //background(0);
  
  fill(255);
  
  for (Ball a: balls) {
    for (Ball b: balls) {
      float d = dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
      
      if (d < 400 && d > a.size + b.size) {
        PVector gravity = b.pos.copy().sub(a.pos).normalize().mult(Cg * b.volume * a.volume).div(d * d);
        a.applyForce(gravity);
      } else if (d < a.size + b.size && d > 1) {
        PVector agr = b.pos.copy().sub(a.pos).normalize().mult(-1 * b.size * a.size).div(d * d);
        a.applyForce(agr);
      }
    }
    PVector drag = a.vel.get();
    drag.normalize();
    float s = a.vel.mag();
    drag.mult(-Cd * s * s);
    a.applyForce(drag);
    a.run(); 
  }
  
  for (int i = 0; i < count; i++) {
    balls[i].draw();
  }
}

void mouseClicked() {
  background(0);
}
