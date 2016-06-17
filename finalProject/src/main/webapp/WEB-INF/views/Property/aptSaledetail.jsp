

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
  text-align: center;
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
  text-align: center;
}
.list-group{
	text-align: center;
}
.panel-footer{
	text-align: center;
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
                        
                     <c:if test="${property.pr_imageName != null}">
				
						<c:set var="head"
							value="${fn:substring(property.pr_imageName,0,fn:length(property.pr_imageName)-4) }"></c:set>
						<c:set var="pattern"
							value="${fn:substringAfter(property.pr_imageName, head) }"></c:set>
						<img src="../M_upload1/${head }${pattern}" width="300px" height="400" />
						
					</c:if>   
					
					 <c:if test="${property.pr_imageName == null}">
					 
                            <i class="fa fa-desktop"></i> <!-- 사진이없을경우 디폴트이미지로 -->
                     </c:if>         
                            
                            
                            <h3>${property.pr_group }</h3> 
                       		<a href="/Property/aptUpdate?pr_propertyNo=${property.pr_propertyNo }">수정하기</a>
                       		<a href="/Property/aptDelete?pr_propertyNo=${property.pr_propertyNo }">삭제하기</a>
                       		
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>희망가 : ${property.pr_price }</strong></p>
                            <p><strong>보증금 :${property.pr_deposit }</strong></p>
                            <p><strong>연락처 : ${property.pr_tel }</strong></p>
                        </div>
                        <ul class="list-group text-center">
                        <li class="list-group-item"><i class="fa fa-check"></i>판매자 : ${property.m_memberNo }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>건물명 : ${property.pr_deposit }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>주소 : ${property.pr_addr }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>해당 층 : ${property.pr_level }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>아파트 층수 : ${property.pr_totalLevel }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>방 개수 : ${property.pr_roomNum } 개</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>화장실 수 : ${property.pr_bathNum } 개</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>실면적 : ${property.pr_roomArea }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>단지규모 : ${property.pr_scale }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>건설회사 : ${property.pr_company }</li>
                             
                            <li class="list-group-item"><i class="fa fa-check"></i> 상세내용 <br>
                            	${property.pr_content }
                     			
                            
                            </li>
                        </ul>
                        <div class="panel-footer">
                       <form method="post" name="send" >
                       							<%-- ${property.m_memberNo } --%>
                       	<input type="hidden" value="${property.m_memberNo }" name="m_memberNo">
                       	<input type="hidden" value="${id }" name="id"> 
                       	
                
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