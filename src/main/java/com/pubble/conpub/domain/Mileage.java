package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "MILEAGE_SEQ_GEN",
        sequenceName = "MILEAGE_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class Mileage {

    @Id
    @Column(name = "mileage_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "MILEAGE_SEQ_GEN"
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member mileageMember;

    private BigDecimal mileage;

    private String mileagePath;

    private LocalDateTime mileageDate;



}

