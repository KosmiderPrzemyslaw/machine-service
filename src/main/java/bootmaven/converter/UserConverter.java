package bootmaven.converter;

import bootmaven.model.User;
import bootmaven.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import java.util.Optional;

public class UserConverter implements Converter<String, Optional<User>> {
    @Autowired
    private UserRepository userRepository;

    @Override
    public Optional<User> convert(String username) {
        Optional<User> user = userRepository.findById(Long.parseLong(username));
        return user;
    }
}
