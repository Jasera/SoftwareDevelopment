
package be.kdg.groepa.selenium;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Created by Thierry on 11/03/14.
 */
public class MessagingTests {

    private static boolean setup = false;

    @Before
    public void init(){
        if (setup) return;
        Helper.setup();
        setup = true;
    }

    @Test
    public void getInboxValues(){
        FirefoxDriver driver = new FirefoxDriver();
        driver.manage().window().setSize(new Dimension(1024, 768));
        driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        Helper.doLogin(driver,"user2@tmc.test.com", "Succes1");
        driver.get("http://localhost:8080/frontend/app/index.html#/inbox");
        Helper.wait(Helper.WAIT_SHORT);

        List<WebElement> searchResults = driver.findElementsByXPath("//section[@id='recieveField']/table/tbody/tr");
        assertTrue("There has to be 9 messages loaded in the send message-tab", searchResults.size()==9);
        searchResults.get(0).click();
        Helper.wait(Helper.WAIT_SHORT);
        WebElement element = driver.findElementByXPath("//section[@id='messageField']/div");
        assertEquals("user@tmc.test.com aan user2@tmc.test.com", element.getText());

        driver.close();
    }

    @Test
    public void checkRead(){
        FirefoxDriver driver = new FirefoxDriver();
        driver.manage().window().setSize(new Dimension(1024, 768));
        driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        Helper.doLogin(driver,"user2@tmc.test.com", "Succes1");
        driver.get("http://localhost:8080/frontend/app/index.html#/inbox");
        Helper.wait(Helper.WAIT_SHORT);

        List<WebElement> searchResults = driver.findElementsByXPath("//section[@id='recieveField']/table/tbody/tr");
        assertTrue("There has to be 9 messages loaded in the send message-tab", searchResults.size()==9);
        searchResults.get(3).click();
        Helper.wait(Helper.WAIT_SHORT);
        WebElement element = driver.findElementByXPath("//section[@id='messageField']/div");
        assertEquals("user@tmc.test.com aan user2@tmc.test.com", element.getText());

        element = driver.findElementByName("inboxClick");
        element.click();
        Helper.wait(Helper.WAIT_SHORT);
        searchResults = driver.findElementsByXPath("//section[@id='recieveField']/table/tbody/tr");
        assertTrue("There has to be 9 messages loaded in the send message-tab", searchResults.size()==9);
        assertTrue("Message 4 should be read", searchResults.get(3).findElement(By.xpath("//td/img")).getAttribute("alt").equals("true"));
        driver.close();
    }

    @Test
    public void replyMessage(){
        FirefoxDriver driver = new FirefoxDriver();
        driver.manage().window().setSize(new Dimension(1024, 768));
        driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        Helper.doLogin(driver,"user2@tmc.test.com", "Succes1");
        driver.get("http://localhost:8080/frontend/app/index.html#/inbox");
        Helper.wait(Helper.WAIT_SHORT);

        int sendMessageSize = driver.findElementsByXPath("//section[@id='sendField']/table/tbody/tr").size();

        List<WebElement> searchResults = driver.findElementsByXPath("//section[@id='recieveField']/table/tbody/tr");
        assertTrue("There has to be 9 messages loaded in the send message-tab", searchResults.size()==9);
        WebElement element = searchResults.get(3).findElement(By.xpath("//td[contains(@class, 'fourth')]/img"));
        element.click();
        Helper.wait(Helper.WAIT_SHORT);
        element = driver.findElementByTagName("textarea");
        element.sendKeys("This is a selenium test message");

        driver.findElementByName("SendMessageButton").click();
        Helper.wait(Helper.WAIT_SHORT);
        driver.findElementByName("sendClick").click();
        Helper.wait(Helper.WAIT_SHORT);

        searchResults =  driver.findElementsByXPath("//section[@id='sendField']/table/tbody/tr");
        assertEquals("Send messages should be increased with 1", searchResults.size(), sendMessageSize + 1);

        searchResults.get(searchResults.size()-1).click();
        Helper.wait(Helper.WAIT_SHORT);

        driver.findElementByName("sendClick").click();
        searchResults =  driver.findElementsByXPath("//section[@id='sendField']/table/tbody/tr");
        assertTrue("Message 4 should be read", searchResults.get(searchResults.size() - 1).findElement(By.xpath("//td/img")).getAttribute("alt").equals("false"));

        driver.close();



    }


}
