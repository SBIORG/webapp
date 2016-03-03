<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!--content-->
<form class="delete_form" action="${pageContext.request.contextPath}/admin/lc/handle.action" method="post">
<input type="hidden" name='task_flg' value=2 >
  <input type="hidden" name='flow_id' value="${map['flow_id'] }">  
  <input type="hidden" name='task_id' value="${map['task_id'] }">  
  <input type="hidden" name='executed_id' value="${map['executed_id'] }">  
  <input type="hidden" name='model_id' value="${map['model_id'] }">  
<input type="hidden" name='user_id' value="${userInfo.user_id}">
<input type="hidden" name='agency_id' value="${userInfo.agency_id }">
  <!--content-->
  <div class="content">
    <!--意见反馈-->
      <div class="feedback_btn">
       <a href="<%=request.getContextPath()%>/yjfk.action?url=<%=java.net.URLEncoder.encode(sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")+request.getContextPath()+"/admin/lc/exec.action?flowId="+request.getParameter("flowId")+"&nodeId="+request.getParameter("nodeId")+"&executedId="+request.getParameter("executedId"),"UTF-8") %>"></a>
    <!--    <em></em>-->
      </div>
      <!--意见反馈-->
    <!--审批业务名称及返回按钮-->
    <div class="message_goback">
      <a href="${pageContext.request.contextPath}/admin/lc/view.action?flowId=${param.flowId}"> < <span>${map['executed_name'] }</span></a>
    </div>
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--填写反馈-->
          <div class="success">
             <p>您确认要删除吗？</p>
          </div>
      </div>
    </div>
    <!--业务-->
  </div>
  <!--底部栏-->
<!--底部栏-->
    <!--审批按钮-->
    <div class="ywsp_button">
       <ul>
         <li class="refuse"><a class="sure_delete">确认</a></li>
         <li class="pass"><a class="cancle_delete" href="${pageContext.request.contextPath}/admin/lc/view.action?flowId=${param.flowId}">取消</a></li>
       </ul>
    </div>
    <!--审批按钮-->
  </form>
  <!--底部栏-->
  <!--content-->
  <script>
    $('.sure_delete').bind(touchend,function(){
		 $('.delete_form').submit();
	})
  </script>