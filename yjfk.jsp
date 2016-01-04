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
<script src="<%=request.getContextPath()%>/resources/js/iscroll.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/main.js" type="text/javascript"></script>
<script>
    document.domain("xinwubao.com");
</script>
</head>
<style>
</style>

<body>
<form method="post" id="fankuiFrom" action="${pageContext.request.contextPath}/feedbackadd.action" enctype="multipart/form-data">
  <!--content-->
  <div class="content">
      <!--意见反馈-->
      <div class="feedback_btn">
        <a></a>
    <!--    <em></em>-->
      </div>
      <!--意见反馈-->
    <!--反馈及返回按钮-->
    <div class="message_goback">
      <a href="${param.url}"> < <span>意见反馈</span></a>
    </div>
    <!--反馈及返回按钮-->
    <!--反馈-->
    <div class="phone_work_sp write_feedback">
      <div class="inner_content">
        <!--填写反馈-->
        
        <div class="each_box">
          <div class="clearfix each_info">
            <input type="hidden" name='url' value="${param.url}"> <!--反馈按钮点击带过来的参数-->
            <input type="text" class="write_meter_num" name="title" placeholder="标题：">
            <div>
              <textarea class="write_meter_txt write_meter_txt_height" style="display:block;" name="detail" placeholder="详细描述..."></textarea>
            </div>
            <div class="meter_box clearfix">
               <iframe id="uploadIframe" scrolling="no" src="http://beta.xinwubao.com/weixin/file/index?user_id=1788"></iframe>
            </div>
          </div>
        </div>
        <!--填写反馈-->
        
        
      </div>
    </div>
    <!--反馈-->
  </div>
  <!--底部栏-->
  <div class="bottom_content">
    <!--反馈信息提交按钮-->
      <div class="fixed_button">
        <p class="button_value"><input id="fankuiSubmit" type="button" value="提交反馈信息"></p>
        <script>
		$("#fankuiSubmit").click(function(){
			
			alert($(window.frames["uploadIframe"].document).html());
			alert($(window.frames["uploadIframe"].document).find("input[@type='hidden']").attr('name'));
			$(window.frames["uploadIframe"].document).find("input[@type='hidden']").each(function(){
				alert($(this).val())
			});
			
			//$("#fankuiFrom").append(html);
			//return false;
		});
		
		</script>
      </div>
  	<!--反馈信息提交按钮-->
  </div>
  <!--底部栏-->
  <!--content-->
  </form>

 </body>
</html>
