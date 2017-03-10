package com.myapp.action;

import java.util.Date;
import java.util.Locale;

import com.myapp.controller.EventsManager;
import com.myapp.controller.SpeakersManager;
import com.myapp.model.Event;
import com.myapp.model.Speaker;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class SaveSpeakerAction extends ActionSupport {

	private String id;
	private String author;
	private String topic;
	private String description;
	private String photo;
	private String event_id;
	private String webix_operation;
	
	public String saveSpeaker() {
		Speaker speaker = new Speaker();
		speaker.setId(id!=null ? Long.parseLong(id, 10) : null);
		speaker.setAuthor(author);
		speaker.setTopic(topic);
		speaker.setDescription(description);
		speaker.setPhoto(photo);
		speaker.setEvent_id(Long.parseLong(event_id, 10));
		Date eventDate = null;

		SpeakersManager speakersManager = new SpeakersManager();
		if (webix_operation.equals("update"))
			speaker = speakersManager.update(speaker);
		else if (webix_operation.equals("delete"))
			speaker = speakersManager.delete(speaker);
		else if (webix_operation.equals("insert"))
			speaker = speakersManager.insert(speaker);

		id = speaker.getId().toString();
		return Action.SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEvent_id() {
		return event_id;
	}

	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}

	public String getWebix_operation() {
		return webix_operation;
	}

	public void setWebix_operation(String webix_operation) {
		this.webix_operation = webix_operation;
	}
}