=====================================
4.1 Optimiser sa requête
=====================================

Changer la syntaxe d'une requête la rends plus rapide.

	* remplacer 500/2 par 250
	* remplacer \`attr\` in (liste...) par \`attr\`=... or \`attr\`=... [...]
	* remplacer \`attr\` like 'Jinka' par \`attr\`='Jinka'
	* remplacer NOT(a OR b) par NOT A AND NOT B
	* remplacer val BETWEEN 5 AND 15 par val=>5 AND val<=15
	* remplacer les select where condition1 or condition2 par (select where condition1) UNION ALL (select where condition2)
	* remplacer select * from A where A.id in (select bid from B) par Select A.* from A, B where A.id = B.bid; si bid est un indexe de la table B