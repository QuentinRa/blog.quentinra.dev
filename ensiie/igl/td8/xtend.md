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
* if you are inside a template block `'''`, you need to write code in `«some_code»`, while you can only put one instruction per `«»`
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

<hr class="sl">

## TODO2

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getStates(StateMachine stateMachine) {
	var states = new ArrayList<State>

	// TODO fill states with all ownedElements which are State

	states
}
```
</div><div>

This method is supposed to return every state in our `stateMachine`. Note that `states` (the last line) is the same as `return states;`.

**Todo**: if stateMachine is not null, then iterate [allOwnedElements](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/Element.html#allOwnedElements()) and add every State (`instanceof`) in `states`.

**Tip**: this is almost of copy-paste of the method above (`getInitialState`). Use it for the syntax of the for (each).

<details class="details-e">
<summary>The solution</summary>

```java
// DONE fill states with all ownedElements which are State
if (stateMachine !== null) {
	for (ownedElement : stateMachine.allOwnedElements) {
		if (ownedElement instanceof State) {
			states.add(ownedElement)
		}
	}
}
```
</details>
</div></div>

<hr class="sr">

## TODO3

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getStateNamesList(StateMachine stateMachine) {
	var stateNames = new ArrayList<String>
	val states = stateMachine.states // uses getStates defined above
	
	// TODO fill stateNames
	
	stateNames
}
```
</div><div>

We know [from the documentation](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/NamedElement.html#getName()) that we got a function getName so we can call `name` on a state.

**Todo**: Loop trough states and add their names in `states`.

**Tip**: this is as easy as you could guess.

<details class="details-e">
<summary>The solution</summary>

```java
// DONE fill stateNames
for (state : states) {
	stateNames.add(state.name)
}
```
</details>
</div></div>

<hr class="sl">

## TODO4

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

```java
/**
* Interpolated expression to get all state names separated by ", "
*/
static def getStateNames(StateMachine stateMachine) '''
	«««TODO get all states names and build expression S1, S2, S3»
'''
```
</div><div>

Notice that we are in a template block `'''`. The syntax of a for loop is

```java
«FOR element: set BEFORE "" SEPARATOR "" AFTER ""»
	«««Some code
«ENDFOR»
```

**Todo**: we need to print every stateName, with a separator "`,`". You may add a if checking if stateMachine isn't null <small>(but that's useless, already checked in getStates)</small>.

<details class="details-e">
<summary>The solution</summary>

```java
«««DONE get all states names and build expression S1, S2, S3»
«FOR stateName : stateMachine.stateNamesList BEFORE "" SEPARATOR ", " AFTER ""»
	"«stateName»"
«ENDFOR»
```

Why do we need `""`, could I use `''` or nothing at all? My teacher told me that `""` is used when you want something to be "printed" in the code, so we have to.
</details>
</div></div>

<hr class="sr">

## TODO5

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getTransitions(StateMachine stateMachine) {
	var transitions = new ArrayList<Transition>
	 	
	// TODO fill transitions with all ownedElements which are Transition
	 	
	 transitions
}
```
</div><div>

**Todo**: some as TODO2 but with Transition

<details class="details-e">
<summary>The solution</summary>

```java
// DONE fill transitions with all ownedElements which are Transition
if (stateMachine !== null) {
	for (ownedElement : stateMachine.allOwnedElements) {
		if (ownedElement instanceof Transition) {
			transitions.add(ownedElement)
		}
	}
}
```
</details>
</div></div>

<hr class="sl">

## TODO6

<div class="row row-cols-md-2 mx-0"><div>

```java
/**
* Utility method to get all transition names of the state machine
* @param stateMachine the state machine to investigate
* @return a list of transitions names in the state machine relating source & targets spearated by ";"
*/
static def getTransitionNamesList(StateMachine stateMachine) {
	var transitionNames = new ArrayList<String>
	val transitions = stateMachine.transitions	// uses getTransitions defined above

	// TODO fill tansitionsNames if source & target of transition are not null & source and target names are not empty

	transitionNames
}
```
</div><div>

You need to check that `transition.source` and `transition.target` are not null, and both of them must have a non-empty name. As you can read [in the doc](), you can use `name` (such as `transition.source.name`).

* **Note**: you can call empty (`something.empty`) to check if `something` is `empty`.
* **Note**: if you didn't pay attention, we are checking the difference with `!==`.

**Todo**: if the check if passed, then add in `transitionNames`, `transition.source.name + ";" + transition.target.name`.

<details class="details-e">
<summary>The solution</summary>

```java
// DONE fill tansitionsNames iff source & target of transition are not null & source and target names are not empty
for (transition : transitions) {
	if (
		transition.source !== null && 
		transition.target !== null && 
		!transition.source.name.empty &&
		!transition.target.name.empty
		) {
			transitionNames.add(transition.source.name + ";" + transition.target.name)
	}
}
```
</details>
</div></div>