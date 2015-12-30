<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
  
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">
          <c:choose>
          	<c:when test="${map['cont_info'].is_lessee == '1'}">租户</c:when>
          	<c:otherwise>业主</c:otherwise>
          </c:choose>信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【租户】</td>
                 <td class="info_words"><i class="c669">${map['lessee'].lessee_name}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【联系方式】</td>
                 <td class="info_words">${map['lessee'].contact}（${map['lessee'].mobile}）</td>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
 		<div class="each_box">
          <h1 class="each_h1">物业合同</h1>
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
                 <td class="info_title">【物业服务费】</td>
                 <td class="info_words">${map['cont'].loan_price}</td>
               </tr>
               <tr>
                 <td class="info_title">【付费方式】</td>
                 <td class="info_words">${map['cont'].pay_type}</td>
               </tr>
               <tr>
                 <td class="info_title">【签约日期】</td>
                 <td class="info_words">${map['cont'].cont_date}</td>
               </tr>
               <c:forEach var='fee' items='${otherFees}' varStatus='status'>
               <tr>
                 <td class="info_title">【${fee.fee_name }】</td>
                 <td class="info_words">${fee.fee_value }</td>
               </tr>
               </c:forEach>
                 <tr>
                 <td class="info_title">【备注说明】</td>
                 <td class="info_words">${map['cont'].cont_remark}</td>
               </tr>
                 <tr>
                 <td class="info_title">【补充条款】</td>
                 <td class="info_words">${map['cont'].loan_add}</td>
               </tr>
               
             </table>
          </div>
        </div>
        <!--审批业务-->
 		
        <!--审批业务-->
      </div>
    </div>
    <!--业务-->

  