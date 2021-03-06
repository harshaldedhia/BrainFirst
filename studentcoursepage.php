<?php
session_start();
require("connection.php");
if(!isset($_SESSION["email"]) or $_SESSION['usertype']!='student')
header('location:index.php');
$email = $_SESSION["email"];
if (isset ($_POST["course_id"]))
{
    $_SESSION['course_id'] = $_POST["course_id"];
}

$course_id = $_SESSION['course_id'];
?>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <!--link rel="icon" type="image/png" sizes="16x16" href="img/icon.png"-->
    <title>Courses - BrainFirst</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="css/sidebar-nav.min.css" rel="stylesheet">
    <!-- Animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/home.css" rel="stylesheet">
    <!-- color CSS you can use different color css from css/colors folder -->
    <!-- We have chosen the skin-blue (blue.css) for this starter
          page. However, you can choose any other skin from folder css / colors .
-->
    <link href="css/colors/blue-dark.css" id="theme" rel="stylesheet">

	<style>
	.title
	{
		font-weight:350;
		text-transform:uppercase; 
		font-size:21px; 
		margin:0 0 12px;
	}

	.field
	{
		background-color:#fff;
		border:1px solid #e4e7ea;
		border-radius:0;
		box-shadow:none;
		color:#565656;
		font-size: 16px;
    	font-family: Rubik,sans-serif;
		height:auto;
		max-width:100%;
		padding:7px 12px;
		line-height: 1.5;
		text-transform: none;
		font-weight: 400;
		transition:all 300ms linear 0s
	}

	.course-name
	{
		color: rgba(0,0,0,.5);
		font-weight: 0;
		margin-top: 6px;
		line-height: 22px;
    	font-size: 24px;
    	font-family: Rubik,sans-serif;
    	text-align: center;
    	margin-right: 0px;
	    margin-bottom: 10px;
	    margin-left: 0px;
	    display: inline-block;
	    /*text-transform: uppercase;*/
	}

	.myButton {
	  border-radius: 40px;
	  background-color: #3399FF;
	  border: none;
	  font-family: Rubik,sans-serif;
	  color: #FFFFFF;
	  box-shadow: 0 6px 12px 0 rgba(0,0,0,0.2), 0 4px 16px 0 rgba(0,0,0,0.19);
	  font-size: 18px;
	  width: 120px;
	  height: 40px;
	  padding-left: 5px;
	  transition: all 0.5s;
	  cursor: pointer;
	}

	.myButton span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}

	.myButton span:after {
	  content: '\00bb';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}

	.myButton:hover span {
	  padding-right: 25px;
	}

	.myButton:hover span:after {
	  opacity: 1;
	  right: 0;
	}
	</style>
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>
                <div class="top-left-part"><a class="logo" href="index.php"><b><img src="img/25.png" alt="home" /></b><span class="hidden-xs"><!--img src="img/brainfirst-text.png" alt="home" /--></span></a></div>
                <ul class="nav navbar-top-links navbar-left m-l-20 hidden-xs">
                    <li>
                        <form role="search" class="app-search hidden-xs" method="post" action="student_searchcourses.php">
                            <input type="text" placeholder="Search..." class="form-control" name="search_term"> <!--a href=""--><i class="fa fa-search"></i></a>
                        </form>
                    </li>
                </ul>
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a href="logout.php"><b class="hidden-xs">Log Out</b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- Left navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="studenthome.php" class="waves-effect"><i class="fa fa-arrow-left fa-fw" aria-hidden="true"></i><span class="hide-menu">Back to Dashboard</span></a>
                    </li>
                    <li>
                        <a href="" class="waves-effect"><i class="fa fa-home fa-fw" aria-hidden="true"></i><span class="hide-menu">Course Home</span></a>
                    </li>
                    <li>
                        <a href="student_content.php" class="waves-effect"><i class="fa fa-file fa-fw" aria-hidden="true"></i><span class="hide-menu">Content</span></a>
                    </li>
                    <li>
                        <a href="studentquiz.php" class="waves-effect"><i class="fa fa-check fa-fw" aria-hidden="true"></i><span class="hide-menu">Quiz</span></a>
                    </li>
                    <li>
                        <a href="studentassignment.php" class="waves-effect"><i class="fa fa-edit fa-fw" aria-hidden="true"></i><span class="hide-menu">Assignments</span></a>
                    </li>
                    <li>
                        <a href="studentdiscussionforum.php" class="waves-effect"><i class="fa fa-question fa-fw" aria-hidden="true"></i><span class="hide-menu">Discussion Forum</span></a>
                    </li>
                    <li>
                        <a href="studentgrade.php" class="waves-effect"><i class="fa fa-line-chart fa-fw" aria-hidden="true"></i><span class="hide-menu">Grades</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Left navbar-header end -->

	<!-- PHP Logic -->
	<?php 
		$q = "select faculty_fname,faculty_lname from faculty,course where (course.course_id='$course_id' AND faculty.faculty_id=course.faculty_id)";
        	$result = mysqli_query($con, $q);
        	$rows = mysqli_fetch_array($result);
        	$faculty_fname = $rows["faculty_fname"];
        	$faculty_lname = $rows["faculty_lname"];
        	$q = "select * from course where course_id='$course_id'";
        	$result = mysqli_query($con, $q);
        	$rows = mysqli_fetch_array($result);
		    $course_name = $rows["course_name"];
        	$start_date = $rows["start_date"];
        	$end_date = $rows["end_date"];
        	$about = $rows["about"];
        	$syllabus_path = $rows["syllabus_path"];
	?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title" style="text-align: center;">
                    <h4 class="course-name"><?php echo $course_name;?>&nbsp &nbsp</h4>             
                    <!-- /.col-lg-12 -->
                    <!--<button class="myButton" style="vertical-align:middle; float:right;"><span>Resume </span></button>-->
                </div>	
	
                <div class="row">
			<div class="col-md-12">
                    <div class="white-box" style="padding:50px">
                            <h3 class="title">Course Details</h3>
                            <h4 >Faculty</h4>
                            <p class="field"><?php echo $faculty_fname." ".$faculty_lname;?></p><br>
                            <h4 >About</h4>
                            <p class="field"><?php echo $about;?></p><br>
                            <h4 >Start Date</h4>
                            <p class="field"><?php echo $start_date;?></p><br>
                            <h4 >End Date</h4>
                            <p class="field"><?php echo $end_date;?></p><br>
                            <h4 >Syllabus</h4>
                            <p class="field"><a href=<?php echo $syllabus_path;?> target="_blank" >Syllabus</a></p><br>
                            <div style="text-align: center;">
                        </div>                                   
            		</div>
            </div>
        </div>
            
            <!-- /.container-fluid -->
            <!--footer class="footer text-center"> Footer </footer-->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="js/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.min.js"></script>
</body>

</html>
