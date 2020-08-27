package runnerKarate;

import com.intuit.karate.junit5.Karate;

public class KarateRunner {
	 @Karate.Test
	    Karate testFullPath() {
	        return Karate.run("classpath:karateFeature.feature").tags("@first");
	    }

}
