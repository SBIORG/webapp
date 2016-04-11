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
         <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/user/uccontlview.action?lm=ht&id="+request.getParameter("id"),"UTF-8") %>"></a>
      </div>
      <!--意见反馈-->
    <!--合同名称及返回按钮-->
    <div class="message_goback">
      <a href="${pageContext.request.contextPath}/user/uccontllist.action?lm=ht"> < <span>租赁合同</span></a>
    </div>
    <!--合同名称及返回按钮-->
    <!--合同-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--合同详情-->
        <div class="each_box">
          <h1 class="each_h1">租赁信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【租赁房间】</td>
                 <td class="info_words"><i class="c669">${map['cont'].all_house}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【合同编号】</td>
                 <td class="info_words">${map['cont'].cont_no}</td>
               </tr>
               <tr>
                 <td class="info_title">【合同状态】</td>
                 <td class="info_words change_color">${map['cont'].zt_status}</td>
               </tr>
               <tr>
                 <td class="info_title">【租赁房价】</td>
                 <td class="info_words">${map['cont'].loan_price}</td>
               </tr>
               <tr>
                 <td class="info_title">【应缴押金】</td>
                 <td class="info_words">${map['cont'].deposit}</td>
               </tr>
               <tr>
                 <td class="info_title">【预订订金】</td>
                 <td class="info_words">${map['cont'].true_book_fee}</td>
               </tr>
               <tr>
                 <td class="info_title">【免租日期】</td>
                 <td class="info_words">${map['cont'].free_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【签约日期】</td>
                 <td class="info_words">${map['cont'].cont_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【租赁说明】</td>
                 <td class="info_words">${map['cont'].loan_remark}</td>
               </tr>
               <tr>
                 <td class="info_title">【补充条款】</td>
                 <td class="info_words">${map['cont'].loan_add}</td>
               </tr>
             </table>
          </div>
        </div>
        <!--合同详情-->
      </div>
    </div>
    <!--合同-->
  </div>
  <!--content-->
 </body>
</html>
