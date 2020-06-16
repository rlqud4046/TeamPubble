package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "DELIVERY_SEQ_GEN",
        sequenceName = "DELIVERY_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class Delivery {

    @Id
    @Column(name = "delivery_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "DELIVERY_SEQ_GEN"
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member deliveryMember;

    private String deliveryName;

    private String addressBase;

    private String addressConf;

    private String zipcode;

    private String phoneNo;

}
