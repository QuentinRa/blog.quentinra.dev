==========================
Annotations
==========================

Les annotations sont destinées au programmeur pour lui rappeler/le prévenir de quelque chose.
Un bon exemple est l'annotation @Overrides qui rappel au programmeur qu'il est en train de surcharger
une méthode.

Exemple d'utilisation
=======================

.. code:: java

		//ceci est une méthode qui prends un argument possiblement null et un argument non null et retourne un résultat non null
		//il s'agit d'un contract, donc le programmeur n'a aucune obligatoire de respecter les annotations, mais certains
		//éditeur préviendrons l'utilisateur que cette méthode attends un argument non null
		//
		//NotNull et Nullable ne sont pas annotations dans l'API officielle
		@NotNull
		public void method(@Nullable argument, @NotNull argument2){ ...}

		// @Deprecated indique une classe ou une méthode qu'il ne faut plusieurs utiliser
		// @Immutable indique une classe qui ne peux plus être modifiée après création sans devor
		// créer un nouvel objet (par exemple toutes les méthodes de String retournent une nouvelle String)

Coder ses propres annotations
====================================

Doc : https://docs.oracle.com/javase/7/docs/api/java/lang/annotation/Retention.html

.. code:: java

		@Retention(...) //durée de vie (compilation, runtime, source)
		@Target(...) //ou peut être utilisée l'annotation (devant une classe, argument d'une méthode, ...)
		public @interface nomAnnotation {
		 //ici vous déclarez des attributs à remplir lors de l'appel de l'annotation,
		 //Si vous leur donnez une valeur par défaut, alors vous n'aurez pas à leur donner
		 //de valeur lors de l'appel
		 String champ() default "";

		 //attribut à remplir car pas default
		 float champVersion();
		}

		//appel de l'annotation
		@nomAnnotation(champVersion=1);
		...