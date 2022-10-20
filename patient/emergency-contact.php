<?php


require'../includes/patient_auth.php';

$fname = $_SESSION['contact-data']['fname'] ?? null;
$lname = $_SESSION['contact-data']['lname'] ?? null;
$contnumber = $_SESSION['contact-data']['contnumber'] ?? null;

unset($_SESSION['contact-data']);
?> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Contact list</title>
	<link rel="stylesheet" type="text/css" href="../css/emergency-contact.css">
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&family=Rubik+Moonrocks&display=swap" rel="stylesheet">

</head>
<body>
	<nav>
		<div class="cointainer nav_container"> 
			<a href="../" class="nav_logo"><h4>Adviisory</h4></a>
			<ul id="nav_menu" class="nav_items">
				<li><a href="../patient/dashboard.php"><?=$patient_record['fname']?>Dashboard</a></li>
				<li><a href="../" target="_blank">About</a></li>					
							
			</ul>
			<button id="open_nav-btn" ><i class="uil uil-bars"></i></button>			
			<button id="close_nav-btn" class="close_menu"><i class="uil uil-times-square"></i></button>
		</div>
	</nav>

	<section class="signup">
		<div class="container signup_container">
			<h4>Create emergency contact(s)</h4>
				<?php
					if(isset($_SESSION['contact'])) :?>
					<div class="alert_message error">
						<p>
							<?= $_SESSION['contact'];
							unset($_SESSION['contact']); ?>
						
						</p>
					</div>
					<?php elseif(isset($_SESSION['contact-success'])) :?>		
					<div class="alert_message success">
						<p>
							<?= $_SESSION['contact-success'];
							unset($_SESSION['contact-success']); ?>
											
						</p>
					</div>
				<?php endif?>
			

			

				<form action="../includes/contact-logic.php" method="post" enctype="multipart/form-data">					
					<input type="text" name="fname" value="<?= $fname?>" placeholder="Enter First Name">	
					<input type="text" name="lname"  value="<?= $lname?>" placeholder="Enter Last Name">
					<input type="tell" name="contnumber" value="<?= $contnumber?>" placeholder="0712345678">
					<button type="submit" name="submit"class="hero-btn">Save</button>				
					<small><a href="../patient/contact-list.php">Click here </a>to view your contact list</small>			
				</form>
			


		</div>
	</section>

	<script type="text/javascript" src="../js/main.js"></script>
</body>
</html>
