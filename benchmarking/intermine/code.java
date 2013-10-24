package modmine;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Iterator;
import java.util.List;

import org.intermine.metadata.Model;
import org.intermine.pathquery.Constraints;
import org.intermine.pathquery.OrderDirection;
import org.intermine.pathquery.OuterJoinStatus;
import org.intermine.pathquery.PathQuery;
import org.intermine.webservice.client.core.ServiceFactory;
import org.intermine.webservice.client.services.QueryService;

/**
 * This is a Java program to run a query from modMine.
 * It was automatically generated at Thu Oct 24 10:33:31 BST 2013
 *
 * @author modMine
 *
 */
public class QueryClient
{
    private static final String ROOT = "http://intermine.modencode.org/release-32/service";

    /**
     * Perform the query and print the rows of results.
     * @param args command line arguments
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
        ServiceFactory factory = new ServiceFactory(ROOT);
        Model model = factory.getModel();
        PathQuery query = new PathQuery(model);

        // Select the output columns:
        query.addViews("Submission.DCCid",
                "Submission.title",
                "Submission.experimentType",
                "Submission.publicReleaseDate",
                "Submission.properties.name",
                "Submission.properties.type",
                "Submission.properties.wikiLink",
                "Submission.experiment.name",
                "Submission.experiment.category",
                "Submission.project.surnamePI",
                "Submission.lab.surname",
                "Submission.lab.affiliation");

        // Add orderby
        query.addOrderBy("Submission.DCCid", OrderDirection.ASC);

        // Filter the results with the following constraints:
        query.addConstraint(Constraints.eq("Submission.organism.shortName", "D. melanogaster"));

        // Outer Joins
        // Show all information about these relationships if they exist, but do not require that they exist.
        query.setOuterJoinStatus("Submission.properties", OuterJoinStatus.OUTER);

        QueryService service = factory.getQueryService();
        PrintStream out = System.out;
        String format = "%-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s | %-10.10s\n";
        out.printf(format, query.getView().toArray());
        Iterator<List<Object>> rows = service.getRowListIterator(query);
        while (rows.hasNext()) {
            out.printf(format, rows.next().toArray());
        }
        out.printf("%d rows\n", service.getCount(query));
    }

}

