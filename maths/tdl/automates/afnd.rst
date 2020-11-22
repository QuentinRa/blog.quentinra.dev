=======================================================
3. Automates - Automate fini non-déterministe (AFND)
=======================================================

Un automate fini non-déterministe (AFND), est un automate fini déterministe
mais

	* possiblement plusieurs états initiaux
	* Pour un état et un symbole, il y a plusieurs transitions possibles.
	* :math:`\delta : Q * \epsilon \rightarrow Q` appelée transition instantanée

Transition
	On peut passer d’une configuration c = (q,w) à c’ = (q’,w’) si

		* w = a.w’ (consomme a) donne :math:`\delta(q,a)`
		* w = w’ (consomme rien) donne :math:`\delta(q,\epsilon)`

	On note c Ⱶ c’

	Remarque : un mot est accepté s’il existe au moins une séquence du type
	c0 = (q0,w) Ⱶ c1 Ⱶ c2 Ⱶ … Ⱶ cn = (qf, :math:`\epsilon` ) avec q0 initial et qf final

:math:`\epsilon`-Fermeture (schéma)
-----------------------------------------

On a toujours un moyen de déterminer un AFND en le ramenant à un AFD.

	* On réunit tous les états initiaux et les états des transitions instantanés en un état initial
	* On cherche tous les états auquel on peut arriver en consommant un symbole ce qui nous donne un ensemble d’état.
	* Les groupes d’états contenant un état acceptant le sont également.

.. image:: /assets/math/tdl/afnd1.png

On groupe les états initiaux q0,q0\’ et les états des transitions
instantanés q0’ et q1 ce qui donne en état initial q0,q0\’,q1.

.. image:: /assets/math/tdl/afnd2.png

Puis on ajoute les flèches de sortie à tous les ensembles qui contiennent au moins un état acceptant :

.. image:: /assets/math/tdl/afnd3.png

Remarque : Le problème est le nombre d’états obtenus peut aller jusqu’à 2^nombre d’état (=cardinal).

:math:`\epsilon`-Fermeture (équations)
-----------------------------------------

| L0 = b.L0 + a.L1
| L0’ = b.L0 + a.L2 + L1 // transition instantanée
| L1 = b.L2 + a.L1 + :math:`\epsilon`
| L2 = b.L2 + a.L1 + a.L0’

Le langage reconnu par l’automate est le résultat de la somme des états initiaux.

Opérations
-------------------------

Les opérations possibles sont

	* Complémentaire : Tous les états acceptants deviennent non-acceptant et tous les états non-acceptant deviennent acceptants.
	* Réunion (:math:`L1 \cup L2`) : on crée un état initial (q0) qui fait une transition instantanée sur les états initiaux de L1 et L2.
	* Intersection (:math:`\overline{ \overline{L1} \cup \overline{L2} }` : complémentaire de l’union des complémentaires
	* Produit : On se positionne à chacun des états initiaux des deux langages, et lorsque l’on consomme un symbole, on avance dans les deux. (Évoluent ensemble) :

L1.L2 -> les états acceptants de L1 vont vers les états initiaux de L2.