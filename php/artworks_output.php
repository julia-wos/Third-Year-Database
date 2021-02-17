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

$sql = "SELECT * FROM artworks_view";

$result = mysqli_query($conn, $sql);

if(mysqli_num_rows($result) > 0)
{
    echo '<table class="table table-striped table-bordered">
            <thead class="thead-dark">
            <tr class="bg-info">
                <th>Title</th>
                <th>Author\'s Full Name</th>
                <th>Author\'s Alias</th>
                <th>Art Style</th>
                <th>Created in:</th>
            </tr>
            </thead>
            <tbody>';

    while($row = mysqli_fetch_assoc($result))
    {
        echo '<tr>';
        echo '<td>' . $row['Title'] . '</td>';
        echo '<td>' . $row['Authors Full Name'] . '</td>';
        echo '<td>' . $row['Authors Alias'] . '</td>';
        echo '<td>' . $row['Art Style'] . '</td>';
        echo '<td>' . $row['Created:'] . '</td>';
        echo '</tr>';
    }
    echo '</tbody>
        </table>';
}
else
{
    echo 'No results found';
}


mysqli_close($conn)


?>
</body>
</html>
