import java.util.*;
import java.util.PriorityQueue;
import java.util.Stack;

PriorityQueue<Customer> customers;
Hamburger userBurger;
int timeForLevel;
boolean gameStart;
Customer cus1, cus2, cus3, cus4;

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
  customers = new PriorityQueue();
  counter = createShape(RECT, 0, 0, 500, 100);
  for (int i = 0; i < 2; i++) {
    customers.add(new Customer(i));
  }
}

void draw() {
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
  assignCustomer();
  drawCustomer();
}

void assignCustomer() {
  while (customers.peek() != null && 
    (cus1 == null || cus2 == null || cus3 == null || cus4 == null)) {
    if (cus1 == null) {
      cus1 = customers.poll();
      cus1.setX(10);
      cus1.setY(100);
    } else if (cus2 == null) {
      cus2 = customers.poll();
      cus2.setX(110);
      cus2.setY(100);
    } else if (cus3 == null) {
      cus3 = customers.poll();
      cus3.setX(210);
      cus3.setY(100);
    } else if (cus4 == null) {
      cus4 = customers.poll();
      cus4.setX(310);
      cus4.setY(100);
    }
  }
}

void drawCustomer() {
  if (cus1 != null) {
    ellipse(cus1.getX(), cus1.getY(), 5, 5);
  }  
  if (cus2 != null) {
    ellipse(cus2.getX(), cus2.getY(), 5, 5);
  }  
  if (cus3 != null) {
    ellipse(cus3.getX(), cus3.getY(), 5, 5);
  }  
  if (cus4 != null) {
    ellipse(cus4.getX(), cus4.getY(), 5, 5);
  }
}

//accessor method for customers
PriorityQueue getCustomers() {
  return customers;
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

//removes current customer and brings in next customer
Customer nextCustomer() {
  customers.remove();
  return customers.peek();
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