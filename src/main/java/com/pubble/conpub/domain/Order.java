package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "ORDER_SEQ_GEN",
        sequenceName = "ORDER_SEQ",
        initialValue = 1,
        allocationSize = 1
)
@Table(name = "orders")
public class Order {

    @Id
    @Column(name = "order_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "ORDER_SEQ_GEN"
    )
    private Long id;

    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    private LocalDateTime orderDate;

    @OneToMany(mappedBy = "selectOptionOrder")
    private List<SelectedOption> selectedOptionList = new ArrayList<SelectedOption>();
}