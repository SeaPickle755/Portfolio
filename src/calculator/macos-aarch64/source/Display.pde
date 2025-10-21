static int DISPLAY_WIDTH = 18;
static int DISPLAY_HEIGHT = 4;
// if this is too high the display will be messed up.
static int DISPLAY_MAX = 10;


class Display {
  String text;
  double number1;
  double number2;
  double result;
  PImage display;
  Display() {
    text = "";
    number1 = 0.0;
    number2 = 0.0;
    result = 0.0;
    display=loadImage("display");
  }
  void display() {
    fill(255, 0, 0);
    rect(SCALE, SCALE, SCALE*DISPLAY_WIDTH, SCALE*DISPLAY_HEIGHT);
    fill(242, 234, 7);
    textSize(SCALE*3);
    tint(255, 255);
    image(display, SCALE, SCALE, SCALE*DISPLAY_WIDTH, SCALE*DISPLAY_HEIGHT);
    tint(255, 255);
    
    textAlign(TOP);
    text(text, (SCALE*2), SCALE+(DISPLAY_HEIGHT/2)*SCALE);
    textAlign(CENTER);
   
  }
  void plusMinus(){
    double temp = (-1*getCurrentNumber());
    text = "";
    text += temp;
  }
  boolean isDisplayFull() {
    return !(text.length() <= DISPLAY_MAX);
  }
  String getText() {
    return text;
  }
  void clearAll() {
    clearDisplay();
    number1 = 0.0;
    number2 = 0.0;
    result = 0.0;
  }
  void addText(char button) {
    text += button;
  }
  void clearDisplay() {
    text = "";
 //   number1= 0;
 //   number2= 0;
  }
  void displayResult() {
    if (result%1 == 0)
      text += (int)result;
    else {
      String temptext = "";
      temptext += result;
      if (temptext.length() < DISPLAY_MAX) {

        text+= result;
      } else {
        for (int i = 0; i < DISPLAY_MAX; i++) {
          text+= temptext.charAt(i);
        }
      }
    }
  }
  // this is fried
  // TODO: Fix this
  double getCurrentNumber() {
    if(text.length() != 0)
      return Double.parseDouble(text);
    else
      return 0.0;
  }
  // if bool is true, add number to number 2. if bool = false, add number to number 1
  void addOperand(double number, boolean number1or2) {
    if (number1or2 == true) {
      number2 += number;
    } else
      number1 += number;
  }
  void setupForOneOperand(){
    number2 = 0.f;
    result = 0.f;
    number1 = getCurrentNumber();
  }
  void updateResult(operators op) {
    clearDisplay();
    if (op == operators.PLUS) {
      this.result = number1 + number2;
    } else if (op == operators.MINUS) {
      this.result = number1 - number2;
    }
    else if(op == operators.SIN){
      this.result = sin(radians((float)number1));
    }
    else if(op == operators.COS){
      this.result = cos(radians((float)number1));
    }
    else if(op == operators.SQRT)
      this.result = sqrt((float)number1);
    if (op == operators.ETOTHEX){
      this.result = exp((float)number1);
    }
    if (op == operators.DIVIDE) {
      if (number2 == 0) {
        clearAll();
        return;
      }
      this.result = number1 / number2;
    }
    if (op == operators.MULTI) {
      this.result = number1 * number2;
    }
    clearDisplay();
    displayResult();
    print("result is ");
    println(this.result);
    print("operator is ");
    println(op);
    print("number 1 is ");
    print(number1);
    print("number2 is ");
    println(number2);
  }
};
