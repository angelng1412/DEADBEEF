import java.util.*;
import java.util.PriorityQueue;
import java.util.Stack;

public class Kart{
    
    private PriorityQueue customers;
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
	    customers.add(new Customer((int)Math.random()*2)); 
	    x--; 
	}

	userBurger = new Hamburger(); 
	gameStart = true; 
    }
       

    /* public void endScreen(){
    }

    public Customer nextCustomer(){
    }

    public void tossOrders(){
    }
    public int compareOrders(Hamburger other){
    }*/

    public static void main (String[] args){
	Kart tina = new Kart(); 
	tina.startLevel(); 
	System.out.println(tina.getCustomers()); 
    }
}
