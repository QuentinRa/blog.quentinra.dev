# IGL

IGL "Introduction au génie logiciel" is not an easy course. You will need strength and motivation to survive 👀. <small>Joke aside, it's hard to learn something. You will have a lot of things used in the graded homework that you didn't "see" during classes</small>.

<hr class="sl">

## TD8 - Code Generation

We have to write some code, that will be able to generate **Java** from our **model**. We will test a few way of doing so.

<details class="details details-border" open>
<summary class="pb-2"><b>1/3</b> 📚 The first one may be achieved by completing the <b>xtend</b> files.</summary>

> **Pro tip**: you may have some auto-completion, and some syntax checks by using the following trick.
>  * Run > Run (or Debug) Configurations > Double click on eclipse application then run/debug
>  * It will run a new papyrus
>  * Open the exact same project inside
>  * Close every file in the previous papyrus (but don't close it), otherwise, you may lose your changes when editing the same file in two papyrus.
> 
> Press <kbd>CTRL+SPACE</kbd> to trigger auto-completion.

<details class="details-s">
<summary>1. Call entry, exit, doActivity, effect behaviors (if written in Java) in correct order according to the context (i.e. switch/cases) of this transition, the target state, and source state</summary>

* **Note**: the order is effect > entry > doActivity > exit
* **Note**: later in the file, you got functions doing the job, such as getEffectBehaviors. We know that `getEffectBehaviors(StateMachine stateMachine)` is the same as `stateMachine.effectBehaviors`
* **Note**: each instruction is enclosed between «» (CTRL+space)
* **Note**: use `«««some comment` if needed

```java
«stateMachine.effectBehaviors»
«stateMachine.entryBehaviors»
«stateMachine.doActivityBehaviors»
«stateMachine.exitBehaviors»
```
</details>

<details class="details-s">
<summary>2. Fill states with all ownedElements which are State</summary>

* **Note**: we are not withing `'''`, no `«`
* **Note**: `states` is the same as `return states;`
* **Note**: you may copy and paste the function `getInitialState` with some slight changes


```java
if (stateMachine !== null) {
	for (ownedElement : stateMachine.allOwnedElements) {
		if (ownedElement instanceof State) {
			states.add(ownedElement)
		}
	}
}
```
</details>

<details class="details-s">
<summary>3. Fill stateNames</summary>

We know [from the documentation](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/NamedElement.html#getName()) that we got a function getName so we can call name

```java
for (state : states) {
	stateNames.add(state.name)
}
```
</details>

<details class="details-s">
<summary>4. Get all states names and build expression S1, S2, S3</summary>

* **Note**: we are in a bloc `'''`, we need to use `«`
* **Note**: Each name will be stored in a variable stateName, using a loop
* **Note**: We are separating values with ", "
* **Note**: We are wrapping separators/«p» in **double quotes** because we want them to be printed as text

```java
«FOR stateName : stateMachine.stateNamesList BEFORE "" SEPARATOR ", " AFTER ""»
  "«stateName»"
«ENDFOR»
```
</details>

<details class="details-s">
<summary>5. Fill transitions with all ownedElements which are Transition</summary>

```java
if (stateMachine !== null) {
	for (ownedElement : stateMachine.allOwnedElements) {
		if (ownedElement instanceof Transition) {
			transitions.add(ownedElement)
		}
	}
}
```
</details>
</details>