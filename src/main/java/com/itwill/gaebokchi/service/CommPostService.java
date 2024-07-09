//package com.itwill.gaebokchi.service;
//
//@Service
//public class CommPostService {
//    private final CommPostDao commPostDao;
//
//    @Autowired
//    public CommPostService(CommPostDao commPostDao) {
//        this.commPostDao = commPostDao;
//    }
//
//    public List<CommPostListDto> getTop5ByLikes() {
//        log.debug("getTop5ByLikes()");
//        List<CommPost> list = commPostDao.selectTop5ByLikes();
//        return list.stream().map(CommPostListDto::fromEntity).toList();
//    }
//}
