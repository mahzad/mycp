package in.mycp.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooJpaActiveRecord(versionField = "", table = "key_pair_info_p", finders = { "findKeyPairInfoPsByKeyNameEquals", "findKeyPairInfoPsByAsset" })
public class KeyPairInfoP {

    @Transient
    public String product;

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public static List<in.mycp.domain.KeyPairInfoP> findAllKeyPairInfoPs() {
        return entityManager().createQuery("SELECT o FROM KeyPairInfoP o", KeyPairInfoP.class).getResultList();
    }

    public static List<in.mycp.domain.KeyPairInfoP> findAllKeyPairInfoPs(int start, int max, String search) {
        EntityManager em = entityManager();
        TypedQuery<KeyPairInfoP> q = null;
        if (StringUtils.isBlank(search)) {
            q = em.createQuery("SELECT o FROM KeyPairInfoP o", KeyPairInfoP.class);
        } else {
            q = em.createQuery("SELECT o FROM KeyPairInfoP o " + " where " + "o.keyName like :search ", KeyPairInfoP.class);
            if (StringUtils.contains(search, " ")) {
                search = StringUtils.replaceChars(search, " ", "%");
            }
            q.setParameter("search", "%" + search + "%");
        }
        q.setFirstResult(start);
        q.setMaxResults(max);
        return q.getResultList();
    }

    public static TypedQuery<in.mycp.domain.KeyPairInfoP> findKeyPairInfoPsByUser(User user, int start, int max, String search) {
        if (user == null) throw new IllegalArgumentException("The user argument is required");
        EntityManager em = entityManager();
        TypedQuery<KeyPairInfoP> q = null;
        if (StringUtils.isBlank(search)) {
            q = em.createQuery("SELECT o FROM KeyPairInfoP AS o WHERE o.asset.user = :user", KeyPairInfoP.class);
        } else {
            q = em.createQuery("SELECT o FROM KeyPairInfoP AS o WHERE o.asset.user = :user " + " and " + "o.keyName like :search ", KeyPairInfoP.class);
            if (StringUtils.contains(search, " ")) {
                search = StringUtils.replaceChars(search, " ", "%");
            }
            q.setParameter("search", "%" + search + "%");
        }
        q.setFirstResult(start);
        q.setMaxResults(max);
        q.setParameter("user", user);
        return q;
    }

    public static TypedQuery<in.mycp.domain.KeyPairInfoP> findKeyPairInfoPsByCompany(Company company, int start, int max, String search) {
        if (company == null) throw new IllegalArgumentException("The company argument is required");
        EntityManager em = entityManager();
        TypedQuery<KeyPairInfoP> q = null;
        if (StringUtils.isBlank(search)) {
            q = em.createQuery("SELECT o FROM KeyPairInfoP AS o WHERE o.asset.user.project.department.company = :company", KeyPairInfoP.class);
        } else {
            q = em.createQuery("SELECT o FROM KeyPairInfoP AS o WHERE o.asset.user.project.department.company = :company " + " and " + " o.keyName like :search ", KeyPairInfoP.class);
            if (StringUtils.contains(search, " ")) {
                search = StringUtils.replaceChars(search, " ", "%");
            }
            q.setParameter("search", "%" + search + "%");
        }
        q.setFirstResult(start);
        q.setMaxResults(max);
        q.setParameter("company", company);
        return q;
    }

    public static Number findKeyPairInfoCountByCompany(Company company, String status) {
        String queryStr = "SELECT COUNT(i.id) FROM KeyPairInfoP i where i.status = :status ";
        if (company != null) {
            queryStr = queryStr + "  and i.asset.user.project.department.company = :company";
        }
        Query q = entityManager().createQuery(queryStr);
        q.setParameter("status", status);
        if (company != null) {
            q.setParameter("company", company);
        }
        return (Number) q.getSingleResult();
    }

    public static TypedQuery<in.mycp.domain.KeyPairInfoP> findKeyPairInfoPsByKeyNameEqualsAndCompanyEquals(String keyName, Company company) {
        if (keyName == null || keyName.length() == 0) throw new IllegalArgumentException("The keyName argument is required");
        EntityManager em = entityManager();
        TypedQuery<KeyPairInfoP> q = em.createQuery("SELECT o FROM KeyPairInfoP AS o WHERE o.keyName = :keyName " + " and o.asset.user.project.department.company = :company", KeyPairInfoP.class);
        q.setParameter("keyName", keyName);
        q.setParameter("company", company);
        return q;
    }

    public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
