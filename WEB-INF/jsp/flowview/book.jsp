<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

 <!--审批业务名称及返回按钮-->
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
                 <td class="info_words"><i class="c669">${map['lessee_info'].lessee_name}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【联系方式】</td>
                 <td class="info_words">${map['lessee_info'].contact}（${map['lessee_info'].mobile}）</td>
               </tr>
             </table>
          </div>
        </div>
        
        <!--审批业务-->
        <!--审批业务-->
        <div class="each_box">
          <h1 class="each_h1">预订信息</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【预订房间】</td>
                 <td class="info_words"><i class="c669">${map['book_info'].book_house}</i>&nbsp;<i class="c333">${map['book_info'].house_num}间（${map['book_info'].house_area}平）</i></td>
               </tr>
               <tr>
                 <td class="info_title">【最早入住】</td>
                 <td class="info_words">${map['book_info'].holp_date}</td>
               </tr>
               <tr>
                 <td class="info_title">【预订订金】</td>
                 <td class="info_words">${map['book_info'].book_fee}元</td>
               </tr>
               <tr>
                 <td class="info_title">【备注】</td>
                 <td class="info_words">${map['book_info'].remark}</td>
               <tr>
                 <td class="info_title">【预订时间】</td>
                 <td class="info_words">${map['book_info'].book_time}</td>
               </tr>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
      </div>
    </div>
    <!--业务-->