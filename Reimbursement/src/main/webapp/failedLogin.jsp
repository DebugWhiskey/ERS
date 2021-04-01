<!doctype html>
<html lang="en">
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Bootsrap Login Form</title>
<style>
input[type="email"] {
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
}

input[type="password"] {
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-top: 0px;
}
</style>
</head>
<body class="bg-dark">


	<div class="text-center mt-5 bg-secondary">
		<form action="login" method="post" style="max-width: 300px; margin: auto;">
			<img class="mt-4 mb-4" src="imgresources/ERSlogo.png" height="200" alt="Logo">
			<h1 class="h3 mb-3">Please Sign In</h1>
			<label class="text-danger fst-italic" for="emailAddress">Incorrect Login</label>
			<input type="email" name="emailAddress" class="form-control" placeholder="Email Address" required autofocus>
			<label class="visually-hidden" for="password">Password</label> 
			<input type="password" name="password" class="form-control" placeholder="Password" required autofocus>
			<div class="mt-3 mb-3 d-grid">
			<input type="submit" class="btn-lg mb-3  btn-primary btn btn-info .gap-* text-white" value="Sign In">
			</div>
		</form>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>