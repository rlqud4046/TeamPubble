package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "REVIEW_SEQ_GEN",
        sequenceName = "REVIEW_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class Review {

    @Id
    @Column(name = "review_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "REVIEW_SEQ_GEN"
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member reviewMember;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_no")
    private Item reviewItem;

    private String reviewPhoto;

    private LocalDateTime reviewDate;

    private int reviewStarpoint;

    private String reviewCont;

    @Enumerated(EnumType.STRING)
    private YesNo mileageOk;

}