package com.myapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="speakers")
public class Speaker {

	private Long id;
	private String author;
	private String topic;
	private String description;
	private String photo;
	private Long event_id;

	public Speaker() {
		
	}
	
	public Speaker(Long id, String author, String topic, String description, String photo, Long event_id) {
		this.id = id;
		this.author = author;
		this.topic = topic;
		this.description = description;
		this.photo = photo;
		this.event_id = event_id;
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

	@Column(name="author")
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name="topic")
	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	@Column(name="description", columnDefinition="TEXT")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name="photo")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name="event_id")
	public Long getEvent_id() {
		return event_id;
	}

	public void setEvent_id(Long event_id) {
		this.event_id = event_id;
	}	
}