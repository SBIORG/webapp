<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
  
    <!--审批业务名称及返回按钮-->
    <!--业务-->
    <div class="phone_work_sp">
      <div class="inner_throwlease_infoent">
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
                 <td class="info_words">${map['lessee'].throwlease_infoact}（${map['lessee'].mobile}）</td>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
 		<div class="each_box">
          <h1 class="each_h1">房屋退租情况</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【租赁房间】</td>
                 <td class="info_words"><i class="c669">${map['throwlease_info'].house_no}</i></td>
               </tr>
               <tr>
                 <td class="info_title">【租赁面积】</td>
                 <td class="info_words">${map['throwlease_info'].lease_area}平方米</td>
               </tr>
               <tr>
                 <td class="info_title">【租赁房价】</td>
                 <td class="info_words">${map['throwlease_info'].loan_price}</td>
               </tr>
               <tr>
                 <td class="info_title">【押金】</td>
                 <td class="info_words">${map['throwlease_info'].deposit}元</td>
               </tr>
               <tr>
                 <td class="info_title">【租赁期限】</td>
                 <td class="info_words">${map['throwlease_info'].z_date}</td>
               </tr>
                <tr>
                 <td class="info_title">【退房时间】</td>
                 <td class="info_words">${map['throwlease_info'].throw_time}</td>
               </tr>
                           <tr>
                 <td class="info_title">【退房原因】</td>
                 <td class="info_words">${map['throwlease_info'].throw_reason}</td>
               </tr>
             </table>
          </div>
        </div>
        <!--审批业务-->
 		<div class="each_box">
          <h1 class="each_h1">租务说明</h1>
          <div class="clearfix each_info">
             <table>
               <tr>
                 <td class="info_title">【原因】</td>
                 <td class="info_words"><i class="c669">${map['throwlease_info'].remark_zhec}</i></td>
               </tr>
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
                 <td class="info_words"><i class="c669">${map['throwlease_info'].remark_whec}</i></td>
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
                 <td class="info_words"><i class="c669">${map['throwlease_info'].remark_chec}</i></td>
               </tr>
             </table>
          </div>
        </div>
      </div>
    </div>
    <!--业务-->

  