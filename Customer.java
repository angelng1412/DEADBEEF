public class Customer implements Comparable{
    private Hamburger _order; 
    private int _priority;

    //constructor
    public Customer(int priority){
	_order = new Hamburger();
	_order.randomOrder(); 
	_priority = priority; 
    }

    //accessor for _order
    public Hamburger getOrder(){
	return _order; 
    }

    //accessor for _priority
    public int getPriority(){
	return _priority; 
    }

    //compares priorities
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

    public String toString(){
	String retstr = "";
	retstr += _priority;
	return retstr;
    }
}
