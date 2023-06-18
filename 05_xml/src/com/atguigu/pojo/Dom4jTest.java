package com.atguigu.pojo;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;
import java.util.List;

public class Dom4jTest {
    /**
     * 读取books.xml文件生成book类
     */
    @Test
    public void test() throws DocumentException {

        // 1 通过创建 SAXReader 对象来读取 xml 文件，获取 Document 对象
        SAXReader reader = new SAXReader();
        Document document = reader.read("src/books.xml");
        // 2 通过 Document 对象拿到 XML 的根元素对象
        Element root = document.getRootElement();
        // Element.asXML() 它将当前元素转换成为 String 对象：标签对象->标签字符串
//         System.out.println( root.asXML() );
        // 3 通过根元素对象获取所有的 book 标签对象
        // Element.elements(标签名)它可以拿到当前元素下的指定的子元素的集合
        // Element.element(标签名)拿到当前元素下的指定的子元素
        List<Element> books = root.elements("book");
        // 4 遍历每个 book 标签对象。然后获取到 book 标签对象内的每一个元素，
        for (Element book : books) {
            // System.out.println(book.asXML());
            // 拿到 book 下面的 name 元素对象
            Element nameElement = book.element("name");
            // 拿到 book 下面的 price 元素对象
            Element priceElement = book.element("price");
            // 拿到 book 下面的 author 元素对象
            Element authorElement = book.element("author");
            // 再通过 getText() 方法拿到起始标签和结束标签之间的文本内容
            System.out.println("书名" + nameElement.getText() + " , 价格:"
                    + priceElement.getText() + ", 作者：" + authorElement.getText());
        }
    }
}
