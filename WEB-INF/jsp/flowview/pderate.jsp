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
          	<c:when test="${map['derate_info'].is_lessee == '1'}">租户</c:when>
          	<c:otherwise>业主</c:otherwise>
          </c:choose>
          信息</h1>
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
          <h1 class="each_h1">减免信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【减免费用】</td>
                 <td class="info_words"><i class="c669">${map['derate_info'].derate_amount}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【减免类型】</td>
                 <td class="info_words">${map['derate_info'].derate_type}</td>
               </tr>
               <tr>
                 <td class="info_title">【减免说明】</td>
                 <td class="info_words">${map['derate_info'].derate_description}</td>
               </tr>
             </table>
          </div>
        </div>

      </div>
    </div>
    <!--业务-->

  