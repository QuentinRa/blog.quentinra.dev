// 1. Quels sont les titres des films dans lesquels a joué “Keanu Reeves” ?

MATCH (m:Movie)<-[:ACTED_IN]-(:ShowbizPerson{name:'Keanu Reeves'})
RETURN DISTINCT m.title

// 2. Quels sont les titres des films qui sont sortis après 2000 ?

MATCH (m:Movie)
  WHERE m.released > 2000
RETURN DISTINCT m.title

// 3. Quels sont les noms des acteurs qui ont joué dans un film avec “Meg Ryan” ? Ecrire une autre
// requête pour renvoyer le
// sous-graphe qui relie “Meg Ryan”, les acteurs avec quels il y a joué ensemble et les films correspondants.

MATCH (c:ShowbizPerson{name:'Meg Ryan'})-[:ACTED_IN]->(m)<-[ACTED_IN]-(a:ShowbizPerson)
RETURN DISTINCT c,m,a

// 4. Trouver tous les acteurs qui ont dirigé un film dans lequel ils ont aussi joué.
// Renvoyer le sous-graphe qui contient les nœuds correspondant aux acteurs et aux films concernés.
// Ecrire une autre requête qui renvoie les paires contenant le nom de l’acteur et le film pour lequel
// il à été acteur et directeur

MATCH (a:ShowbizPerson)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(a)
RETURN DISTINCT a,m

// ou

MATCH (a:ShowbizPerson)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(c:ShowbizPerson)
  WHERE c.name = a.name
RETURN DISTINCT c,m

// 5. Quels sont les noms des toutes les personnes qui ont écrit des critiques sur le film “The Replacements” ?

MATCH (a:MoviegoerPerson)-[c:REVIEWED]->(b:Movie{title:'The Replacements'}) RETURN a

// 6. Quels sont les noms des toutes les personnes qui ont donnée un rating > 60 au film “The Da Vinci Code” ?

// arête en plus "follow" mais c'est ok
MATCH (a:MoviegoerPerson)-[c:REVIEWED]->(b:Movie{title:'The Da Vinci Code'})
  WHERE c.rating > 60
RETURN a ;

// 7. Quels sont les noms des 5 films dans lesquels ont joué le plus grande nombre des acteurs ?
// Affichez aussi le nombre des acteurs correspondant.

MATCH (m:Movie)<-[:ACTED_IN]-(:ShowbizPerson)
RETURN m.title, COUNT(*) AS nb_actors
  ORDER BY nb_actors DESC
  LIMIT 5

// 8. Quels sont les noms des personnes qui ont écrit mais pas produit le même film ? Astuce : utiliser WHERE NOT.

MATCH (m:Movie)<-[:WROTE]-(p)
  WHERE NOT (p)-[:PRODUCED]-(m)
return p.name,m.title