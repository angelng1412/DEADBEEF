public class Customer implements Comparable{
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

    public int compareTo(Customer other){ 
	if (this.getPriority() > other.getPriority()){
	    return 1;
	}
	else if (this.getPriority() < other.getPriority()){
	    return -1; 
	}
	else{
	    return 0; 
	}
    }
}
