package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
@SequenceGenerator(
        name = "SMS_SEQ_GEN",
        sequenceName = "SMS_SEQ",
        initialValue = 1, allocationSize = 1
)
public class SMS {

    @Id
    @Column(name = "sms_no")
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator = "SMS_SEQ_GEN")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member smsMember;


    private String smsCont;


}
