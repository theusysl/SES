package util;

import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.ServletContext;

public class DBUtil {
    public static Connection connect(ServletContext context) throws Exception {
        Class.forName("org.sqlite.JDBC");

        String relativePath = Config.getProperty(context, "db.path");
        String fullPath = context.getRealPath("/" + relativePath);

        return DriverManager.getConnection("jdbc:sqlite:" + fullPath);
    }
}