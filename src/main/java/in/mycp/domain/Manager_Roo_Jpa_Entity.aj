// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package in.mycp.domain;

import in.mycp.domain.Manager;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Manager_Roo_Jpa_Entity {
    
    declare @type: Manager: @Entity;
    
    declare @type: Manager: @Table(name = "manager");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Manager.id;
    
    public Integer Manager.getId() {
        return this.id;
    }
    
    public void Manager.setId(Integer id) {
        this.id = id;
    }
    
}
