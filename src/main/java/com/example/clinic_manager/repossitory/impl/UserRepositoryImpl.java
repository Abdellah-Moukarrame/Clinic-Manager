package com.example.clinic_manager.repossitory.impl;

import com.example.clinic_manager.model.User;
import com.example.clinic_manager.repossitory.UserRepository;
import com.example.clinic_manager.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.Optional;

public class UserRepositoryImpl implements UserRepository {

    @Override
    public void save(User user) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<User> findByEmail(String email) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                    "select u from User u where u.email = :email",
                    User.class
            ).setParameter("email", email).getResultStream().findFirst();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean emailExist(String email) {
        return findByEmail(email).isPresent();
    }
}