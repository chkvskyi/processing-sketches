fullScreen();
loadPixels();
for (int i = 0; i < pixels.length; i++) {
  int x = i % width;
  int y = (int) Math.floor(i / width);
  float r = x * 255 / width;
  float g = y * 255 / height;
  float b = 255 - r - g;
  pixels[i] = color(r, g, b);
}
updatePixels();
