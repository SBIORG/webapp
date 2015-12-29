<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
  
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1"><c:if test="${map['throw_info'].is_lessee=="1" }">租户</c:if><c:if test="${map['throw_info'].is_lessee=="0" }">业主</c:if>信息</h1>
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
          <h1 class="each_h1">车位租赁缴费情况</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【缴费单】</td>
                 <td class="info_words"><i class="c669">${map['throw_info'].pay_num}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【总应缴费用】</td>
                 <td class="info_words">${map['throw_info'].fee_info}</td>
               </tr>
               <tr>
                 <td class="info_title">【押金】</td>
                 <td class="info_words">${map['throw_info'].deposit_info}</td>
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
                 <td class="info_words"><i class="c669">${map['throw_info'].all_parking}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【租赁期限】</td>
                 <td class="info_words">${map['throw_info'].lease_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【退租时间】</td>
                 <td class="info_words">${map['throw_info'].throw_time}</td>
               </tr>
                              <tr>
                 <td class="info_title">【租赁退费】</td>
                 <td class="info_words">${map['throw_info'].throw_fee}</td>
               </tr>
                                             <tr>
                 <td class="info_title">【押金】</td>
                 <td class="info_words">${map['throw_info'].deposit}</td>
               </tr>
                                             <tr>
                 <td class="info_title">【${map['throw_info'].fee_name}】</td>
                 <td class="info_words">${map['throw_info'].fee_value}</td>
               </tr>
             </table>
          </div>
        </div>

      </div>
    </div>
    <!--业务-->

  