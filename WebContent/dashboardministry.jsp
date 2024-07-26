<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>National Scholarship Portal</title>
    <link rel="stylesheet" href=".\css\dashboardinstitutestyle.css" />
    <!-- Boxicons CDN Link -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body>
    <div class="sidebar">
      <div class="logo-details">
        <span class="logo_name"><h5>National Scholarship Portal</h5></span>
      </div>
      <ul class="nav-links">
        <li>
          <a href="dashboardministry.jsp" class="active">
            <i class="bx bx-grid-alt"></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-box"></i>
            <span class="links_name">Add Scholarship</span>
          </a>
        </li>
        <li>
          <a href="DashboardState">
            <i class="bx bx-pie-chart-alt-2"></i>
            <span class="links_name">Institute Applications</span>
          </a>
        </li>
        <li>
          <a href="MScholarapprove">
            <i class="bx bx-coin-stack"></i>
            <span class="links_name">Scholarship Applications</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-book-alt"></i>
            <span class="links_name">Print Application</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-message"></i>
            <span class="links_name">Notifications</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-heart"></i>
            <span class="links_name">Favrorites</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-cog"></i>
            <span class="links_name">Setting</span>
          </a>
        </li>
        <li class="log_out">
          <a href="logout.jsp">
            <i class="bx bx-log-out"></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
    </div>
    
    <section class="home-section">
      <nav>
        <div class="sidebar-button">
          <i class="bx bx-menu sidebarBtn"></i>
          <span class="dashboard">Dashboard</span>
        </div>
        <div class="search-box">
          <input type="text" placeholder="Search..." />
          <i class="bx bx-search"></i>
        </div>
        <div class="profile-details">
          <span class="admin_name">Ministry view</span>
        </div>
      </nav>

      <div class="home-content">
        <div class="overview-boxes">
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Total Applicants</div>
              <div class="number">876</div>
            </div>
          <!--  <i class="bx bx-cart-alt cart"></i> -->
          </div>
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Eligible Applicants</div>
              <div class="number">376</div>
            </div>
         <!--   <i class="bx bxs-cart-add cart two"></i> -->
          </div>
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Subsidy Amount</div>
              <div class="number">&#8377 12,876</div>
            </div>
         <!--   <i class="bx bx-cart cart three"></i> -->
          </div>
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Total Scheme</div>
              <div class="number">11</div>  
            </div>
         <!--   <i class="bx bxs-cart-download cart four"></i> -->
          </div>
        </div>

        <div class="sales-boxes">
          <div class="recent-sales box">
            <div class="title">Pending for Approval</div>
            <div class="sales-details">
              <ul class="details">
                <!-- select studentName, aadharNumber, DOB, mobileNumber from student where instituteApproved = "No"; -->
                <li class="topic">Student Name</li>
                <li><a href="#">Komal Suresh</a></li>
              </ul>
              <ul class="details">
                <li class="topic">Age</li>
                <li><a href="#">19</a></li>
              </ul>
              <ul class="details">
                <li class="topic">Aadhar Number</li>
                <li><a href="#">948294930529</a></li>
              </ul>
              <ul class="details">
                <li class="topic">Mobile Number</li>
                <li><a href="#">9986211570</a></li>
              </ul>
            </div>
            <div class="button">
              <a href="#">View Form</a>
            </div>
          </div>
          <div class="top-sales box">
            <div class="title">All Schemes</div>
            <ul class="top-sales-details">
              <li>
                  <span class="product">Post Matric Scholarship</span>
                </a>
                <span class="price">Ministry of Minority Affairs</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <script>
      let sidebar = document.querySelector(".sidebar");
      let sidebarBtn = document.querySelector(".sidebarBtn");
      sidebarBtn.onclick = function () {
        sidebar.classList.toggle("active");
        if (sidebar.classList.contains("active")) {
          sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
        } else sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      };
    </script>
  </body>
</html>
