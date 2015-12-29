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
          <h1 class="each_h1">延期信息</h1>
          <div class="clearfix each_info">
          
             <table class="width_rewrite"><!--因样式稍有变化，请为table添加class：width_rewrite-->
               <tr>
                 <td class="info_title">【原合同编号】</td>
                 <td class="info_words">${map['delay_info'].old_cont_no}</td>
               </tr>
               <tr>
                 <td class="info_title">【原合同到期日期】</td>
                 <td class="info_words">${map['delay_info'].old_end_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【延期时间】</td>
                 <td class="info_words">${map['delay_info'].date}</td>
               </tr>
               <tr>
                 <td class="info_title">【延期单价】</td>
                 <td class="info_words">${map['delay_info'].loan_price}</td>
               </tr>
               <tr>
                 <td class="info_title">【延期说明】</td>
                 <td class="info_words">${map['delay_info'].loan_remark}</td>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
      </div>
    </div>
    <!--业务-->
