package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Setter
@Getter
@SequenceGenerator(
        name = "BOARD_SEQ_GEN",
        sequenceName = "BOARD_SEQ",
        initialValue = 1, allocationSize = 1
)
public class Board {
    @Id
    @Column(name = "board_no")
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator = "BOARD_SEQ_GEN")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_no")
    private Member boardMember;

    private String boardTitle;

    private int boardSortationNo;

    private String boardCont;

    private LocalDateTime boardDate;

    @Enumerated(EnumType.STRING)
    private YesNo questionResponse;

    @OneToMany(mappedBy = "replyBoard")
    private List<Reply> replies = new ArrayList<Reply>();


}