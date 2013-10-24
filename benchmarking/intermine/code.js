<html>
<!-- This is an automatically generated code snippet to run your query
 using the intermine JavaScript client library. It is assumed that you
 will be wanting to run this query from a webpage, and so the code is
 formatted such that you can just cut and paste it into any webpage -->

<head>
<link href="http://cdn.intermine.org/css/bootstrap/2.0.3-prefixed/css/bootstrap.min.css" rel="stylesheet"><script src="http://cdn.intermine.org/js/jquery/1.7/jquery.min.js"></script><script src="http://cdn.intermine.org/js/underscore.js/1.3.3/underscore-min.js"></script><script src="http://cdn.intermine.org/js/backbone.js/0.9.2/backbone-min.js"></script><script src="http://cdn.intermine.org/js/intermine/imjs/latest/imjs.js"></script><script src="http://cdn.intermine.org/js/intermine/im-tables/latest/deps.js"></script><script src="http://cdn.intermine.org/js/intermine/im-tables/latest/imtables.js"></script><link href="http://cdn.intermine.org/js/intermine/im-tables/latest/tables.css" rel="stylesheet"><link href="http://cdn.intermine.org/css/jquery-ui/1.8.19/jquery-ui-1.8.19.custom.css" rel="stylesheet"><link href="http://cdn.intermine.org/css/google-code-prettify/latest/prettify.css" rel="stylesheet"><script type="text/javascript">
(function($) {
    var query = {"model":{"name":"genomic"},"select":["Submission.DCCid","Submission.title","Submission.experimentType","Submission.publicReleaseDate","Submission.properties.name","Submission.properties.type","Submission.properties.wikiLink","Submission.experiment.name","Submission.experiment.category","Submission.project.surnamePI","Submission.lab.surname","Submission.lab.affiliation"],"orderBy":[{"Submission.DCCid":"ASC"}],"joins":["Submission.properties"],"where":[{"path":"Submission.organism.shortName","op":"=","code":"A","value":"D. melanogaster"}]};
    var service = new intermine.Service({
        root: "http://intermine.modencode.org/release-32/",
     // token: "YOUR-TOKEN-HERE"
    });

    $(function() {
      var view = new intermine.query.results.CompactView(service, query);
      view.$el.appendTo('#query-table-container-2');
      view.render();
    });
})(jQuery);
</script>
</head>
<body>
  <div id="query-table-container-2"></div>
</body>
</html>
