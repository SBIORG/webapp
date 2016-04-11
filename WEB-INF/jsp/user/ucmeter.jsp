<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<c:set var="meterType" value="${map['meter_type']}"/>
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
      <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/user/ucmeter.action?lm=sb","UTF-8") %>"></a>
      </div>
      <!--意见反馈-->
    <!--抄表下拉框以及按钮-->
    <div class="read_meter">
        <!--下拉框-->
        <div class="select_box clearfix">
         <div class="metet_select choose_meter fl">
           <a><span>${meterTypes[meterType]}</span></a>
           <!--弹框-->
           <div class="meter_popDiv" style="display:none;">
             <ul>
             	 <c:forEach var="meter" items="${meterTypes}"> 
               <a href="${pageContext.request.contextPath}/user/ucmeter.action?meterType=${meter.key}"><li><span>${meter.value}</span></li></a>
               </c:forEach>
             </ul>
           </div>
           <!--弹框-->
         </div>
       </div>
        <!--下拉框-->
        <!--抄表标题-->
        <div class="read_met_title clearfix">
          <ul>
            <li class="read_met_data"><span>抄表日期</span></li>
            <li class=""><span>抄表数</span></li>
            <li class=""><span>用电量</span></li>
          </ul>
        </div>
        <!--抄表标题-->
    </div>
    <!--抄表下拉框以及按钮-->
    <!--业务-->
    <div class="phone_meter_reading">
      <div class="inner_content">
        <!--抄表业务-->
        
         <c:forEach var='meter' items='${meterlist}' varStatus='status'>
        <div class="each_box">
          <h1 class="each_h1 clearfix each_h1_center"><span>${meter.house_number } ${meterTypes[meterType]}</span></h1>
          <div class="clearfix each_info each_met_num">
            <table>
            	<c:forEach var="v" items='${ meter.list}'>
              <tr>
                <td width="34%">${v.reads_date }</td>
                <td width="33%">${v.meter_num }</td>
                <td width="33%">${v.cha_num }</td>
              </tr>
               </c:forEach>
            </table>
          </div>
        </div>
        </c:forEach>
        <!--抄表业务-->
      </div>
    </div>
    <!--业务-->
  </div>
 
  <!--content-->
  <script src="js/mobiscroll_date.js" charset="gb2312" type="text/javascript"></script>
  <script src="js/mobiscroll.js" type="text/javascript"></script>
 </body>
</html>
