import java.util.*;

public class Hamburger{

    private final String[] _ingredients = {"lettuce", "tomato", "pickle", "ketchup", "cucumber", "mustard", "cheese", "honey mustard", "onion", "mushroom", "patty", "pepper"};
    private ArrayList<String> _order;

    public Hamburger(){
	_order = new ArrayList();
    }

    public ArrayList<String> randomOrder(){
	for (int x = 0; x < (int)(Math.random() * 10); x++){
	    _order.add(_ingredients[(int)(Math.random() * 13)]);
	}
	return _order;
    }

    public String toString(){
	String retstr = "";
	for (int x = 0; x < _order.size(); x++){
	    retstr += _order.get(x);
	}
	return retstr;
    }
    
    public static void main(String[] args){
	Hamburger bob = new Hamburger();
	System.out.println(bob.randomOrder());
    }
}
