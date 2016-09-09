# Requirements

require 'rdf'
require 'rdf/vocab'
require 'linkeddata'

# Create a basic graph and dump it

graph = RDF::Graph.new do
  self << [:trashCan, RDF::RDFS.label,   "Trash Can"]
  self << [:car, RDF.type,   :truck]
end

graph.dump(:ntriples)

# Create a cooler graph and check some properties

graph = RDF::Graph.load("https://data.sfgov.org/api/views/ays8-rxxc/rows.rdf?accessType=DOWNLOAD")

graph.size
graph.predicates
graph.objects

statements = graph.statements
statements[30]

# Basic querying
query = RDF::Query.new([nil, nil, "Trash Can"])
query = RDF::Query.new([nil, RDF::Vocab::GEO.long, nil])

graph.query(query.patterns) do |solution| puts solution end; nil
solutions = graph.query(query.patterns)

# Use these geo coordinates on map 37.7768066, -122.426363

# Add external vocabulary
ds = RDF::Vocabulary.new("http://data.sfgov.org/resource/ays8-rxxc/")

# Data GOV Trashcans
https://catalog.data.gov/dataset?q=trashcan
# New York
https://data.ny.gov/api/views/cg7p-tdy5/rows.rdf?accessType=DOWNLOAD
# San Fran
https://data.sfgov.org/api/views/ays8-rxxc/rows.rdf?accessType=DOWNLOAD
# Smaller foaf example
http://ruby-rdf.github.com/rdf/etc/doap.nt
http://greggkellogg.net/foaf
# Broken
http://data.sfgov.org/resource/ays8-rxxc/
