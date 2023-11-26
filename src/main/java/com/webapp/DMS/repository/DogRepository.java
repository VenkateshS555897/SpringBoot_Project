package com.webapp.DMS.repository;
/*
 * @author Patlolla Venkateshwar Reddy S555897
 */
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.webapp.DMS.Models.Dog;

public interface DogRepository extends CrudRepository<Dog, Integer> {
	List<Dog> findByName(String name);
}
