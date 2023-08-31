<aside class="main-sidebar sidebar-dark-primary elevation-4" style="background:#002E6D">
	<a href="dashboard" class="brand-link" title="Executive Mentoring & Coaching" style="background:#002E6D">
		<!-- <img src="usedStaticFiles/images/white-logo-120x120.png" class="brand-image img-circle img-circle elevation-5" alt="Anand Icon"> -->
		<img src="usedStaticFiles/images/white-icon.ico" class="brand-image img-circle img-circle elevation-5" alt="Anand Icon">
		<!-- <span class="brand-text font-weight-light text-white" style="font-size: 13.5px;"><strong>EMC Tracker</strong></span> -->
		<span class="brand-text font-weight-light text-white"><strong>EMC Tracker</strong></span>
	</a>
	<div class="sidebar">
		<%-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="nav-link">
				<i class="nav-icon fas fa-user-alt text-white"></i>
			</div>
			<div class="info">
				<a href="#" class="d-block">${sessionUserInfo.userFirstName } ${sessionUserInfo.userLastName }</a>
			</div>
		</div> --%>
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item">
					<a href="dashboard" class="nav-link text-white" title="Dashboard">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="dashboard" class="nav-link text-white" title="Dashboard">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>ACT Dashboard</p>
					</a>
				</li>
				<li class="nav-item has-treeview">
					<a href="#" class="nav-link text-white">
						<i class="nav-icon fas fa-user-shield"></i>
						<p>Admin<i class="right fas fa-angle-left"></i></p>
					</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item">
							<a href="employee" class="nav-link text-white">
								<i class="far fa-user nav-icon"></i>
								<p>Add/Edit Employee</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="company" class="nav-link text-white">
								<i class="fas fa-building nav-icon"></i>
								<p>Add/Edit Company</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="location" class="nav-link text-white">
								<i class="fas fa-location-arrow nav-icon"></i>
								<p>Add/Edit Location</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="designation" class="nav-link text-white">
								<i class="fas fa-layer-group nav-icon"></i>
								<p>Add/Edit Designation</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="memberType" class="nav-link text-white">
								<i class="fas fa-sitemap nav-icon"></i>
								<p>Add/Edit Member Type</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="memberLevel" class="nav-link text-white">
								<i class="fas fa-level-up-alt nav-icon"></i>
								<p>Add/Edit Employee Level</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="role" class="nav-link text-white">
								<i class="fas fa-user-tag nav-icon"></i>
								<p>Add/Edit Employee Role</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="menu" class="nav-link text-white">
								<i class="fas fa-th-list nav-icon"></i>
								<p>Add/Edit Menu Master</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/inline.html" class="nav-link text-white">
								<i class="fas fa-map-signs nav-icon"></i>
								<!-- <p>Add/Edit Role Based Screen Mapping</p> -->
								<p>Role-Screen Map</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/inline.html" class="nav-link text-white">
								<i class="fas fa-map-signs nav-icon"></i>
								<p>Company-Location Map</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/inline.html" class="nav-link text-white">
								<i class="fas fa-envelope nav-icon"></i>
								<p>Add Emailing Groups</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/inline.html" class="nav-link text-white">
								<i class="fas fa-mail-bulk nav-icon"></i>
								<p>Add/Edit Email To Group</p>
							</a>
						</li>
					</ul>
				</li>
				
				
				
				
				
				
				<li class="nav-item has-treeview">
					<a href="#" class="nav-link text-white">
						<i class="nav-icon fas fa-book-reader"></i>
						<p>Coaching Batch<i class="right fas fa-angle-left"></i></p>
					</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item">
							<a href="addCoachingBatch" class="nav-link text-white">
								<i class="fas fa-plus-circle nav-icon"></i>
								<p>Create - Coaching Batch</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="editCoachingBatch" class="nav-link text-white">
								<i class="nav-icon fas fa-users"></i>
								<p>List - Coaching Batch</p>
							</a>
						</li>
					</ul>
				</li>
				
				
				<li class="nav-item has-treeview">
					<a href="#" class="nav-link text-white">
						<i class="nav-icon fas fa-info-circle"></i>
						<p>Coaching Details<i class="right fas fa-angle-left"></i></p>
					</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item">
							<a href="pages/charts/chartjs.html" class="nav-link text-white">
								<i class="fas fa-plus-circle nav-icon"></i>
								<p>Add Trio Meeting Info</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/flot.html" class="nav-link text-white">
								<i class="nav-icon fas fa-bullseye"></i>
								<p>Add Coaching Goals</p>
							</a>
						</li>
					</ul>
				</li>
				
				
				
				<li class="nav-item has-treeview">
					<a href="#" class="nav-link text-white">
						<i class="nav-icon fas fa-list-alt"></i>
						<p>Reports<i class="right fas fa-angle-left"></i></p>
					</a>
					<ul class="nav nav-treeview" style="display: none;">
						<li class="nav-item">
							<a href="pages/charts/chartjs.html" class="nav-link text-white">
								<i class="nav-icon fas fa-map-signs"></i>
								<p>Coach-Coachee Map</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/flot.html" class="nav-link text-white">
								<i class="nav-icon fas fa-clipboard-check"></i>
								<p>Session Coverage</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="pages/charts/flot.html" class="nav-link text-white">
								<i class="nav-icon fas fa-list-alt"></i>
								<p>All Coaching Reports</p>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="nav-item">
					<a href="dashboard" class="nav-link text-white" title="Dashboard">
						<!-- <i class="nav-icon fas fa-tachometer-alt text-success"></i> -->
						<i class="nav-icon fas fas fa-list-alt"></i>
						<p>Process Owner Report</p>
					</a>
				</li>
				
				
				
				
				
				
			</ul>
		</nav>
	</div>
</aside>