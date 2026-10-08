package com.example.clinic_manager.repossitory.impl;

import com.example.clinic_manager.model.Doctor;

import com.example.clinic_manager.model.Staff;
import com.example.clinic_manager.repossitory.GenericRepository;
import com.example.clinic_manager.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DoctorRepositoryImpl implements GenericRepository<Doctor> {


    @Override
    public void save(Doctor doctor) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.persist(doctor);
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
    public Optional<Doctor> findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            Doctor doctor = em.find(Doctor.class,id);
            em.getTransaction().commit();

            return Optional.ofNullable(doctor);
        } catch (Exception e) {
            throw (e);
        }
        finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            return em.createQuery("SELECT s FROM Doctor s ").getResultList();

        }
        finally {
            em.close();
        }
    }

    @Override
    public void update(Doctor doctor) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.merge(doctor);
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
            Doctor doctor = em.find(Doctor.class,id);

            if (doctor != null) {
                em.remove(doctor);
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
