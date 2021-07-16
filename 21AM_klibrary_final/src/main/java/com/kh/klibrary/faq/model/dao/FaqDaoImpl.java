package com.kh.klibrary.faq.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.faq.model.vo.Faq;
@Repository
public class FaqDaoImpl implements FaqDao {
	@Inject
	SqlSession sqlSession;

	
	  @Override public List<Map> selectFaqList(SqlSessionTemplate sqlsession) { 
		  //TODO Auto-generated method stub 
		  // returnsqlsession.selectList("faq.selectFaqList"); 
		  
		  return sqlsession.selectList("faq.selectFaqList"); }
	
	  /*
	 * @Override public List<Faq> listAll(String searchOption, String keyword)
	 * throws Exception { // 검색옵션, 키워드 맵에 저장 Map<String, String> map= new
	 * HashMap<String, String>(); map.put("searchOption",searchOption);
	 * map.put("keyword", keyword); return sqlSession.selectList("faq.listAll",map);
	 * }
	 * 
	 * //게시글 갯수
	 * 
	 * @Override public int countArticle(String searchOption, String keyword) throws
	 * Exception { Map<String, String> map= new HashMap<String, String>();
	 * map.put("searchOption", searchOption); map.put("keyword", keyword); return
	 * sqlSession.selectOne("faq.countArticle",map); }
	 */
	
}
