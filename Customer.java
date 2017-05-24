public class Customer{
    private Hamburger _order = new Hamburger(); 
    private int _priority;
    
    public Customer(Hamburger burger, int priority){
	_order = burger; 
	_priority = priority; 
    }

    public Hamburger getOrder(){
	return _order; 
    }

    public int getPriority(){
	return _priority; 
    }
}
