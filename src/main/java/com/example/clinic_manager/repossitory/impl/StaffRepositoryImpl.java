package com.example.clinic_manager.repossitory.impl;

import com.example.clinic_manager.model.Staff;
import com.example.clinic_manager.repossitory.GenericRepository;
import com.example.clinic_manager.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class StaffRepositoryImpl implements GenericRepository<Staff> {

    @Override
    public void save(Staff staff) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.persist(staff);
            em.getTransaction().commit();

        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw ( e );
        }
        finally {
            em.close();
        }
    }

    @Override
    public Optional<Staff> findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            Staff staff = em.find(Staff.class,id);
            em.getTransaction().commit();

            return Optional.ofNullable(staff);
        } catch (Exception e) {
            throw (e);
        }
        finally {
            em.close();
        }

    }

    @Override
    public List<Staff> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            return em.createQuery("SELECT s FROM Staff s ").getResultList();

        }
        finally {
            em.close();
        }
    }

    @Override
    public void update(Staff staff) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.merge(staff);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()){
                em.getTransaction().rollback();
            }
            throw (e);
        }
        finally {
            em.close();
        }
    }

    @Override
    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            Staff staff = em.find(Staff.class,id);

            if (staff != null) {
                em.remove(staff);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()){
                em.getTransaction().rollback();
            }
            throw (e);
        }
        finally {
            em.close();
        }
    }
}