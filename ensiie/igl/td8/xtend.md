# xtend - Code Generation

[Go back](../index.md#td8---code-generation)

Do you remember that in the setup, we generated code from the model? Well, if you are checking, the code isn't complete nor working. **We need to complete the generator**.

In **org.eclipse.papyrus.designer.languages.java.codegen.sm**, edit the file **JavaStateMachine.xtend** in **src/.../codegen/sm/xtend** (the last one).

> **Question** 📚: How do I know that my generator is working?<br>
> **Answer** 📖: Your generated code should be the same as the code in the the folder `expected-src` in **SMModel**.

<hr class="sl">

## Let's be efficient

You need to know that

* you will write a sort of Java code
* if you are inside a bloc `'''`, you need to write code in `«some_code»`, while you can only put one instruction per `«»`
* more syntax will be given when needed

To generate `«»` or to trigger autocompletion, press <kbd>CTRL+SPACE</kbd>.

<hr class="sr">

## TODO1

<div class="row row-cols-md-2 mx-0"><div>

```java
public void transit(String sourceState, String targetState) {
	if (!states.contains(sourceState)) {
		System.err.println("Invalid source state: " + sourceState);
		return;
	}
	
	if (!states.contains(targetState)) {
		System.err.println("Invalid target state: " + targetState);
		return;
	}
		
	String transition = sourceState + ";" + targetState;
	if (transitions.contains(transition)) {
		«««TODO Call entry, exit, doActivity, effect behaviors (if written in Java) in correct order according to the context (i.e. switch/cases) of this transition, the target state, and source state

		currentState = targetState;
	} else {
		System.err.println("Invalid transition: current state " + currentState + " cannot transit to " + targetState);
	}
}
````
</div><div>

We are on a state. We are checking if we got a transition. If we do, we need to **exit the current state**, **go trough the transition so we are doing the effect**, then we are **entering** the new state, and **doing** its activity. **This is the order: exit, effect, enter, doActivity** (you don't believe me? check `expected-src`).

Fortunately, doing exit/... is something easy, as this is simply a call to a method, at the bottom of the file <small>(the method is empty with some todo inside, but don't mind it for now)</small>.

The syntax to call `getEffectBehaviors(StateMachine stateMachine)` is `stateMachine.effectBehaviors`.

**Todo**: call the methods in the right order.

<details class="details-e">
<summary>The solution</summary>

```java
// ...
if (transitions.contains(transition)) {
	«««DONE Call entry, exit, ...

	«stateMachine.exitBehaviors»

	«stateMachine.effectBehaviors»

	«stateMachine.entryBehaviors»

	«stateMachine.doActivityBehaviors»

	currentState = targetState;
} else {
// ...
```

**Why do you add spaces like this?** Later, you will compare your generated code with the one in `expected-src` and see that you need to add spaces.
</details>
</div></div>