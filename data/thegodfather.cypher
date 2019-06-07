CREATE (TheGodfather:Movie {title:'The Godfather', released:1972})
  MERGE (MarlonB:Person {name:'Marlon Brando', born:1924})
  MERGE (AlP:Person {name:'Al Pacino', born:1940})
  MERGE (JamesC:Person {name:'James Caan', born:1940})
  MERGE (RobertD:Person {name:'Robert Duvall', born:1931})
  MERGE (Dianek:Person {name:'Diane Keaton', born:1946})
  MERGE (TaliaS:Person {name:'Talia Shire', born:1946})
  MERGE (FrancisFC:Person {name:'Francis Ford Coppola', born:1939})
  MERGE (MarioP:Person {name:'Mario Puzo', born:1920})
  MERGE (AlbertD:Person {name:'Albert S. Ruddy', born:1930})
  CREATE
    (MarlonB)-[:ACTED_IN {roles:['Don Vito Corleone']}]->(TheGodfather),
    (AlP)-[:ACTED_IN {roles:['Michael Corleone']}]->(TheGodfather),
    (JamesC)-[:ACTED_IN {roles:['Sonny Corleone']}]->(TheGodfather),
    (RobertD)-[:ACTED_IN {roles:['Tom Hagen']}]->(TheGodfather),
    (Dianek)-[:ACTED_IN {roles:['Kay Adams']}]->(TheGodfather),
    (TaliaS)-[:ACTED_IN {roles:['Connie Corleone']}]->(TheGodfather),
    (FrancisFC)-[:DIRECTED]->(TheGodfather),
    (MarioP)-[:WROTE]->(TheGodfather),
    (FrancisFC)-[:WROTE]->(TheGodfather),
    (AlbertD)-[:PRODUCED]->(TheGodfather)

CREATE (TheGodfather2:Movie {title:'The Godfather: Part II', released:1974})
  MERGE (RobertDN:Person {name:'Robert De Niro', born:1943})
  MERGE (JohnC:Person {name:'John Cazale', born:1935})
  CREATE
    (RobertDN)-[:ACTED_IN {roles:['Vito Corleone']}]->(TheGodfather2),
    (AlP)-[:ACTED_IN {roles:['Michael Corleone']}]->(TheGodfather2),
    (Dianek)-[:ACTED_IN {roles:['Kay Adams']}]->(TheGodfather2),
    (RobertD)-[:ACTED_IN {roles:['Tom Hagen']}]->(TheGodfather2),
    (TaliaS)-[:ACTED_IN {roles:['Connie Corleone']}]->(TheGodfather2),
    (JohnC)-[:ACTED_IN {roles:['Fredo Corleone']}]->(TheGodfather2),
    (FrancisFC)-[:DIRECTED]->(TheGodfather2),
    (MarioP)-[:WROTE]->(TheGodfather2),
    (FrancisFC)-[:WROTE]->(TheGodfather2)
    
CREATE (TheGodfather3:Movie {title:'The Godfather: Part III', released:1990})
  MERGE (AndyG:Person {name:'Andy Garcia', born:1956})
  MERGE (SofiaC:Person {name:'Sofia Coppola', born:1971})
  MERGE (FrancD:Person {name:'Franc DAmbrosio', born:1962})
  CREATE
    (AlP)-[:ACTED_IN {roles:['Don Michael Corleone']}]->(TheGodfather3),
    (Dianek)-[:ACTED_IN {roles:['Kay Adams Michelson']}]->(TheGodfather3),
    (TaliaS)-[:ACTED_IN {roles:['Connie Corleone Rizzi']}]->(TheGodfather3),
    (AndyG)-[:ACTED_IN {roles:['Vincent Mancini']}]->(TheGodfather3),
    (SofiaC)-[:ACTED_IN {roles:['Mary Corleone']}]->(TheGodfather3),
    (FrancD)-[:ACTED_IN {roles:['Anthony Vito Corleone']}]->(TheGodfather3),
    (FrancisFC)-[:DIRECTED]->(TheGodfather3),
    (MarioP)-[:WROTE]->(TheGodfather3),
    (FrancisFC)-[:WROTE]->(TheGodfather3)

