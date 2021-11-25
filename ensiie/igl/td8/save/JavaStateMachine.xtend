/*******************************************************************************
 * Copyright (c) 2006 - 2016 CEA LIST.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *     Shuai Li (CEA LIST) <shuai.li@cea.fr> - initial API and implementation
 *******************************************************************************/

package org.eclipse.papyrus.designer.languages.java.codegen.sm.xtend

import java.util.ArrayList
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.Transition
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.OpaqueAction

class JavaStateMachine {

	static def javaStateMachineGeneration(StateMachine stateMachine) '''
		private String currentState = "«stateMachine.initialState»";
		
		private HashSet<String> states = new HashSet<>(Arrays.asList(«stateMachine.stateNames»));
		
		«««DONE Fill a HashSet with transition names in the format "S1;S2" if the transition's source's name is "S1" and the target's name is "S2".
		««« You can choose another format if you want, or even a new data type instead of String, but you must then adapt the code below accordingly.
		private HashSet<String> transitions = new HashSet<>(Arrays.asList(«stateMachine.transitionNames»));
			
		
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
				«««DONE Call entry, exit, doActivity, effect behaviors (if written in Java) in correct order according to the context (i.e. switch/cases) of this transition, the target state, and source state
«««ordre : exit effect behaviors entry doActivity
				«stateMachine.exitBehaviors»
		
				«stateMachine.effectBehaviors»
			
				«stateMachine.entryBehaviors»
			
				«stateMachine.doActivityBehaviors»
			
				currentState = targetState;
			} else {
				System.err.println("Invalid transition: current state " + currentState + " cannot transit to " + targetState);
			}
		}
	'''

	/**
	 * Utility method to get initial state or nothing
	 * @param stateMachine the state machine to investigate
	 * @return initial state
	 */
	static def getInitialState(StateMachine stateMachine) {
		if (stateMachine !== null) {
			for (ownedElement : stateMachine.allOwnedElements) {
				if (ownedElement instanceof Pseudostate) {
					for (outgoing : (ownedElement as Pseudostate).outgoings) {
						if (outgoing.target instanceof State) {
							return outgoing.target.name
						}
					}
				}
			}
		}

		return ""
	}

	/**
	 * Utility method to get all states from state Machine
	 * @param stateMachine the state machine to investigate
	 * @return all states in the state machine
	 */
	static def getStates(StateMachine stateMachine) {
		var states = new ArrayList<State>
		
		// DONE fill states with all ownedElements which are State
		if (stateMachine !== null) {
			for (ownedElement : stateMachine.allOwnedElements) {
				if (ownedElement instanceof State) {
					states.add(ownedElement)
				}
			}
		}
		
		states
	}
	
	/**
	 * Utility method to get all states names of the state machine
	 * @param stateMachine the state machine to investigate
	 * @return a list of states names in the state machine
	 */
	static def getStateNamesList(StateMachine stateMachine) {
		var stateNames = new ArrayList<String>
		val states = stateMachine.states	// uses getStates defined above

		// DONE fill stateNames
		for (state : states) {
			stateNames.add(state.name)
		}

		stateNames
	}

	/**
	 * Interpolated expression to get all state names separated by ", "
	 */
	static def getStateNames(StateMachine stateMachine) '''
		«««DONE get all states names and build expression S1, S2, S3»
		«««expression interpolée»
		«IF stateMachine !== null»
			«FOR stateName : stateMachine.stateNamesList BEFORE "" SEPARATOR ", " AFTER ""»
				"«stateName»"
			«ENDFOR»
		«ENDIF»
	'''

	/**
	 * Utility method to get all transitions of the state machine
	 * @param stateMachine the state machine to investigate
	 * @return all transitions in the state machine
	 */
	 static def getTransitions(StateMachine stateMachine) {
	 	var transitions = new ArrayList<Transition>
	 	
	 	// DONE fill transitions with all ownedElements which are Transition
	 	if (stateMachine !== null) {
			for (ownedElement : stateMachine.allOwnedElements) {
				if (ownedElement instanceof Transition) {
					transitions.add(ownedElement)
				}
			}
		}
	 	
	 	transitions
	 }
	 
	/**
	 * Utility method to get all transition names of the state machine
	 * @param stateMachine the state machine to investigate
	 * @return a list of transitions names in the state machine relating source & targets spearated by ";"
	 */
	static def getTransitionNamesList(StateMachine stateMachine) {
		var transitionNames = new ArrayList<String>
		val transitions = stateMachine.transitions	// uses getTransitions defined above

		// DONE fill tansitionsNames iff source & target of transition are not null & source and target names are not empty
		for (transition : transitions) {
			if (transition.source !== null && transition.target !== null && !transition.source.name.empty && !transition.target.name.empty) {
				transitionNames.add(transition.source.name + ";" + transition.target.name)
			}
		}

		transitionNames
	}

	/**
	 * Interpolated expression to get all transition names separated by ", "
	 */
	static def getTransitionNames(StateMachine stateMachine) '''
		«««TODO get all transition names and build expression T1, T2, ...»
		«IF stateMachine !== null»
			«FOR transitionName : stateMachine.transitionNamesList BEFORE "" SEPARATOR ", " AFTER ""»
				"«transitionName»"
			«ENDFOR»
		«ENDIF»
	'''
	
