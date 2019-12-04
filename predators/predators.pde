/*
TODO:
  single attractor
  positive and negative balls
*/

class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float size;
  float volume;
  
  int charge;
  
  Particle(int speed, float s, int ch) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-speed, speed), random(-speed, speed));
    acc = new PVector(0, 0);
    size = s;
    
    float r = (size / 2);
    volume = (4 / 3) * PI * r * r * r;
    
    charge = ch;
  }
  
  void draw() {
    if (charge > 0) {
      stroke(0, 0, 255);
      fill(0, 0, 255);
    } else {
      stroke(255, 0, 0);
      fill(255, 0, 0);
    }
    
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

Particle[] preys = new Particle[90];
Particle[] predators = new Particle[3];
float maxSpeed = 5;
// drag force
float Cd = 0.001;

// gravity
float Cg =  0.0000001;
float Cag = 0.000001;

void setup() {
  size(1000, 1000, P2D);
  //fullScreen(P2D);
  background(0);
  for (int i = 0; i < 3; i++) {
    predators[i] = new Particle(5, 80, -1);
  }
  
  for (int i = 0; i < 90; i++) {
    preys[i] = new Particle(2, 20, 1);
  }
}

void draw() {
  fill(0, 0, 0, 20);
  strokeWeight(0);
  rect(0, 0, width, height);
  //background(0);
  
  fill(255);
  
  for (Particle predator: predators) {
    for (Particle prey: preys) {
      float d = dist(predator.pos.x, predator.pos.y, prey.pos.x, prey.pos.y);
      
      if (d > predator.size + prey.size) {
        PVector dir = prey.pos.copy().sub(predator.pos).normalize();
        PVector gravity = dir.mult(40).div(d * d);
        predator.applyForce(gravity);
        
        PVector agravity = dir.mult(-100).div(d * d);
        prey.applyForce(agravity);
      }
    }
    PVector drag = predator.vel.get();
    drag.normalize();
    float s = predator.vel.mag();
    drag.mult(-Cd * s * s);
    predator.applyForce(drag);
    predator.run(); 
  }
  
  for  (Particle prey1: preys) {
    for (Particle prey2: preys) {
      float d = dist(prey1.pos.x, prey1.pos.y, prey2.pos.x, prey2.pos.y);
      if (d > prey1.size + prey2.size) {
        PVector dir = prey2.pos.copy().sub(prey1.pos).normalize();
        PVector gr = dir.mult(20).div(d * d);
        prey1.applyForce(gr);
      }
    }
    PVector drag = prey1.vel.get();
    drag.normalize();
    float s = prey1.vel.mag();
    drag.mult(-Cd * s * s);
    prey1.applyForce(drag);
    prey1.run();
  }
  
  for (Particle p: predators) {
    p.draw();
  }
  
  for (Particle p: preys) {
    p.draw();
  }
}

void mouseClicked() {
  background(0);
}
