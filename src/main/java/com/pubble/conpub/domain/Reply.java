package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Setter
@Getter
@SequenceGenerator(
        name = "REPLY_SEQ_GEN",
        sequenceName = "REPLY_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class Reply {
    @Id
    @Column(name = "reply_no")
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "REPLY_SEQ_GEN"
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "board_no")
    private Board replyBoard;

    private String replyCont;

    private LocalDateTime replyTime;


}