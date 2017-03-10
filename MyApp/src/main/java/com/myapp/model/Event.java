package com.myapp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;

@Entity
@Table(name="events")
public class Event {

	private Long id;
	private String name;
	private String description;
	private Date date_to;
	private String location;
	private String photo;
	
	public Event() {
		
	}
	
	public Event(Long id, String name, String description, Date date_to, String location, String photo) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.date_to = date_to;
		this.location = location;
		this.photo = photo;
	}

	@Id
    @GeneratedValue
    @Column(name="id")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="description", columnDefinition="TEXT")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name="date_to")
	@JSON(format = "yyyy-MM-dd")
	public Date getDate() {
		return date_to;
	}

	public void setDate(Date date_to) {
		this.date_to = date_to;
	}

	@Column(name="location")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@Column(name="photo")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}