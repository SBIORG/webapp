<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
  
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_content">
        <!--审批业务-->
        
        
        <div class="each_box">
          <h1 class="each_h1">客户信息</h1>
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
          <h1 class="each_h1">退订信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【退订房间】</td>
                 <td class="info_words"><i class="c669">${map['bookrefund_info'].book_house}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【退订类型】</td>
                 <td class="info_words">${map['bookrefund_info'].refund_type}</td>
               </tr>
               <tr>
                 <td class="info_title">【退订时间】</td>
                 <td class="info_words">${map['bookrefund_info'].op_time}</td>
               </tr>
               <tr>
                 <td class="info_title">【订金退费】</td>
                 <td class="info_words">${map['bookrefund_info'].book_return}</td>
               </tr>
               <tr>
                 <td class="info_title">【缴纳订金】</td>
                 <td class="info_words">${${map['bookrefund_info'].book_fee}}</td>
               </tr>
               <tr>
                 <td class="info_title">【备注】</td>
                 <td class="info_words">${${map['bookrefund_info'].remark}}</td>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
 		
        <!--审批业务-->
      </div>
    </div>
    <!--业务-->

  