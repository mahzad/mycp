// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package in.mycp.domain;

import in.mycp.domain.Asset;
import in.mycp.domain.GroupDescriptionP;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect GroupDescriptionP_Roo_Finder {
    
    public static TypedQuery<GroupDescriptionP> GroupDescriptionP.findGroupDescriptionPsByAsset(Asset asset) {
        if (asset == null) throw new IllegalArgumentException("The asset argument is required");
        EntityManager em = GroupDescriptionP.entityManager();
        TypedQuery<GroupDescriptionP> q = em.createQuery("SELECT o FROM GroupDescriptionP AS o WHERE o.asset = :asset", GroupDescriptionP.class);
        q.setParameter("asset", asset);
        return q;
    }
    
    public static TypedQuery<GroupDescriptionP> GroupDescriptionP.findGroupDescriptionPsByDescriptonLike(String descripton) {
        if (descripton == null || descripton.length() == 0) throw new IllegalArgumentException("The descripton argument is required");
        descripton = descripton.replace('*', '%');
        if (descripton.charAt(0) != '%') {
            descripton = "%" + descripton;
        }
        if (descripton.charAt(descripton.length() - 1) != '%') {
            descripton = descripton + "%";
        }
        EntityManager em = GroupDescriptionP.entityManager();
        TypedQuery<GroupDescriptionP> q = em.createQuery("SELECT o FROM GroupDescriptionP AS o WHERE LOWER(o.descripton) LIKE LOWER(:descripton)", GroupDescriptionP.class);
        q.setParameter("descripton", descripton);
        return q;
    }
    
    public static TypedQuery<GroupDescriptionP> GroupDescriptionP.findGroupDescriptionPsByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = GroupDescriptionP.entityManager();
        TypedQuery<GroupDescriptionP> q = em.createQuery("SELECT o FROM GroupDescriptionP AS o WHERE o.name = :name", GroupDescriptionP.class);
        q.setParameter("name", name);
        return q;
    }
    
    public static TypedQuery<GroupDescriptionP> GroupDescriptionP.findGroupDescriptionPsByOwnerEquals(String owner) {
        if (owner == null || owner.length() == 0) throw new IllegalArgumentException("The owner argument is required");
        EntityManager em = GroupDescriptionP.entityManager();
        TypedQuery<GroupDescriptionP> q = em.createQuery("SELECT o FROM GroupDescriptionP AS o WHERE o.owner = :owner", GroupDescriptionP.class);
        q.setParameter("owner", owner);
        return q;
    }
    
}
