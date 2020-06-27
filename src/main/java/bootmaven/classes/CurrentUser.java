package bootmaven.classes;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class CurrentUser extends org.springframework.security.core.userdetails.User {
    private final bootmaven.model.User user;

    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       bootmaven.model.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public bootmaven.model.User getUser() {return user;}
}
