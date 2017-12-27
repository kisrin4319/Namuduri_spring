<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Dashboard</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
            <div class="col-sm-6 col-md-2">
              <div class="card text-white bg-info">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-people"></i>
                  </div>
                  <div class="h4 mb-0">87.500</div>
                  <small class="text-muted text-uppercase font-weight-bold">Visitors</small>
                  <div class="progress progress-white progress-xs mt-3">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card text-white bg-success">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-user-follow"></i>
                  </div>
                  <div class="h4 mb-0">385</div>
                  <small class="text-muted text-uppercase font-weight-bold">New Clients</small>
                  <div class="progress progress-white progress-xs mt-3">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card text-white bg-warning">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-basket-loaded"></i>
                  </div>
                  <div class="h4 mb-0">1238</div>
                  <small class="text-muted text-uppercase font-weight-bold">Products sold</small>
                  <div class="progress progress-white progress-xs mt-3">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card text-white bg-primary">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-pie-chart"></i>
                  </div>
                  <div class="h4 mb-0">28%</div>
                  <small class="text-muted text-uppercase font-weight-bold">Returning Visitors</small>
                  <div class="progress progress-white progress-xs mt-3">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card text-white bg-danger">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-speedometer"></i>
                  </div>
                  <div class="h4 mb-0">5:34:11</div>
                  <small class="text-muted text-uppercase font-weight-bold">Avg. Time</small>
                  <div class="progress progress-white progress-xs mt-3">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card text-white bg-info">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-speech"></i>
                  </div>
                  <div class="h4 mb-0">972</div>
                  <small class="text-muted text-uppercase font-weight-bold">Comments</small>
                  <div class="progress progress-white progress-xs mt-3">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>
		
		<div class="row">
            <div class="col-sm-6 col-md-2">
              <div class="card">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-people"></i>
                  </div>
                  <div class="h4 mb-0">87.500</div>
                  <small class="text-muted text-uppercase font-weight-bold">Visitors</small>
                  <div class="progress progress-xs mt-3 mb-0">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-user-follow"></i>
                  </div>
                  <div class="h4 mb-0">385</div>
                  <small class="text-muted text-uppercase font-weight-bold">New Clients</small>
                  <div class="progress progress-xs mt-3 mb-0">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-basket-loaded"></i>
                  </div>
                  <div class="h4 mb-0">1238</div>
                  <small class="text-muted text-uppercase font-weight-bold">Products sold</small>
                  <div class="progress progress-xs mt-3 mb-0">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-pie-chart"></i>
                  </div>
                  <div class="h4 mb-0">28%</div>
                  <small class="text-muted text-uppercase font-weight-bold">Returning Visitors</small>
                  <div class="progress progress-xs mt-3 mb-0">
                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-speedometer"></i>
                  </div>
                  <div class="h4 mb-0">5:34:11</div>
                  <small class="text-muted text-uppercase font-weight-bold">Avg. Time</small>
                  <div class="progress progress-xs mt-3 mb-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
            <div class="col-sm-6 col-md-2">
              <div class="card">
                <div class="card-block">
                  <div class="h1 text-muted text-right mb-4">
                    <i class="icon-speech"></i>
                  </div>
                  <div class="h4 mb-0">972</div>
                  <small class="text-muted text-uppercase font-weight-bold">Comments</small>
                  <div class="progress progress-xs mt-3 mb-0">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>
		  
		  <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-block">
                  <div class="row">
                    <div class="col-sm-12 col-lg-9">
                     
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <div>
                          <div class="callout">
                            <small class="text-muted">CTR</small>
                            <br>
                            <strong class="h4">23%</strong>
                          </div>
                      </div>
                      <hr class="mt-0">
                      <ul class="icons-list">
                        <li>
                          <div class="desc">
                            <div class="title">BOOK</div>
                            <small>value</small>
                          </div>
                        </li>
                        <li class="divider text-center">
                          <button type="button" class="btn btn-sm btn-link text-muted" data-toggle="tooltip" data-placement="top" title="show more"><i class="icon-options"></i></button>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
	</div>
</body>
</html>