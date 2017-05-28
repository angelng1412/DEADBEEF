import java.util.*;

public class Hamburger{

    private final String[] _ingredients = {"lettuce", "tomato", "pickle", "ketchup", "cucumber", "mustard", "cheese", "honey mustard", "onion", "mushroom", "patty", "pepper"};
    private Stack<String> _order;
    private int _size;

    public Hamburger(){
	_order = new Stack();
	_order.add("bottom bun"); 
    }

    public Stack<String> getOrder(){
	return _order; 
    }

    public void randomOrder(){
	for (int x = 0; x < (int)(Math.random() * 8) + 3; x++){
	    _order.add(_ingredients[(int)(Math.random() * 12)]);
	    _size++;
	}
	_order.add("top bun"); 
    }

    public int size(){
	return _size;
    }
    public String toString(){
	String retstr = "";
	for (int x = 0; x < _order.size(); x++){
	    retstr += _order.get(x) + " ";
	}
	return retstr;
    }

    public boolean isEqual(Hamburger other){
	if (getOrder().size() != other.getOrder().size()){
	    return false; 
	}
	else{
	    for (int i = 0; i < getOrder().size(); i++){
		if (getOrder().get(i) != other.getOrder().get(i)){
		    return false;
		}
	    }
	    return true; 
	}
    }
    
    public static void main(String[] args){
	Hamburger bob = new Hamburger();
	//bob.randomOrder();
        //System.out.println(bob);
    }
}
