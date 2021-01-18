===============================
Manipulation de flux
===============================

| :code:`package` : java.io
| :code:`Classes utiles` : `Files`_, `File`_

.. _Files: https://docs.oracle.com/javase/7/docs/api/java/nio/file/Files.html
.. _File: https://docs.oracle.com/javase/7/docs/api/java/io/File.html

La manipulation des flux nécessite de capturer
les exceptions de la classe IOException qui sont des exception vérifiées.

Pour obtenir les flux standards

.. code:: java

	System.in // entrée standard
	System.out // sortie standard
	System.err // sortie d'erreur

Fichiers (octets)
-------------------

Pour la théorie, les flux en lecture
héritent de :code:`InputStream`
et les flux en écriture héritent de :code:`OutputStream`.

.. code:: java

		// écriture
		FileOutputStream fos = new FileOutputStream(fichier);
		fos.write(int valeur);

		// lecture
		FileInputStream fis = new FileInputStream(fichier);
		int lu = fis.read();

Fichiers (texte)
-----------------

Pour la théorie, les flux en lecture
héritent de :code:`Reader`
et les flux en écriture héritent de :code:`Writer`.

.. code:: java

		//écriture
		BufferedWriter wr = new BufferedWriter(new FileWriter(fichier));
		wr.write(string);

		//lecture
		BufferedReader br = new BufferedReader(new FileReader(fichier));
		br.readLine();

Flux de caractères
-------------------

Pour la théorie, les flux en lecture
héritent de :code:`Reader`
et les flux en écriture héritent de :code:`Writer`.

.. code:: java

		// écriture (char)
		OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(fichier));
		out.write(caractère);
		// écriture (string)
		BufferedWriter wr = new BufferedWriter(out);
		wr.write(string);

		// lecture (char)
		InputStreamReader sr = new InputStreamReader(new FileInputStream(fichier));
		sr.read(); //lecture 1 par 1
		// lecture (string)
		BufferedReader br = new BufferedReader(wr);
		br.readLine();//lecture d'une ligne

