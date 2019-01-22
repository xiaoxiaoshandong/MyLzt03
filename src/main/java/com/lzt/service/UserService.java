package com.lzt.service;

import com.lzt.entity.UserT;

public interface UserService {

	UserT selectUser(UserT user);

	Integer insertUserT(UserT user);

}
