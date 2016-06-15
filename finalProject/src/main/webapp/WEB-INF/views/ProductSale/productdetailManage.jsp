

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="../css/Min/bootstrap/bootstrap.min.css" rel="stylesheet">
  <style type="text/css">
 @import url("http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css");
 .panel-pricing {
  -moz-transition: all .3s ease;
  -o-transition: all .3s ease;
  -webkit-transition: all .3s ease;
}
.panel-pricing:hover {
  box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.2);
}
.panel-pricing .panel-heading {
  padding: 20px 10px;
}
.panel-pricing .panel-heading .fa {
  margin-top: 10px;
  font-size: 58px;
}
.panel-pricing .list-group-item {
  color: #777777;
  border-bottom: 1px solid rgba(250, 250, 250, 0.5);
}
.panel-pricing .list-group-item:last-child {
  border-bottom-right-radius: 0px;
  border-bottom-left-radius: 0px;
}
.panel-pricing .list-group-item:first-child {
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
}
.panel-pricing .panel-body {
  background-color: #f0f0f0;
  font-size: 40px;
  color: #777777;
  padding: 20px;
  margin: 0px;
}
 </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

/* function checkId(id2){
	url = "aptMessage.jsp?m_memberNo=" + id2.m_memberNo.value ;
	alert(url);
    open(
          url,
          "confirm",
          "toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=700, height=600");
	
} */

function aaa(id2){

	//alert("url");
	
	
	
	
	url = "/aptMessage?m_memberNo="+id2.m_memberNo.value+"&&id="+id2.id.value;
	//alert(url);
	
	open(
			url,
			"confirm",
			"toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=410, height=280");

}

</script>
 
<title>Insert title here</title>
</head>
<body>
    <section id="plans">
        <div class="container">
            <div class="row">

               
                <!-- item -->
                <div class="col-md-11 text-center">
                    <div class="panel panel-success panel-pricing">
                        <div class="panel-heading">
                        
                            <i class="fa fa-desktop"></i>
                            <h3>${product.pro_no }</h3> 
                       		<a href="/ProductSale/aptUpdate?pro_no=${product.pro_no }">수정하기</a>
                       		<a href="/ProductSale/aptDelete?pro_no=${product.pro_no }">삭제하기</a>
                       		
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>판매자 : ${product.m_memberNo }</strong></p>
                            <p><strong>연락처 :${product.pro_tel }</strong></p>
                            <p><strong>시작일 :${product.pro_startdate } ~ 종료일 : ${product.pro_enddate }</strong></p>
                          
                        
                        </div>
                        <ul class="list-group text-center">
                        <li class="list-group-item"><i class="fa fa-check"></i>분류 : ${product.pro_group  }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>판매상품명 : ${product.pro_name }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>판매가격 : ${product.pro_price }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>총 판매수량 : ${product.pro_num }</li>
                           
       						<li class="list-group-item"><i class="fa fa-check"></i>택배비용 : ${product.checkPost }</li>
                          
                            <li class="list-group-item"><i class="fa fa-check"></i>판매내용 : ${product.pro_context }</li>
                            
                            
                          <li class="list-group-item"><i class="fa fa-check"></i>이미지 : 
                            <c:if test="${product.pro_img1 != null}">
				
							<c:set var="head"
							value="${fn:substring(product.pro_img1,0,fn:length(product.pro_img1)-4) }"></c:set>
							<c:set var="pattern"
							value="${fn:substringAfter(product.pro_img1, head) }"></c:set>
							<img src="../M_upload1/${head }${pattern}" width="300px" height="400" />
						
					</c:if>  
					
                            </li>
                            
                            
                            
                            
                        </ul>
                        
                        
                        <div class="panel-footer">
                       <form method="post" name="send" >
                       							<%-- ${property.m_memberNo } --%>
                       	<input type="hidden" value="${product.m_memberNo }" name="m_memberNo">
                      
                
					    <input type="button" value="쪽지보내기"  onclick="aaa(this.form)" class="btn btn-lg btn-block btn-success">
                       
                       </form>
                                              
                        </div>
                    </div>
                </div>
                <!-- /item -->

            </div>
        </div>
    </section>

</body>
</html>