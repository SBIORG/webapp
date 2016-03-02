<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
     <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">租户信息</h1>
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
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">续签合同信息</h1>
          <div class="clearfix each_info">
             <table class="width_rewrite"><!--因样式稍有变化，请为table添加class：width_rewrite-->
               <tr>
                 <td class="info_title">【租赁房间】</td>
                 <td class="info_words"><i class="c669">${map['cont'].all_house}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【原合同号】</td>
                 <td class="info_words">${map['cont'].old_cont_no}</td>
               </tr>
               <tr>
                 <td class="info_title">【续签合同编号】</td>
                 <td class="info_words">${map['cont'].cont_no}</td>
               </tr>
               <tr>
                 <td class="info_title">【续签日期】</td>
                 <td class="info_words">${map['cont'].cont_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【免租日期】</td>
                 <td class="info_words">${map['cont'].free_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【付费方式】</td>
                 <td class="info_words">${map['cont'].pay_type}</td>
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
        <!--审批业务-->
      </div>
    </div>
    <!--业务-->
