<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<aside class="main-sidebar sidebar-dark-primary elevation-4 bg-color-anand-two">
	  <a href="dashboard" class="brand-link bg-color-anand-two" title="ANAND Central">
	    <img src="usedStaticFiles/images/white-icon.ico" class="brand-image img-circle img-circle elevation-5" alt="Anand Icon">
	    <span class="brand-text font-weight-light font-weight-bold text-white">ANAND Admin</span>
	  </a>
	  <div class="sidebar">
	    <nav class="mt-2">
	      <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
	        <li class="nav-item">
	          <a href="dashboard" class="nav-link text-white" title="Dashboard">
	            <i class="nav-icon fas fa-tachometer-alt"></i>
	            <p class="font-weight-bold">Dashboard</p>             
	          </a>
	        </li>
	        <c:if test="${itAdmin eq 1 }">
	          <li class="nav-item">
	            <a href="master" class="nav-link text-white" title="Masters">
	              <i class="nav-icon fas fa-database"></i>
	              <p class="font-weight-bold">Admin Dashboard</p>             
	            </a>
	          </li>
	        </c:if>
	      </ul>
        </nav>
      </div>
    </aside>