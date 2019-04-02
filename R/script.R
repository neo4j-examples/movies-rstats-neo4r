## Install dependencies

if(!require(neo4r)){
    remotes::install_github("neo4j-rstats/neo4r")
    library(neo4r)
}

if(!require(magrittr)){
    install.packages("magrittr")
    library(magrittr)
}

if(!require(visNetwork)){
    install.packages("visNetwork")
    library(visNetwork)
}

if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
}

## Open connection

con <- neo4j_api$new(url = "http://localhost:7474", 
                     user = "neo4j", password = "root")

## Check connection

con
con$ping()
con$get_version()
con$get_constraints()
con$get_labels()
con$get_relationships()
con$get_index()

## Neo4j tutorial

'MATCH (tom {name: "Tom Hanks"}) RETURN tom' %>%
    call_neo4j(con)

'MATCH (cloudAtlas {title: "Cloud Atlas"}) RETURN cloudAtlas' %>%
    call_neo4j(con)

'MATCH (people:Person) RETURN people.name LIMIT 10' %>%
    call_neo4j(con)

'MATCH (nineties:Movie) WHERE nineties.released >= 1990 AND nineties.released < 2000 RETURN nineties.title' %>%
    call_neo4j(con)

'MATCH (tom:Person {name: "Tom Hanks"})-[:ACTED_IN]->(tomHanksMovies) RETURN tom,tomHanksMovies' %>%
    call_neo4j(con, type = "row") 

'MATCH (cloudAtlas {title: "Cloud Atlas"})<-[:DIRECTED]-(directors) RETURN directors.name' %>%
    call_neo4j(con)

'MATCH (tom:Person {name:"Tom Hanks"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(coActors) RETURN coActors.name' %>%
    call_neo4j(con)

#'MATCH (people:Person)-[relatedTo]-(:Movie {title: "Cloud Atlas"}) RETURN people.name, Type(relatedTo), relatedTo' %>%
#    call_neo4j(con)

'MATCH (bacon:Person {name:"Kevin Bacon"})-[*1..4]-(hollywood) RETURN DISTINCT hollywood' %>%
    call_neo4j(con)

g <- 'MATCH p=shortestPath((bacon:Person {name:"Kevin Bacon"})-[*]-(meg:Person {name:"Meg Ryan"})) RETURN p' %>%
    call_neo4j(con, type = 'graph')

visNetwork(g$nodes %>% unnest_nodes(what = "properties"),
           g$relationships %>% unnest_relationships() %>%
               select(from = startNode, to = endNode, label = type))

'MATCH (tom:Person {name:"Tom Hanks"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(coActors), 
    (coActors)-[:ACTED_IN]->(m2)<-[:ACTED_IN]-(cocoActors) 
    WHERE NOT (tom)-[:ACTED_IN]->()<-[:ACTED_IN]-(cocoActors) 
    AND tom <> cocoActors RETURN cocoActors.name AS Recommended, count(*) AS Strength 
    ORDER BY Strength DESC' %>%
    call_neo4j(con)

'MATCH (tom:Person {name:"Tom Hanks"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(coActors),
      (coActors)-[:ACTED_IN]->(m2)<-[:ACTED_IN]-(cruise:Person {name:"Tom Cruise"})
RETURN tom, m, coActors, m2, cruise' %>%
    call_neo4j(con)

