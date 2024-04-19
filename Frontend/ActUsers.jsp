<%-- 
    Document   : ActUsers
    Created on : Dec 18, 2022, 11:52:31 PM
    Author     : Murthi
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="AuthorizedSearch.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Authorized Keyword Search over Outsourced Encrypted Data in Cloud Environment</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/table.css" rel="stylesheet">
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s" style="background:  #338aff ">
            <br>
            <br>
            <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s"  style="background:  #338aff ">
                <a href="#" class="navbar-brand ms-4 ms-lg-0">
                    <h3 class="display-6 m-0" style="color: white">Attribute Authority</h3>
                </a>
                <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto p-4 p-lg-0">
                        <a href="AAHome.jsp" style="color: white" class="nav-item nav-link">AA Home</a>
                        <a href="UserAct.jsp" style="color: white" class="nav-item nav-link">User Activations</a>
                        <a href="ActUsers.jsp" style="color: white" class="nav-item nav-link">Active Users</a>
                        <a href="logout.jsp" style="color: white" class="nav-item nav-link active">Logout</a>
                    </div>
                </div>
            </nav>
        </div>

        <!-- About Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <br><br><br><br><br>
                        <h2>Active Users</h2><br><br>
                        <center><table id="naresh">
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Dob</th>
                                    <th>Gender</th>
                                    <th>Status</th>
                                    <th>Reg.time</th>
                                </tr>
                                <%
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("Select * from users where ustatus ='Active'");
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString("id")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("email")%></td>
                                    <td><%=rs.getString("phone")%></td>
                                    <td><%=rs.getString("dob")%></td>
                                    <td><%=rs.getString("gender")%></td>
                                    <td><%=rs.getString("ustatus")%></td>
                                    <td><%=rs.getString("regtime")%></td>
                                </tr>
                                <%                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </table></center> 
                        <br><br><br><br><br><br><br>

                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright Start -->
        <div class="container-fluid copyright py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; Authorized Keyword Search over Outsourced
                        Encrypted Data in Cloud Environment. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>


