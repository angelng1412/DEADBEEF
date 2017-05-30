import java.util.*;
import java.util.PriorityQueue;
import java.util.Stack;

public class Kart{
    
    private PriorityQueue<Customer> customers;
    private Hamburger userBurger;
    private int timeForLevel;
    private boolean gameStart;
    
    public PriorityQueue getCustomers(){
	return customers; 
    }
    
    //starts the level 
    public void startLevel(){
	customers = new PriorityQueue(); 
	int x = 5; 
	while (x > 0){
	    customers.add(new Customer((int)(Math.random()*5))); 
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

    public void makeBurger(){
	System.out.print("\n1: lettuce\n2: tomato\n3: pickle\n4: ketchup\n5: cucumber\n6: mustard\n7: cheese\n8: onion\n9: mushroom\n10: patty\n11: patty\n12: done")
	action = Keyboard.readInt()
	while (true){ 
	    if (action == 12){
		userBurger.add("top bun"); 
		return; 
	    }
	    else if (action == 1){ 
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
		userBurger.add(""); 
	    }
	}
	    

    public void tossOrders(){
	userBurger = new Hamburger();
    
    }
    public boolean compareOrders(Hamburger other){
	Customer current = customers.peek();
	if (other.size() == current.getOrder().size()){
	    for (int x = 0; x < other.size(); x++){
		if (other.getOrder().pop().equals(current.getOrder().getOrder().pop())){  	    
		}
		else{
		    return false;
		}
		return true;
	    }
	}
	return false;
    }

    public static void main (String[] args){
	Kart tina = new Kart(); 
	tina.startLevel(); 
	while (!tina.getCustomers().isEmpty()){
	    System.out.println("This is your order..."); 
	    System.out.println(tina.nextCustomer()); 
	    tina.makeBurger(); 
	}
    }
}
