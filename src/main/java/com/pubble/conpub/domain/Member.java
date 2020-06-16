package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@SequenceGenerator(
        name = "MEMBER_SEQ_GEN",
        sequenceName = "MEMBER_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class Member {

    @Id
    @Column(name = "member_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "MEMBER_SEQ_GEN"
    )
    private Long id;

    private String memberId;

    private String memberPwd;

    private String memberName;

    private String memberBirth;

    private String memberEmail;

    @Enumerated(EnumType.STRING)
    private YesNo emailAgree;

    private String memberPhone;

    @Enumerated(EnumType.STRING)
    private YesNo smsAgree;

    private String memberMemo;

    @OneToMany(mappedBy = "boardMember")
    private List<Board> boards = new ArrayList<Board>();

    @OneToMany(mappedBy = "deliveryMember")
    private List<Delivery> deliveries = new ArrayList<Delivery>();

    @OneToMany(mappedBy = "mileageMember")
    private List<Mileage> mileages = new ArrayList<Mileage>();

    @OneToMany(mappedBy = "reviewMember")
    private List<Review> reviews = new ArrayList<Review>();

    @OneToMany(mappedBy = "selectOptionMember")
    private List<SelectedOption> selectedOptions = new ArrayList<SelectedOption>();




}