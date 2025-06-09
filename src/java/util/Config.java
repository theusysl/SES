package util;

import java.io.InputStream;
import java.util.Properties;
import jakarta.servlet.ServletContext;

public class Config {
    public static String getProperty(ServletContext context, String key) throws Exception {
        InputStream input = context.getResourceAsStream("/WEB-INF/config.properties");
        Properties props = new Properties();
        props.load(input);
        return props.getProperty(key);
    }
}