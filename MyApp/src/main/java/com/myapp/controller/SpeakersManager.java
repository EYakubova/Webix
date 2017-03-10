package com.myapp.controller;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.myapp.model.Speaker;
import com.myapp.util.HibernateUtil;
 
public class SpeakersManager extends HibernateUtil {

    public List<Speaker> list() {
    	return list(null);
    }

    public List<Speaker> list(Long eventId) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Speaker> speakers = null;
        try {
        	Query query = session.createQuery("from Speaker" + (eventId != null ? " where event_id=:event_id" : ""));
        	if (eventId != null) {
        		query.setParameter("event_id", eventId);
        	}
        	speakers = (List<Speaker>) query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.getTransaction().commit();
        return speakers;
    }
    
    public List<Speaker> lastList() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<Speaker> speakers = null;
        try {
        	Query query = session.createQuery("from Speaker S ORDER BY S.id DESC");
        	query.setMaxResults(3);
        	speakers = (List<Speaker>) query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.getTransaction().commit();
        return speakers;
    }
    
    public Speaker update(Speaker speaker) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	session.update(speaker);
    	session.getTransaction().commit();
    	return speaker;
    }
    
    public Speaker delete(Speaker speaker) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	session.delete(speaker);
    	session.getTransaction().commit();
    	return speaker;
    }
    
    public Speaker insert(Speaker speaker) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    	session.beginTransaction();
    	session.save(speaker);
    	session.getTransaction().commit();
    	return speaker;
    }
}