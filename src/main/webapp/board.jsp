<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="hm-gradient">
    
    <main>
        
        <!--MDB Tables-->
        <div class="container mt-4">

            <div class="text-center darken-grey-text mb-4">
                <h1 class="font-bold mt-4 mb-3 h5">Built with Material Design for Bootstrap 4</h1>
                <a class="btn btn-danger btn-md" href="https://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">Free download<i class="fa fa-download pl-2"></i></a>
            </div>

            <div class="card mb-4">
                <div class="card-body">
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-12">
                            <h2 class="pt-3 pb-4 text-center font-bold font-up deep-purple-text">Search within table</h2>
                            <div class="input-group md-form form-sm form-2 pl-0">
                                <input class="form-control my-0 py-1 pl-3 purple-border" type="text" placeholder="Search something here..." aria-label="Search">
                                <span class="input-group-addon waves-effect purple lighten-2" id="basic-addon1"><a><i class="fa fa-search white-text" aria-hidden="true"></i></a></span>
                            </div>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                    <!--Table-->
                    <table class="table table-striped">
                        <!--Table head-->
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <!--Table head-->
                        <!--Table body-->
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                        <!--Table body-->
                    </table>
                    <!--Table-->
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-12">
                            <h2 class="pt-3 pb-4 text-center font-bold font-up danger-text">Bordered table</h2>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                    <table class="table table-bordered red-border text-center">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <!--Table-->
                    <table class="table table-hover">
                        <!--Table head-->
                        <thead class="mdb-color darken-3">
                            <tr class="text-white">
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                                <th>Country</th>
                                <th>City</th>
                            </tr>
                        </thead>
                        <!--Table head-->
                        <!--Table body-->
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>USA</td>
                                <td>New York</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                <td>Spain</td>
                                <td>Madrid</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                                <td>Italy</td>
                                <td>Rome</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Anna</td>
                                <td>Doe</td>
                                <td>@anna</td>
                                <td>Poland</td>
                                <td>Warsaw</td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>Mary</td>
                                <td>Kate</td>
                                <td>@olsen</td>
                                <td>Germany</td>
                                <td>Berlin</td>
                            </tr>
                        </tbody>
                        <!--Table body-->
                    </table>
                    <!--Table-->
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-12">
                            <h2 class="py-3 text-center font-bold font-up success-text">Colorful table</h2>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Column heading</th>
                                <th>Column heading</th>
                                <th>Column heading</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table-success">
                                <th scope="row">3</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr class="table-info">
                                <th scope="row">5</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr>
                                <th scope="row">6</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr class="table-warning">
                                <th scope="row">7</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr>
                                <th scope="row">8</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr class="table-danger">
                                <th scope="row">9</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-12">
                            <h2 class="py-3 text-center font-bold font-up blue-text">Table with pagination</h2>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                    <!--Table-->
                    <table class="table table-hover table-responsive mb-0">
                        <!--Table head-->
                        <thead>
                            <tr>
                                <th scope="row">#</th>
                                <th class="th-lg"><a>First Name</a></th>
                                <th class="th-lg"><a href="">Last Name</a></th>
                                <th class="th-lg"><a href="">Username</a></th>
                                <th class="th-lg"><a href="">Username</a></th>
                                <th class="th-lg"><a href="">Username</a></th>
                                <th class="th-lg"><a href="">Username</a></th>
                            </tr>
                        </thead>
                        <!--Table head-->
                        <!--Table body-->
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Paul</td>
                                <td>Topolski</td>
                                <td>@P_Topolski</td>
                                <td>Paul</td>
                                <td>Topolski</td>
                                <td>@P_Topolski</td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                        <!--Table body-->
                    </table>
                    <!--Bottom Table UI-->
                    <div class="d-flex justify-content-center">
                        <!--Pagination -->
                        <nav class="my-4 pt-2">
                            <ul class="pagination pagination-circle pg-blue mb-0">
                                <!--First-->
                                <li class="page-item disabled clearfix d-none d-md-block"><a class="page-link">First</a></li>
                                <!--Arrow left-->
                                <li class="page-item disabled">
                                    <a class="page-link" aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                </li>
                                <!--Numbers-->
                                <li class="page-item active"><a class="page-link">1</a></li>
                                <li class="page-item"><a class="page-link">2</a></li>
                                <li class="page-item"><a class="page-link">3</a></li>
                                <li class="page-item"><a class="page-link">4</a></li>
                                <li class="page-item"><a class="page-link">5</a></li>
                                <!--Arrow right-->
                                <li class="page-item">
                                    <a class="page-link" aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                </li>
                                <!--First-->
                                <li class="page-item clearfix d-none d-md-block"><a class="page-link">Last</a></li>
                            </ul>
                        </nav>
                        <!--/Pagination -->
                    </div>
                    <!--Bottom Table UI-->
                </div>
            </div>
          
            <hr class="my-4">
          
            <div class="text-center darken-grey-text mb-4">
                <h3 class="font-bold mb-3">Here you can find more Tables:</h3>
                <a class="btn btn-danger" href="https://mdbootstrap.com/content/tables/" target="_blank">Bootstrap Tables</a>
            </div>

        </div>
        <!--MDB Tables-->
      
    </main>
  
</body>
</html>