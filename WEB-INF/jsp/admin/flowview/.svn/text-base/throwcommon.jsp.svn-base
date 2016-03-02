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
          	<c:when test="${map['throw_info'].is_lessee == '1'}">租户</c:when>
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
          <h1 class="each_h1">一次性签约缴费情况</h1>
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
             </table>
          </div>
        </div>
        
                <!--审批业务-->
 		<div class="each_box">
          <h1 class="each_h1">一次性签约退租情况</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【退租资产】</td>
                 <td class="info_words"><i class="c669">${map['throw_info'].lease_asset}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【资产类型】</td>
                 <td class="info_words">${map['throw_info'].asset_type}</td>
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
                 <td class="info_title">【租金退费】</td>
                 <td class="info_words">${map['throw_info'].throw_fee}</td>
               </tr>
                                        <tr>
                 <td class="info_title">【${map['throw_info'].fee_name}】</td>
                 <td class="info_words">${map['throw_info'].fee_value}</td>
               </tr>                       
                <tr>
                 <td class="info_title">【退租原因】</td>
                 <td class="info_words">${map['throw_info'].throw_reason}</td>
               </tr>
             </table>
          </div>
        </div>

      </div>
    </div>
    <!--业务-->

  