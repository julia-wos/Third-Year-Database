<?php

include('customer_register_form.php');
require('connect.php');

// One of the assumptions states that there will not be more than 99999 customers in the database
// This variable halps prevent it form happening
$full_error = false;

$count_cust_sql = "SELECT COUNT(CustomerID) AS customer_number FROM customer;";
$cust_number = mysqli_query($conn, $count_cust_sql);

//Customer Id input based on the number of current customers.
//As the assumption states, the customers cannot be deleted from the database.
//It means that the next customer will have an Id one higher than the amount of existing customers.
$row = mysqli_fetch_assoc($cust_number);
$custID_num = ($row['customer_number'] + 1);


//This ensures that the customer Id is made of 6 characters and has the right format.
if($custID_num < 10)
{
    $custID = 'C0000' . $custID_num;
} else if ($custID_num >= 10 && $custID_num < 100)
{
    $custID = 'C000' . $custID_num;
} else if ($custID_num >= 100 && $custID_num < 1000)
{
    $custID = 'C00' . $custID_num;
} else if ($custID_num >= 1000 && $custID_num < 10000)
{
    $custID = 'C0' . $custID_num;
} else if ($custID_num >= 10000 && $custID_num < 100000)
{
    $custID = 'C' . $custID_num;
} else 
{
    echo 'Database is full!!!';
    $full_error = true;
}

//if there already is 99999 customers, no data will be inserted into database
if($full_error == false)
{

$firstName = mysqli_real_escape_string($conn, $_POST['FirstName']);
$lastName = mysqli_real_escape_string($conn, $_POST['LastName']);
$email = mysqli_real_escape_string($conn, $_POST['Email']);
$phoneNo = $_POST['PhoneNumber'];
$street = mysqli_real_escape_string($conn, $_POST['StreetName']);
$house = mysqli_real_escape_string($conn, $_POST['HouseNumber']);
$flat = mysqli_real_escape_string($conn, $_POST['FlatNumber']);
$postcode = $_POST['PostCode'];
$city = mysqli_real_escape_string($conn, $_POST['City']);

//If the Flat Number field has been left blank it will have a value of 0
If($flat == 0)
{
    //if the Flat Number has been left blank a NULL value will be inserted into the database
    $sql = "INSERT INTO customer (CustomerID, FirstName, LastName, Email, PhoneNumber, StreetName, HouseNumber, FlatNumber, PostCode, City)
        VALUES ('$custID', '$firstName', '$lastName', '$email', '$phoneNo', '$street', '$house', NULL, '$postcode', '$city');";
}
else
{
    $sql = "INSERT INTO customer (CustomerID, FirstName, LastName, Email, PhoneNumber, StreetName, HouseNumber, FlatNumber, PostCode, City)
        VALUES ('$custID', '$firstName', '$lastName', '$email', '$phoneNo', '$street', '$house', '$flat', '$postcode', '$city');";
}

if(mysqli_query($conn, $sql))
{
    echo 'Records were inserted successfully';
}
else
{
    echo 'Error: ' . mysqli_error($conn);
}
}

mysqli_close($conn);
?>
    
</body>
</html>