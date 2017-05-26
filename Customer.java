public class Customer implements Comparable{
    private Hamburger _order; 
    private int _priority;
    
    public Customer(int priority){
	_order = new Hamburger();
	_order.randomOrder(); 
	_priority = priority; 
    }

    public Hamburger getOrder(){
	return _order; 
    }

    public int getPriority(){
	return _priority; 
    }

    public int compareTo(Object other){ 
	if (this.getPriority() > ((Customer)other).getPriority()){
	    return 1;
	}
	else if (this.getPriority() < ((Customer)other).getPriority()){
	    return -1; 
	}
	else{
	    return 0; 
	}
    }
}
