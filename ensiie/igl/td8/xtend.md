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

## TODO 1

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

## TODO 2

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

## TODO 3

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

## TODO 4

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

## TODO 5

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

## TODO 6

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

<hr class="sr">

## TODO 7

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getTransitionNames(StateMachine stateMachine) '''
	«««TODO get all transition names and build expression T1, T2, ...»
'''
```
</div><div>

**Todo**: Same as we did in TODO4.

<details class="details-e">
<summary>The solution</summary>

```java
«««DONE get all transition names and build expression T1, T2, ...»
«FOR transitionName : stateMachine.transitionNamesList BEFORE "" SEPARATOR ", " AFTER ""»
	"«transitionName»"
«ENDFOR»
```
</details>
</div></div>

<hr class="sl">

## Mid-way explanation

Until now, you were coding functions without understanding why you did that. These functions are utilities functions that we need for our 4 main functions that we called in `transit` a while back.

For each function, you are expecting something like that. Of course, `sourceState` will change, the values in the case will change, the content of the comments will change, and finally, you were not supposed to know `System.out.println(???)`. The user defined in his diagram some code that will be executed when exiting. This is `System.out.println(???)`. Some states may not have such code, so you will have to check that they do (we don't want empty cases).

```java
// Exit behaviors
switch (sourceState) {
case "S1":
	// Call S1 exit behavior
	System.out.println("Exiting S1");
	break;
case "S2":
	// Call S2 exit behavior
	System.out.println("Exiting S2");
	break;
case "S3":
	// Call S3 exit behavior
	System.out.println("Exiting S3");
	break;
}
```

> **Pro tip**: go read the code in expected-src, if you want to know from where the answers are coming from (i.g.: what you have to put in your switch).<br>
> **Question**: hey, why are we using xxx in this switch, will this variable do not exist in the function. **Answer**: you called these functions in a template block. So they do not exist, their code will be printed directly in `transit` and we got `sourceState/targetState/transition`. Check `expected-src` if you don't believe it.

<hr class="sr">

## TODO 8

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getExitBehaviors(StateMachine stateMachine) {
	var states = stateMachine.states
	var exitBehaviorCode = ""
	
	// TODO builds the cases code before surrounding it with switch (sourceState) {}
	
	// TODO if exitBehaviorCode is not empty then surround it with switch (sourceState) { exitBehaviorCode }
}
```
</div><div>

**Todo**
	* for each state, add a case in exitBehaviorCode, only if the state got an exit behavior (`state.exit.javaBehavior` not empty)
	* if the exitBehaviorCode is not empty, wrap it in a `switch`

**Tips**: you will use template blocks for the cases and the switch. Do not forget the comments.

<details class="details-e">
<summary>The solution</summary>

```java
// DONE builds the cases code before surrounding it with switch (sourceState) {}
for (state: states) {
	if (!state.name.empty && !state.exit.javaBehavior.empty) {
		exitBehaviorCode += 
		'''
		case "«state.name»":
			// Call «state.name» exit behavior
			«state.exit.javaBehavior»
			break;
		'''
	}
}

// DONE if exitBehaviorCode is not empty then surround it with switch (sourceState) { exitBehaviorCode }
if (!exitBehaviorCode.empty) {
	exitBehaviorCode =
	'''
	// Exit behaviors
	switch (sourceState) {
	'''
	+ exitBehaviorCode +
	'''
	}
	'''
}
```
</details>
</div></div>

<hr class="sl">

## TODO 9

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getEntryBehaviors(StateMachine stateMachine) {
	var states = stateMachine.states
	var entryBehaviorCode = ""

	// TODO builds the cases code before surrounding it with switch (sourceState) {}

	// TODO if entryBehaviorCode is not empty then surround it with switch (sourceState) { entryBehaviorCode }
}
```
</div><div>

**Todo**: Same as TODO 8.

<details class="details-e">
<summary>The solution</summary>

```java
// DONE builds the cases code before surrounding it with switch (sourceState) {}
for (state: states) {
	if (!state.name.empty && !state.entry.javaBehavior.empty) {
		entryBehaviorCode +=
		'''
		case "«state.name»":
			// Call «state.name» entry behavior
			«state.entry.javaBehavior»
			break;
		'''
	}
}

// DONE if entryBehaviorCode is not empty then surround it with switch (sourceState) { entryBehaviorCode }
if (!entryBehaviorCode.empty) {
	entryBehaviorCode = '''
	// Entry behaviors
	switch (targetState) {
	'''
	+ entryBehaviorCode +
	'''
	}
	'''
}
```
</details>
</div></div>

<hr class="sr">

## TODO 10

<div class="row row-cols-md-2 mx-0"><div>

```java
static def getDoActivityBehaviors(StateMachine stateMachine) {
	var states = stateMachine.states
	var doActivityBehaviorCode = ""
	// TODO builds the cases code before surrounding it with switch (sourceState) {}

	// TODO if doActivityBehaviorCode is not empty then surround it with switch (sourceState) { doActivityBehaviorCode }
}
```
</div><div>

**Todo**: Same as TODO 8 or TODO 9.

<details class="details-e">
<summary>The solution</summary>

```java
// DONE builds the cases code before surrounding it with switch (sourceState) {}
for (state: states) {
	if (!state.name.empty && !state.doActivity.javaBehavior.empty) {
		doActivityBehaviorCode += 
			'''
			case "«state.name»":
				// Call «state.name» doActivity behavior
				«state.doActivity.javaBehavior»
				break;
			'''
	}
}

// DONE if doActivityBehaviorCode is not empty then surround it with switch (sourceState) { doActivityBehaviorCode }
if (!doActivityBehaviorCode.empty) {
	doActivityBehaviorCode = '''
	// DoActivity behaviors
	switch (targetState) {
	'''
	+ doActivityBehaviorCode +
	'''
	}
	'''
}
```
</details>
</div></div>