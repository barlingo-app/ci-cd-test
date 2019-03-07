package com.barlingo.models.repositories;

import org.springframework.data.repository.CrudRepository;

import com.barlingo.models.entities.User;

public interface UserRepository extends CrudRepository<User, Integer> {

}
