class Customer implements Comparable {
  Hamburger _order; 
  int _priority;
  int x, y;

  //constructor
  Customer(int priority) {
    _order = new Hamburger();
    _order.randomOrder(); 
    _priority = priority;
  }

  int getX() {
    return x;
  }

  void setX(int newX) {
    x = newX;
  }

  int getY() {
    return y;
  }

  void setY(int newY) {
    y = newY;
  }

  //accessor for _order
  Hamburger getOrder() {
    return _order;
  }

  //accessor for _priority
  int getPriority() {
    return _priority;
  }

  //compares priorities
  int compareTo(Object other) { 
    if (this.getPriority() > ((Customer)other).getPriority()) {
      return 1;
    } else if (this.getPriority() < ((Customer)other).getPriority()) {
      return -1;
    } else {
      return 0;
    }
  }

  String toString() {
    String retstr = "";
    retstr += _priority;
    return retstr;
  }
}