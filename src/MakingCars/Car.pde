class Car{
  // member variables
  color c;
float x;
float y;
float speed;
PImage image;
PImage kachow;
Boolean kachowing;
int kachowing_counter;
Boolean left;
// Constructor
Car() {
   c = color(random(0, 255), random(0, 255), random(0, 255));
   y = random(0, 400);
   x = 0;
   speed = random(1, 10);
   kachowing = false;
   if((int)random(0, 2) == 0){
     left = false;
     print("Car is left");
   }
   else{
     left = true;
   }
   if(left == false)
     image = loadImage("Lightning_McQueenLeft.png");
   else
     image = loadImage("Lightning_McQueen.png");
   kachow = loadImage("Untitled.png");

}
// member functions
void drawr() {
  move();
  display();
}

void move() {
  if(left == true){
    x += speed;
  }
  else{
    x -= speed;
  }
  if (x > width && left) {
    x = random(0, 16);
  }
  else if (x < 0 && !left) {
    x = random(width, width - 16);
  }
}

void display() {
  fill(c);
  //rect(x,y,30,10);
  image(image, x, y, 40, 40);
  if(((int)random(0, 400) == 0)&&!kachowing){
    kachowing = true;
    kachowing_counter = 0;
  }
  if(kachowing)
    kachowing_counter+=1;
  if(kachowing_counter == 50 && kachowing == true){
     kachowing = false;}
  if(kachowing == true)
    image(kachow, x, y - 10);
}
};
