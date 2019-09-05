package com.fdmgroup.springmvcproject.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import com.fdmgroup.springmvcproject.domain.User;

public class UserDao {
	
	private EntityManagerFactory emf;

	@Autowired
	public UserDao(EntityManagerFactory emf) {
		super();
		this.emf = emf;
	}
	
	public boolean register(User user) {
		boolean created = false;
		EntityManager em = null;
		try {
		em= emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		created = true;
		} finally {
			if(em != null && em.isOpen()) {
				em.close();
			}
		}
		
		return created;
	}
	
	public User read(String username) {
		EntityManager em = null;
		User user = null;
		try {
			em = emf.createEntityManager();
			user= em.find(User.class, username);
			
		} finally {
			if(em != null && em.isOpen()) {
			em.close();
		}
	}
		
		return user;
	}
}
