package com.pubble.conpub.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Getter
@Setter
public class SiteImage {
    @Id
    @Column(name = "position_no")
    private int id;

    private String imageSrc;

    private String link1;

    private String link2;

}