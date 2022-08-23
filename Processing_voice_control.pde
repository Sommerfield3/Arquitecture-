Game g;
boolean juego1exe = false;
boolean juego2exe = false;
PImage dinosaurioImg;
PImage bombaImg;
PImage cannonImg;
int a = 800;
int b = 400;
int vel = 1;
int varx = 100;
int vary = 400;
boolean trigger = false;
int txt1 = 0;
int txt2 = 10;
boolean gameoverW = false;
boolean gameoverL = false;
boolean hit = false;
boolean ejecutando = false;

void setup(){
  bid = 0;
  size(1200,500);
  //fullScreen();
  strokeWeight(width/36);
  strokeJoin(ROUND);
  //stroke(0,0,100);
  frameRate(1000);
  strokeWeight(height/32);
  textAlign(CENTER, CENTER);
  textSize(26);
  input = new AudioIn(this, 0);
  // start the Audio Input
  input.start();
  // create a new Amplitude analyzer
  analyzer = new Amplitude(this);
  // Patch the input to an volume analyzer
  analyzer.input(input);
}

void draw(){
  if(width > 500 && gameoverW==false && gameoverL==false){
  background(0,0,100);
  }
  else if(gameoverW==false && gameoverL==false){
    text("screen size not suported",width/2,height/2);
    text("open on desktop or laptop",width/2 + 100,height/2);
  }
  if(juego1exe == false && juego2exe == false){
    fill(255, 0, 0);
    quad(width/8, height/8, width/8, 7*height/8, width/2, 7*height/8, width/2, height/8);
    fill(0, 255, 0);
    quad(7*width/8, height/8, 7*width/8, 7*height/8, width/2+10, 7*height/8, width/2+10, height/8);
    textSize(24);
    text("Runner con reconocimiento de voz", 350, 200);
    text("Haga clic para iniciar", 350, 300);
    fill(255, 0, 0);
    text("Juego de precisión con voz", 800, 200);
    text("Haga clic para iniciar", 800, 300);
  }
  else if(juego1exe == true && juego2exe == false){
    g.play();
    ejecutando = true;
  }
  else if(juego2exe == true && gameoverW == false && gameoverL == false){
    b = b + vel;       
    if (b > height || b < 0 ) {
    vel = vel * -1;
    }
    push();
    translate (0, 0);
    image (dinosaurioImg, a - 150, b);
    pop();
    float vol = analyzer.analyze();
    if(vol >0.019){
      trigger = true;
    }
    if(trigger){
      varx = varx+1;
    }
    if(varx> 1300){
      varx=100;
      trigger = false;
      txt2 = txt2-1;
    }
      if(dist(a, b, varx, vary) < 150){
        txt1 = txt1 + 1;
        txt2 = txt2 -1;
        varx=100;
        trigger = false;
        hit = true;
      }
        
      
      if(txt2<1 && txt1 >5){
       gameoverW = true;
      }
      
      if(txt2<1 && txt1 < 5){
        gameoverL = true;
      }
      
      push();
      image(bombaImg, varx+40, vary+5);
      pop();
      
      image(cannonImg, 30, 400);
      
      fill(0);
      textSize(30);
      text("Puntaje: ", 100, 60);
      text(txt1, 200, 60);
      text("Bombas restantes: ", 160, 120);
      text(txt2, 360, 120);
      textSize(16);
      text("Di algo para lanzar una bomba. ", 100, 650);
      textSize(20);
      text("Anota 5 puntos para ganar", 100, 675);
      if(gameoverL == true){
        clear();
        background(255);
        fill(0);
        textSize(24);
        text("PERDISTE", 400, 100);
        text("Puntaje final: ", 400, 150);
        text(txt1, 500, 150);
      }
      
      if(gameoverW == true){
        clear();
        background(255);
        fill(0);
        textSize(24);
        text("GANASTE", 400, 100);
        text("Puntaje final: ", 400, 150);
        text(txt1, 500, 150);
      }
      
  } 
  
  if(gameoverW==true || gameoverL==true){
    if(mousePressed){
          gameoverW = false;
          txt1= 0;
          txt2 = 10;
        }
  }
}

void cargarimagenes(){
  dinosaurioImg = loadImage ("png_dinosaur_41567.png");
  bombaImg = loadImage ("Fuse-Bomb-PNG-Free-Image.png");
  cannonImg = loadImage ("Cannon.png");
}

void mousePressed(){
  if((mouseX > width/8) && (mouseX<width/2) && (mouseY>height/8) && (mouseY<7*height/8) && ejecutando == false){
    g = new Game();
    juego1exe = true;
    colorMode(HSB, 100);
  }
  else if((mouseX > width/2+10) && (mouseX<7*width/8) && (mouseY>height/8) && (mouseY<7*height/8) && juego1exe == false){
    cargarimagenes();
    dinosaurioImg.resize(500, 0);
    bombaImg.resize(50, 0);
    cannonImg.resize(200, 0);
    juego2exe = true;
    colorMode(HSB, 100);
  }
}

boolean isBetween(float x , float l ,float r){
    return ( x>= l && x<=r);
}
