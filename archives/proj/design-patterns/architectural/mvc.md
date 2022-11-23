# MVC

[Go back](..)

The model is the data of the application. The view is what we will show. And the controller is the brain, asking for data from the model, formatting it, and giving it to the view.

They are a lot of kinds of MVC (at least, I was taught that), but MVC is supposed to refer to this

* the controller generates the view
* the view request data from the model (updates)
* the model check for new data and ask the controller to regenerates the view
  
Still, I think that the core idea of MVC is separating view - model - and the rest. Doing so will make you able to easily change something inside a category without needing to change the other, if you did your job rightfully.