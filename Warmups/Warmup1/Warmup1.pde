// BitLeigh Vu

color[] colors = new color[4];
int k = 0;

void setup() {
  size(600, 600);
  
  for (int x = 0; x < 4; x++) {
    colors[0] =  color(179, 163, 105); // tech gold 
    colors[1] =  color(234, 170, 0); // buzz gold 
    colors[2] =  color(245, 213, 128); // buzz gold 60
    colors[3] =  color(255, 255, 255); // white 
  }
}

void draw() {
  background(0, 48, 87); // gt blue 
  noStroke();
  
  rectMode(CENTER);
  rect(width/2, height/2, width/3, height/3);
  
  float centerX = width/2;
  float centerY = height/2;
  
  float angle = atan2(mouseY - centerY, mouseX - centerX);
  float radius = sqrt(sq(mouseX - centerX) + sq(mouseY - centerY)); 
  float size = 100;
  
  recursiveSquare(radius, angle, size, centerX, centerY);
  recursiveSquare(radius, angle + HALF_PI, size, centerX, centerY);
  recursiveSquare(radius, angle + PI, size, centerX, centerY);
  recursiveSquare(radius, angle + (3 * HALF_PI), size, centerX, centerY);
}


void recursiveSquare(float radius, float angle, float size, float centerX, float centerY) {
  
  float x = cos(angle) * radius + centerX;
  float y = sin(angle) * radius + centerY;
  
  fill(colors[k]);
  rect(x, y, size, size);
  
  radius = radius/2;
  size = size/2;
  centerX = x;
  centerY = y;
  k++;
  
  // reset color array fill
  if (k == 3) {
    k = 0;
  }
 
  
  if (size > 2) {
   
    recursiveSquare(radius, angle, size, x, y);
    recursiveSquare(radius, angle + HALF_PI, size, x, y);
    recursiveSquare(radius, angle + PI, size, x, y);
    recursiveSquare(radius, angle + (3 * HALF_PI), size, x, y);
  }
}
