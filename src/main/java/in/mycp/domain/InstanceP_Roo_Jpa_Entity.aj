// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package in.mycp.domain;

import in.mycp.domain.InstanceP;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect InstanceP_Roo_Jpa_Entity {
    
    declare @type: InstanceP: @Entity;
    
    declare @type: InstanceP: @Table(name = "instance_p");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer InstanceP.id;
    
    public Integer InstanceP.getId() {
        return this.id;
    }
    
    public void InstanceP.setId(Integer id) {
        this.id = id;
    }
    
}
