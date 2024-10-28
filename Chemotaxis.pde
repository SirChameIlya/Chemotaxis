PImage img;
PImage img2;

int ingotColor = color(255, 215, 0);
int score = 0;

Ingot[] ingotArray = new Ingot[15];

void setup() {
  size(700, 700);
  img = loadImage("minecraftPickAxe.png");
  img2 = loadImage("minecraftCave.jpg");
  for (int i = 0; i < ingotArray.length; i++) {
    ingotArray[i] = new Ingot((int)(Math.random()*600+50), (int)(Math.random()*600)+50);
  }
}

void draw() {
  background(255);
  image(img2,0,0,width,height);
  for (int i = 0; i < ingotArray.length; i++) {
    ingotArray[i].show();
    ingotArray[i].move();
  }
  image(img, mouseX-30, mouseY-30, 60, 60);
  fill(0);
  textAlign(CENTER);
  textSize(25);
  fill(255);
  text("Ingots mined: " + score, width/2, 50);
}

class Ingot {
  int ingotX, ingotY, ingotColor, ingotDelay;

  Ingot(int x, int y) {
    ingotX = x;
    ingotY = y;
    if ((int)(Math.random() * 2) == 1) {
      ingotColor = color(255, 215, 0);
    } else {
      ingotColor = color(192);
    }
    ingotDelay = 0;
  }

  void move() {
    
      if (ingotX < mouseX) {
        ingotX = ingotX + (int)(Math.random() * 4) - 1;
      } else if (ingotX > mouseX) {
        ingotX = ingotX - (int)(Math.random() * 4) + 1;
      }
      if (ingotY < mouseY) {
        ingotY = ingotY + (int)(Math.random() * 4) - 1;
      } else if (ingotY > mouseY) {
        ingotY = ingotY - (int)(Math.random() * 4) + 1;
      }
      for (int i = 0; i < ingotArray.length; i++) {
      if (dist(ingotArray[i].ingotX, ingotArray[i].ingotY, mouseX, mouseY) < 50) {
        ingotArray[i].ingotDelay++;
        if (ingotArray[i].ingotColor == color(255, 215, 0)) {
          ingotArray[i].ingotColor = color(255, 255, 70);
        } else if (ingotArray[i].ingotColor == color(192)) {
          ingotArray[i].ingotColor = color(240);
        }
        if (ingotArray[i].ingotDelay >= 240) {
          score++;
          ingotArray[i] = new Ingot((int)(Math.random()*600 + 50), (int)(Math.random()*600 + 50));
        }
      } else {
        if (ingotArray[i].ingotColor == color(255, 255, 70)) {
          ingotArray[i].ingotColor = color(255, 215, 0);
        } else if (ingotArray[i].ingotColor == color(240)) {
          ingotArray[i].ingotColor = color(192);
        }
      }
      if (ingotArray[i].ingotY == height) {
        ingotY -= 5;
      } else if (ingotArray[i].ingotY == 0){
        ingotY += 5;
      } else if (ingotArray[i].ingotX == 700){
        ingotX -= 5;
      } else if (ingotArray[i].ingotX == 0){
        ingotX += 5;
      }
    }
  }

  void show() {
    fill(ingotColor);
    beginShape();
    vertex(ingotX, ingotY);
    vertex(ingotX + 50, ingotY);
    vertex(ingotX + 70, ingotY + 20);
    vertex(ingotX - 20, ingotY + 20);
    vertex(ingotX, ingotY);
    endShape();
  }
}
