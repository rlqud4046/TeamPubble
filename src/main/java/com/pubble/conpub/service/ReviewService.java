package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.Review;
import com.pubble.conpub.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    /*특정 상품에 해당하는 모든 리뷰 가져오기.*/
    @Transactional
    public List<Review> FindReviewList(Long page_no){
        return reviewRepository.findItemReview(page_no);
    }


}
