PImage lettuce;
PImage cheese;
PImage ketchup;
PImage mushroom;
PImage mustard;
PImage onion;
PImage patty;
PImage pepper;
PImage pickle;
PImage tomato;
PImage cucumber;
PShape counter;

void setup(){
  size(1100, 500);
  lettuce = loadImage("lettuce.PNG");
  cheese = loadImage("cheese.PNG");
  ketchup = loadImage("ketchup.PNG");
  mushroom = loadImage("mushroom.PNG");
  mustard = loadImage("mustard.PNG");
  onion = loadImage("onion.PNG");
  patty = loadImage("patty.PNG");
  pepper = loadImage("pepper.PNG");
  pickle = loadImage("pickle.PNG");
  tomato = loadImage("tomato.PNG");
  cucumber = loadImage("cucumber.PNG");
  counter = createShape(RECT, 0, 0, 500, 100);
}

void draw(){
  background(#DCEA45);
  image(lettuce,0,400, width/11, height/5);
  image(cheese,100,400, width/11, height/5);
  image(ketchup,200,400, width/11, height/5);
  image(mushroom,300,400, width/11, height/5);
  image(mustard,400,400, width/11, height/5);
  image(onion,500,400, width/11, height/5);
  image(patty,600,400, width/11, height/5);
  image(pepper,700,400, width/11, height/5);
  image(pickle,800,400, width/11, height/5);
  image(tomato,900,400, width/11, height/5);
  image(cucumber,1000,400, width/11, height/5);
  shape(counter, 300, 300);
}

void mouseClicked(){
  if (mouseX > 0 && mouseX < 100 && mouseY > 400 && mouseY < 500){
    
  }
}