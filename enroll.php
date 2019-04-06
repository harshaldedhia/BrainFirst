<?php
    session_start();
$servername = "127.0.0.1";
        $username = "root";
        $password = "";
        $dbname = "brainfirst";

        $con = mysqli_connect($servername, $username, $password, $dbname);
if(!isset($_SESSION["email"]))
header('location:index.php');

$course_id = $_POST['course_id'];

$email = $_SESSION['email'];

$q = "select student_id from student where email='$email'";
$result = mysqli_query($con, $q);
$rows = mysqli_fetch_array($result);
$student_id = $rows['student_id'];

$q = "INSERT INTO course_enrolled (student_id,course_id,whether_completed) VALUES ($student_id,$course_id,'No')";
if(mysqli_query($con, $q)){
	echo "<script type='text/javascript'>alert('You have successfully enrolled for this course!!!');
	window.location.href='studenthome.php';
	</script>";
}
?>