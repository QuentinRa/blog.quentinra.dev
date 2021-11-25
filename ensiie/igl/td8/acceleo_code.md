# Acceleo (code generation)

[Go back](../index.md#td8---code-generation)

In this section, we will again generate code, but this time, we will use **Acceleo**. Note that the output is not the same! **Edit the file**: `/org.eclipse.acceleo.examples.uml2java/` > src > `/org/eclipse/acceleo/examples/uml2java/main/uml2java.mtl`.

<hr class="sl">

## TODO 1

```mtl
[comment TODO you may need to import other files for Interface & Enumeration /]
```

**Todo**: Use the syntax above and import the two other files in `files` (the one for generateInterface, and the one for generateEnumeration).

**Hint**: this is as easy as you could guess, given that the syntax is `[import org::eclipse::acceleo::examples::uml2java::files::classJavaFile /]`

<details class="details-e">
<summary>Solution</summary>

```mtl
[comment DONE you may need to import other files for Interface & Enumeration /]
[import org::eclipse::acceleo::examples::uml2java::files::interfaceJavaFile /]
[import org::eclipse::acceleo::examples::uml2java::files::enumJavaFile /]
```
</details>

<hr class="sr">

## TODO 2

```mtl
[comment TODO also process aType if Kind Of Interface ?/]
[comment TODO also process aType if Kind Of Enumeration ?/]
```

**Todo**: As some "elseif" cases for Interface and Enumeration.

**Hint**: this is as easy as you could guess, given that the syntax is `[elseif (aType.oclIsKindOf(?????))]`. Don't forget to use <kbd>CTRL+SPACE</kbd> to autocomplete the method, which is starting with `gen`.

<details class="details-e">
<summary>Solution</summary>

```mtl
[comment DONE also process aType if Kind Of Interface ?/]
[elseif (aType.oclIsKindOf(Interface))]
	[aType.oclAsType(Interface).genInterfaceJavaFile()/]
[comment DONE also process aType if Kind Of Enumeration ?/]
[elseif (aType.oclIsKindOf(Enumeration))]
	[aType.oclAsType(Enumeration).genEnumJavaFile()/]
```
</details>

<hr class="sl">

## Getting the results of your hard work

* In the `runtime_eclipse` instance
* Click on the arrow to extend the model (see di, notation, UML)
* Right-click on the UML file
  * Acceleo Model To Text
  * Generate UML2java
* You got a folder **src-gen**

I did it on SMModel, and the folder was quite empty, but fortunately, on my model, it did the job.