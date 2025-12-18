// (c) Andrew Yenchek, 9/9/2025
float grade = random(0.0, 4.001);
  String letterGrade = "";
println("grade: ", grade);

if (grade >= 3.51){
  letterGrade = "A";
} else if (grade > 3 && grade <= 3.5){
  letterGrade = "A-";
}else if (grade >= 2.84){
  letterGrade = "B+";
}else if (grade >= 2.67){
  letterGrade = "B";
}else if (grade >= 2.5){
  letterGrade = "B-";
}else if (grade >= 2.34){
  letterGrade = "C+";
}else if (grade >= 2.17){
  letterGrade = "C";
}else if (grade >= 2){
  letterGrade = "C-";
}else if (grade >= 1.66){
  letterGrade = "D+";
}else if (grade >= 1.33){
  letterGrade = "D";
}else if (grade >= 1){
  letterGrade = "D-";
}else{
  letterGrade = "F";
} 

println(letterGrade);
