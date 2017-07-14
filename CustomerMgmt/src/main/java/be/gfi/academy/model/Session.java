package be.gfi.academy.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "customer_sessions")
public class Session {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;
    @Column(name = "session_date")
    private Date sessionDate;
    @Column(name = "descr")
    private String evaluation;
    @Column
    private String complaints;
    @Column
    private boolean bh;
    @Column
    private double price;
    @Column(name = "created_at")
    private Date createdAt;
    @Column(name = "updated_at")
    private Date updatedAt;
    @Column(name = "cust_id")
    private long customerId;
}
