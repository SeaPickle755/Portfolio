  // (c) Andrew Yenchek, 9/9/2025
  
  float grade;
  String letterGrade = "";
  void setup() {
    size(801, 120);
    background(155);
  }
  void draw() {
    background(155);
    line(0, 50, 800, 50);
    ellipse(mouseX, 50, 5, 5);
    // i probably shouldnt need the typecast here but I do anyways.
    grade = (float)mouseX/200;
  
    // draw tick marks
    // also probably better way to do this
    drawTickMark(0);
    drawTickMark(1);
    drawTickMark(1.33);
    drawTickMark(1.66);
    drawTickMark(2);
    drawTickMark(2.17);
    drawTickMark(2.34);
    drawTickMark(2.5);
    drawTickMark(2.67);
    drawTickMark(2.84);
    drawTickMark(3.01);
    drawTickMark(3.51);
    letterGrade = calcGrade(grade);
    text("Grade:", width/2, 75);
    text(letterGrade, width/2, 85);
    text("Score:", width/2, 95);
    text(grade, width/2, 105);
  }
  String calcGrade(float grade) {
    String letterGrade = "XX";
    if (grade >= 3.51) {
      letterGrade = "A";
    } else if (grade > 3 && grade <= 3.5) {
      letterGrade = "A-";
    } else if (grade >= 2.84) {
      letterGrade = "B+";
    } else if (grade >= 2.67) {
      letterGrade = "B";
    } else if (grade >= 2.5) {
      letterGrade = "B-";
    } else if (grade >= 2.34) {
      letterGrade = "C+";
    } else if (grade >= 2.17) {
      letterGrade = "C";
    } else if (grade >= 2) {
      letterGrade = "C-";
    } else if (grade >= 1.66) {
      letterGrade = "D+";
    } else if (grade >= 1.33) {
      letterGrade = "D";
    } else if (grade >= 1) {
      letterGrade = "D-";
    } else {
      letterGrade = "F";
    }
    return letterGrade;
  }
  // y is the grade
  // should be x but i made a mistake sorry
  void drawTickMark(float y) {
    line(y*200, height/2-2, y*200, height/2-15);
    //grade
    text(y, y*200, height/2 - 30);
    // letter grade
    text(calcGrade(y), y*200, height/2-17);
  }
