class Point {
  int x;
  int y;
  
  Point(int dx, int dy) {
    x = dx;
    y = dy;
    ellipse(x, y, 1, 1);
  }
}
Point[] points = new Point[3];
int clicked = 0;
Point prev;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  fill(255);
}

void draw() {
  if (clicked > 3) {
    Point next = points[(int) random(3)];
    Point middle = new Point((prev.x + next.x) / 2, (prev.y + next.y) / 2);
    prev = middle;
  }
}

void mouseClicked() {
  if (clicked <= 4) {
    points[clicked] = new Point(mouseX, mouseY);
    prev = points[clicked];
    clicked++;
  }
 }
