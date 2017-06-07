import java.util.*;
import java.util.PriorityQueue;
import java.util.Stack;

PriorityQueue<Customer> customers;
Hamburger userBurger;
int timeForLevel;
boolean gameStart;
Customer cus;

PImage lettuce;
PImage cheese;
PImage ketchup;
PImage mustard;
PImage mushroom; 
PImage onion;
PImage patty;
PImage pepper;
PImage pickle;
PImage tomato;
PImage bacon;
PImage person;
//PImage bg; 
PShape counter;


void setup() {
  size(1100, 500);
  lettuce = loadImage("lettuce.PNG");
  cheese = loadImage("cheese.PNG");
  ketchup = loadImage("ketchup.PNG");
  mustard = loadImage("mustard.PNG");
  mushroom = loadImage("mushroom.PNG");
  onion = loadImage("onion.PNG");
  patty = loadImage("patty.PNG");
  pepper = loadImage("pepper.PNG");
  pickle = loadImage("pickle.PNG");
  tomato = loadImage("tomato.PNG");
  bacon = loadImage("bacon.PNG");
  //bg = loadImage("background.PNG"); 
  
  int customer = (int)(Math.random() * 3); 
  if (customer == 0){
    person = loadImage("customer1.PNG");
  }
  else if (customer == 1){
    person = loadImage("customer2.PNG");
  }
  else{
    person = loadImage("customer3.PNG");
  }
  
  counter = createShape(RECT, 0, 0, 500, 100);

  timeForLevel = (minute() + 3) % 60;
  startLevel();
  assignCustomer();
  userBurger = new Hamburger();
}

void draw() {
  //background(bg); 
  
  int m = minute();
  int s = second();
  background(#DCEA45);
  image(lettuce, 0, 400, width/11, height/5);
  image(cheese, 100, 400, width/11, height/5);
  image(ketchup, 200, 400, width/11, height/5);
  image(mushroom, 300, 400, width/11, height/5);
  image(mustard, 400, 400, width/11, height/5);
  image(onion, 500, 400, width/11, height/5);
  image(patty, 600, 400, width/11, height/5);
  image(pepper, 700, 400, width/11, height/5);
  image(pickle, 800, 400, width/11, height/5);
  image(tomato, 900, 400, width/11, height/5);
  image(bacon, 1000, 400, width/11, height/5);
  shape(counter, 300, 300);

  fill(#1062E3);
  rect(50, 200, 100, 100, 10);

  assignCustomer();
  if (cus != null) {
    drawCustomer();
    displayBurger(cus.getOrder(), cus.getX() + 150, cus.getY() + 10, width/11, height/5);
  }
  if (userBurger.size() > 0){
    displayBurger(userBurger, 320, 305, width/11, height/5);
  }
  if (timeForLevel == m || cus == null) {
    endScreen();
    exit();
  }
}

void assignCustomer() {
  if (customers.peek() != null && cus == null) {
    cus = customers.poll();
    cus.setX(425);
    cus.setY(50);
  }
}

void mouseClicked() {
  if (overButton(50, 200, 100, 100)) {
    userBurger.getOrder().add("top_bun.PNG");
    if (userBurger.isEqual(cus.getOrder())) {
      cus = null;
    } else {
      tossOrders();
    }
  }
  addIngredients();
}

 void displayBurger(Hamburger burger, int x, int y, int widthOfImage, int heightOfImage) {
    for (int i = 1; i < burger.size()-1; i++) {
      image(loadImage(burger.getOrder().get(i)), x + (i*50), y, widthOfImage/2, heightOfImage/2);
    }
  }

boolean overButton(int xcor, int ycor, int width, int height) {
  if (mouseX > xcor && mouseX < xcor + width && mouseY > ycor && mouseY < ycor + height) {
    return true;
  }
  return false;
}

void addIngredients(){
  if (overButton(0, 400, width/11, height/5)) {
    userBurger.add("lettuce.PNG");
  }
  if (overButton(100, 400, width/11, height/5)) {
    userBurger.add("cheese.PNG");
  }  
  if (overButton(200, 400, width/11, height/5)) {
    userBurger.add("ketchup.PNG");
  }  
  if (overButton(300, 400, width/11, height/5)) {
    userBurger.add("mushroom.PNG");
  }  
  if (overButton(400, 400, width/11, height/5)) {
    userBurger.add("mustard.PNG");
  }  
  if (overButton(500, 400, width/11, height/5)) {
    userBurger.add("onion.PNG");
  }  
  if (overButton(600, 400, width/11, height/5)) {
    userBurger.add("patty.PNG");
  }  
  if (overButton(700, 400, width/11, height/5)) {
    userBurger.add("pepper.PNG");
  }  
  if (overButton(800, 400, width/11, height/5)) {
    userBurger.add("pickle.PNG");
  }  
  if (overButton(900, 400, width/11, height/5)) {
    userBurger.add("tomato.PNG");
  }  
  if (overButton(1000, 400, width/11, height/5)) {
    userBurger.add("bacon.PNG");
  }
}

void drawCustomer() {
  image(person, cus.getX(), cus.getY(), 200, 200);
}

//starts the level by creating customers
void startLevel() {
  customers = new PriorityQueue(); 
  int x = 5; 
  while (x > 0) {
    customers.add(new Customer((int)(Math.random()*5))); 
    x--;
  }
  userBurger = new Hamburger(); 
  gameStart = true;
}

//final screen when the game is over
void endScreen() {
  System.out.println("game over");
}

//if you mess up 
void tossOrders() {
  userBurger = new Hamburger();
}