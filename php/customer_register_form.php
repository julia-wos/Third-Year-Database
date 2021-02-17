<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap available at: https://getbootstrap.com -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Document</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="artworks_output.php">Artworks</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="donations.php">Donations</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="galleryart_delete.php">Delete Artworks</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="customer_register_form.php">Customer Registration</a>
      </li>
    </ul>
  </div>
</nav>

<form method='post' action='customer_form_output.php'>
<div class="form-group">
    <h4> Customer registration: </h4>
    <label for="FirstName" >First Name: </label>
    <input name="FirstName" class="form-control" id="FirstName" type="text" required><br>

    <label for="LastName" >Last Name: </label>
    <input name="LastName" class="form-control" id="LastName" type="text" required><br>
    
    <label for="Email">Email: </label>
    <input name="Email" class="form-control" id="Email" type="email" required><br>
    
    <label for="PhoneNumber">Phone Number: </label>
    <input name="PhoneNumber" class="form-control" id="PhoneNumber" type="tel" pattern="[0-9]{5}-[0-9]{6}" required><br>
    
    <label for="StreetName">Street Name: </label>
    <input name="StreetName" class="form-control" id="StreetName" type="text" required><br>
    
    <label for="HouseNumber">House Number: </label>
    <input name="HouseNumber" class="form-control" id="HouseNumber" type="number" required><br>
    
    <label for="FlatNumber">Flat Number (optional): </label>
    <input name="FlatNumber" class="form-control" id="FlatNumber" type="number" default="0"><br>
    
    <label for="PostCode">Post code: </label>
    <input name="PostCode" class="form-control" id="PostCode" type="text" required><br>
    
    <label for="City">City: </label>
    <input name="City" class="form-control" id="City" type="text" required><br>

    <input name="submit" class="btn btn-success" id="submit-btn" type="submit">
    </div>
</form>

</body>
</html>