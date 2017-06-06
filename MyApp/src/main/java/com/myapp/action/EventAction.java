package com.myapp.action;

import java.util.ArrayList;
import java.util.List;

import com.myapp.controller.EventsManager;
import com.myapp.model.Event;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class EventAction extends ActionSupport {
	
	private List<Event> data = new ArrayList<Event>();
	private String eventId;
	private Event event = null;

	public String getEventById() {
		if (eventId != null) {
			EventsManager eventsManager = new EventsManager();
			event = eventsManager.getById(Long.parseLong(eventId, 10));
			return Action.SUCCESS;
		} else {
			return Action.ERROR;
		}
		
	}
	
	public String getEvents() {
		EventsManager eventsManager = new EventsManager();
		data = eventsManager.list();
		return Action.SUCCESS;
	}

	public List<Event> getData() {
		return data;
	}
	public void setData(List<Event> lists) {
		this.data = lists;
	}

	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
}