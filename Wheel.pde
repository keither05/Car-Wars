class Wheel{
  float xpos;
  float ypos;
  float theta;
  
  Wheel(float tempx, float tempy, float tempa){
    xpos=tempx;
    ypos=tempy;
    theta=tempa;
  }
  
  void turn(float tempa){
    theta=theta+tempa;
    if (abs(theta)>MAX_TURN){
      theta=theta-tempa;
    }
  }
  
  void display(){
    stroke(0);
    strokeWeight(8);
    pushMatrix();
    translate(xpos,ypos);
    rotate(theta);
    line(-8,0,8,0);
    strokeWeight(1);
    popMatrix();
  }
}