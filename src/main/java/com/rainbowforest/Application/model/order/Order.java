package com.rainbowforest.Application.model.order;

import java.time.LocalDate;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.rainbowforest.Application.model.constructionSite.ConstructionSite;

@Entity
@Table (name = "orders")
@JsonIgnoreProperties({"orderDetails", "hibernateLazyInitializer", "handler"})
public class Order {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column (name = "total_price")
	private Double totalPrice;
	@Column (name = "date")
	private LocalDate date;
	@Column (name = "status")
	private Integer status;
	@Column (name = "ordering_party")
	private String orderingParty;
	
	@ManyToOne (cascade = CascadeType.MERGE)
	@JoinColumn(name = "construction_site_id")
	@JsonManagedReference
	private ConstructionSite constructionSite;

	@OneToOne (mappedBy = "order")
	private OrderDetails orderDetails;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getOrderingParty() {
		return orderingParty;
	}

	public void setOrderingParty(String orderingParty) {
		this.orderingParty = orderingParty;
	}

	public ConstructionSite getConstructionSite() {
		return constructionSite;
	}

	public void setConstructionSite(ConstructionSite constructionSite) {
		this.constructionSite = constructionSite;
	}

	public OrderDetails getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(OrderDetails orderDetails) {
		this.orderDetails = orderDetails;
	}
}
