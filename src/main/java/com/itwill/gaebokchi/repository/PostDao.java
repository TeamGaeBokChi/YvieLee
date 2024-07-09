package com.itwill.gaebokchi.repository;

import java.util.List;

import com.itwill.gaebokchi.dto.PostSearchDto;

public interface PostDao {

    // post-mapper.xml에서 id="selectOrderByIdDesc"인 SQL을 실행하는 메서드.
    List<Post> selectOrderByIdDesc();
    Post selectById(Integer id);
    int insertPost(Post post);
    int updatePost(Post post);
    int deletePost(Integer id);
    List<Post> search(PostSearchDto dto);
    
}