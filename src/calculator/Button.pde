static int BUTTONSIZE = 3;

class Button {
  int x, y;
  color bgColor = color(123, 63, 0);
  color bgColorActive = color(128);
  color textColor = color(255, 0, 230);
  boolean isHovering;
  boolean click;
  char use;
  PImage button;
  Button(int startX, int startY, char newUse) {
    isHovering = false;
    x = startX*SCALE;
    y = startY*SCALE;
    use = newUse;
    click = false;
    if(newUse == 'C')
      button = loadImage("button2.jpg");
    else if(newUse == '8')
      button = loadImage("button10.jpg");
    else if(newUse == '3')
       button = loadImage("button11.jpg");
    else if(newUse == '1')
      button = loadImage("button12.jpg");
    else if(newUse == '7')
      button = loadImage("button14.jpg");
    else if(newUse == '6')
      button = loadImage("button15.jpg");
    else if(newUse == '5')
      button = loadImage("button16.jpg");
    else if(newUse == '='){
      button = loadImage("button3.jpg");
    }
    else if(newUse == '9')
      button = loadImage("button17.jpg");
    else if(newUse == '.')
      button = loadImage("button18.png");
    else if(newUse == '4')
      button = loadImage("button19.jpg");
    else if(newUse == '2')
      button = loadImage("button20.jpg");
    else if(newUse == '0')
      button = loadImage("button21.jpg");
    else if(newUse == 'e')
      button = loadImage("button22.png");
    else if(newUse == 'x')
      button = loadImage("button23.jpg");
    else if(newUse == '/')
       button = loadImage("button.jpg");
    else if (newUse == 'S')
       button = loadImage("button5.jpg");
    else if(newUse == '±')
      button = loadImage("button6.jpg");
    else if (newUse == '-')
      button = loadImage("button7.jpg");
    else if (newUse == 'c')
      button = loadImage("button8.jpg"); 
    else if (newUse == '√')
      button = loadImage("button9.jpg");
      
  else
    button = loadImage("button4.jpg");
  }
  char mousePressed() {
    if (mouseX >= x && mouseY >= y && mouseX <= x+(BUTTONSIZE*SCALE)\
    && mouseY <= y+(BUTTONSIZE*SCALE)) {
      isHovering = true;
    } else {
      isHovering = false;
    }
    if (isHovering && mousePressed && mouseButton == LEFT && !click) {
      click = true;
      return use;
    }
    if (click == true && !mousePressed) {
      click = false;
    }
    return 0;
  }
  void setChar(char newValue){
    use = newValue;
  }
  void display() {
    if (isHovering)
      tint(255, 128);
    else
      tint(255, 255);
    fill(bgColor);

    textSize(SCALE*2.5);
    rect(x, y, (BUTTONSIZE*SCALE), (BUTTONSIZE*SCALE));
    
    image(button, x, y, (BUTTONSIZE*SCALE), (BUTTONSIZE*SCALE));
    tint(255, 255);
    fill(textColor);
    text(use, x+((0.5)*BUTTONSIZE*SCALE), y+SCALE+((BUTTONSIZE*SCALE)/2));
  }
  void performCalculations() {
  }
  char getKey(){
    return use;
  }
};
