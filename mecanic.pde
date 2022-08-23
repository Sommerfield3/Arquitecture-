class Engine {

  Player p;
  ArrayList<Building> b;
  float v, a , inv ;
  int minWidth, maxWidth, minHeight = 100, maxHeight = 150 ;
  float midLevel;

  int seen ;

  Engine() {

    p = new Player();
    b = new ArrayList<Building>();

    minWidth = 30*p.size/4 ;
    maxWidth = 40*p.size/4 ;

    midLevel = height/2;

    seen = 0 ;

    inv = width/4;
  }


  void start() {

    v = inv;
    a = 3;

    p.onReady();

    addBuilding(-10, midLevel, 500);
    addBuilding();
    addBuilding();
    addBuilding();
    addBuilding();
  }

  void run() {

    int l = b.size();

    for (int i = 0; i < l; i++ ) {
      Building bl = b.get(i);
      bl.run();
      if (bl.pos.x + bl.w < -500) {
        addBuilding();

        b.remove(i);
      }
    }

    p.run();

    if (p.pos.y > height ) {
      seen = 2;
    }

    collision();

    v += a/frameRate ;
  }

  void clear(){
    b.clear();
  }


  void collision() {
    boolean flag = true;

    int l = b.size();

    for (int i = 0; i < l; i++) {

      Building bl = b.get(i);

      float px = p.pos.x;
      float py = p.pos.y;
      float pw = p.size;

      float bx = bl.pos.x;
      float by = bl.pos.y;
      float bw = bl.w;

      if (isBetween( px, bx, bx + bw) || isBetween( px + pw, bx, bx + bw)  ) {
        //Building is in scop
        if (isBetween(py+pw, by, by+10 )) {
          p.grounded = true;
          p.pos.y = by - pw ;
          flag = false;
          break;
        }
      } else {
        //building is not in scop
        continue ;
      }
    }//end of collision loop

    if (flag) {
      p.grounded = false;

    }
  }


  void addBuilding() {

    float x = b.get(b.size() - 1).pos.x + b.get(b.size() - 1).w + random( 5*p.size + sqrt(v) , 9*p.size + sqrt(v) );
    float y = random(midLevel - 80, midLevel + 80);
    float w = random( 30*p.size/4 + sqrt(v) , 40*p.size/4 + sqrt(v)  );

    b.add(new Building(x, y, w, v));
  }

  void addBuilding(float x, float y, float w) {
    b.add(new Building(x, y, w, v));
  }
}
