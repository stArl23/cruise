package com.huidi.cruise.repository;

import com.huidi.cruise.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String> {
    User getByUsername(String username);
}
