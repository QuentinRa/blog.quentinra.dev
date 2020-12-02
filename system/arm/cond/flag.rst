============================================
5. Conditions - Opérateurs et Flags
============================================

====== =========== ================= ======================================
NZCV   {cond}      NZCV              Note
====== =========== ================= ======================================
al     Rien                          On fait toujours
0000   eq          Z                 précédent test vaut 0
0001   ne          !Z	               précédent test différent de 0
0100   mi          N	               négatif
0101   pl          !N	               positif
1010   ge          N==V	             Supérieur ou égal
1011   lt          N !=V	           Inférieur
1100   gt          !Z AND (N==V)	   Supérieur
1101   le          Z or (N != V)	   Inférieur ou égal
\      CS, CC	     C, !C             Retenue, pas de retenue
\      VS, VC	     V, !V             Débordement, pas de débordement
====== =========== ================= ======================================