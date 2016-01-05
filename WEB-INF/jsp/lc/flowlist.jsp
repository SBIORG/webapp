<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>微信页面</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/page.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/center.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mobiscroll.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mobiscroll_date.css"/>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.7.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.touchSwipe.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/iscroll.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/main.js" type="text/javascript"></script>
</head>
<style>
  html,body{
	  background:#f3f3f3;
  }
</style>

<body>
  <!--content-->
  <div class="content">
      <!--意见反馈-->
      <div class="feedback_btn">
        <a href="<%=request.getContextPath()%>/yjfk.jsp?url=<%=request.getHeader("Referer")%>"></a>
      </div>
      <!--意见反馈-->
    <!--业务-->
    <div class="phone_work" id="wrapper">
        <div id="scroller">
          <!---->
          <div class="inner_content" id="thelist">
            <!--每一条业务信息-->
            <c:forEach items="${flowBusPojos}" var="bus" varStatus="status">
            <a class="all_link" href="${pageContext.request.contextPath}/lc/view.action?flowId=${bus.flow_id}">
                <div class="each_box">
                  <h1 class="each_h1">${bus.flow_name }</h1>
                  <div class="clearfix each_info">
                     <span class="fl info_text all_link_span">${bus.lessee_name } ${bus.node_name }。</span>
                     <span class="fr each_time">${bus.time }</span>
                  </div>
                </div>
            </a>
            </c:forEach>
          </div>
          <!---->
          <div id="pullUp">
             <span class="pullUpIcon"></span><span class="pullUpLabel">Pull up to refresh...</span>
          </div>
        </div>
    </div>
    <!--业务-->
  </div>

  <!--content-->
  <script>
	var myScroll,pullDownEl, pullDownOffset,pullUpEl, pullUpOffset;//generatedCount = 0;

//function pullDownAction () {  //下拉获取最新内容
//	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
//		var el, li, i;
//		el = document.getElementById('thelist');
//
//		for (i=0; i<3; i++) {
//			li = document.createElement('li');
//			li.innerText = 'Generated row ' + (++generatedCount);
//			el.insertBefore(li, el.childNodes[0]);
//		}
//		
//		myScroll.refresh();		// Remember to refresh when contents are loaded (ie: on ajax completion)
//	}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
//}
var flag=1;
var isLoadAjax = true;
var loadOver = false;
function pullUpAction () { //上拉加载更多内容  动态发送ajax请求获取内容
	//setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
		
		var el, a, i, content;
		el = document.getElementById('thelist');
		flag=flag+1;
		showUrl="${pageContext.request.contextPath}/lc/view.action?flowId=";
		if(isLoadAjax==true){
			 $.ajax({
					type: "GET",
					url: "${pageContext.request.contextPath}/lc/ajaxList.action?page="+flag,
					dataType: "json",
					success: function(data){
						// alert(data);
						 var dataObj=data;
						 
						 if(dataObj.result!=1){
						 }else if(dataObj.result==1){
							 //alert(dataObj.data);
							 listdata = eval(dataObj.data);
							 if(listdata.length==0 || listdata=='' ){
								 isLoadAjax=false;
								 a = document.createElement('a');
								 $('#pullUp').hide();
								 a.innerHtml="<div class='each_info' style='color:#333; text-align:center;'>暂无数据</div>";
								 
								 el.appendChild(a, el.childNodes[0]);
								
							 }
							 $.each(listdata, function(index){
								//alert(index);
							    
									a = document.createElement('a');
									// cHtml+='<option value="'+index+'">'+data[index]+'</option>';
									a.innerHTML = "<a class='all_link' href='"+showUrl+listdata[index].flow_id+"'><div class='each_box'>"
												  +"<h1 class='each_h1'>"+listdata[index].flow_name+"</h1>"
												  +"<div class='clearfix each_info'>"
												  +"<span class='fl info_text all_link_span'>"+listdata[index].lessee_name+listdata[index].node_name+"。</span>"
												  +"<span class='fr each_time'>"+listdata[index].time+"</span>"
												  +"</div></div></a>";	  
								
									el.appendChild(a, el.childNodes[0]);
							 })
							 if(listdata.length<30)
							 {
								 isLoadAjax=false;
								 a = document.createElement('a');
								 $('#pullUp').hide();
								 a.innerHtml="<div class='each_info' style='color:#333; text-align:center;'>暂无数据</div>";
								 
								 el.appendChild(a, el.childNodes[0]);
								
							 } 
							 loadOver = true;
					   }
				   },
		        });
			
		}
       
		
		myScroll.refresh();		// Remember to refresh when contents are loaded (ie: on ajax completion)
	//}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
}

function loaded() {
	//pullDownEl = document.getElementById('pullDown');
	//pullDownOffset = pullDownEl.offsetHeight;
	pullUpEl = document.getElementById('pullUp');	
	pullUpOffset = pullUpEl.offsetHeight;
	myScroll = new iScroll('wrapper', {
		useTransition: true,
		topOffset: pullDownOffset,
		onRefresh: function () {
			//if (pullDownEl.className.match('loading')) {
//				pullDownEl.className = '';
//				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Pull down to refresh...';
//			} else 
			if (pullUpEl.className.match('loading')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';//Pull up to load more...
			}
		},
		onScrollMove: function () {
			//if (this.y > 5 && !pullDownEl.className.match('flip')) {
//				pullDownEl.className = 'flip';
//				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Release to refresh...';
//				this.minScrollY = 0;
//			} else if (this.y < 5 && pullDownEl.className.match('flip')) {
//				pullDownEl.className = '';
//				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Pull down to refresh...';
//				this.minScrollY = -pullDownOffset;
//			} else 
			if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放刷新...';//Release to refresh...
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...'; //Pull up to load more...
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () {
			/*if (pullDownEl.className.match('flip')) {
				pullDownEl.className = 'loading';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Loading...';				
				pullDownAction();	// Execute custom function (ajax call?)
			} else */
			if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载...';
				
					pullUpAction();	// Execute custom function (ajax call?)
				
				
			}
		}
	});
	
	//setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
}


if(flag==1 || loadOver == true){
	document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
	document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded); }, false);
}

  </script>

 </body>
</html>
