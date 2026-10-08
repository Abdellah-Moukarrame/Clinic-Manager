package com.example.clinic_manager.repossitory.impl;

import com.example.clinic_manager.model.Department;
import com.example.clinic_manager.model.Doctor;
import com.example.clinic_manager.repossitory.GenericRepository;
import com.example.clinic_manager.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DepartmentRepositoryImpl implements GenericRepository<Department> {
    @Override
    public void save(Department department) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.persist(department);
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
    public Optional<Department> findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            Department department = em.find(Department.class,id);
            em.getTransaction().commit();

            return Optional.ofNullable(department);
        } catch (Exception e) {
            throw (e);
        }
        finally {
            em.close();
        }
    }

    @Override
    public List<Department> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            return em.createQuery("SELECT d FROM Department d ").getResultList();

        }
        finally {
            em.close();
        }
    }

    @Override
    public void update(Department department) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            em.getTransaction().begin();
            em.merge(department);
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
            Department department = em.find(Department.class,id);

            if (department != null) {
                em.remove(department);
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
