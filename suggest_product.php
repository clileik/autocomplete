<?php
    //database configuration
    $sql = new mysqli(
  null, // host
  'root', // username
  'superman',     // password
  'products', // database name
  null,
  '/cloudsql/plenary-ridge-184212:us-east1:products'
  ); 
    //get search term
    $searchTerm = $_GET['term'];
    
    $query = $db->query("SELECT list_name FROM products WHERE list_name LIKE '%".$searchTerm."%' LIMIT 10");
    while ($row = $query->fetch_assoc()) {
        $data[] = $row['list_name'];
    }
    
    //return json data
    echo json_encode($data);
?>

