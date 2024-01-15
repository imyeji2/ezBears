# 👩‍💻3차 프로젝트 <이젠 베어스 : 구단 관리 그룹웨어 시스템>
![image](https://github.com/imyeji2/ezBears/assets/137904402/1779a09f-29d1-4975-acd8-08317a8eb500)



## 📌목차
[1. 기획 의도 및 목표](#%EF%B8%8F-기획의도-및-목표)

[2. 제작 일정](#%EF%B8%8F제작-일정2023-07-17--2023-09-11)

[3. 개발 환경](#%EF%B8%8F개발-환경)

[4. 시스템 아키텍쳐](#%EF%B8%8F시스템-아키텍쳐)

[5. DB 설계](#%EF%B8%8Fdb설계)

[6. 사용한 API](#%EF%B8%8F사용한-api)

[7. 핵심 구현 기능](#%EF%B8%8F핵심-구현-기능)

[8. 멤버 및 역할 분담](#%EF%B8%8F멤버-및-역할-분담)

[9. 메뉴 구성](#%EF%B8%8F메뉴-구성)

[10.전체 기능 소개](#%EF%B8%8F전체-기능-소개)

[11. 프로젝트 개선 방향](#%EF%B8%8F프로젝트-개선-방향)


## ✔️ 기획의도 및 목표
   - 공부한 백엔드 & 프론트 스킬을 모두 활용하여 스포츠 구단의 업무를 관리할 수 있는 그룹웨어 시스템을 만든다.
   - 동적 보드 기능을 활용하여 부서별, 그룹별 스케줄 관리와 업무를 진행할 수 있는 공간을 제공한다
   - 시합 경기 기록을 그래프로 제공하여 팀의 성과를 한 눈에 파악하고 관리할 수 있도록 정보를 제공한다.




## ✔️제작 일정(2023. 07. 17 ~ 2023. 09. 11)
![image](https://github.com/imyeji2/ezBears/assets/137904402/55c577e0-bbad-43e5-b689-3eb44a53968f)


## ✔️개발 환경
![image](https://github.com/imyeji2/ezBears/assets/137904402/e9ef9fa8-bc76-41d6-b635-da97264970ec)


## ✔️시스템 아키텍쳐
![image](https://github.com/imyeji2/ezBears/assets/137904402/89092742-3198-440d-9569-adc546586557)



## ✔️DB설계
### 📍논리
![image](https://github.com/imyeji2/ezBears/assets/137904402/3c22df59-7bfd-4fe2-b82e-12b67fc8e1c7)

![image](https://github.com/imyeji2/ezBears/assets/137904402/f9332442-80ca-44d6-bd8e-a8d1e5eee88d)


### 📍물리
![image](https://github.com/imyeji2/ezBears/assets/137904402/f517a41c-ddd6-4bd8-977b-e61b75cf476c)
![image](https://github.com/imyeji2/ezBears/assets/137904402/86811425-103d-4486-b071-6979351dc95a)


## ✔️사용한 API
![image](https://github.com/imyeji2/ezBears/assets/137904402/43216b56-9b77-42d9-a332-aa375bbc6385)



## ✔️핵심 구현 기능

#### ⭐ 전체 사원 검색, 임직원 정보에서 키워드 검색
#### ⭐ 메인 페이지에 표시되는 동적 보드 변경
#### ⭐ FullCalendar를 이용한 스케줄, 근태 관리
#### ⭐ KakaoMapAPI, NaverSerchAPI, ApachePOIAPI 등 다양한 API를 활용
#### ⭐ Ajax 기능을 활용한 동적 보드 관리(생성, 삭제, 멤버 추가, 관리자 변경 등)
#### ⭐ 피드형 게시판 스크롤 페이징 처리
#### ⭐ 프로시저를 활용한 댓글 삭제
#### ⭐ 업무 게시판 ToDoList 기능과 해당 데이터를 활용한 업무 그래프 표시
#### ⭐ 결재 신청 및 결재 처리




## ✔️멤버 및 역할 분담
👩‍💻이예지(팀장)
- [메인페이지](#%EF%B8%8F메인페이지)
- [동적보드 공지사항](#%EF%B8%8F동적보드-공지사항)
- [동적보드 업무 게시판](#%EF%B8%8F동적보드-업무게시판)
- [동적보드 멤버 관리](#%EF%B8%8F동적보드-멤버관리)
- [동적보드 관리](#%EF%B8%8F동적보드-관리)



👩‍💻서다희
- [전체 사원 검색](#%EF%B8%8F전체-사원-검색)
- [경영지원팀 사원 관리](#%EF%B8%8F경영지원팀-사원-관리)
- [경영지원팀 부서 관리](#%EF%B8%8F경영지원팀-부서-관리)
- [경영지원팀 게시판 관리](#%EF%B8%8F경영지원팀-게시판-관리)
- [임직원정보](#%EF%B8%8F임직원정보)

  
👨‍💻이충혁
- [출/퇴근](#%EF%B8%8F출퇴근)
- [경영지원팀 근태 관리](#%EF%B8%8F경영지원팀-근태-관리)
- [경영지원팀 결재 관리](#%EF%B8%8F경영지원팀-결재-관리)
- [경영지원팀 스태프 관리](#%EF%B8%8F경영지원팀-스태프-관리)
- 

👩‍💻박희진
- [동적 보드 스케줄](#%EF%B8%8F동적보드-스케줄)
- [동적 보드 결재](#%EF%B8%8F동적보드-결재)


👨‍💻고판주
- [로그인](#%EF%B8%8F로그인)
- [마이페이지](##%EF%B8%8F마이페이지)
- [공용 게시판](##%EF%B8%8F공용-게시판)
  

👨‍💻노건우
- [팀관리 경기 기록](#%EF%B8%8F팀관리-경기-기록)
- [팀관리 선수 기록](#%EF%B8%8F팀관리-선수-기록)
  
👪공통    
- 자료조사, PPT, WBS, Use Case, FBS 작성, DB설계 및 작성



## ✔️메뉴 구성
![image](https://github.com/imyeji2/ezBears/assets/137904402/44516bef-00e4-42d6-9921-3088e88b715a)


## ✔️전체 기능 소개
### ▶️로그인
![image](https://github.com/imyeji2/ezBears/assets/137904402/2501dfb8-48c4-4f13-8026-18e65e7e413d)
![image](https://github.com/imyeji2/ezBears/assets/137904402/9044ee21-0f28-41cc-ab1e-f45b8ef8c86f)
![image](https://github.com/imyeji2/ezBears/assets/137904402/9d362b2f-44cc-4248-96f7-496a60935fc7)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️메인페이지
#### 📍메뉴 구성
![image](https://github.com/imyeji2/ezBears/assets/137904402/7435a706-880e-436d-9fca-8566614f0793)
![image](https://github.com/imyeji2/ezBears/assets/137904402/99c4ea1e-a9a5-4518-a0a0-2f06a30d01ec)


#### 📍일반 사원
![image](https://github.com/imyeji2/ezBears/assets/137904402/0278f5fd-3470-499b-93f6-cc81c8fac7c2)
![image](https://github.com/imyeji2/ezBears/assets/137904402/2ab87fed-123d-464c-91fb-2cb4ca3b24e0)



#### 📍스태프
![image](https://github.com/imyeji2/ezBears/assets/137904402/9df23c99-574e-4048-ae84-f87ce8aa89cb)
![image](https://github.com/imyeji2/ezBears/assets/137904402/bf9a6948-ec18-4f06-b31a-794cd7186e19)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️전체 사원 검색
![image](https://github.com/imyeji2/ezBears/assets/137904402/6ca00943-2d00-46fb-a78a-4d3dce37d866)
![image](https://github.com/imyeji2/ezBears/assets/137904402/724e10a1-b670-4c9a-a33b-adb19b450c5d)
![image](https://github.com/imyeji2/ezBears/assets/137904402/da1799e3-bc31-4db7-b9c6-e7c6893c30b9)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️마이페이지
![image](https://github.com/imyeji2/ezBears/assets/137904402/bf436972-e21b-45bc-966a-3ba5897133d9)
![image](https://github.com/imyeji2/ezBears/assets/137904402/fcb3564f-4fce-48bc-935e-7571eec59d35)
![image](https://github.com/imyeji2/ezBears/assets/137904402/2033de2d-af1c-4607-8c99-de5ef20a7829)
![image](https://github.com/imyeji2/ezBears/assets/137904402/1fc75f38-4a27-4462-b7f8-ecd235bc1b0b)

###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️출/퇴근
#### 📍출/퇴근 처리
![image](https://github.com/imyeji2/ezBears/assets/137904402/d36cfbee-6069-4c99-a3c1-a1401650ed9c)


#### 📍출/퇴근 기록 조회
![image](https://github.com/imyeji2/ezBears/assets/137904402/1398326b-5af1-4f51-b360-741bff4a64c6)
![image](https://github.com/imyeji2/ezBears/assets/137904402/1b92e50c-06e3-4a60-8034-7ebe45901d88)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️공용 게시판
#### 📍공지사항
![image](https://github.com/imyeji2/ezBears/assets/137904402/d246a39e-9f46-41ae-8517-59af19da0d26)
![image](https://github.com/imyeji2/ezBears/assets/137904402/e704ff0a-57c3-4612-8216-75c9a02a7916)
![image](https://github.com/imyeji2/ezBears/assets/137904402/d439da91-baf2-422a-95cc-4e89400415f4)
![image](https://github.com/imyeji2/ezBears/assets/137904402/32362105-a785-4545-855b-be6bdde594c8)

#### 📍자유 게시판
![image](https://github.com/imyeji2/ezBears/assets/137904402/dc09a904-e4f2-464e-a7f5-9b17214420f9)
![image](https://github.com/imyeji2/ezBears/assets/137904402/c87091ca-364b-4405-84c2-2414c3446ad4)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️경영지원팀 사원 관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/d13b36ce-9d6a-4546-9b11-8246d8a14d00)
![image](https://github.com/imyeji2/ezBears/assets/137904402/152f6c17-bc70-4b00-85d2-cedd9fc7b2a3)
![image](https://github.com/imyeji2/ezBears/assets/137904402/7435f4f8-7f42-4eff-8fa9-ecd628085802)
![image](https://github.com/imyeji2/ezBears/assets/137904402/d5b26f6c-0d63-4a80-9b9b-df959ee5cbcc)
![image](https://github.com/imyeji2/ezBears/assets/137904402/8c4ed29d-0394-4906-a845-2061b254a2b9)
![image](https://github.com/imyeji2/ezBears/assets/137904402/14615a7b-8562-4008-98f4-47e2298b1b51)
![image](https://github.com/imyeji2/ezBears/assets/137904402/27e622eb-4b5f-412d-b6cb-048843c5f31e)
![image](https://github.com/imyeji2/ezBears/assets/137904402/8de7517b-624a-4390-b6e3-4720c60014bd)
![image](https://github.com/imyeji2/ezBears/assets/137904402/1e71f2f4-6429-4296-9da2-bbd54316a1d1)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️경영지원팀 부서 관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/91bdf1c4-9088-4794-a752-6f13125eb1e0)
![image](https://github.com/imyeji2/ezBears/assets/137904402/5fb2f1af-b02f-4d5f-a63d-39e96969cfce)
![image](https://github.com/imyeji2/ezBears/assets/137904402/7272c7b1-6ecf-47f9-a70b-e9bb0809add3)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️경영지원팀 게시판 관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/c51b28c0-5433-4700-8cf6-40249a01b560)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---

### ▶️경영지원팀 근태 관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/83f538c0-6695-47b1-9181-a0c56e98d1eb)
![image](https://github.com/imyeji2/ezBears/assets/137904402/2ffa5c77-c319-405a-b029-8e09a3da1cf7)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️경영지원팀 결재 관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/4750f875-1bdc-4b50-9cd9-f7abe0b79d49)
![image](https://github.com/imyeji2/ezBears/assets/137904402/cb065166-1bbb-4908-acaf-1b7349f25973)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️경영지원팀 스태프 관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/2c671595-1fe8-4e32-8f4e-e0b8c4e862c9)
![image](https://github.com/imyeji2/ezBears/assets/137904402/958bdaf5-010a-46d8-9f25-362fab838804)
![image](https://github.com/imyeji2/ezBears/assets/137904402/0878533e-cc78-4ffc-97f0-e6eb0fa49d7d)
![image](https://github.com/imyeji2/ezBears/assets/137904402/a4730279-c80e-4e7d-b62f-9374e88a1761)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️동적보드 공지사항
![image](https://github.com/imyeji2/ezBears/assets/137904402/e943af1c-b128-492d-bd12-aa611636ba41)
![image](https://github.com/imyeji2/ezBears/assets/137904402/63b08421-c6f7-4170-8a2c-2dda1bac6e7d)
![image](https://github.com/imyeji2/ezBears/assets/137904402/b9931f4c-7572-424a-b434-7e8c99f50171)
![image](https://github.com/imyeji2/ezBears/assets/137904402/552d6119-6d73-4ec3-ac26-9a59800e0db6)
![image](https://github.com/imyeji2/ezBears/assets/137904402/a84c8b3f-02da-4fc9-b5e4-6e159c5bd449)
![image](https://github.com/imyeji2/ezBears/assets/137904402/4b7778e8-dd8a-4bca-9654-f57da8017575)
![image](https://github.com/imyeji2/ezBears/assets/137904402/bf2ac02f-09d6-4a6d-acbc-804fd2fb2693)
![image](https://github.com/imyeji2/ezBears/assets/137904402/293580f9-8750-441e-95f0-a91d80b64283)
![image](https://github.com/imyeji2/ezBears/assets/137904402/8181c7f8-c719-4c12-b1b8-af727afd5283)
![image](https://github.com/imyeji2/ezBears/assets/137904402/876d9069-b9ed-411b-9a54-65b34291684c)
![image](https://github.com/imyeji2/ezBears/assets/137904402/88325f21-83a2-4767-9743-8d832b712e41)
![image](https://github.com/imyeji2/ezBears/assets/137904402/63650dbd-37c3-4fe5-a9d6-69d33bc68cf1)
![image](https://github.com/imyeji2/ezBears/assets/137904402/64835d9f-3c3b-4f21-be48-024c3635905b)
![image](https://github.com/imyeji2/ezBears/assets/137904402/6f5f1747-8c78-4f51-bf95-d8138a9b4148)
![image](https://github.com/imyeji2/ezBears/assets/137904402/5f5ab39e-eaeb-4dbf-8256-5f91f4aab1ae)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️동적보드 업무게시판
![image](https://github.com/imyeji2/ezBears/assets/137904402/3ae610c4-7a7c-47a8-b878-9d4505c6864b)
![image](https://github.com/imyeji2/ezBears/assets/137904402/746c2af9-4bc2-4d60-b8db-68bf3cdcdfcb)
![image](https://github.com/imyeji2/ezBears/assets/137904402/d79c6481-3a2f-4990-82a3-84802e406baa)
![image](https://github.com/imyeji2/ezBears/assets/137904402/7246f89a-1917-41d6-b058-30d7f9837448)
![image](https://github.com/imyeji2/ezBears/assets/137904402/92ce6fcb-adb0-4380-ad02-e5735d6616f8)
![image](https://github.com/imyeji2/ezBears/assets/137904402/fe4df7d4-8ff8-4ff8-9143-0680f58e8298)
![image](https://github.com/imyeji2/ezBears/assets/137904402/0ee9a568-2238-4ac7-b098-24d6bce9a757)
![image](https://github.com/imyeji2/ezBears/assets/137904402/2efbdec4-27f7-4fad-aa10-38c2630fec34)
![image](https://github.com/imyeji2/ezBears/assets/137904402/aa700770-5f1a-45ba-a048-e13c87cb8e06)
![image](https://github.com/imyeji2/ezBears/assets/137904402/f530c1e6-0f8f-4cb8-8610-09121e517aca)
![image](https://github.com/imyeji2/ezBears/assets/137904402/fbc40b41-1f0f-4196-87aa-aaf0628179b4)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️동적보드 스케줄
![image](https://github.com/imyeji2/ezBears/assets/137904402/9b4db8ae-f770-4891-b9cc-94048ae2dab8)
![image](https://github.com/imyeji2/ezBears/assets/137904402/59648bd1-b057-439f-a598-43ea15ff2ca2)
![image](https://github.com/imyeji2/ezBears/assets/137904402/d5965664-1418-4c56-856b-de33a4967175)
![image](https://github.com/imyeji2/ezBears/assets/137904402/f9ab21da-3f8c-485d-b659-aed20f9bcc1b)
![image](https://github.com/imyeji2/ezBears/assets/137904402/5909f40c-e8a8-4945-97f6-202e812a7567)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️동적보드 결재
![image](https://github.com/imyeji2/ezBears/assets/137904402/30ea2308-db3c-413e-b286-0e8ab2dad082)
![image](https://github.com/imyeji2/ezBears/assets/137904402/4bc883ce-7c3e-4d49-9bcc-8c237dd65ba6)
![image](https://github.com/imyeji2/ezBears/assets/137904402/1c0dff5f-9d88-464b-83a9-6c6de95c2961)
![image](https://github.com/imyeji2/ezBears/assets/137904402/9fbe6efa-e854-4195-8986-d3f24dc90c43)
![image](https://github.com/imyeji2/ezBears/assets/137904402/a8421268-f4fe-4d8d-8190-6a951691e804)
![image](https://github.com/imyeji2/ezBears/assets/137904402/f5ae8a74-2ac4-431f-8237-b9ac922cc778)
![image](https://github.com/imyeji2/ezBears/assets/137904402/8a0e5fd7-aac0-48a0-9278-a46d01b1b3c1)
![image](https://github.com/imyeji2/ezBears/assets/137904402/3ce51dac-a2be-4034-a4ac-aef8a8181d31)
![image](https://github.com/imyeji2/ezBears/assets/137904402/3e58f597-d76f-4a93-a6f7-8b8e20d393cf)
![image](https://github.com/imyeji2/ezBears/assets/137904402/e067faf5-a358-4329-a1ed-836d524424e3)
![image](https://github.com/imyeji2/ezBears/assets/137904402/abbc764e-dfc0-4cef-94c0-d838dcc5d647)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️동적보드 멤버관리
![image](https://github.com/imyeji2/ezBears/assets/137904402/609ebf92-09ae-445f-a120-b074572b65d4)
![image](https://github.com/imyeji2/ezBears/assets/137904402/82ce0143-4c51-43da-b187-373d9c0df48a)
![image](https://github.com/imyeji2/ezBears/assets/137904402/1fc78d50-61d8-44d1-999a-306274551559)
![image](https://github.com/imyeji2/ezBears/assets/137904402/82a9d391-2ead-4ebb-9281-60100e9a4f3a)
![image](https://github.com/imyeji2/ezBears/assets/137904402/68212333-df81-4e93-a784-858e69fb2dc4)
![image](https://github.com/imyeji2/ezBears/assets/137904402/76dd6c76-d8b2-4fb7-84a0-b9a3850fd931)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️동적보드 관리 
![image](https://github.com/imyeji2/ezBears/assets/137904402/604edf7a-f960-4b9f-b3de-3504aef351bd)
![image](https://github.com/imyeji2/ezBears/assets/137904402/7736d618-627f-4dca-a566-b4c8a5a5a406)
![image](https://github.com/imyeji2/ezBears/assets/137904402/a36a35ec-2fc9-4aee-ad83-ff502a7fe5d4)
![image](https://github.com/imyeji2/ezBears/assets/137904402/c984488b-efc3-408e-ba71-9ff7f9d8543c)
![image](https://github.com/imyeji2/ezBears/assets/137904402/9ceaf737-5ef9-4f87-b714-4a834f33eaf5)
![image](https://github.com/imyeji2/ezBears/assets/137904402/8e84f0ec-6e2f-4d5b-bc1c-20440d90299b)
![image](https://github.com/imyeji2/ezBears/assets/137904402/a308b331-7627-45ce-a2e2-394f97540cd2)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️팀관리 경기 기록
![image](https://github.com/imyeji2/ezBears/assets/137904402/ed71827a-1db8-486b-a190-accd717257aa)
![image](https://github.com/imyeji2/ezBears/assets/137904402/4ee9569d-6839-45e8-bee5-e37133a62fd1)
![image](https://github.com/imyeji2/ezBears/assets/137904402/7afeb377-92f1-40d8-b28f-b994038e3307)
![image](https://github.com/imyeji2/ezBears/assets/137904402/c766f9e8-4197-44d7-8498-95995e31c5f1)
![image](https://github.com/imyeji2/ezBears/assets/137904402/ac326fb1-5c69-4a29-83a6-250256d89830)
![image](https://github.com/imyeji2/ezBears/assets/137904402/4371212c-81b4-4503-9cd6-babfea04324b)
![image](https://github.com/imyeji2/ezBears/assets/137904402/826abb69-5358-4a63-bb51-d081ffdee2fa)
![image](https://github.com/imyeji2/ezBears/assets/137904402/9729ff78-3f8c-450e-bccd-91d36dfca6bf)
![image](https://github.com/imyeji2/ezBears/assets/137904402/7106ebb3-980f-41c7-b3ce-7aec5391208e)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️팀관리 선수 기록
![image](https://github.com/imyeji2/ezBears/assets/137904402/60b99b31-b9d4-4731-9f6c-fc78214b775e)
![image](https://github.com/imyeji2/ezBears/assets/137904402/6e835cb8-8113-4918-b221-f56227e911fc)
![image](https://github.com/imyeji2/ezBears/assets/137904402/863acfa1-2850-4015-a8fc-0f2ae9dad45a)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)
---


### ▶️임직원정보 
![image](https://github.com/imyeji2/ezBears/assets/137904402/df3b6236-ce7d-4d5f-9eaa-a61e5a4d703c)
![image](https://github.com/imyeji2/ezBears/assets/137904402/c0b40a43-34e9-484f-b2a0-d7df143a245e)
![image](https://github.com/imyeji2/ezBears/assets/137904402/e2be2c78-4f1d-4368-838b-53a184ce04a3)
![image](https://github.com/imyeji2/ezBears/assets/137904402/3b0f9fd3-39da-4d6b-8426-4ea398a8a875)
![image](https://github.com/imyeji2/ezBears/assets/137904402/9af3d521-caa1-46bb-bd19-fd829bd214c4)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)





## ✔️프로젝트 개선 방향
    ☑️ 팀 관리 고도화
     - 경기 기록, 선수 기록 하나씩 등록하지 않고 엑셀 파일 업로드로 DB에 자동 등록될 수 있게 한다
     - DB에 저장된 데이터를 바탕으로 다양한 팀, 선수 통계를 산출해 정보를 제공할 수 있게 한다.

    ☑️ 채팅 기능 고도화
     - ajax가 아닌 웹 소켓을 활용하여 제대로 된 채팅 기능을 제공할 수 있게 한다.

    ☑️ 알림 기능 추가
     - 공지사항, 채팅 등 기능에 관련된 알 기능을 추가해 새로운 정보를 확인할 수 있도록 한다.










