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

$sql_donnors = "SELECT CONCAT_WS(' ', c.FirstName, c.LastName) AS FullName
                FROM customer c
                WHERE CustomerID IN(
                    SELECT CustomerID
                    FROM donation)
                ORDER BY FullName;";

$sql_no1_donnor = "SELECT CONCAT_WS(' ', c.FirstName, c.LastName) AS FullName
                    FROM customer c
                    WHERE CustomerID IN (
                        SELECT CustomerID
                        FROM donation
                        WHERE Amount IN (
                            SELECT MAX(Amount)
                            FROM donation
                            )
                        )";

$donnors = mysqli_query($conn, $sql_donnors);
$no1_donnor = mysqli_query($conn, $sql_no1_donnor);

$row = mysqli_fetch_assoc($no1_donnor);
?>
<div class="bg-warning text-center">
<h2>
<?php
echo 'Special thanks for our highest donation, which comes from: ' . $row['FullName'];
?>
</h2>
</div>
<div class="text-center">
<br>
<?php
if(mysqli_num_rows($donnors) > 0)
{
    echo '<h4> Donnors </h4>
            ';

    while($row = mysqli_fetch_assoc($donnors))
    {
        echo $row['FullName'];
        echo '<br>';
    }
    echo '</table>';
}
else
{
    echo 'No donnors found';
}



?>
</div>

</body>
</html>

