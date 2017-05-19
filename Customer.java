public class Customer{
    private Hamburger _burger; 
    private int _priority;
    
    public Customer(Hamburger burger, int priority){
	_burger = burger; 
	_priority = priority; 
    }

    public Hamburger getBurger(){
	return burger; 
    }

    public int getPriority(){
	return priority; 
    }
}
