=====================================
JUnit4, lancer une suite de tests
=====================================

Sous JUnit4, vous devez utiliser un main et
le code suivant pour lancer vos tests.

.. code:: java

		import org.junit.runner.JUnitCore;
		import org.junit.runner.Result;
		import org.junit.runner.notification.Failure;

		public class RunAllTests {

		 public static void main(String[] args) {
		  Result result = JUnitCore.runClasses(AllTests.class);

		  if(result.wasSuccessful()) {
		   System.out.println("All tests passed.");
		  } else {
		   for (Failure failure : result.getFailures()) {
		    System.err.println("Failure : " + failure.toString());
		   }
		  }
		 }
		}