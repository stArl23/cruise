package com.huidi.cruise.service;


public interface UserService {
    /***
     * admin login system with username and password
     * @param username username to login
     * @param password password in plaintext
     * @return username or null
     */
    String login(String username, String password);
}
