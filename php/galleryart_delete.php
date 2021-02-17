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
?>

<form method='post' action='delete_form.php'>
<div class="form-group">
<h4> Choose which art piece you want to delete: </h4>

<?php

$sql = "SELECT ArtPieceID, Title FROM galleryart";

$result = mysqli_query($conn, $sql);


if(mysqli_num_rows($result) > 0)
{
    echo '<table class="table table-striped table-bordered">
            <tr class="bg-danger">
                <th>ID</th>
                <th>Title</th>
                <th>Delete</th>
            </tr>';

    while($row = mysqli_fetch_assoc($result))
    {
        echo '<tr>';
        echo '<td>' . $row['ArtPieceID'] . '</td>';
        echo '<td>' . $row['Title'] . '</td>';
        ?>
        <td><input class="btn btn-warning" type="submit" name="delete" value=<?php echo $row['ArtPieceID'] ?>></td>
        <?php
        echo '</tr>';
    }
    echo '</table>';
}
else
{
    echo 'No results found';
}

?>

</div>
</form>
</body>
</html>