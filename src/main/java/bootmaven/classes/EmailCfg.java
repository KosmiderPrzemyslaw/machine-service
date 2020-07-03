package bootmaven.classes;

import org.springframework.stereotype.Component;

@Component
public class EmailCfg {
    private String host;
    private int port;
    private String username;
    private String password;
}
