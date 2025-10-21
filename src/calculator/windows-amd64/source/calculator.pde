// (c) Andrew Yenchek 2025
import processing.sound.*;
SoundFile buttonSound;
static int SCALE = 30;
static int WIDTH_BASE = 25;
static int HEIGHT_BASE = 22;
Display display;
public enum operators {
  PLUS, MINUS, DIVIDE, MULTI, ETOTHEX, SIN, COS, SQRT, NONE
};
operators operator;
Button[] buttons = new Button[22];
IntList buttonsList2 = new IntList(9);
float result;
void setup() {
  size(10, 10);
  surface.setResizable(true);
  surface.setSize(WIDTH_BASE*SCALE, HEIGHT_BASE*SCALE);
  buttonSound = new SoundFile(this, "button.mp3");
  textAlign(CENTER);
  for(int i = 48; i < 58; i++){
    buttonsList2.append(i);
  }
  buttonsList2.shuffle();
  display = new Display();
  operator = operators.NONE;
  buttons[0] = new Button(5, 18, '.');
  buttons[1] = new Button(9, 18, (char)buttonsList2.get(0));
  buttons[2] = new Button(13, 18, '=');
  buttons[3] = new Button(17, 18, 'x');
  buttons[4] = new Button(21, 18, '±');
  buttons[5] = new Button(1, 18, '√');
  buttons[6] = new Button(1, 14, 'c');
  buttons[7] = new Button(5, 14, (char)buttonsList2.get(1));
  buttons[8] = new Button(9, 14, (char)buttonsList2.get(2));
  buttons[9] = new Button(13, 14, (char)buttonsList2.get(3));
  buttons[10] = new Button(17, 14, '-');
  buttons[11] = new Button(1, 10, 'e');
  buttons[12] = new Button(5, 10, (char)buttonsList2.get(4));
  buttons[13] = new Button(9, 10, (char)buttonsList2.get(5));
  buttons[14] = new Button(13, 10, (char)buttonsList2.get(6));
  buttons[15] = new Button(17, 10, '+');
  buttons[16] = new Button(1, 6, 'S');
  buttons[17] = new Button(5, 6, (char)buttonsList2.get(7));
  buttons[18] = new Button(9, 6, (char)buttonsList2.get(8));
  buttons[19] = new Button(13, 6, (char)buttonsList2.get(9));
  buttons[20] = new Button(17, 6, '/');
  buttons[21] = new Button(20, 1, 'C');
}
void tryToAddCharacter(char clicked) {
  if (!display.isDisplayFull())
    display.addText(clicked);
}

void draw() {
  background(242, 234, 7);
  // update hovering status
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    char clicked = buttons[i].mousePressed();
    if (clicked != 0){
        buttonSound.play(); 
    }
    switch(clicked) {
    case 0:
      break;
    case 'C':
      display.clearAll();
      break;
    case ' ':
      break;
      // TODO: add op. logic
    case '-':
      // this line of code adds the number into the display. we only give it number 1 if there is no previous operator.
      display.addOperand(display.getCurrentNumber(), (operator!=operators.NONE));
      operator = operators.MINUS;
      display.clearDisplay();
      break;
    case '/':
      display.addOperand(display.getCurrentNumber(), (operator!=operators.NONE));
      operator = operators.DIVIDE;
      display.clearDisplay();
      break;
    case '+':
      display.addOperand(display.getCurrentNumber(), (operator!=operators.NONE));
      operator = operators.PLUS;
      display.clearDisplay();
      break;
    case 'x':
      display.addOperand(display.getCurrentNumber(), (operator!=operators.NONE));
      operator = operators.MULTI;
      display.clearDisplay();
      break;
    case '=':
      display.addOperand(display.getCurrentNumber(), true);
      display.updateResult(operator);
      operator = operators.NONE;
      break;
    case 'e':
      display.setupForOneOperand();
      operator = operators.ETOTHEX;
      display.updateResult(operator);
      operator = operators.NONE;
      break;
    case 'S':
      display.setupForOneOperand();
      display.updateResult(operators.SIN);
      operator = operators.NONE;
      break;
    case 'c':
      display.setupForOneOperand();
      operator = operators.COS;
      display.updateResult(operator);
      operator = operators.NONE;
      break;
    case '√':
      display.setupForOneOperand();
      operator = operators.SQRT;
      display.updateResult(operator);
      operator = operators.NONE;
      break;
    case '±':
      display.plusMinus();
      break;
    case '.':
      if(!(display.getText().contains(".")))
        tryToAddCharacter(clicked);
      break;
    default:
      tryToAddCharacter(clicked);
    }
  }
  display.display();
}
