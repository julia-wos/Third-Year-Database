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

<?php

require('connect.php');

$delete_artwork_ID = $_POST['delete'];

$delete_sql = " DELETE FROM galleryart WHERE ArtPieceID LIKE '$delete_artwork_ID';";

if(mysqli_query($conn, $delete_sql))
{
    echo $delete_artwork_ID . 'has been deleted successfylly';
} else{
    echo 'Oops... Something went wrong';
};

mysqli_close($conn)


?>
</body>
</html>