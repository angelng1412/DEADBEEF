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
PImage mushroom;
PImage mustard;
PImage onion;
PImage patty;
PImage pepper;
PImage pickle;
PImage tomato;
PImage cucumber;
PImage person;
PShape counter;

void setup() {
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
  person = loadImage("customer.PNG");
  counter = createShape(RECT, 0, 0, 500, 100);

  timeForLevel = (minute() + 3) % 60;
  startLevel();
  assignCustomer();
}

void draw() {
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
  image(cucumber, 1000, 400, width/11, height/5);
  shape(counter, 300, 300);
  
  fill(#1062E3);
  rect(50, 200, 100, 100, 10);
  
  assignCustomer();
  //System.out.println(cus);
  if (cus != null){
  drawCustomer();
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
  overButton(50, 200, 100, 100);
}

void overButton(int xcor, int ycor, int width, int height){
  if (mouseX > xcor && mouseX < xcor + width && mouseY > ycor && mouseY < ycor + height){
    if (userBurger.isEqual(cus.getOrder())){
      cus = null;
    }
    else{
      tossOrders();
    }
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

//checks to see if your burger matches customer's needs
boolean compareOrders(Hamburger other) {
  int x = 0;
  Customer current = customers.peek();
  if (other.size() == current.getOrder().size()) {
    while (x < other.size()) {
      if (other.getOrder().pop().equals(current.getOrder().getOrder().pop())) {
      } else {
        return false;
      }
      x++;
    }
  }
  return false;
}