import java.util.*;

class Hamburger {

  final String[] _ingredients = {"lettuce", "tomato", "pickle", "ketchup", "cucumber", "mustard", "cheese", "onion", "mushroom", "patty", "pepper"};
  Stack<String> _order;
  int _size;

  //constructor
  Hamburger() {
    _order = new Stack();
    _order.add("bottom bun");
  }

  //accessor for _order
  Stack<String> getOrder() {
    return _order;
  }

  //generates a random order
  void randomOrder() {
    for (int x = 0; x < (int)(Math.random() * 8) + 2; x++) {
      _order.add(_ingredients[(int)(Math.random() * 11)]);
      _size++;
    }
    _order.add("top bun");
  }

  //accesor for _size
  int size() {
    return _size;
  }    

  //compares burgers
  boolean isEqual(Hamburger other) {
    if (getOrder().size() != other.getOrder().size()) {
      return false;
    } else {
      for (int i = 0; i < getOrder().size(); i++) {
        if (getOrder().get(i) != other.getOrder().get(i)) {
          return false;
        }
      }
      return true;
    }
  }

  String toString() {
    String retstr = "";
    for (int x = 0; x < _order.size(); x++) {
      retstr += _order.get(x) + " ";
    }
    return retstr;
  }
}