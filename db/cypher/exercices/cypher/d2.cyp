// 1. Quels sont tous les noms des Films dans lesquels à joué Meg Ryan ?

MATCH (m:Movie)<-[a:ACTED_IN]-(p:ShowbizPerson{name:"Meg Ryan"})
RETURN m

// 2. Quels sont le(s) noms des réalisateur.ice(s) du film \"The Matrix\" ?

...

// 3. Quels sont tous les noms des films qui ont été mis en vente entre 1990 et 2000 ?

...

// 4. Qui sont les acteurs qui ont joué dans les mêmes films que \"Tom Cruise\" ?

...

// 5. Quels sont les personnes qui ont écrit et produit le m^eme film ?

...

// 6. Combien y a t-il de personnes qui ont écrit ou produit un film ?

...

// 7. Combien d'acteurs sont reliés jusqu à trois degrés à \"Kevin Bacon\" ?

...

// 8. Qui sont tous les acteurs directement reliés à \"Kevin Bacon\" ?

...

// 9. Qui sont tous les acteurs indirectement reliés à \"Kevin Bacon\" ?

...

// 10. Y a t-il des acteurs à strictement plus de 6 degés de séparation de \"Kevin Bacon\" ?

...