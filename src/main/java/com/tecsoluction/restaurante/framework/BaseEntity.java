package com.tecsoluction.restaurante.framework;

@Getter
@Setter
@MappedSuperclass
public class BaseEntity {
    
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Type(type = "pg-uuid")
    @Column(name = "id", length = 36)
    private UUID id;
    
    @Column(name = "isativo")
    private boolean isativo;

    public boolean isNew() {
        return (this.id == null);
    }

}
