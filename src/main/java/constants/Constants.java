package constants;

import com.free4lab.utils.account.ConfigurationUtil;

import java.io.IOException;
import java.util.Properties;

/**
 * @author 付华
 * @create 2017/11/6 15:25
 * @since 1.0.0
 */
public class Constants {
    public static final String PICURL;
    public static final String LOCATION;

    static {
        try {
            ConfigurationUtil configurationUtil = new ConfigurationUtil();
            Properties p = configurationUtil.getPropertyFileConfiguration("app.properties");
            PICURL=p.getProperty("PIC_URL");
            LOCATION=p.getProperty("LOCATION");
        }catch (IOException e) {
            System.out.println("Wrong constants");
            throw new RuntimeException("Failed to init app configuration", e);
        }
    }
}
