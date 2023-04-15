package com.juliechan.savetravels.models;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="expenses")
public class Expense {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(min = 3, max = 255, message="Name of expense must not be blank.")
	private String cost;
	
	@Size(min = 3, max = 255, message="Vendor must not be blank.")
	private String vendor;
	
	@NotNull(message="Amount must be greater than 0.")
	@Min(value = 0)
	private Double amount;
	
	@Size(min = 3, max = 255, message="Description must not be blank. It must be at least 3 characters long.")
	private String description;
	
	@Column(updatable = false)
	@DateTimeFormat (pattern="MM-dd-yyyy")
	private Date createdAt;
	private Date updatedAt;
	
	public Expense() { // EMPTY CONSTRUCTOR
		
	}
	
	public Expense(String cost, String vendor, Double amount, String description) {
		this.cost = cost;
		this.vendor = vendor;
		this.amount = amount;
		this.description = description; 
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}
