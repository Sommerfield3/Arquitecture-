import processing.sound.*;
AudioIn input;
Amplitude analyzer;
class Game{

  Engine e;
  int seen ;
  int score ;
  int highScore;
  Game(){
    e = new Engine();
    seen = 0;
    highScore = 0;
  }

  void play(){
    if(seen==0){
      //strartscren
      startScreen();
    }
    else if(seen == 1){
      //install
      score = 0;
      e.clear();
      e.start();

      seen = 2;
    }
    else if(seen == 2){
      //play screen
      e.run();
      fill(0);

      text((int)score,8*width/10, height / 10 );
      score ++;

      if(e.p.pos.y > height){
        seen = 3;
      }

  }
    else if(seen == 3){
      //end screen;
      endScreen();

    }

  }

  void startScreen(){

    
    fill(34,100,50);
    stroke(34,100,100);
    ellipse(width/2,height/2,height/2.5,height/2.5);
    
    stroke(0,0,100);
    fill(0,0,100);
    triangle(width/2 - 30, height/2 + 30 , width/2 -30 , height/2 -30 , width/2 +30, height/2);

    if( dist(mouseX,mouseY,width/2,height/2) < height/5 ){
      stroke(34,100,100);
      fill(0,0,200);
      ellipse(width/2,height/2,height/2.5,height/2.5);
      
      stroke(34,100,100);
      fill(34,100,100);
      triangle(width/2 - 30, height/2 + 30 , width/2 -30 , height/2 -30 , width/2 +30, height/2);
      if(mousePressed)
        seen = 1;

    }

    
    
  }

  void endScreen(){
      highScore = max(highScore,score);
      e.run();
      noStroke();
      fill(0,0,100,80);    
      rect(0,0,width,height);
      fill(0,0,0);
      text("High Score "+highScore , width/2, height - 50 ); 
      
      fill(34,100,50);
      stroke(34,100,100);
      ellipse(width/2,height/2 - 20,height/2.5,height/2.5);
    
      stroke(0,0,100);
      fill(0,0,100);
      triangle(width/2 - 30, height/2 + 30 -20 , width/2 -30 , height/2 -30 -20 , width/2 +30, height/2-20);

      if( dist(mouseX,mouseY,width/2,height/2-20) < height/5 ){
        stroke(34,100,100);
        fill(0,0,100);
        ellipse(width/2,height/2-20,height/2.5,height/2.5);
      
        stroke(34,100,100);
        fill(34,100,100);
        triangle(width/2 - 30, height/2 + 30-20 , width/2 -30 , height/2 -30-20 , width/2 +30, height/2-20);

      if(mousePressed)
        seen = 1;

    }

  }

}
