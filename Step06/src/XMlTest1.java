import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMlTest1 {
	public static void main(String[] args) throws Exception {
		File file = new File("test.xml");
		//System.out.println(file.exists());
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = f.newDocumentBuilder();
		Document doc = dBuilder.parse(file);
		doc.getDocumentElement().normalize();
		
		String root = doc.getDocumentElement().getNodeName();
		System.out.println("root : " + root);
		NodeList list = doc.getElementsByTagName(root);	// company 선택
		
		Node temp = list.item(0);	// company
		NodeList child = temp.getChildNodes();	// staff들
		
		for(int i=0; i<child.getLength(); i++) {
			Node n = child.item(i);
			if(n.getNodeType() == Node.ELEMENT_NODE) {
				System.out.println(n.getNodeName());
				if(n.getNodeName().equals("staff")) {
					NodeList schild = n.getChildNodes();
					for(int j=0; j<schild.getLength();j++) {
						Node t = schild.item(j);
						if(t.getNodeType() == Node.ELEMENT_NODE) {
							System.out.println(t.getNodeName() + ": " + t.getTextContent());
						}
					}
				}
			}
		}
		
		
	}
}
