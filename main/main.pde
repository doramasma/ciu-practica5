float eyeX, eyeY, eyeZ, targetX, targetY, targetZ;
float dist;
float dx;
PImage cubeTexture;
PShape cube;
boolean [] move = new boolean[6];
boolean [] ligthControl = new boolean[6];
float lightIntensity;
int flag;

void setup() {
  size(700, 700, P3D);
  dist = -50;
  eyeX=0;
  eyeY=150;
  eyeZ=0.01;
  targetX=0;
  targetY=-100;
  targetZ=dist;
  lightIntensity = 30;
  flag = 0;
  dx = 0;
  cubeTexture = loadImage("./image/cubeTexture.png");
}

void draw() {
  background(0);
  lightFalloff(.5, 0, 0.0008);
  myCamera();
  move();
  puntero();
  paintBox();
  rotateWall();
  ligthControl();
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
    1, 10000);
}

void paintBox() {

  pushMatrix();
  translate(0, 0, 0);
  cube = createShape(BOX, 10); 
  cube.setTexture(cubeTexture);
  popMatrix();
}

void paintWall(int x, int y) {
  for (int i = 0; i <= x; i = i + 10) {
    for (int j = 0; j <= y; j = j + 10) {
      pushMatrix();
      translate(i, j, 0);
      shape(cube);
      popMatrix();
    }
  }
}

void rotateWall() {
    paintWall(200,200);
    pushMatrix();
    rotateX(radians(270));
    paintWall(200,200);
    translate(0,0,200);
    paintWall(200,200);
   
    popMatrix();
    pushMatrix();
    rotateY(radians(90));
    paintWall(200,200);
    translate(0,0,200);
    paintWall(200,200);
    popMatrix();
    translate(0,0,-200);
    paintWall(200,100);
    paintWall(125,200);
}

void myCamera() {
  pushMatrix();
  translate(eyeX, eyeY, eyeZ);
  rotateY(radians(-dx));
  //rotateX(radians(mouseY *.5));
  translate(0, 0, dist);
  targetX = modelX(0, 0, 0);
  targetY = modelY(0, 0, 0);
  targetZ = modelZ(0, 0, 0);

  popMatrix();

  camera(eyeX, eyeY, eyeZ, targetX, targetY, targetZ, 0, 1, 0);
}

void puntero() {
  pushMatrix();
  //pushStyle();
  translate(eyeX, eyeY, eyeZ);
  rotateY(radians(-dx));
  translate(0, 0, -50);
  if (flag == 0) {
    emissive(lightIntensity, lightIntensity, lightIntensity);
    ambientLight(200, 200, 20);
  }
  
  if (flag == 1) {
    emissive(lightIntensity, 0, 0);
    ambientLight(200, 0, 0);
  }
  if (flag == 2) {
    emissive(0, lightIntensity, 0);
    ambientLight(0, 200, 0);
  }
  if (flag == 3) {
    emissive(0, 0, lightIntensity);
    ambientLight(0, 0, 200);
  }
  box(1);
  
  //popStyle();
  popMatrix();
}

void move() {
  float vX = 0;
  float vY = 0;
  float vZ = 0;
  int sign = 1;
  if (move [0] == true) {
    sign = +1;
    vX=targetX-eyeX;
    vY=targetY-eyeY;
    vZ=targetZ-eyeZ;
  } else if (move[1] == true) {
    sign = -1;
    vX=targetX-eyeX;
    vY=targetY-eyeY;
    vZ=targetZ-eyeZ;
  }
  eyeX += vX * 0.2 * sign;
  eyeY += vY * 0.2 * sign;
  eyeZ += vZ * 0.2 * sign;
}

void ligthControl() {
  if (ligthControl[0] == true && lightIntensity < 255) lightIntensity += 15;
  if (ligthControl[1] == true && lightIntensity > 0)   lightIntensity -= 15; 
}

void keyPressed() {
  if (key == 'w' || key == 'W') move[0] =true;
  if (key == 's' || key == 'S') move[1] =true;
  if (key == CODED) {   
    if (keyCode == UP)   ligthControl[0] = true ;
    if (keyCode == DOWN) ligthControl[1] = true ;
    if (keyCode == RIGHT) {
      flag +=1;
      if (flag > 3) flag = 0;
    }
    if (keyCode == LEFT) {
      flag -=1;
      if (flag < 0) flag = 3;
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') move[0] =false;
  if (key == 's' || key == 'S') move[1] =false;
  if (key == CODED) {
   
    if (keyCode == UP)   ligthControl[0] = false ;
    if (keyCode == DOWN) ligthControl[1] = false ;
  }
}

void mouseDragged() {
  dx += (mouseX - pmouseX) * .5;
}
