<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!--content-->
<form action="${pageContext.request.contextPath}/lc/handle.action" method="post">
<input type="hidden" name='audit_status' value='nopass'>
<input type="hidden" name='task_flg' value=2 >
  <input type="hidden" name='flow_id' value="${map['flow_id'] }">  
  <input type="hidden" name='task_id' value="${map['task_id'] }">  
  <input type="hidden" name='executed_id' value="${map['executed_id'] }">  
  <input type="hidden" name='model_id' value="${map['model_id'] }">  
<input type="hidden" name='user_id' value="${userInfo.user_id}">
<input type="hidden" name='agency_id' value="${userInfo.agency_id }">

  <div class="content">
      <!--意见反馈-->
      <div class="feedback_btn">
        <a href="<%=request.getContextPath()%>/yjfk.jsp?url=<%=sbi.xwb.weixin.commons.filemonitor.PropertiesReader.read("server")%>${pageContext.request.contextPath}/exec.action?flowId=${param.flowId}&nodeId=${param.nodeId}&executedId=${param.executedId}"></a>
    <!--    <em></em>-->
      </div>
      <!--意见反馈-->
    <!--反馈及返回按钮-->
    <div class="message_goback">
      <a href="${pageContext.request.contextPath}/lc/view.action?flowId=${param.flowId}"> < <span>${map['executed_name'] }</span></a>
    </div>
    <!--反馈及返回按钮-->
    <!--反馈-->
    <div class="phone_work_sp write_feedback">
      <div class="inner_content">
        <!--填写反馈-->
        <div class="">
          <div class="clearfix each_info">
            <div>
              <textarea name="audit_remark" class="write_meter_txt write_meter_txt_height" style="display:block;" placeholder="详细描述..."></textarea>
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
        <p class="button_value"><input type="submit" value="提交"></p>
      </div>
  	<!--反馈信息提交按钮-->
  </div>
  </form>
  <!--底部栏-->
  <!--content-->