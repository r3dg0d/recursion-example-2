// ChatGPT helped with some code, and basic improvements.

float globalAngleOffset;

void setup() {
  size(800, 600);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  globalAngleOffset += 0.005;
  float initialRadius = 150;
  int levels = 5;
  int circlesPerLevel = 6;
  drawCircles(width / 2, height / 2, initialRadius, levels, circlesPerLevel, globalAngleOffset);
}

void drawCircles(float x, float y, float radius, int level, int numCircles, float angleOffset) {
  if (level == 0) {
    return;
  }

  for (int i = 0; i < numCircles; i++) {
    float angle = map(i, 0, numCircles, 0, TWO_PI) + angleOffset;
    float newX = x + cos(angle) * radius;
    float newY = y + sin(angle) * radius;
    float newRadius = radius * 0.5;
    
    fill(100, 50 + (20 * level), 255 - (20 * level));
    ellipse(newX, newY, newRadius * 2, newRadius * 2);
    
    drawCircles(newX, newY, newRadius, level - 1, numCircles, angleOffset);
  }
}
