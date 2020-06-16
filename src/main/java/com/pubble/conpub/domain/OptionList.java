package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "OPTION_SEQ_GEN",
        sequenceName = "OPTION_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class OptionList {

    @Id
    @Column(name = "option_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "OPTION_SEQ_GEN"
    )
    private Long id;

    // private String optionType;

    // private String optionDetail;

    @Column(nullable = false, precision = 12, scale = 1)
    private BigDecimal optionPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "optionType")
    private OptionList optionType;

    @OneToMany(mappedBy = "optionType")
    private List<OptionList> optionDetail = new ArrayList<OptionList>();












}
