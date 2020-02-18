package claroApp.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class ParseHTML {
    public String getScanNumber(String html) {

        Document doc = Jsoup.parse(html);
        String number = doc.getElementById("vulnerability-container").attr("data-scan");
        return number;
    }

    public int getTable(String html) {

        Document doc = Jsoup.parse(html);
        int table = doc.select("tr.table-info").size();
        System.out.println("********* Size " + table);
        return table;
    }

    public int getHigh(String html) {

        Document doc = Jsoup.parse(html);
        int high = doc.select("tr.table-danger td:contains(IDOR)").size();
        String description = doc.select("tr.table-danger td").text();
        System.out.println("********* VUNERABILITY " + description);
        return high;
    }

}
