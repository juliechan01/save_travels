package com.juliechan.savetravels.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import com.juliechan.savetravels.models.Expense;

public interface ExpenseRepo extends CrudRepository<Expense, Long>{
	
	// READ ALL EXPENSES METHOD
	List<Expense> findAll();
	
	// READ AN EXPENSE METHOD
	Optional<Expense> findById(Long id);
	
	// DELETE AN EXPENSE METHOD
	void deleteById(Long id);
}
