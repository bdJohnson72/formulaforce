1. The application class calls the UOW factory and does he config by passing in the list of appropriate sobject types
2. We call factory.newInstance() and get a UOW object with the object type property set. 
3. The constructor calls handleRegister and sets up a new map of Type to List 