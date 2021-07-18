# MVC

[Go back](..)

The model is the data of the application. The view
is what we will show. And the controller is the brain,
asking for data from the model, formatting it, and giving
it to the view.

They are a lot of kind of MVC, usually the most
rightful one is a bit different from above

* the controller generates the view
* the view ask data from the model (updates)
* the model check for new data and ask the controller
to regenerates the view
  
But I personally think that the core idea of MVC
is separating view - model - and the rest since doing
so will make you able to easily change one without
needing to change the other, that's only if you did
your job rightfully.