class Star {
  color col;
  PVector pos;
  PVector vel;
  
  Star(color c) {
    col = c;
    pos = new PVector(random(width), 0);
    vel = new PVector(0, random(2));
  }
  
  void move() {
    pos.add(vel);
  }
  
  void render() {
    stroke(col);
    fill(col);
    ellipse(pos.x, pos.y, 1, 1);
  }
  
  boolean isVisible() {
    return pos.x < width && pos.y < height;
  }
}

color[] colorPallete = {
#be4a2f,
#d77643,
#ead4aa,
#e4a672,
#b86f50,
#733e39,
#3e2731,
#a22633,
#e43b44,
#f77622,
#feae34,
#fee761,
#63c74d,
#3e8948,
#265c42,
#193c3e,
#124e89,
#0099db,
#2ce8f5,
#c0cbdc,
#8b9bb4,
#5a6988,
#3a4466,
#262b44,
#181425,
#ff0044,
#68386c,
#b55088,
#f6757a,
#e8b796,
#c28569
};

ArrayList<Star> stars = new ArrayList<Star>();

void setup() {
  size(600, 600);
}

void draw() {
  int colorInd = (int) random(colorPallete.length);
  stars.add(new Star(colorPallete[colorInd]));
  for (int i = stars.size() - 1; i >= 0; i--) {
    Star s = stars.get(i);
    s.move();
    s.render();
    if (!s.isVisible()) {
      stars.remove(i);
    }
  }
}
