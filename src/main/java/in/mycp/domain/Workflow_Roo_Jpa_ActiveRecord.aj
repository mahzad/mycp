// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package in.mycp.domain;

import in.mycp.domain.Workflow;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Workflow_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Workflow.entityManager;
    
    public static final EntityManager Workflow.entityManager() {
        EntityManager em = new Workflow().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Workflow.countWorkflows() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Workflow o", Long.class).getSingleResult();
    }
    
    public static List<Workflow> Workflow.findAllWorkflows() {
        return entityManager().createQuery("SELECT o FROM Workflow o", Workflow.class).getResultList();
    }
    
    public static Workflow Workflow.findWorkflow(Integer id) {
        if (id == null) return null;
        return entityManager().find(Workflow.class, id);
    }
    
    public static List<Workflow> Workflow.findWorkflowEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Workflow o", Workflow.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Workflow.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Workflow.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Workflow attached = Workflow.findWorkflow(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Workflow.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Workflow.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Workflow Workflow.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Workflow merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
