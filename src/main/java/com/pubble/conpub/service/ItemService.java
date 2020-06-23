package com.pubble.conpub.service;

import com.pubble.conpub.domain.Item;
import com.pubble.conpub.domain.Member;
import com.pubble.conpub.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ItemService {

    @Autowired
    private ItemRepository itemRepository;

    // 전체 아이템 조회 메서드
    public List<Item> findItems() {
        return itemRepository.findAll();
    }

    // 특정 아이템 조회
    public Item findOne(Long id){
        return itemRepository.findOne(id);
    }
}
