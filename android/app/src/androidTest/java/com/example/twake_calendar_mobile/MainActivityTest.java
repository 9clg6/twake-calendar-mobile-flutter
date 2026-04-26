package com.example.twake_calendar_mobile;

import androidx.test.platform.app.InstrumentationRegistry;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import org.junit.runner.RunWith;
import pl.leancode.patrol.PatrolJUnitRunner;

@RunWith(AndroidJUnit4.class)
public class MainActivityTest {
    @org.junit.Test
    public void runDartTests() {
        PatrolJUnitRunner instrumentation =
            (PatrolJUnitRunner) InstrumentationRegistry.getInstrumentation();
        instrumentation.setUp(MainActivity.class);
        instrumentation.waitForPatrolAppService();
    }
}
