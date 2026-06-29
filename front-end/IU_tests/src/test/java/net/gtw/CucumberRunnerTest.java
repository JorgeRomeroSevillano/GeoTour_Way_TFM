package net.gtw;

import static io.cucumber.junit.platform.engine.Constants.FILTER_TAGS_PROPERTY_NAME;
import static io.cucumber.junit.platform.engine.Constants.GLUE_PROPERTY_NAME;
import static io.cucumber.junit.platform.engine.Constants.PLUGIN_PROPERTY_NAME;

import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;
import org.junit.platform.suite.api.ConfigurationParameter;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("net/gtw")
@ConfigurationParameter(key = GLUE_PROPERTY_NAME, value = "net.gtw")
@ConfigurationParameter(key = FILTER_TAGS_PROPERTY_NAME, value = "not @ignore")
@ConfigurationParameter(key = PLUGIN_PROPERTY_NAME, value = "pretty, html:target/cucumber-report/cucumber.html")

public class CucumberRunnerTest {
}
