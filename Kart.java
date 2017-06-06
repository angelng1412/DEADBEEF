import java.util.*;
import java.util.PriorityQueue;
import java.util.Stack;
import cs1.Keyboard; 

public class Kart{
    
    private PriorityQueue<Customer> customers;
    private Stack<Customer> garbo; 
    private Hamburger userBurger;
    private int timeForLevel;
    private boolean gameStart;
    
    public PriorityQueue getCustomers(){
	return customers; 
    }
    
    public Stack getGarbo(){
	return garbo; 
    }
    
    //starts the level 
    public void startLevel(int level){
	customers = new PriorityQueue(); 
	garbo = new Stack(); 
	int x = level*2; 
	while (x > 0){
	    customers.add(new Customer((int)(Math.random()*7))); 
	    x--; 
	}
	userBurger = new Hamburger(); 
	gameStart = true; 
    }
       
    public void endScreen(){
	System.out.println("game over");
    }
    
    public Customer nextCustomer(){
	return customers.remove();
    }

    public Customer lastCustomer(){
	return garbo.pop(); 
    }

    public void process(Customer cust){
	garbo.push(cust);
    }

    public void makeBurger(){
	System.out.print("INGREDIENTS:\n1: lettuce\t2: tomato\t3: pickle\t4: ketchup\t5: cucumber\t6: mustard\n7: cheese\t8: onion\t9: mushroom\t10: pepper\t11: patty\t12: top bun");
	int action; 
	
	while (true){ 
	    System.out.print("\nBurger in process: "); 
	    System.out.print(userBurger); 
	    System.out.println("\n");
	    System.out.print("What should be added next? ");
	    action = Keyboard.readInt();
	    if (action == 1){ 
		userBurger.add("lettuce"); 
	    }
	    else if (action == 2){ 
		userBurger.add("tomato"); 
	    }
	    else if (action == 3){ 
		userBurger.add("pickle"); 
	    }
	    else if (action == 4){ 
		userBurger.add("ketchup"); 
	    }
	    else if (action == 5){ 
		userBurger.add("cucumber"); 
	    }
	    else if (action == 6){ 
		userBurger.add("mustard"); 
	    }
	    else if (action == 7){ 
		userBurger.add("cheese"); 
	    }
	    else if (action == 8){ 
		userBurger.add("onion"); 
	    }
	    else if (action == 9){ 
		userBurger.add("mushroom"); 
	    }
	    else if (action == 10){ 
		userBurger.add("pepper"); 
	    }
	    else if (action == 11){
		userBurger.add("patty");
	    }
	    else if (action == 12){
		userBurger.add("top bun"); 
		return; 
	    }

	}
    }
	    

    public void clearOrder(){
	userBurger = new Hamburger(); 
    }

    public boolean compareOrders(Hamburger order){
	return userBurger.isEqual(order); 
    }

    public static void main (String[] args){
	Kart tina = new Kart(); 
	Customer next;
	int level; 
	boolean correct = true;
	System.out.println("Welcome to your Burger Kart!");
	System.out.print("Select your level(1-5): ");
	level = Keyboard.readInt(); 
	tina.startLevel(level);
	while (!tina.getCustomers().isEmpty()){
	    System.out.println(tina.nextCustomer());
	}

	/*while (!tina.getCustomers().isEmpty()){
	    System.out.println("Garbo: " + tina.getGarbo() + "\n"); 
	    if (correct){
		tina.clearOrder(); 
		next = tina.nextCustomer(); 
		tina.process(next); 
		System.out.println("This is your order..."); 
		System.out.println(next); 
		tina.makeBurger(); 
		correct = tina.compareOrders(next.getOrder());
	    }
	    else{
		tina.clearOrder(); 
		next = tina.lastCustomer(); 
		tina.process(next); 
		System.out.println("You done goofed!"); 
		System.out.println("This is your order..."); 
		System.out.println(next); 
		tina.makeBurger(); 
	    }
	    }*/
    }
}
