Car myCar;
ArrayList<Car> myCars;
void setup()  {
  size(500, 500);
  randomSeed(second());
  myCars = new ArrayList<Car>();
  for(int i = 0; i < 50; i++){
    Car newCar;
    newCar = new Car();
    myCars.add(newCar);
  }
  myCar= new Car();
  fill(0);
}

void draw()  {
  background(255);
  myCar.drawr();
  for(Car item : myCars){
    item.drawr();
  }
}
