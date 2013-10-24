#!/usr/bin/perl

######################################################################
# This is an automatically generated script to run your query.
# To use it you will require the InterMine Perl client libraries.
# These can be installed from CPAN, using your preferred client, eg:
#
#    sudo cpan Webservice::InterMine
#
# For help using these modules, please see these resources:
#
#  * http://search.cpan.org/perldoc?Webservice::InterMine
#       - API reference
#  * http://search.cpan.org/perldoc?Webservice::InterMine::Cookbook
#       - A How-To manual
#  * http://www.intermine.org/wiki/PerlWebServiceAPI
#       - General Usage
#  * http://www.intermine.org/wiki/WebService
#       - Reference documentation for the underlying REST API
#
######################################################################

use strict;
use warnings;

# Set the output field separator as tab
$, = "\t";
# Print unicode to standard out
binmode(STDOUT, 'utf8');
# Silence warnings when printing null fields
no warnings ('uninitialized');

# The following import statement sets modMine as your default
use Webservice::InterMine 0.9904 'http://intermine.modencode.org/release-32';

my $query = new_query(class => 'Submission');

# The view specifies the output columns
$query->add_view(qw/
    DCCid
    title
    experimentType
    publicReleaseDate
    properties.name
    properties.type
    properties.wikiLink
    experiment.name
    experiment.category
    project.surnamePI
    lab.surname
    lab.affiliation
/);

# edit the line below to change the sort order:
# $query->add_sort_order('DCCid', 'ASC');

# Outer Joins
# (Show attributes of these relations if they exist, but do not require them to exist.)
$query->add_outer_join('properties');

$query->add_constraint(
    path  => 'Submission.organism.shortName',
    op    => '=',
    value => 'D. melanogaster',
    code  => 'A',
);

# Use an iterator to avoid having all rows in memory at once.
my $it = $query->iterator();
while (my $row = <$it>) {
    print $row->{'DCCid'}, $row->{'title'}, $row->{'experimentType'}, $row->{'publicReleaseDate'},
        $row->{'properties.name'}, $row->{'properties.type'}, $row->{'properties.wikiLink'},
        $row->{'experiment.name'}, $row->{'experiment.category'}, $row->{'project.surnamePI'},
        $row->{'lab.surname'}, $row->{'lab.affiliation'}, "\n";
}

