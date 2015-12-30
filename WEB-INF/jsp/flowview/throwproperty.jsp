<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
  
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_throw_infoent">
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">
          <c:choose>
          	<c:when test="${map['throw_info'].is_lessee == '1'}">租户</c:when>
          	<c:otherwise>客户</c:otherwise>
          </c:choose>信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【租户】</td>
                 <td class="info_words"><i class="c669">${map['lessee'].lessee_name}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【联系方式】</td>
                 <td class="info_words">${map['lessee'].throw_infoact}（${map['lessee'].mobile}）</td>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
 		<div class="each_box">
          <h1 class="each_h1">物业合同信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【租赁房间】</td>
                 <td class="info_words"><i class="c669">${map['throw_info'].all_house}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【租赁面积】</td>
                 <td class="info_words">${map['throw_info'].area_sum}</td>
               </tr>
               <tr>
                 <td class="info_title">【合同编码】</td>
                 <td class="info_words">${map['throw_info'].cont_no}</td>
               </tr>
               <tr>
                 <td class="info_title">【物业服务费】</td>
                 <td class="info_words">${map['throw_info'].loan_price}</td>
               </tr>
               <tr>
                 <td class="info_title">【付费方式】</td>
                 <td class="info_words">${map['throw_info'].pay_type}</td>
               </tr>
                 <tr>
                 <td class="info_title">【退房时间】</td>
                 <td class="info_words">${map['throw_info'].throw_time}</td>
               </tr>
                 <tr>
                 <td class="info_title">【退房原因】</td>
                 <td class="info_words">${map['throw_info'].throw_reason}</td>
               </tr>
               
             </table>
          </div>
        </div>
        
         <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">退租抄表</h1>
          <div class="clearfix each_info">
             <table>
               <tr style="color:#7c7b7b;">
                 <td width="32%">房号</td>
                 <td width="19%">表类型</td>
                 <td>抄表日期</td>
                 <td width="20%">表码</td>
               </tr>
               <c:forEach var='meter' items='${meterInfos}' varStatus='status'>
               <tr>
                 <td class="info_title"><i class="c669">${meter.house_no }</i></td>
                 <td class="info_words">${meter.meter_name }</td>
                 <td class="info_words">${meter.reads_date }</td>
                 <td class="info_words">${meter.meter_num }</td>
               </tr>
               </c:forEach>
             </table>
          </div>
        </div>
            <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">物业说明</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【原因】</td>
                 <td class="info_words"><i class="c669">${map['throw_info'].remark_whec}</i></td>
               </tr>
             </table>
          </div>
        </div>
                <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">财务说明</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【原因】</td>
                 <td class="info_words"><i class="c669">${map['throw_info'].remark_chec}</i></td>
               </tr>
             </table>
          </div>
        </div>
      </div>
    </div>
    <!--业务-->

  