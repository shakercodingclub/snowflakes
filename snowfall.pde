int quantity=413; // The number of snowflakes
float [] xPosition = new float[quantity]; // Holds x position of our quantity of flakes
float [] yPosition = new float[quantity]; // Holds y position of our quantity of flakes
int [] flakeSize = new int[quantity]; // Stores the size of each snowflake
int [] direction = new int[quantity]; // Stores the direction of each snowflake
int minFlakeSize = 1; // Smallest possible snowflake
int maxFlakeSize = 5; // Largest possible snowflake


  void setup(){
  size(1280,720); // This sets the size of your canvas to 1280x720 pixels

  for(int i = 0; i < quantity; i++) { // For every snowflake..
    // Give the current snowflake a random integer size from minFlakeSize to //maxFlakeSize
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));

    // Start each snowflake at a random x Position from the left screen side to
    // right screen size
    xPosition[i] = random(0, width);

    // Start each snowflake at a random y Position from the top of the screen to the bottom of the screen
    yPosition[i] = random(0, height);

    direction[i] = round(random(0, 1)); // Snowfall drifts! 0=left, 1=right
    }


  }
  void draw(){
    background(0); // This sets the canvas background to black
    for(int i = 0; i < xPosition.length; i++) { // For every snowflake..

    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    if(direction[i] == 0) {
        xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
        xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    yPosition[i] += flakeSize[i] + direction[i]; //Larger snowflakes fall faster!

       // What happens when a snowflake drifts off of the screen? We give it a new position!
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) { 
       xPosition[i] = random(0, width);
       yPosition[i] = -flakeSize[i];
    }
   }
  }
