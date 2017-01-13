<?php

if(!$_POST) exit;

// Email verification, do not edit.
function isEmail($email_review ) {
	return(preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/",$email_review ));
}

if (!defined("PHP_EOL")) define("PHP_EOL", "\r\n");

$tour_name_review     = $_POST['tour_name_review'];
$name_review     = $_POST['name_review'];
$lastname_review    = $_POST['lastname_review'];
$email_review    = $_POST['email_review'];
$rating_review   = $_POST['rating_review'];
$review_text = $_POST['review_text'];
$verify_review   = $_POST['verify_review'];

if(trim($name_review) == '') {
	echo '<div class="error_message">You must enter your Name.</div>';
	exit();
} else if(trim($lastname_review ) == '') {
	echo '<div class="error_message">You must enter your Last name.</div>';
	exit();
} else if(trim($email_review) == '') {
	echo '<div class="error_message">Please enter a valid email address.</div>';
	exit();
} else if(!isEmail($email_review)) {
	echo '<div class="error_message">You have enter an invalid e-mail address, try again.</div>';
	exit();
} else if(trim($rating_review) == '') {
	echo '<div class="error_message">You must enter your rating.</div>';
	exit();
} else if(trim($review_text) == '') {
	echo '<div class="error_message">Please enter your review.</div>';
	exit();
} else if(!isset($verify_review) || trim($verify_review) == '') {
	echo '<div class="error_message"> Please enter the verification number.</div>';
	exit();
} else if(trim($verify_review) != '4') {
	echo '<div class="error_message">The verification number you entered is incorrect.</div>';
	exit();
}

if(get_magic_quotes_gpc()) {
	$review_text = stripslashes($review_text);
}


//$address = "HERE your email address";
$address = "info@domain.com";


// Below the subject of the email
$e_subject = 'You\'ve been contacted by ' . $name_review . '.';

// You can change this if you feel that you need to.
$e_body = "You have been contacted by $name_review $lastname_review with the following review:" . PHP_EOL . PHP_EOL;
$e_content = "Tour name: $tour_name_review.\nUser rating: $rating_review.\n\nReview: $review_text" . PHP_EOL . PHP_EOL;
$e_reply = "You can contact $name_review  $lastname_review via email: $email_review.";

$msg = wordwrap( $e_body . $e_content . $e_reply, 70 );

$headers = "From: $email_review" . PHP_EOL;
$headers .= "Reply-To: $email_review" . PHP_EOL;
$headers .= "MIME-Version: 1.0" . PHP_EOL;
$headers .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
$headers .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;

$user = "$email_review";
$usersubject = "Thank You";
$userheaders = "From: info@domain.com\n";
$userheaders .= "MIME-Version: 1.0" . PHP_EOL;
$userheaders .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
$userheaders .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;
$usermessage = "Thank you for review BesTours! Here a summary of your review: \n $e_content. ";
mail($user,$usersubject,$usermessage,$userheaders);

if(mail($address, $e_subject, $msg, $headers)) {

	// Success message
	echo "<div id='success_page' style='padding:20px 0'>";
	echo "<strong >Email Sent.</strong>";
	echo "Thank you <strong>$name_review</strong>,<br> your review has been submitted.";
	echo "</div>";

} else {

	echo 'ERROR!';

}
