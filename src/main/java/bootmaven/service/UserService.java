package bootmaven.service;

import bootmaven.model.User;

public interface UserService {
    User findByUserName(String name);

    void saveUser(User user);

  }
