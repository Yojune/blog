package com.pxy.service;

import com.pxy.entity.User;

public interface UserService {

    User checkUser(String username, String password);
}
