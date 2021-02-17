<?php

$host = 'localhost';
$user = 'root';
$pass = '';
$dbms = 'artgallery';


$conn = mysqli_connect($host,$user,$pass,$dbms);

if(!$conn)
{
    die('Connection error: ' . mysqli_connect_error());
}

?>