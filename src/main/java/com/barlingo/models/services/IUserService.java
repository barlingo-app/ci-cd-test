package com.barlingo.models.services;

import java.util.List;

import com.barlingo.models.entities.User;

public interface IUserService {

	List<User> findAll();

	void save(User user);

	User findById(Integer id);

	void delete(User user);
}
