package com.rainbowforest.Application.model.order;

import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import com.rainbowforest.Application.model.catalog.Item;
import com.rainbowforest.Application.model.catalog.Product;
import com.rainbowforest.Application.model.constructionSite.ConstructionSite;

@Entity
@Table(name = "order_details")
public class OrderDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "email")
	private String email;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "order_id")
	private Order order;

	@OneToMany(mappedBy = "orderDetails", cascade = CascadeType.ALL)
	private List<Item> orderItems;

	@ManyToOne
	@JoinColumn(name = "construction_site_id")
	private ConstructionSite constructionSite;

	// ===== GETTERS & SETTERS =====

	public Integer getId() { return id; }
	public void setId(Integer id) { this.id = id; }

	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }

	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }

	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	public Order getOrder() { return order; }
	public void setOrder(Order order) { this.order = order; }

	public List<Item> getOrderItems() { return orderItems; }
	public void setOrderItems(List<Item> orderItems) { this.orderItems = orderItems; }

	public ConstructionSite getConstructionSite() { return constructionSite; }
	public void setConstructionSite(ConstructionSite constructionSite) { this.constructionSite = constructionSite; }

    public void setItems(List<Item> items) {

    }
}