<%-- 
    Document   : index
    Created on : Dec 14, 2022, 4:56:03 PM
    Author     : Murthi
--%>
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
                    <h3 class="display-6 m-0" style="color: white">Authorized Keyword Search</h3>
                </a>
                <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto p-4 p-lg-0">
                        <a href="AA.jsp" style="color: white" class="nav-item nav-link">Attribute Authority</a>
                        <a href="VA.jsp" style="color: white" class="nav-item nav-link">Verification Authority</a>
                        <a href="CSP.jsp" style="color: white" class="nav-item nav-link">CSP</a>
                        <a href="Owner.jsp" style="color: white" class="nav-item nav-link">Owner</a>
                        <a href="User.jsp" style="color: white" class="nav-item nav-link active">User</a>
                    </div>
                </div>
            </nav>
        </div>


        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="img/cloud.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <br>
                                <br>
                                <div class="row justify-content-start">
                                    <div class="col-lg-8">
                                        <h1 class="display-6 mb-4 animated slideInDown">Authorized Keyword Search over Outsourced Encrypted Data in Cloud Environment</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="img/cloud1.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <br>
                                <br>
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-1 mb-4 animated slideInDown">Outsourced Encrypted Data in Cloud Environment</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- About Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <h1 class="mb-4">Abstract</h1>
                        <p align="justify">For better data availability and accessibility while ensuring data secrecy, end-users often tend to outsource their data to the
                            cloud servers in an encrypted form. However, this brings a major challenge to perform the search for some keywords over encrypted
                            content without disclosing any information to unintended entities. This paper proposes a novel expressive authorized keyword search
                            scheme relying on the concept of ciphertext-policy attribute-based encryption. The originality of the proposed scheme is multifold. First,
                            it supports the generic and convenient multi-owner and multi-user scenario, where the encrypted data are outsourced by several data
                            owners and searchable by multiple users. Second, the formal security analysis proves that the proposed scheme is semantically
                            secure against chosen keyword and outsiders keyword guessing attacks. Third, an interactive protocol is introduced which avoids the
                            need of any secure-channels between users and service provider. Fourth, due to the concept of bilinear-map accumulator, the system
                            can efficiently revoke users and/or their attributes, and authenticate them prior to launching any expensive search operations. Fifth,
                            conjunctive keyword search is provided thus enabling to search for multiple keywords simultaneously, with minimal cost. Sixth, the
                            performance analysis shows that the proposed scheme outperforms closely-related works.</p>
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
