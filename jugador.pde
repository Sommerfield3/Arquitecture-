class Player{

  PVector pos;
  int size;

  float gravity = 1000;
  float velocity ; // = 0;

  float jumpVel = 375;
  float onAirJump = 605;

  boolean grounded = false ;
  int level;

  Player(){
    pos = new PVector(width/10,0);
    size = min(width,height)/15;
  }

  void onReady(){
    velocity = 0;
    pos.y = 0;
  }
  void display(){

    pushStyle();

      stroke(0);
      fill(0);
      
      rect(pos.x,pos.y,size,size);
    popStyle();
  }

  void update(){

    velocity += gravity/frameRate ;
    if(grounded)velocity = 0;
    pos.y += velocity/frameRate ;

  }

  void run(){

    update();
    jump();
    display();
  }

  void jump(){
    float vol = analyzer.analyze();
    if(vol>0.019){/*Calibrar*/

      if(grounded){
        pos.y -= 1;
        velocity = -jumpVel;
      }
      else{
        velocity -= onAirJump/frameRate;
      }

    }
  }

}
