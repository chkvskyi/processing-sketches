int step = 10;
size(600, 600);
stroke(255);
strokeWeight(2);
background(0);

for (int x = 0; x < width; x = x + step) {
  for (int y = 0; y < height; y = y + step) {
    float rand = random(2);
    if (rand < 1) {
      line(x, y, x + step, y + step);
    } else {
      line(x + step, y, x, y + step);
    }
  }
}
  
