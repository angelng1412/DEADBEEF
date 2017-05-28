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
	customers.remove();
	return customers.peek();	
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
	System.out.println(tina.getCustomers());
	tina.nextCustomer();
	System.out.println(tina.getCustomers()); 
    }
}
