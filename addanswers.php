<?php 
session_start();
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "brainfirst";

$con = mysqli_connect($servername, $username, $password, $dbname);
if(!isset($_SESSION["email"]))
header('location:index.php');

$checked_count=0;
if(isset($_POST['submit_btn'])){
        if(!empty($_POST['option'])) {
        // Counting number of checked checkboxes.
        $checked_count = count($_POST['option']);
        $selected = $_POST['option'];
        //$no_of_questions = $_SESSION['no_of_questions'];
    }
}


$i=0;
while($i<$checked_count)
{
	$i++;
	$ans = $selected[$i];
	$student_id = $_SESSION['student_id'];
	$quiz_id = $_SESSION['quiz_id'];
	$q = "insert into quiz_ans values('$student_id','$quiz_id','$i','$ans')";
	$result = mysqli_query($con, $q);
}
echo '<script>alert("Your answers are noted. Thank You!");</script>';
header('location:studentquiz.php');
?>