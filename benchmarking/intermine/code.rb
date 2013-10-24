#!/usr/bin/env ruby

# This is an automatically generated script to run your query
# to use it you will require the intermine ruby client.
# To install the client, run the following command from a terminal:
#
#     sudo gem install intermine
#
# For further documentation you can visit:
#          http://intermine.org/docs/ruby-docs/
#     and: http://intermine.org/docs/ruby-bio-docs/
#
# The following two lines will be needed in every script:
require "rubygems"
require "intermine/service"
service = Service.new("http://intermine.modencode.org/release-32")

# Get a new query from the service you will be querying:
service.new_query("Submission").
    select(["DCCid", "title", "experimentType", "publicReleaseDate", "properties.name", "properties.type", "properties.wikiLink", "experiment.name", "experiment.category", "project.surnamePI", "lab.surname", "lab.affiliation"]).
    # You can edit the constraint values below
    where("Submission.organism.shortName" => "D. melanogaster").
    order_by("DCCid", "ASC").
    join("Submission.properties", "OUTER").
    limit(10).
    each_row { |r| puts r}