	/**
	 * Builds the code for all exit behaviors
	 * @param stateMachine the state machine to investigate
	 * @code
	 * 	switch (sourceState) {
	 * 		case "«state name»":
	 * 			// Call «state name» exit behavior
	 * 			«state...javaBehavior»
	 * 			break;
	 * 		...
	 * 	}
	 * @endode
	 * Only if at least one state has an exit behavior
	 * @return the code for exit behaviors (if any)
	 */
	static def getExitBehaviors(StateMachine stateMachine) {
		var states = stateMachine.states
		var exitBehaviorCode = ""

		// DONE builds the cases code before surrounding it with switch (sourceState) {}
		for (state : states) {
			if (!state.name.empty && !state.exit.javaBehavior.empty) {
				exitBehaviorCode += '''
				case "«state.name»":
					// Call «state.name» exit behavior
					«state.exit.javaBehavior»
					break;
				'''
			}
		}
		// TODO if exitBehaviorCode is not empty then surround it with switch (sourceState) { exitBehaviorCode }
		if(!exitBehaviorCode.empty) {
			exitBehaviorCode = '''
				// Exit behaviors
				switch (sourceState) {
				''' 
				+ exitBehaviorCode + 
				'''
				}
				'''
		}
	}
	
	/**
	 * Builds the code for all entry behaviors
	 * @param stateMachine the state machine to investigate
	 * @code
	 * 	switch (sourceState) {
	 * 		case "«state name»":
	 * 			// Call «state name» entry behavior
	 * 			«state...javaBehavior»
	 * 			break;
	 * 		...
	 * 	}
	 * @endode
	 * Only if at least one state has an entry behavior
	 * @return the code for entry behaviors (if any)
	 */
	static def getEntryBehaviors(StateMachine stateMachine) {
		var states = stateMachine.states
		var entryBehaviorCode = ""

		// DONE builds the cases code before surrounding it with switch (sourceState) {}
		for (state : states) {
			if (!state.name.empty && !state.entry.javaBehavior.empty) {
				entryBehaviorCode += '''
				case "«state.name»":
					// Call «state.name» entry behavior
					«state.entry.javaBehavior»
					break;
				'''
			}
		}
		// DONE if entryBehaviorCode is not empty then surround it with switch (sourceState) { entryBehaviorCode }
		if(!entryBehaviorCode.empty) {
			entryBehaviorCode = '''
				// Entry behaviors
				switch (targetState) {
				''' 
				+ entryBehaviorCode +
				'''
				}
				'''
		}
	}
	
	/**
	 * Builds the code for all do activity behaviors
	 * @param stateMachine the state machine to investigate
	 * @code
	 * 	switch (sourceState) {
	 * 		case "«state name»":
	 * 			// Call «state name» do activity behavior
	 * 			«state...javaBehavior»
	 * 			break;
	 * 		...
	 * 	}
	 * @endode
	 * Only if at least one state has an do activity behavior
	 * @return the code for do activity behaviors (if any)
	 */
	static def getDoActivityBehaviors(StateMachine stateMachine) {
		var states = stateMachine.states
		var doActivityBehaviorCode = ""
		
		// DONE builds the cases code before surrounding it with switch (sourceState) {}
		for (state : states) {
			if (!state.name.empty && !state.doActivity.javaBehavior.empty) {
				doActivityBehaviorCode += '''
				case "«state.name»":
					// Call «state.name» doActivity behavior
					«state.doActivity.javaBehavior»
					break;
				'''
			}
		}

		// DONE if doActivityBehaviorCode is not empty then surround it with switch (sourceState) { doActivityBehaviorCode }
		if(!doActivityBehaviorCode.empty) {
			doActivityBehaviorCode = '''
				// DoActivity behaviors
				switch (targetState) {
				'''
				+ doActivityBehaviorCode +
				'''
				}
				'''
		}
	}
	
	/**
	 * Builds the code for all transitions effect behaviors
	 * @param stateMachine the state machine to investigate
	 * @code
	 * 	switch (transition) {
	 * 		case "«transition name»":
	 * 			// Call «transition name» effect behavior
	 * 			«transition...javaBehavior»
	 * 			break;
	 * 		...
	 * 	}
	 * @endode
	 * Only if at least one state has an do activity behavior
	 * @return the code for do activity behaviors (if any)
	 */
	static def getEffectBehaviors(StateMachine stateMachine) {
		var transitions = stateMachine.transitions
		var effectBehaviorCode = ""

		// DONE builds the transition name as "transition source name;transition target name" 
		// DONE for each case the source AND target of the transition must be non null
		// DONE for each case the source AND target names of the transition must be non empty
		for (transition : transitions) {
			if (
				transition.source !== null && transition.target !== null && 
				!transition.source.name.empty && !transition.source.name.empty &&
				!transition.effect.javaBehavior.empty
			) {
				// DONE if transition name is not empty AND there is an effect behavior there is a case for this transition so builds the cases code before surrounding it with switch (sourceState) {}
				var transitionName = transition.source.name + ";" + transition.target.name

				effectBehaviorCode += '''
				case "«transitionName»":
					// Call «transitionName» effect behavior
					«transition.effect.javaBehavior»
					break;
				'''
			}
		}

		// TODO if effectBehaviorCode is not empty then surround it with switch (transition) { effectBehaviorCode }
		if (!effectBehaviorCode.empty) {
			effectBehaviorCode = '''
			// Transition effect behaviors
			switch (transition) {
			'''
			+ effectBehaviorCode +
			'''
			}
			'''
		}
	}
	
	/**
	 * Get JavaBehavior from opaque behavior
	 * @param behavior the behavior to investigate for Java Behavior
	 * @return a Java behavior implementation if there is any
	 */
	static def getJavaBehavior(Behavior behavior) {
		if (behavior instanceof OpaqueBehavior) {
			val opaqueBehavior = behavior as OpaqueBehavior
			if (opaqueBehavior.bodies.size == opaqueBehavior.languages.size) {
				val i = opaqueBehavior.languages.indexOf("JAVA")
				return opaqueBehavior.bodies.get(i)
			}
		}
		
		return ""
	}
}