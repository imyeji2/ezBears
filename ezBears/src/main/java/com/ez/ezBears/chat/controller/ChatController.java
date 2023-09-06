//package com.ez.ezBears.chat.controller;
//
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//
//import com.ez.ezBears.chat.model.ChatContentVO;
//import com.ez.ezBears.chat.model.ChatMemberVO;
//import com.ez.ezBears.chat.model.ChatRoomVO;
//import com.ez.ezBears.chat.model.ChatService;
//import com.ez.ezBears.common.FileUploadUtil;
//import com.ez.ezBears.controller.indexController;
//import com.ez.ezBears.dept.model.DeptService;
//import com.ez.ezBears.member.model.MemberService;
//import com.ez.ezBears.member.model.MemberVO;
//import com.ez.ezBears.team.model.TeamService;
//
//import org.apache.ibatis.javassist.compiler.ast.Member;
//import org.apache.ibatis.session.SqlSession;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequestMapping("/chat")
//@RequiredArgsConstructor
//public class ChatController {
//	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
//	
//	private final ChatService cService;
//	private final MemberService memberService;
//	
//	@RequestMapping(value = "/chatListView")
//	public String chatListView(Model model, HttpSession session) {
//		model.addAttribute("myCondition", "chat");
//		 Map<String, Object> map= (Map<String, Object>) session.getAttribute("memVo"); 
//		logger.info("map = {}", map);
//		List<ChatRoomVO> rList = cService.printAllChatRoom(Integer.parseInt(String.valueOf(map.get("MEM_NO"))));
//		logger.info("rList = {}", rList);
//		if(!rList.isEmpty()) {
//			for(int i = 0; i < rList.size(); i++) {
//				ChatContentVO chatContent = cService.printChatContent(rList.get(i).getChatRoomNo());
//				rList.get(i).setChatContent(chatContent.getChatContent());
//				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd a h:mm");
//				rList.get(i).setChatDate(sf.format(chatContent.getChatDate()));
//			}
//		}
//		return "/chat/chatRoom";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/chat/registerChatRoom", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String registerChatRoom(HttpServletRequest request
//			, @RequestParam("chatMember") String[] chatMember
//			, @RequestParam("chatRoomTitle") String chatRoomTitle, SqlSession sqlsession) {
//		HttpSession session = request.getSession();
//		MemberVO memberVo = (MemberVO) session.getAttribute("loginUser");
//		int result = 0;
//		ChatRoomVO chatRoom = new ChatRoomVO();
//		if(chatMember.length == 1) {
//			chatRoom.setChatRoomType(0);
//		}else {
//			chatRoom.setChatRoomType(1);
//		}
//		chatRoom.setChatRoomTitle(chatRoomTitle);
//		result = cService.registerChatRoom(chatRoom);
//		if(result > 0) {
//			int mResult = cService.registerChatMember(sqlsession, memberVo.getMemName());
//			for(int i = 0; i < chatMember.length; i++) {
//				mResult = cService.registerChatMember(sqlsession, chatMember[i]);
//			}
//			if(mResult > 0) {
//				chatRoom.setChatRoomNo(0);
//				List<ChatMemberVO> mList = cService.printAllMember(chatRoom);
//				String[] chatMemberArr = new String[mList.size()];
//				if(!mList.isEmpty()) {
//					for(int j = 0; j < mList.size(); j++) {
//						chatMemberArr[j] = mList.get(j).getDeptName() + " " + mList.get(j).getMemName() + " " + mList.get(j).getPositionName();
//					}
//				}
//				ChatContentVO chatContent = new ChatContentVO();
//				chatContent.setChatType(1);
//				chatContent.setChatRoomNo(0);
//				Date nowTime = new Date();
//				SimpleDateFormat sf = new SimpleDateFormat("yyyy년 M월 d일 E요일");
//				chatContent.setChatContent("- " + sf.format(nowTime) + " -");
//				cService.registerChatContent(chatContent);
//				int n = chatMemberArr.length - 1;
//				String[] inviteMemberArr = new String[n];
//				System.arraycopy(chatMemberArr, 1, inviteMemberArr, 0, n);
//				String inviteMember = "";
//				for(int k = 0; k < inviteMemberArr.length; k++) {
//					if(k < inviteMemberArr.length - 1) {
//						inviteMember += "<strong>" + inviteMemberArr[k] + "</strong>님, ";
//					}else if(k == inviteMemberArr.length - 1) {
//						inviteMember += "<strong>" + inviteMemberArr[k] + "</strong>님을 초대했습니다.";
//					}
//				}
//				chatContent.setChatContent("<strong>" + chatMemberArr[0] + "</strong>님이 " + inviteMember);
//				cService.registerChatContent(chatContent);
//				int chatRoomNo = cService.printChatRoomNo();
//				return new Gson().toJson(chatRoomNo);
//			}
//		}
//		return null;
//	}
//
//	@RequestMapping(value = "/chat/detail")
//	public ModelAndView chatView(ModelAndView mv, @RequestParam("chatRoomNo") int chatRoomNo) {
//		mv.addObject("chatRoomNo", chatRoomNo);
//		mv.setViewName("chat/chatDetail");
//		return mv;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/chat/out", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatOut(@RequestParam("chatRoomNo") int chatRoomNo, @RequestParam("memNo") String memName) {
//		ChatMemberVO chatMember = new ChatMemberVO();
//		chatMember.setChatRoomNo(chatRoomNo);
//		chatMember.setMemName(memName);
//		chatMember.setMemStatus(1);
//		int result = cService.modifyStatusChatMember(chatMember);
//		if(result > 0) {
//			ChatContentVO chatContent = new ChatContentVO();
//			chatMember = cService.printChatMember(chatMember);
//			chatContent.setChatRoomNo(chatRoomNo);
//			chatContent.setChatType(1);
//			Date nowTime = new Date();
//			SimpleDateFormat sf = new SimpleDateFormat("yyyy년 M월 d일 E요일");
//			chatContent.setChatContent("- " + sf.format(nowTime) + " -");
//			int fineCount = cService.fineContentDate(chatContent);
//			if(fineCount == 0) {
//				cService.registerChatContent(chatContent);
//			}
//			chatContent.setChatContent("<strong>" + chatMember.getDeptName() + " " + chatMember.getMemName() + " " + chatMember.getPositionName() + "</strong>님이 나갔습니다.");
//			cService.registerChatContent(chatContent);
//			int chatMemberCount = cService.printChatMemberCount(chatRoomNo);
//			if(chatMemberCount <= 2 && chatMemberCount > 0) {
//				ChatRoomVO chatRoom = new ChatRoomVO();
//				chatRoom.setChatRoomNo(chatRoomNo);
//				chatRoom.setChatRoomType(0);
//				cService.modifyStatusChatRoom(chatRoom);
//			}else if(chatMemberCount == 0) {
//				cService.removeChatRoom(chatRoomNo);
//			}
//			return new Gson().toJson(result);
//		}
//		return null;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/chat/titleChange", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatTitleModify(@ModelAttribute ChatRoomVO chatRoom) {
//		int result = cService.modifyChatTitle(chatRoom);
//		if(result > 0) {
//			return new Gson().toJson(result);
//		}
//		return null;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/chat/registerChatMember", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatInviteAdd(HttpServletRequest request
//			, @RequestParam("chatRoomNo") int chatRoomNo
//			, @RequestParam("chatMember") String[] chatMember) {
//		ChatMemberVO member = new ChatMemberVO();
//		member.setChatRoomNo(chatRoomNo);
//		int result = 0;
//		String[] chatMemberArr = new String[chatMember.length];
//		for(int i = 0; i < chatMember.length; i++) {
//			member.setMemName(chatMember[i]);
//			ChatMemberVO inviteMember = cService.printChatMember(member);
//			if(inviteMember == null) {
//				result = cService.inviteChatMember(member);
//				member = cService.printChatMember(member);
//			}else {
//				member = inviteMember;
//				member.setMemStatus(0);
//				result = cService.modifyStatusChatMember(member);
//			}
//			chatMemberArr[i] = member.getDeptName() + " " + member.getMemName() + " " + member.getPositionName();
//		}
//		if(result > 0) {
//			ChatRoomVO chatRoom = new ChatRoomVO();
//			chatRoom.setChatRoomNo(chatRoomNo);
//			chatRoom.setChatRoomType(1);
//			int chatMemberCount = cService.printChatMemberCount(chatRoomNo);
//			if(chatMemberCount > 2) {
//				cService.modifyStatusChatRoom(chatRoom);
//			}else {
//				chatRoom.setChatRoomType(0);
//				cService.modifyStatusChatRoom(chatRoom);
//			}
//			ChatContentVO chatContent = new ChatContentVO();
//			chatContent.setChatType(1);
//			chatContent.setChatRoomNo(chatRoomNo);
//			Date nowTime = new Date();
//			SimpleDateFormat sf = new SimpleDateFormat("yyyy년 M월 d일 E요일");
//			chatContent.setChatContent("- " + sf.format(nowTime) + " -");
//			int fineCount = cService.fineContentDate(chatContent);
//			if(fineCount == 0) {
//				cService.registerChatContent(chatContent);
//			}
//			String inviteMember = "";
//			for(int k = 0; k < chatMemberArr.length; k++) {
//				if(k < chatMemberArr.length - 1) {
//					inviteMember += "<strong>" + chatMemberArr[k] + "</strong>님, ";
//				}else if(k == chatMemberArr.length - 1) {
//					inviteMember += "<strong>" + chatMemberArr[k] + "</strong>님을 초대했습니다.";
//				}
//			}
//			HttpSession session = request.getSession();
//			MemberVO sessionMember = (MemberVO) session.getAttribute("loginUser");
//			ChatMemberVO loginMember = new ChatMemberVO();
//			loginMember.setChatRoomNo(chatRoomNo);
//			loginMember.setMemNo(sessionMember.getMemNo());
//			loginMember = cService.printChatMember(loginMember);
//			String inviter = loginMember.getDeptName() + " " + loginMember.getMemName() + " " + loginMember.getPositionName();
//			chatContent.setChatContent("<strong>" + inviter + "</strong>님이 " + inviteMember);
//			cService.registerChatContent(chatContent);
//			return new Gson().toJson("채팅방 사용자 초대 성공");
//		}else {
//			return new Gson().toJson("채팅방 사용자 초대 실패");
//		}
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/chat/send", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatSend(@ModelAttribute ChatContentVO chatContent) {
//		ChatContentVO chatNotice = new ChatContentVO();
//		Date nowTime = new Date();
//		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 M월 d일 E요일");
//		chatNotice.setChatContent("- " + sf.format(nowTime) + " -");
//		chatNotice.setChatRoomNo(chatContent.getChatRoomNo());
//		chatNotice.setChatType(1);
//		int fineCount = cService.fineContentDate(chatNotice);
//		if(fineCount == 0) {
//			cService.registerChatContent(chatNotice);
//		}
//		int result = cService.registerChatContent(chatContent);
//		if(result > 0) {
//			return new Gson().toJson(result);
//		}else {
//			return null;
//		}
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/chat/content", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatContentAjax(@RequestParam("chatRoomNo") int chatRoomNo) {
//		List<ChatContentVO> cList = cService.printAllChat(chatRoomNo);
//		for(int i = 0; i < cList.size(); i++) {
//			SimpleDateFormat sf = new SimpleDateFormat("a h:mm");
//			cList.get(i).setChatDateFormat(sf.format(cList.get(i).getChatDate()));
//		}
//		return new Gson().toJson(cList);
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/chat/chatRoom", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatRoomAjax(@RequestParam("chatRoomNo") int chatRoomNo) {
//		ChatRoomVO chatRoom = cService.printChatRoom(chatRoomNo);
//		return new Gson().toJson(chatRoom);
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/chat/headCount", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String headCountAjax(@RequestParam("chatRoomNo") int chatRoomNo) {
//		int chatHeadCount = cService.printChatMemberCount(chatRoomNo);
//		return new Gson().toJson(chatHeadCount);
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/chat/member", method = RequestMethod.GET, produces="application/json;charset=utf-8")
//	public String chatMember(@RequestParam("chatRoomNo") int chatRoomNo) {
//		ChatRoomVO chatRoom = new ChatRoomVO();
//		chatRoom.setChatRoomNo(chatRoomNo);
//		List<ChatMemberVO> mList = cService.printAllMember(chatRoom);
//		String[] chatMemberArr = new String[mList.size()];
//		if(!mList.isEmpty()) {
//			for(int j = 0; j < mList.size(); j++) {
//				chatMemberArr[j] = mList.get(j).getDeptName() + " " + mList.get(j).getMemName() + " " + mList.get(j).getPositionName();
//			}
//		}
//		return new Gson().toJson(chatMemberArr);
//	}
//}
//>>>>>>> branch 'main' of https://github.com/GunwooRoh/FinalProject.git
