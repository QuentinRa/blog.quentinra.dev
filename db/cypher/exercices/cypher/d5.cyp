// 1. Écrire une requête pour ajouter dans FILMS le plus récent film de “Tom Hanks”,
// “A Beautiful Day in the Neighborhood”.
// Vérifiez que le film à bien été ajouté en le séléctionant avec une requête.

MATCH (a)
  WHERE a.name = 'Tom Hanks'
CREATE (movie:Movie{title:'A Beautiful Day in the Neighborhood'})
CREATE (a)-[:ACTED_IN]->(movie)

// ou

MATCH (a{name:'Tom Hanks'})
CREATE (movie:Movie{title:'A Beautiful Day in the Neighborhood'})
CREATE (a)-[:ACTED_IN]->(movie)

// check

MATCH (m:Movie{name:'A Beautiful Day in the Neighborhood'})
RETURN m

// 2. Effacer toutes les films plus anciens que 2000. Attention : on a besoin de deux requêtes, une pour
// effacer toutes les relations
// qui pourrait parler de ces films ( :ACTED_IN | :PRODUCED | :DIRECTED | :REVIEWED | :WROTE ) et une autre pour
// effacer tous les nœuds correspondants.

...