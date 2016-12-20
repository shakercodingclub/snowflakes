class Snowflake{
  static final int minSize = 1, maxSize=5;
  float [] position = new float[2]; // [0]=y, [1]=x
  int size, direction;
  
  Snowflake(){
    position[0] = random(0,height);
    position[1] = random(0,width);
    size = round(random(minSize, maxSize));  
    direction = round(random(0, 1));
  }
  
  void paint(){
    ellipse(position[1], position[0], size, size);
    position[0] += size;
    position[1] += direction==0?-.5:.5;
    if((position[1] > width) || (position[1] < 0) || (position[0] > height)){
      position[0] = 0;
      position[1] = random(0, width);
    }
  }
}

Snowflake [] snowflakes = new Snowflake[400];
void setup(){
  size(1280, 720);
  frameRate(30);
  smooth();
  for(int i=0; i<snowflakes.length; i++)
    snowflakes[i] = new Snowflake();
}

void draw(){
  background(0);
  for(int i=0; i<snowflakes.length; i++)
    snowflakes[i].paint();
}