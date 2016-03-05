Properties BigCircle = new Properties();      // Background Circle properties
Properties Ln = new Properties();             // Line properties            
Properties Pt = new Properties();             // Point properties
int speed, num_lines;          

void configurationParameters() {
  // illusion parameters
  num_lines = 6;    // number of lines
  speed = 100;      // frames per second

  // big circle appearance
  BigCircle.x = width/2;
  BigCircle.y = height/2;
  BigCircle.d = width-10;
  BigCircle.r = BigCircle.d/2;
  BigCircle.stroke = color(255, 0, 0);
  BigCircle.fill = color(255, 0, 0);
  BigCircle.strokeWeight = 2;

  // line appearance
  Ln.stroke = color(0);
  Ln.strokeWeight = 2;
  Ln.x = Ln.y = Ln.deg = 0;    // line position

  // point appearance
  Pt.strokeWeight = 30;
  Pt.stroke = color(255);
  Pt.x = Pt.y = Pt.deg = 0;  // point position
}  // end init

void setup() {  
  configurationParameters();
  size(300, 300);
  frameRate(speed);
}

void draw() {    
  background(255);
  
  // increment point position
  Pt.deg = (Pt.deg + 1) %360;  
  
  // Draw background circle
  strokeWeight(BigCircle.strokeWeight);
  fill(BigCircle.fill);
  stroke(BigCircle.stroke);
  ellipse(BigCircle.x, BigCircle.y, BigCircle.d, BigCircle.d);

  // Show lines if a key is pressed
  if (keyPressed) {
    drawLines();
  }

  // Draw points
  drawPoints();
}  // end draw()

void drawPoints() {
  strokeWeight(Pt.strokeWeight);
  stroke(Pt.stroke);

  for (int l = 0; l < num_lines; l++) {
    Ln.x = (BigCircle.r-Pt.strokeWeight/2-1)*cos(radians(Ln.deg+l*180/num_lines));
    Ln.y = (BigCircle.r-Pt.strokeWeight/2-1)*sin(radians(Ln.deg+l*180/num_lines));

    point(BigCircle.x+Ln.x*sin(radians(Pt.deg+l*180/num_lines)), BigCircle.y+Ln.y*sin(radians(Pt.deg+l*180/num_lines)));
  } // end for
};// end drawPoints

void drawLines() {
  stroke(Ln.stroke);
  strokeWeight(Ln.strokeWeight);

  for (int l = 0; l < num_lines; l++) {
    Ln.x = BigCircle.r*cos(radians(Ln.deg + l*180/num_lines));
    Ln.y = BigCircle.r*sin(radians(Ln.deg + l*180/num_lines));

    line(BigCircle.x-Ln.x, BigCircle.y-Ln.y, BigCircle.x+Ln.x, BigCircle.y+Ln.y);
  } // end for
}; // end drawLines

class Properties { 
  float x, y, d, r, deg;
  color fill, stroke, strokeWeight;
  Properties () {
  }
}