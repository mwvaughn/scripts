#!/usr/bin/env python

# This is an automatically generated script to run your query
# to use it you will require the intermine python client.
# To install the client, run the following command from a terminal:
#
#     sudo easy_install intermine
#
# For further documentation you can visit:
#     http://www.intermine.org/wiki/PythonClient

# The following two lines will be needed in every python script:
from intermine.webservice import Service
service = Service("http://intermine.modencode.org/release-32/service")

# Get a new query on the class (table) you will be querying:
query = service.new_query("Submission")

# The view specifies the output columns
query.add_view(
    "DCCid", "title", "experimentType", "publicReleaseDate", "properties.name",
    "properties.type", "properties.wikiLink", "experiment.name",
    "experiment.category", "project.surnamePI", "lab.surname", "lab.affiliation"
)

# Uncomment and edit the line below (the default) to select a custom sort order:
# query.add_sort_order("Submission.DCCid", "ASC")

# You can edit the constraint values below
query.add_constraint("organism.shortName", "=", "D. melanogaster", "A")

# Uncomment and edit the code below to specify your own custom logic:
# query.set_logic("A")

# Outer Joins
# (display properties of these relations if they exist,
# but also show objects without these relationships)
query.outerjoin("properties")

for row in query.rows():
    print row["DCCid"], row["title"], row["experimentType"], row["publicReleaseDate"],\
         row["properties.name"], row["properties.type"], row["properties.wikiLink"],\
         row["experiment.name"], row["experiment.category"], row["project.surnamePI"],\
         row["lab.surname"], row["lab.affiliation"]

