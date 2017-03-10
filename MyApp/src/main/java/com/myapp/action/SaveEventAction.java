package com.myapp.action;

import java.util.Date;
import java.util.Locale;

import com.myapp.controller.EventsManager;
import com.myapp.model.Event;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class SaveEventAction extends ActionSupport {

	private String id;
	private String name;
	private String description;
	private String date_to;
	private String location;
	private String photo;
	private String webix_operation;
	
	public String saveEvent() {
		Event event = new Event();
		event.setId(id!=null ? Long.parseLong(id, 10) : null);
		event.setName(name);
		event.setDescription(description);
		Date eventDate = null;
		try {
			eventDate = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(date_to);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		event.setDate(eventDate);
		event.setLocation(location);
		event.setPhoto(photo);

		EventsManager eventsManager = new EventsManager();
		if (webix_operation.equals("update"))
			event = eventsManager.update(event);
		else if (webix_operation.equals("delete"))
			event = eventsManager.delete(event);
		else if (webix_operation.equals("insert"))
			event = eventsManager.insert(event);

		id = event.getId().toString();
		return Action.SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date_to;
	}

	public void setDate(String date) {
		this.date_to = date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getWebix_operation() {
		return webix_operation;
	}

	public void setWebix_operation(String webix_operation) {
		this.webix_operation = webix_operation;
	}

}