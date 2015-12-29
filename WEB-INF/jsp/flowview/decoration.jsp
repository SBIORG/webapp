<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1"><c:if test="${map['decoration_info'].is_lessee=="1" }">租户</c:if><c:if test="${map['decoration_info'].is_lessee=="0" }">业主</c:if>信息</h1>
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
          <h1 class="each_h1">装修申请信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【装修房屋】</td>
                 <td class="info_words"><i class="c669">${map['decoration_info'].house_no}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【装修时间】</td>
                 <td class="info_words">${map['decoration_info'].zx_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【装修图纸】</td>
                 <td class="info_words">${map['decoration_info'].map}</td>
               </tr>
                              <tr>
                 <td class="info_title">【装修保证金】</td>
                 <td class="info_words">${map['decoration_info'].collateral}</td>
               </tr>
               <c:forEach var='fee' items='${otherFees}' varStatus='status'>
               <tr>
                 <td class="info_title">${status.index }【${fee.fee_name }】</td>
                 <td class="info_words">${fee.fee_value }</td>
               </tr>
               </c:forEach>
                 <tr>
                 <td class="info_title">【说明】</td>
                 <td class="info_words">${map['decoration_info'].description}</td>
               </tr>
             </table>
          </div>
        </div>

      </div>
    </div>
    <!--业务-->

  