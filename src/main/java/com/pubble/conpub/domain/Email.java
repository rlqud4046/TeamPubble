package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Setter
@Getter
@SequenceGenerator(
        name = "EMAIL_SEQ_GEN",
        sequenceName = "EMAIL_SEQ",
        initialValue = 1, allocationSize = 1
)
public class Email {

    @Id
    @Column(name = "email_no")
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator = "EMAIL_SEQ_GEN")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member emailMember;

    private String emailTitle;

    private String emailCont;

    private LocalDateTime sendDate;


}
