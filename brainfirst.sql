-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2018 at 11:46 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brainfirst`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_ans`
--

CREATE TABLE `assignment_ans` (
  `student_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `answer_path` varchar(1000) NOT NULL,
  `grade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_ques`
--

CREATE TABLE `assignment_ques` (
  `course_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `about_assignment` varchar(1000) NOT NULL,
  `question_path` varchar(1000) NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment_ques`
--

INSERT INTO `assignment_ques` (`course_id`, `assignment_id`, `about_assignment`, `question_path`, `due_date`) VALUES
(5, 1, 'Test', 'assignment_ques/5_Test.pdf', '2018-09-21 18:30:00'),
(5, 2, 'test2', 'assignment_ques/5_test2.pdf', '2018-09-28 22:26:00'),
(5, 3, 'test3', 'assignment_ques/5_test3.pdf', '2018-09-21 10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `about` varchar(1000) NOT NULL,
  `syllabus_path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `faculty_id`, `course_name`, `start_date`, `end_date`, `about`, `syllabus_path`) VALUES
(1, 2, 'JAVA', '2018-09-01', '2018-09-30', 'Basics of JAVA', 'syllabus/2_JAVA.docx'),
(2, 2, 'Python', '2018-10-01', '2018-10-31', 'Here, you will learn the basics of Python programming language.', 'syllabus/2_Python.docx'),
(3, 2, 'WT', '2018-09-15', '2018-10-15', 'uu', ' syllabus/2_WT.docx'),
(4, 3, 'Android App Development', '2018-09-15', '2018-10-15', 'Just an introduction to app development using Android Studio', ' syllabus/3_Android_App_Development.pdf'),
(5, 3, 'Machine Learning', '2018-11-01', '2018-12-16', 'Here, you will the basics of Machine Learning along with a few algorithms', ' syllabus/3_Machine_Learning.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `course_content`
--

CREATE TABLE `course_content` (
  `course_id` int(11) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_content`
--

INSERT INTO `course_content` (`course_id`, `file_path`, `time`, `file_type`) VALUES
(5, 'content/5_1611011-(ADBMS-EXP3).pdf', '2018-09-20 05:51:17', 'Document'),
(5, 'content/5_movie.mp4', '2018-09-21 08:20:37', 'Video'),
(5, 'content/5_venom-trailer-1_h720p.mov', '2018-09-20 13:17:36', 'Video');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

CREATE TABLE `course_enrolled` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `whether_completed` varchar(4) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_enrolled`
--

INSERT INTO `course_enrolled` (`student_id`, `course_id`, `whether_completed`, `grade`) VALUES
(1, 1, 'No', NULL),
(1, 2, 'No', NULL),
(1, 5, 'No', NULL),
(3, 4, 'No', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discussion_forum_ans`
--

CREATE TABLE `discussion_forum_ans` (
  `course_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `id` int(11) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_forum_ques`
--

CREATE TABLE `discussion_forum_ques` (
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_fname` varchar(50) NOT NULL,
  `faculty_lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_fname`, `faculty_lname`, `email`) VALUES
(1, 'FNAME', 'LNAME', 'faculty@somaiya.edu'),
(2, 'XYZ', 'PQR', 'xyz@somaiya.edu'),
(3, 'Harshal', 'Dedhia', 'harshal.ad@somaiya.edu');

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`email`, `password`, `usertype`) VALUES
('abc@somaiya.edu', 'abcd', 'student'),
('faculty@somaiya.edu', 'password', 'faculty'),
('gandhi.hk@somaiya.edu', 'harsh', 'student'),
('harshal.ad@somaiya.edu', 'harshal', 'faculty'),
('narayan.ghogale@somaiya.edu', 'narayan', 'student'),
('xyz@somaiya.edu', '1234', 'faculty');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_ans`
--

CREATE TABLE `quiz_ans` (
  `student_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `ques_num` int(11) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_grade`
--

CREATE TABLE `quiz_grade` (
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `grade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_info`
--

CREATE TABLE `quiz_info` (
  `quiz_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `start_timestamp` timestamp NULL DEFAULT NULL,
  `end_timestamp` timestamp NULL DEFAULT NULL,
  `about_quiz` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_info`
--

INSERT INTO `quiz_info` (`quiz_id`, `course_id`, `start_timestamp`, `end_timestamp`, `about_quiz`) VALUES
(1, 5, '2018-09-18 18:42:00', '2018-09-21 18:42:00', 'baiscsml'),
(2, 5, '2018-09-18 18:42:00', '2018-09-28 06:42:00', '1wdadasd');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_ques`
--

CREATE TABLE `quiz_ques` (
  `quiz_id` int(11) NOT NULL,
  `ques_num` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `option_a` varchar(50) NOT NULL,
  `option_b` varchar(50) NOT NULL,
  `option_c` varchar(50) NOT NULL,
  `option_d` varchar(50) NOT NULL,
  `correct_answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_fname` varchar(50) NOT NULL,
  `student_lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_fname`, `student_lname`, `email`) VALUES
(1, 'ABC', 'DEF', 'abc@somaiya.edu'),
(3, 'Harsh', 'Gandhi', 'gandhi.hk@somaiya.edu'),
(4, 'Narayan', 'Ghogale', 'narayan.ghogale@somaiya.edu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_ans`
--
ALTER TABLE `assignment_ans`
  ADD PRIMARY KEY (`student_id`,`assignment_id`),
  ADD KEY `assignment_ans_assignment_fk` (`assignment_id`);

--
-- Indexes for table `assignment_ques`
--
ALTER TABLE `assignment_ques`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `assignment_ques_course_fk` (`course_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_name` (`course_name`),
  ADD UNIQUE KEY `faculty_id` (`faculty_id`,`course_name`),
  ADD KEY `course_faculty_fk` (`faculty_id`);

--
-- Indexes for table `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`file_path`),
  ADD KEY `course_content_course_id_fk` (`course_id`);

--
-- Indexes for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD PRIMARY KEY (`student_id`,`course_id`),
  ADD KEY `enrolled_course_fk` (`course_id`);

--
-- Indexes for table `discussion_forum_ans`
--
ALTER TABLE `discussion_forum_ans`
  ADD PRIMARY KEY (`thread_id`,`user_type`,`id`);

--
-- Indexes for table `discussion_forum_ques`
--
ALTER TABLE `discussion_forum_ques`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `discussion_forum_ques_course_fk` (`course_id`),
  ADD KEY `discussion_forum_ques_student_fk` (`student_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `faculty_email_fk` (`email`);

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `quiz_ans`
--
ALTER TABLE `quiz_ans`
  ADD PRIMARY KEY (`student_id`,`quiz_id`,`ques_num`),
  ADD KEY `quiz_id_ques_num_fk` (`quiz_id`,`ques_num`);

--
-- Indexes for table `quiz_grade`
--
ALTER TABLE `quiz_grade`
  ADD PRIMARY KEY (`course_id`,`student_id`,`quiz_id`),
  ADD KEY `quiz_grade_student_fk` (`student_id`);

--
-- Indexes for table `quiz_info`
--
ALTER TABLE `quiz_info`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `course_id_fk` (`course_id`);

--
-- Indexes for table `quiz_ques`
--
ALTER TABLE `quiz_ques`
  ADD PRIMARY KEY (`quiz_id`,`ques_num`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `student_email_fk` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_ques`
--
ALTER TABLE `assignment_ques`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discussion_forum_ques`
--
ALTER TABLE `discussion_forum_ques`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quiz_info`
--
ALTER TABLE `quiz_info`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment_ans`
--
ALTER TABLE `assignment_ans`
  ADD CONSTRAINT `assignment_ans_assignment_fk` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_ques` (`assignment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `assignment_ans_student_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `assignment_ques`
--
ALTER TABLE `assignment_ques`
  ADD CONSTRAINT `assignment_ques_course_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_faculty_fk` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course_content`
--
ALTER TABLE `course_content`
  ADD CONSTRAINT `course_content_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD CONSTRAINT `enrolled_course_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `enrolled_student_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `discussion_forum_ques`
--
ALTER TABLE `discussion_forum_ques`
  ADD CONSTRAINT `discussion_forum_ques_course_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `discussion_forum_ques_student_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_email_fk` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `quiz_ans`
--
ALTER TABLE `quiz_ans`
  ADD CONSTRAINT `quiz_ans_student_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `quiz_id_ques_num_fk` FOREIGN KEY (`quiz_id`,`ques_num`) REFERENCES `quiz_ques` (`quiz_id`, `ques_num`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `quiz_grade`
--
ALTER TABLE `quiz_grade`
  ADD CONSTRAINT `quiz_grade_course_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `quiz_grade_student_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `quiz_info`
--
ALTER TABLE `quiz_info`
  ADD CONSTRAINT `course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `quiz_ques`
--
ALTER TABLE `quiz_ques`
  ADD CONSTRAINT `quiz_info_id_fk` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_info` (`quiz_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_email_fk` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
