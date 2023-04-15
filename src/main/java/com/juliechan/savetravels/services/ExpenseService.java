package com.juliechan.savetravels.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.juliechan.savetravels.models.Expense;
import com.juliechan.savetravels.repositories.ExpenseRepo;

@Service
public class ExpenseService {
	@Autowired
	private ExpenseRepo eRepo;
	
	// READ ALL EXPENSES
	public List<Expense> getAll() {
		return eRepo.findAll();
	}
	
	// CREATE OR UPDATE NEW EXPENSE
	public Expense createOrUpdate(Expense newExpense) {
		return eRepo.save(newExpense);
	}
	
	// READ ONE EXPENSE
	public Expense getOne(Long id) {
		Optional<Expense> e = eRepo.findById(id);
		if(e.isPresent()) {
			return e.get();
		}
		return null;
	}
	
	// DELETE EXPENSE
	public void delete(Long id) {
		Optional<Expense> e = eRepo.findById(id);
		if(e.isPresent()) {
			eRepo.deleteById(id);
		}
	}
}
