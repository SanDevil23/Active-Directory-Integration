<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="main-footer" style="color: #002E6D;font-size: 12px;">
	  <div class="float-right d-none d-sm-block">
	    <c:choose>
	      <c:when test="${AEMS eq 1 }">
	        <b>AEMS</b> v.1.0.0<br>
	      </c:when>
	      <c:otherwise>
	        <b>HR Central</b> v.1.0.0<br>
	      </c:otherwise>
	    </c:choose>
	  </div>
	  <div class="float-left d-none d-sm-block">
	    Developed &amp; Maintained by <b>ANAND Automotive Private Limited</b>
	  </div>
	  <img width="100%" src="usedStaticFiles/images/anand_footer_large.png" />
	</footer>