import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.Assert;

import demo.Demo;

public class DemoTest {

  private Demo demo;

  @Before
  public void before(){
    demo = new Demo();
  }

  @After
  public void after(){
    demo = null;
  }

  @Test
  public void testMessage() throws Exception {
    Assert.assertEquals(demo.getMessage(), "Hello World!");
  }

}
