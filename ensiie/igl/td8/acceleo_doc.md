# Acceleo (doc generation)

[Go back](../index.md#td8---code-generation)

In this section, we will again generate **documentation, for our classes**. You will edit the following files in `org.eclipse.acceleo.module.sample` > src > `org/eclipse/acceleo/module/sample/`

* main/generateMain.mtl
* files/generateClass.mtl
* files/generateInterface.mtl

> **Don't forget to use <kbd>CTRL+SPACE</kbd> to generate some syntax/autocompletion.

<hr class="sl">

## TODO 1 (generateMain)

```
[comment TODO search for classes and interfaces in model's nested packages/]
[comment TODO then display Package's name/]
[comment TODO and indent classes and interfaces names/]
```

**Todo**: iterate values in "nestedPackage", and call "generateClassElement" if we got a class, or "generateInterfaceElement" if we got an interface.

**Tips**

* You can call [nestedPackage](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/Package.html#getNestedPackages()) on [aModel](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/Model.html), which is returning a list of [Package](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/Package.html)
* A [Package](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/Package.html) got [packagedElement](https://download.eclipse.org/modeling/mdt/uml2/javadoc/2.1.1/org/eclipse/uml2/uml/Package.html#getPackagedElements()), so your code will look like the for loop above in the file

<details class="details-e">
<summary>Solution</summary>

Don't forget to import

```
[import org::eclipse::acceleo::module::sample::files::generateInterface/]
```

Then the code is

```java
[comment DONE search for classes and interfaces in model's nested packages/]
[for (p : Package | aModel.nestedPackage->sortedBy(name))]
	[comment DONE then display Package's name/]
	Package [p.name/]
	[comment DONE and indent classes and interfaces names/]
	[for (c : Class | p.packagedElement->filter(Class)->sortedBy(name))]
		[generateClassElement(c)/]
	[/for]
	[for (i : Interface | p.packagedElement->filter(Interface)->sortedBy(name))]
		[generateInterfaceElement(i)/]
	[/for]
[/for]
```
</details>

I'm expecting something like this, but without changing some things, it won't look neat at all.

```none
Package {Name}
	public class {Name} {extend ...}{implements ...} {
		
		public {Type} {attributeName};
			
		public {Type} {methodName}({args}) {
		}			
	}
```

<hr class="sl">

## Generate Documentation

* In the `runtime_eclipse` instance
* Click on the arrow to extend the model (see di, notation, UML)
* Right-click on the UML file
    * Acceleo Model To Text
    * Generate **UML2text**
* You got a .txt in the folder **src-gen**

<hr class="sr">

## TODO 2 (generateClass)

```
[comment TODO also generate Association elements for aClass : see generateAssociation.mtl/]
```

**Todo**: simply call generateAssociationElement

<details class="details-e">
<summary>Solution</summary>

Don't forget to import

```
[import org::eclipse::acceleo::module::sample::files::generateInterface/]
```

Then the code is

```java
[comment DONE also generate Association elements for aClass : see generateAssociation.mtl/]
[generateAssociationElement(aClass)/]
```
</details>

<hr class="sl">

## TODO 3 (generateInterface)

```
[comment TODO see generateClass.mtl for inspiration/]
```

**Todo**: ???

<details class="details-e">
<summary>Possible solution</summary>

```none
[comment encoding = UTF-8 /]
[**
 * The documentation of the module generateInterface.
 */]
[module generateInterface('http://www.eclipse.org/uml2/5.0.0/UML')]
[import org::eclipse::acceleo::module::sample::files::generateAttribute/]
[import org::eclipse::acceleo::module::sample::files::generateOperation/]
[import org::eclipse::acceleo::module::sample::files::generateParent/]
[import org::eclipse::acceleo::module::sample::files::generateAssociation/]

[**
 * The documentation of the template generateElement.
 * @param anInterface
 */]
[template public generateInterfaceElement(anInterface : Interface)]

[file (anInterface.name, false, 'UTF-8')]
[anInterface.visibility/] interface [anInterface.name.toUpperFirst()/][generateParentElement(anInterface)/] {

[for (p : Property | anInterface.attribute)]
	[generateAttributeElement(p)/]
[/for]
[for (o : Operation | anInterface.ownedOperation)]
	[generateOperationElement(o)/]
[/for]
[generateAssociationElement(anInterface)/]
}
[/file]
[/template]
```

And create `generateParentElement(Interface)` in `generateParent.mtl`

```none
[**
 * The documentation of the template generateElement.
 * @param anInterface
 */]
[template public generateParentElement(anInterface : Interface)]
[for (i : Interface | anInterface.redefinedInterface) before ('extends') separator (', ') ]
	[i.name/]
[/for]
[/template]
```

And edit `generateAssociationElement` in `generateAssociation.html`

```diff
- [template public generateAssociationElement(c: Class)]
+ [template public generateAssociationElement(c: Type)]
```
</details>