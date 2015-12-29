<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
  
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1"><c:if test="${map['cont_info'].is_lessee=="1" }">租户</c:if><c:if test="${map['cont_info'].is_lessee=="0" }">业主</c:if>信息</h1>
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
          <h1 class="each_h1">三联供签约</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【绑定房间】</td>
                 <td class="info_words"><i class="c669">${map['cont_info'].all_house}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【合同编号】</td>
                 <td class="info_words">${map['cont_info'].cont_no}</td>
               </tr>
               <tr>
                 <td class="info_title">【合同日期】</td>
                 <td class="info_words">${map['cont_info'].lease_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【签约费用】</td>
                 <td class="info_words">${map['cont_info'].fee_sum}</td>
               </tr>
                              <tr>
                 <td class="info_title">【免租日期】</td>
                 <td class="info_words">${map['cont_info'].free_date}</td>
               </tr>
                 <tr>
                 <td class="info_title">【租赁说明】</td>
                 <td class="info_words">${map['cont_info'].loan_remark}</td>
               </tr>
             </table>
          </div>
        </div>
                <!--审批业务-->
 		<div class="each_box">
          <h1 class="each_h1">车位退租情况</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【退租车位】</td>
                 <td class="info_words"><i class="c669">${map['cont_info'].all_parking}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【租赁期限】</td>
                 <td class="info_words">${map['cont_info'].lease_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【退租时间】</td>
                 <td class="info_words">${map['cont_info'].throw_time}</td>
               </tr>
                              <tr>
                 <td class="info_title">【租赁退费】</td>
                 <td class="info_words">${map['cont_info'].throw_fee}</td>
               </tr>
                                             <tr>
                 <td class="info_title">【押金】</td>
                 <td class="info_words">${map['cont_info'].deposit}</td>
               </tr>
                                             <tr>
                 <td class="info_title">【${map['cont_info'].fee_name}】</td>
                 <td class="info_words">${map['cont_info'].fee_value}</td>
               </tr>
             </table>
          </div>
        </div>

      </div>
    </div>
    <!--业务-->

  