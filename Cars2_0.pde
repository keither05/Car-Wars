Car[] cars = new Car[2]; //<>// //<>//
Dice rdice;
float TANGLE=PI/24;
float MAX_TURN=PI/4;
float SPEED=10;
int active = 0;
int WINX=400;
int WINY=400;
boolean drive=false;
boolean rdrive=false;
boolean dispdice=false;

void settings() {
  size(WINX,WINY);
}

void setup() {
  rdice = new Dice(WINX-25,18);
  cars[0] = new Car(200,WINX/2,WINY/2,0);
  cars[1] = new Car(150,WINX/4,WINY/4,PI/2);
}

void draw() {
  background(255);
  
  drawInstructions();
  
  if (dispdice==true) 
    rdice.display();
  
  for(Car car: cars)
    car.display();
  
  if (drive==true){
    cars[active].forward();
  }
  
  if (rdrive==true){
    cars[active].reverse();
  }
}

void drawInstructions() {
  fill(0);
  text("arrow keys=move",10,10);
  text("'f'=continuous forward",10,25);
  text("'r'=continuous reverse",10,40);
  text("'s'=stop",10,55);
  text("'Tab'=next car",10,70);
  text("'d'=dice",10,85);
}

void keyPressed(){
  if (keyCode==TAB){
    active = (active + 1)%2;
  }
  
  if (keyCode==LEFT){
    cars[active].turn(-TANGLE);
  } 
  if (keyCode==RIGHT) {
    cars[active].turn(TANGLE);
  }
  if (keyCode==UP) {
    cars[active].forward();
  }
  if (keyCode==DOWN) {
    cars[active].reverse();
  }
  if (key =='f') {
    SPEED=4;
    drive=true;
    rdrive=false;
  }
  if (key == 'r') {
    SPEED=4;
    drive=false;
    rdrive=true;
  }
  if (key == 's') {
    SPEED=10;
    drive=false;
    rdrive=false;
  }
  if (key == 'd') {
    dispdice=!dispdice;
  }
} //<>// //<>//

void mouseClicked() {
  rdice.checkDice(mouseX,mouseY);
}