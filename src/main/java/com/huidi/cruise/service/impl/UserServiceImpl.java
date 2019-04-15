package com.huidi.cruise.service.impl;

import com.huidi.cruise.domain.User;
import com.huidi.cruise.enums.UserEnums;
import com.huidi.cruise.exception.UserException;
import com.huidi.cruise.repository.UserRepository;
import com.huidi.cruise.service.UserService;
import com.huidi.cruise.utils.MathUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public String login(String username, String password) {
        User user = userRepository.getByUsername(username);
        if (Objects.isNull(user))
            throw new UserException(UserEnums.USER_NO_FOUND.getId(), UserEnums.USER_NO_FOUND.getMessage());
        //encode password
        password = MathUtils.encode(password);
        return (Objects.equals(password, user.getPassword())) ? user.getUsername() : null;
    }
}
