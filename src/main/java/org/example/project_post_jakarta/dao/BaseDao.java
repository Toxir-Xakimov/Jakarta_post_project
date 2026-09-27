package org.example.project_post_jakarta.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public abstract class BaseDao {


    private final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("post_unit");
    private final EntityManager entityManager = entityManagerFactory.createEntityManager();


    public EntityManager em() {
        return entityManager;
    }

    public void begin() {
        entityManager.getTransaction().begin();
    }

    public void commit() {
        entityManager.getTransaction().commit();
    }

}
