package kh.pingpong.controller;

import java.sql.Timestamp;
import java.util.HashMap;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import kh.pingpong.dto.ChatRoomDTO;
import kh.pingpong.dto.CommentDTO;
import kh.pingpong.dto.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
})
public class TestClient {
	private static final Logger logger = LoggerFactory.getLogger(TestClient.class);
	
	@Autowired
	private WebApplicationContext wac; // 웹 환경 구성 역할의 인스턴스
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		//text code보다 먼저 실행됨
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}
	
//	@Test
//	public void testMessageInsert() {
//		try {
//			MemberDTO mdto = new MemberDTO();
//			mdto.setId("cccc");
//			mdto.setName("영그램");
//			HashMap<String, Object> sessionattr = new HashMap<String, Object>();
//			sessionattr.put("loginInfo", mdto);	
//			mockMvc.perform(MockMvcRequestBuilders.post("/discussion/write").
//					sessionAttrs(sessionattr).
//					param("writer","jack").
//					param("title","제목 제목").
//					param("contents","내용내용").
//					param("caution","주의주의").
//					param("language","한국어").
//					param("write_date","2020/07/16").
//					param("view_count","0").
//					param("like_count","0").
//					param("comment_count","0").
//					param("id","cccc").
//					param("thumNail","test.jgp")
//					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
//			logger.info("글쓰기 성공");
//		} catch (Exception e) {
//			// TODO: handle exception
//			logger.info(e.getMessage());
//		}
//	}
	
//	@Test
//	public void testMessageDelete() {
//		try {
//			MemberDTO mdto = new MemberDTO();
//			mdto.setId("cccc");
//			mdto.setName("영그램");
//			HashMap<String, Object> sessionattr = new HashMap<String, Object>();
//			sessionattr.put("loginInfo", mdto);	
//			mockMvc.perform(MockMvcRequestBuilders.post("/discussion/delete").
//					sessionAttrs(sessionattr).
//					param("seq","1")
//					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
//			logger.info("삭제 성공");
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			// TODO: handle exception
//		}
//	}	
	
//	@Test
//	public void testMessageModify() {
//		try {
//			MemberDTO mdto = new MemberDTO();
//			mdto.setId("cccc");
//			mdto.setName("영그램");
//			HashMap<String, Object> sessionattr = new HashMap<String, Object>();
//			sessionattr.put("loginInfo", mdto);	
//			mockMvc.perform(MockMvcRequestBuilders.post("/discussion/modifyProc").
//					sessionAttrs(sessionattr).
//					param("title","제목 제목").
//					param("contents","내용내용").
//					param("caution","주의주의").
//					param("language","한국어").
//					param("seq","1")
//					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
//			logger.info("수정 성공");
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			// TODO: handle exception
//		}
//	}	
	
	
//	@Test
//	public void testMessageSelect() {
//		
//		try {
//			MemberDTO mdto = new MemberDTO();
//			mdto.setId("cccc");
//			mdto.setName("영그램");
//			HashMap<String, Object> sessionattr = new HashMap<String, Object>();
//			sessionattr.put("loginInfo", mdto);
//			mockMvc.perform(MockMvcRequestBuilders.post("/discussion/list").
//					sessionAttrs(sessionattr)
//					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
//			logger.info("리스트 출력 성공");
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			// TODO: handle exception
//		}
//	}	
	
//	@Test
//	public void testClassDateSch() {
//		try {
//			mockMvc.perform(MockMvcRequestBuilders.post("/classDateSch").
//					param("day", "2020-07-16")
//					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
//			System.out.println("그룹모입 출력 성공");
//			System.out.println("강의 목록 출력 성공");
//		} catch (Exception e) {
//			System.out.println("그룹모입 출력 성공");
//			System.out.println("강의 목록 출력 성공");
//			// TODO: handle exception
//		}
//	}	
	
	
//	@Test
//	public void testMapSch() {
//		try {
//			mockMvc.perform(MockMvcRequestBuilders.post("/member/personList").
//					param("type", "tutor")
//					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
//			logger.info("튜터 리스트 출력 성공");
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			// TODO: handle exception
//		}
//	}	
	

	@Test
	public void testMapSch() {
		try {
			MemberDTO mdto = new MemberDTO();
			mdto.setId("cccc");
			mdto.setName("영그램");
			HashMap<String, Object> sessionattr = new HashMap<String, Object>();
			sessionattr.put("loginInfo", mdto);			
			mockMvc.perform(MockMvcRequestBuilders.post("/discussion/commentHate").
					sessionAttrs(sessionattr).
					param("id", "cccc").
					param("parent_seq", "8").
					param("category", "토론 댓글")
					).andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk());
			logger.info("댓글 싫어요 성공");
		} catch (Exception e) {
			logger.error(e.getMessage());
			// TODO: handle exception
		}
	}	
	
	
}
