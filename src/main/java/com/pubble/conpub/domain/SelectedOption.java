package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "SELECTED_OPTION_SEQ_GEN",
        sequenceName = "SELECTED_OPTION_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class SelectedOption {

    @Id
    @Column(name = "selected_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "SELECTED_OPTION_SEQ_GEN"
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member selectOptionMember;

    @Enumerated(EnumType.STRING)
    private SelectedStatus selectedStatus;

    private String size;

    private String paper;

    private int page;

    private String binding;

    private String bindingDirection;

    private String coverColor;

    private String coverSide;

    private String coverType;

    private String coverCoating;

    private String textColor;

    private String textBothSides;

    private String annalsCoverColor;

    private String hardGold;

    private String signaturePage;

    private int amount;

    @Column(nullable = false, precision = 12, scale = 1)
    private BigDecimal total_price;

    private String ALIAS;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "selectedOptionList")
    private Order selectOptionOrder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_no")
    private Item item;


}
