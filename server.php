<?php
session_start();

// initializing variables
$username = "";
$email    = "";
$errors = array();

// connect to the database
$db = pg_connect("host=localhost port=5432 dbname=shinasal_db user=shinasal_admin password=admin_test");

if (isset($_POST['reg_user'])) {
  $username = pg_escape_string($db, $_POST['username']);
  $email = pg_escape_string($db, $_POST['email']);
  $password_1 = pg_escape_string($db, $_POST['password_1']);
  $password_2 = pg_escape_string($db, $_POST['password_2']);

  if (empty($username)) { array_push($errors, "Username is required"); }
  if (empty($email)) { array_push($errors, "Email is required"); }
  if (empty($password_1)) { array_push($errors, "Password is required"); }
  if ($password_1 != $password_2) {
	array_push($errors, "The two passwords do not match");
  }

  $user_check_query = "SELECT * FROM users.credentials WHERE username='$username' OR email='$email' LIMIT 1";
  $result = pg_query($db, $user_check_query);
  $user = pg_fetch_assoc($result);

  if ($user) {
    if ($user['username'] === $username) {
      array_push($errors, "Username already exists");
    }

    if ($user['email'] === $email) {
      array_push($errors, "email already exists");
    }
  }

  if (count($errors) == 0) {
  	$password = md5($password_1);

  	$query = "INSERT INTO users.credentials (username, password, email)
  			  VALUES ('$username', '$password', '$email')";
  	pg_query($db, $query);
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header('location: index.php');
  }
}

// LOGIN USER
if (isset($_POST['login_user'])) {
  $username = pg_escape_string($db, $_POST['username']);
  $password = pg_escape_string($db, $_POST['password']);

  if (empty($username)) {
  	array_push($errors, "Username is required");
  }
  if (empty($password)) {
  	array_push($errors, "Password is required");
  }

  if (count($errors) == 0) {
  	$password = md5($password);
  	$query = "SELECT * FROM users.credentials WHERE username='$username' AND password='$password'";
  	$results = pg_query($db, $query);
  	if (pg_num_rows($results) == 1) {
  	  $_SESSION['username'] = $username;
  	  $_SESSION['success'] = "You are now logged in";
  	  header('location: index.php');
  	}else {
  		array_push($errors, "Wrong username/password combination");
  	}
  }
}

?>
