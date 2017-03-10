package com.myapp.controller;
  
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.myapp.model.Event;
import com.myapp.util.HibernateUtil;
 
public class EventsManager extends HibernateUtil {
 
    public List<Event> list() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Event> events = null;
        try {
        	events = (List<Event>)session.createQuery("from Event").list();
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.getTransaction().commit();
        return events;
    }
    
    public Event getById(Long eventId) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	Event event = (Event) session.get(Event.class, eventId);
    	session.getTransaction().commit();
    	return event;
    }
    
    public Event update(Event event) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	session.update(event);
    	session.getTransaction().commit();
    	return event;
    }
    
    public Event delete(Event event) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	session.delete(event);
    	session.getTransaction().commit();
    	return event;
    }
    
    public Event insert(Event event) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	session.save(event);
    	session.getTransaction().commit();
    	return event;
    }
}