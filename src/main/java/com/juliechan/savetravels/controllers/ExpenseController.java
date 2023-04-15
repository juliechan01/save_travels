package com.juliechan.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juliechan.savetravels.models.Expense;
import com.juliechan.savetravels.services.ExpenseService;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	@Autowired
	private ExpenseService eService;
	
	// DASHBOARD - READ ALL EXPENSES
	@GetMapping("")
	public String rHome(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> overhead = eService.getAll();
		model.addAttribute("expenses", overhead);
		return "index.jsp";
	}
	
	// CREATE AN EXPENSE
	@PostMapping("/new")
	public String pCreateExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("expenses", eService.getAll());
			return "index.jsp";
		}
		eService.createOrUpdate(expense);	
		return "redirect:/expenses";
	}
	
	// READ ONE EXPENSE
	@GetMapping("/{id}")
	public String rExpense(@PathVariable("id") Long expensesId, @ModelAttribute("expense") Expense expense, Model model) {
		model.addAttribute("expense", eService.getOne(expensesId));
		return "one_expense.jsp";
	}
	
	// UPDATE AN EXPENSE
	@PutMapping("/{id}")
	public String pExpense(@PathVariable("id") Long expensesId, @Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		System.out.println(expense);
		if(result.hasErrors()) {
			model.addAttribute("expense", eService.getOne(expensesId));
			return "one_expense.jsp";
		}
		eService.createOrUpdate(expense);
		return String.format("redirect:/expenses", expensesId);
	}
	
	// DELETE AN EXPENSE
	@DeleteMapping("/{id}")
	public String destroy(@PathVariable("id") Long expensesId) {
		eService.delete(expensesId);
		return "redirect:/expenses";
	}
}
