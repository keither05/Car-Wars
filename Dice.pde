//should really have a separate class die and a dice class that contains some die

class Dice{
  int ndie; //number of dice
  float xpos; //x position of top of dice display
  float ypos; // y position of top of dice display
  float size=30;
  int maxDice=6;
  int[] nspots;
  
  Dice(float tempx, float tempy){
    ndie=0;
    xpos=tempx;
    ypos=tempy;
    nspots = new int[maxDice];
    for (int i=0; i<maxDice; i++)
      nspots[i]=ceil(random(6));
  }
  
  void display(){
    stroke(0);
    fill(255);
    pushMatrix();
    translate(xpos,ypos);
    rect(0,0,30,25);
    fill(200);
    rect(10,-6.25,10,12.5);
    rect(10,6.25,10,12.5);
    rect(0,20,30,15);
    fill(0);
    textSize(16);
    text(""+ndie,-10,6);
    textSize(12);
    text("roll",-10,25);
    triangle(8,-4,10,-9,12,-4);
    triangle(8,4,10,9,12,4);
    for (int i=0; i<ndie;i++){
      fill(240);
      float ty=10+40*(i+1);
      rect(0,ty,size,size);
      fill(0);
      switch(nspots[i]) {
        case 1:
          ellipse(0,ty,5,5);
          break;
        case 2:
          ellipse(-5,ty-5,5,5);
          ellipse(5,ty+5,5,5);
          break;
        case 3:
          ellipse(-7,ty-7,5,5);
          ellipse(0,ty,5,5);
          ellipse(7,ty+7,5,5);
          break;
        case 4:
          ellipse(-6,ty-6,5,5);
          ellipse(-6,ty+6,5,5);
          ellipse(6,ty-6,5,5);
          ellipse(6,ty+6,5,5);
          break;
        case 5:
          ellipse(-7,ty-7,5,5);
          ellipse(-7,ty+7,5,5);
          ellipse(7,ty-7,5,5);
          ellipse(7,ty+7,5,5);
          ellipse(0,ty,5,5);
          break;
        case 6:
          ellipse(-6,ty-8,5,5);
          ellipse(-6,ty,5,5);
          ellipse(-6,ty+8,5,5);
          ellipse(6,ty-8,5,5);
          ellipse(6,ty,5,5);
          ellipse(6,ty+8,5,5);
          break;
        default:
          ellipse(0,ty,5,5);
          break;
      }
    }
    popMatrix();
  }
  
  void checkDice(float tempx, float tempy) {
    if(tempx>xpos+5&tempx<xpos+15&tempy>ypos-12.5&tempy<ypos+0&ndie<maxDice){
      fill(0);
      rect(xpos+10,ypos-6.25,10,12.5);
      ndie+=1;
    }
    else if (tempx>xpos+5&tempx<xpos+15&tempy>ypos+0&tempy<ypos+12.5&ndie>0){
      fill(0);
      rect(xpos+10,ypos+6.25,10,12.5);
      ndie-=1;
    }
    else if (tempx>xpos-15&tempx<xpos+15&tempy>ypos+12.5&tempy<ypos+27.5) {
      roll();   
    }
  }
  
  void roll() {
    fill(0);
    rect(xpos,ypos+20,30,15);
    for (int i = 0; i<ndie; i++) {
      nspots[i] = ceil(random(6));
    }
  }
    
}