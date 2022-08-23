int bid;

class Building{
  
  PVector pos;
  float w,h;
  
  float velocity;
  
  color fill_ , stroke_;
  int id;
  
  Building(float x , float y , float w_ ,float v){ 
    pos = new PVector(x,y);  
    w = w_;
    h = height - y + 20;
    velocity = v;
    /*int c = (int)random(0,100);*/
    fill_ = color(random(255),100,100);
    stroke_ = color(random(255),60,100);
    id = ++bid ;
  }
  
  void display(){
    
      if(pos.x<width){
        fill(fill_);
        stroke(stroke_);
        rect(pos.x , pos.y ,w,h);
      }
  }
  
  void update(){
    
     pos.x -= velocity/frameRate ;
  }
  
  void run(){

    update();
    display();
  }

}
