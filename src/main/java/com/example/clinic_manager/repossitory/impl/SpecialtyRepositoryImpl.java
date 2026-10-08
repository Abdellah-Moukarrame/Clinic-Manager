package com.example.clinic_manager.repossitory.impl;

import com.example.clinic_manager.model.Doctor;
import com.example.clinic_manager.model.Specialty;
import com.example.clinic_manager.repossitory.GenericRepository;
import com.example.clinic_manager.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class SpecialtyRepositoryImpl implements GenericRepository<Specialty> {

    @Override
    public void save(Specialty specialty) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.persist(specialty);
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
    public Optional<Specialty> findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            Specialty specialty = em.find(Specialty.class,id);
            em.getTransaction().commit();

            return Optional.ofNullable(specialty);
        } catch (Exception e) {
            throw (e);
        }
        finally {
            em.close();
        }
    }

    @Override
    public List<Specialty> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            return em.createQuery("SELECT s FROM Specialty s ").getResultList();

        }
        finally {
            em.close();
        }
    }

    @Override
    public void update(Specialty specialty) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.merge(specialty);
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
            Specialty specialty = em.find(Specialty.class,id);

            if (specialty != null) {
                em.remove(specialty);
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
