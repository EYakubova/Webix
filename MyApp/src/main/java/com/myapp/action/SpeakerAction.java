package com.myapp.action;

import java.util.ArrayList;
import java.util.List;

import com.myapp.controller.SpeakersManager;
import com.myapp.model.Speaker;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class SpeakerAction extends ActionSupport {

	private List<Speaker> data = new ArrayList<Speaker>();
	private String eventId;

	public String getSpeakers() {
		SpeakersManager speakersManager = new SpeakersManager();
		if (eventId != null) {
			data = speakersManager.list(Long.parseLong(eventId, 10));
		} else {
			data = speakersManager.list();
		}
		return Action.SUCCESS;
	}
	
	public String getLastSpeakers() {
		SpeakersManager speakersManager = new SpeakersManager();
		data = speakersManager.lastList();
		return Action.SUCCESS;
	}

	public List<Speaker> getData() {
		return data;
	}
	public void setData(List<Speaker> lists) {
		this.data = lists;
	}

	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
}