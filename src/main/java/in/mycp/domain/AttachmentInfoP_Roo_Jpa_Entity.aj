// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package in.mycp.domain;

import in.mycp.domain.AttachmentInfoP;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect AttachmentInfoP_Roo_Jpa_Entity {
    
    declare @type: AttachmentInfoP: @Entity;
    
    declare @type: AttachmentInfoP: @Table(name = "attachment_info_p");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer AttachmentInfoP.id;
    
    public Integer AttachmentInfoP.getId() {
        return this.id;
    }
    
    public void AttachmentInfoP.setId(Integer id) {
        this.id = id;
    }
    
}
