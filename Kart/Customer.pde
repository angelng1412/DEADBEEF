class Customer implements Comparable {
  Hamburger _order; 
  int _priority;

  //constructor
  Customer(int priority) {
    _order = new Hamburger();
    _order.randomOrder(); 
    _priority = priority;
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