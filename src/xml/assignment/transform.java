package xml.assignment;

import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;



public class transform {

	public static void main(String[] args) {
		String xslFile = "xml/assignment/site2website.xsl";
		String inFile = "xml/assignment/site.xml";
		String outFile = "xml/assignment/website.xml";

		StreamSource xslcode = new StreamSource(new File(xslFile));
		StreamSource input = new StreamSource(new File(inFile));
		StreamResult output = new StreamResult(new File(outFile));
		
		TransformerFactory tf = TransformerFactory.newInstance();

		Transformer trans;
		try {
			trans = tf.newTransformer(xslcode);
			trans.transform(input, output);
			
		} catch (TransformerException e) {
			e.printStackTrace();
		}

		xslFile = "xml/assignment/websiteXml2Html.xsl";
		inFile = "xml/assignment/website.xml";
		outFile = "xml/assignment/website.html";

		xslcode = new StreamSource(new File(xslFile));
		input = new StreamSource(new File(inFile));
		output = new StreamResult(new File(outFile));
		
		tf = TransformerFactory.newInstance();

		try {
			trans = tf.newTransformer(xslcode);
			trans.transform(input, output);
			
		} catch (TransformerException e) {
			e.printStackTrace();
		}

		
	}

}
