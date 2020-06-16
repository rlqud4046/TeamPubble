package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "FAQ_SEQ_GEN",
        sequenceName = "FAQ_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class Faq {

    @Id
    @Column(name = "faq_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "FAQ_SEQ_GEN"
    )
    private Long id;

    private String faqQuestion;

    private String faqAnswer;

}