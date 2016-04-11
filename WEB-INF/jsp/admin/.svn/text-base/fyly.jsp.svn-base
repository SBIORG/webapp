<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>微信页面</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/page.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/center.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mobiscroll.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mobiscroll_date.css"/>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.7.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.touchSwipe.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/main.js" type="text/javascript"></script>

</head>
<style>
  html,body{
	  background:#f3f3f3;
  }
</style>

<body>
  <!--content-->
  <div class="content">
        <!--意见反馈-->
      <div class="feedback_btn">
      <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/admin/msglist.action?houseId="+request.getParameter("houseId")+"&houseNO="+request.getParameter("houseNO"),"UTF-8")+"#locationMessage" %>"></a>
      </div>
      <!--意见反馈-->

    <!--留言返回按钮-->
    <div class="message_goback">
      <a href="${pageContext.request.contextPath}/admin/index.action?lm=fy"> < <span>${param.houseNO}</span> 留言</a>
    </div>
    <!--留言返回按钮-->
    <div class="message_wrappe">
      <div class="all_messages wrappe_640">
        <div class="message_list clearfix">
        
        <!----
        "data":[
        {
            "id":"2",
            "user_id":"1781",
            "op_name":"检修的如何呢",
            "op_time":"2015-12-02",
            "content":"检修的如何呢"
        },
        {
            "id":"1",
            "user_id":"1788", //用户ID
            "op_name":"邓元兵",//留言的用户的用户名
            "op_time":"2015-12-01",//留言的时间
            "content":"房屋现在在检修"//留言的内容
        }
    ],
      循环，如果循环中的user_id的当前的用户ID的话,用留言右，如果不等于用留言左，留言右不显示用户名，显示的是我
    
        -->
         <c:forEach var='msg' items='${msglist}' varStatus='status'>
            <c:choose>
          	<c:when test="${userInfo.user_id != msg.user_id}">
          <!--留言左-->
          <div class="fl each_message fl_message clearfix">
             <div class="fl message_info">
               <i class="message_icon"></i>
               <p class="message_name">${msg.op_name }</p>
             </div>
             <div class="fl message_content">
               <p class="message_time">${msg.op_time }</p>
               <div class="message_text">
                 <span>${msg.content }</span>
               </div>
             </div>
          </div>
          <!--留言左-->
          </c:when>
          <c:otherwise>
          <!--留言右-->
          <div class="fr each_message fr_message clearfix">
             <div class="fr message_info">
               <i class="message_icon"></i>
               <p class="message_name">我</p>
             </div>
             <div class="fr message_content">
               <p class="message_time">${msg.op_time }</p>
               <div class="message_text">
                 <span>${msg.content }</span>
               </div>
             </div>
          </div>
          </c:otherwise>
          </c:choose>
          </c:forEach>
          <!--留言右-->
 			<!--锚点定位--><a id="locationMessage" name="locationMessage" ></a>
        </div>
      </div>
      
    </div>
  </div>
  <!--底部留言框和提交按钮-->
  <div class="bottom_submit">
  	<form  class="bottomSubmitForm" action="${pageContext.request.contextPath}/admin/msgadd.action" method="post">
    <input name="user_id" type="hidden" value="${userInfo.user_id }"><!--session的用户ID-->
    <input name="op_name" type="hidden" value="${userInfo.username }"><!--session的用户名称-->
    <input name="house_id" type="hidden" value="${param.houseId}"><!--get的房屋ID-->
    <input name="house_no" type="hidden" value="${param.houseNO}"><!--get的房屋ID-->
    <div class="messages_box">
      <textarea class="leave_message" name="content" placeholder="留言"></textarea>
    </div>
    <input type="button" class="submit_message" value="提交留言">
    </form>
  </div>
  <!--底部留言框和提交按钮-->
  <!--content-->
  <script>
      $(function(){
		  $('.submit_message').bind(touchend,function(){
			  $('.leave_message').blur();
			  if($('.leave_message').val()==''){
				  $('.leave_message').addClass('errorBorder');
			  }else{
				  $('.bottomSubmitForm').submit();
			  }
		  })
	  })
  </script>
</body>
</html>
