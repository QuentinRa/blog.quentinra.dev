// 1. Trouver les étiquettes distinctes qui apparaissent sur les nœuds. Pour cela, utiliser la fonction labels.

MATCH (a)
RETURN DISTINCT labels(a)

// 2. Trouver les listes distinctes de propriétés qui son associées aux nœuds. Pour cela,
// utiliser la fonction keys. Comparer les résultats avec la Figure 2. Qu’est-ce qu’on remarque ?

MATCH (a)
RETURN DISTINCT keys(a)

// remarque des listes avec les mêmes valeurs mais permutées

// 3. Trouver tous les personnes qui n’ont que leur nom comme propriété associé.
// Pour cela, utiliser une condition dans la clause WHERE.

MATCH (a)
  WHERE keys(a)=['name']
RETURN DISTINCT a.name

// 4. Trouver tous les films qui n’ont que leur titre et date de sortie comme propriété associés.

MATCH (m:Movie)
  WHERE keys(m)=collect(['released','title'])
RETURN DISTINCT m.released, m.title

// 5. Trouver les types distincts des arêtes. Pour cela, utiliser la fonction type

MATCH (a)-[c]->(b)
RETURN DISTINCT type(c)

// 6. Trouver les listes distinctes de propriétés qui son associées aux arêtes. Comparer
// les résultats avec la Figure 2. Qu’est-ce qu’on remarque ?

MATCH ()-[edge]->()
RETURN DISTINCT keys(edge)

// 7. Renvoyer les sous-graphes dont les arêtes n’ont aucune propriété associé.

MATCH (a)-[edge]->(b)
  WHERE keys(edge) = []
RETURN DISTINCT type(edge)

// 8. Trouver tous les propriétés distinctes qui son associées aux nœuds. Cette fois ci,
// utiliser UNWIND pour transformer les listes dans des tuples. Faire la même chose pour
// les propriétés distinctes associées aux arêtes.

MATCH (a)
UNWIND keys(a) as v
RETURN DISTINCT v

MATCH (a)-[c]->(b)
UNWIND keys(c) as v
RETURN DISTINCT v