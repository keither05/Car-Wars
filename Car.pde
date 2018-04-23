class Car{ //classes have: name,data,constructor,methods)
  color c;
  float xpos; //x position of center of car
  float ypos; //y position of center of car
  float theta; //angle of car relative to horizontal (+ is CW)
  float[] xcorners = new float[4];
  float[] ycorners = new float[4];
  float minx;
  float maxx;
  float miny;
  float maxy;
  boolean tcar;
  float xpost;
  float ypost;
  Wheel[] wheels = new Wheel[4];
  int carWidth=30;
  int carLength=60;
  
  Car(color tempC, float tempx, float tempy, float tempa){ //constructor
    c=tempC;
    xpos=tempx;
    ypos=tempy;
    theta=tempa;
    wheels[0] = new Wheel(carLength/4+2,carWidth/2,0);
    wheels[1] = new Wheel(carLength/4+2,-carWidth/2,0);
    wheels[2] = new Wheel(-carLength/4-2,carWidth/2,0);
    wheels[3] = new Wheel(-carLength/4-2,-carWidth/2,0);
  }
  
  void display(){
    xcorners[0] = carLength/2*cos(theta)+xpos+carWidth/2*sin(theta);
    xcorners[1] = carLength/2*cos(theta)+xpos-carWidth/2*sin(theta);
    xcorners[2] = xpos-carLength/2*cos(theta)+carWidth/2*sin(theta);
    xcorners[3] = xpos-carLength/2*cos(theta)-carWidth/2*sin(theta);
    ycorners[0] = carLength/2*sin(theta)+ypos-carWidth/2*cos(theta);
    ycorners[1] = carLength/2*sin(theta)+ypos+carWidth/2*cos(theta);
    ycorners[2] = ypos-carLength/2*sin(theta)-carWidth/2*cos(theta);
    ycorners[3] = ypos-carLength/2*sin(theta)+carWidth/2*cos(theta);
    
    minx=min(xcorners);
    maxx=max(xcorners);
    miny=min(ycorners);
    maxy=max(ycorners);
    
    xpos=xpos%WINX+WINX*int(xpos<0);
    ypos=ypos%WINY+WINY*int(ypos<0);
    
    xpost=xpos+WINX*int(minx<0)-WINX*int(maxx>WINX);
    ypost=ypos+WINY*int(miny<0)-WINY*int(maxy>WINY);
    tcar=(minx<0)||(maxx>WINX)||(miny<0)||(maxy>WINY);
    
    text(""+xpos,10,200);
    text(""+ypos,10,215);
    text(""+theta,10,230);
    text(xpost,10,245);
    text(ypost,10,260);
    text(int(tcar),10,275);
    
    
    ellipse(minx,miny,6,6);
    ellipse(maxx,maxy,6,6);
    fill(255);
    rect(minx+(maxx-minx)/2,miny+(maxy-miny)/2,maxx-minx,maxy-miny);
 
    stroke(0);
    fill(c);
    rectMode(CENTER);
    pushMatrix();
    translate(xpos,ypos);
    rotate(theta);
    rect(0,0,carLength,carWidth);
    for (Wheel wheel: wheels)
      wheel.display();
    popMatrix();
    if (tcar) {
      pushMatrix();
      translate(xpost,ypost);
      rotate(theta);
      rect(0,0,carLength,carWidth);
      for (Wheel wheel: wheels)
        wheel.display();
      popMatrix();
    }
  }
  
  void turn(float tempa){
    wheels[0].turn(tempa);
    wheels[1].turn(tempa);
  }
  
  void forward(){
    theta+=wheels[0].theta;
    xpos+=SPEED*cos(theta);
    ypos+=SPEED*sin(theta); 
  }
  
  void reverse(){
    theta-=wheels[0].theta;
    xpos-=SPEED*cos(theta);
    ypos-=SPEED*sin(theta);
  }
}