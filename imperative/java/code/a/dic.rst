===============
Dictionnaires
===============

Une hash map permet de créer un tableau indexé
dans lequel chaque valeur est associée à une clef. Vous pouvez récupérer une valeur depuis sa clef.
les clefs sont uniques. Si une clef est déjà prise, alors la valeur associée est changée avec votre nouvelle valeur.

.. code:: java

		//HashMap<String, Integer> est un tableau associatif avec par exemple "key1" contient 1
		HashMap<ClasseClef, ClasseValeurs> map;
		map = new HashMap<>();

		//méthodes
		map.put(clef, valeur);//ajout
		map.remove(clef);//supprimer
		map.get(clef);//récupérer
		map.clear();//vider
		map.contains(key); //clef existe
		map.entrySet(); //parcourir toutes les valeurs

		//ex de parcours
		foreach(Map.Entry<ClasseCles, ClasseValeurs> entry: map.entrySet){
		 //affiche la clef
		 entry.getKey()
		 //affiche la valeur
		 entry.getValue()
		}