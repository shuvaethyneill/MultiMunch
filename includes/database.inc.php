<!-- Shuvaethy Neill 101143478 -->

<?php
// Collection of functions to deal with SQLite3 database

function setConnectionInfo() {
  $pdo = new PDO("sqlite:".__DIR__."/database/multimunch.db");
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $pdo;
}

function runQuery($pdo, $sql, $parameters=array())     {
    // Ensure parameters are in an array
    if (!is_array($parameters)) {
        $parameters = array($parameters);
    }

    $statement = null;
    if (count($parameters) > 0) {
        // Use a prepared statement if parameters
        $statement = $pdo->prepare($sql);
        $executedOk = $statement->execute($parameters);
        if (! $executedOk) {
            throw new PDOException;
        }
    } else {
        // Execute a normal query
        $statement = $pdo->query($sql);
        if (!$statement) {
            throw new PDOException;
        }
    }
    return $statement;
}


function readAllRestaurants() {
    $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Restaurant ORDER BY name", array());
    return $statement;
}

function readSelectRestaurantByRating($RestaurantRating) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Restaurant WHERE rating = ?", array($RestaurantRating));
    return $statement;
}

function readSelectRestaurantByName($RestaurantName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Restaurant WHERE name = ?", array($RestaurantName));
    return $statement;
}

function readSelectRestaurantBySearch($RestaurantName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Restaurant WHERE name LIKE ?", array("%".$RestaurantName."%"));
    return $statement;
}

function readSelectFoodItemByRestaurant($RestaurantName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM FoodItem WHERE rest_name = ?", array($RestaurantName));
    return $statement;
}

function readAllCustomers() {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Customer ORDER BY cust_name", array());
    return $statement;
}

function readSelectCustomerById($CustomerId) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Customer WHERE cust_id = ?", array($CustomerId));
    return $statement;
}

function readSelectCustomerBySearch($CustomerName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Customer WHERE cust_name LIKE ?", array("%".$CustomerName."%"));
    return $statement;
}

function readAllCouriers() {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Courier ORDER BY cour_name", array());
    return $statement;
}

function readSelectCourierById($CourierId) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Courier WHERE cour_id = ?", array($CourierId));
    return $statement;
}

function readSelectCourierBySearch($CourierName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT * FROM Courier WHERE cour_name LIKE ?", array("%".$CourierName."%"));
    return $statement;
}

function readRestaurantOrders($RestaurantName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT order_number, total_price, order_date, courier_id, customer_id
      FROM Orders INNER JOIN OrderDetails ON Orders.order_number=OrderDetails.order_no WHERE restaurant_name = ? GROUP BY order_no", array($RestaurantName));
    return $statement;
}

function readRestaurantCouriers($RestaurantName) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT cour_name, courier_id FROM Courier INNER JOIN WorksFor ON Courier.cour_id=WorksFor.courier_id WHERE restaurant_name = ?", array($RestaurantName));
    return $statement;
}

function readCustomerOrder($CustomerId){
  $pdo = setConnectionInfo();
  $statement = runQuery($pdo, "SELECT food_name, order_number, total_price, order_date, customer_id, restaurant_name
    FROM Orders INNER JOIN OrderDetails ON Orders.order_number=OrderDetails.order_no WHERE customer_id = ? GROUP BY order_number", array($CustomerId));
  return $statement;
}

function readCustomerFoodItems($OrderId){
  $pdo = setConnectionInfo();
  $statement = runQuery($pdo, "SELECT food_name, order_number, customer_id, quantity
    FROM Orders INNER JOIN OrderDetails ON Orders.order_number=OrderDetails.order_no WHERE order_number = ?", array($OrderId));
  return $statement;
}

function readCourierDeliveries($CourierId){
  $pdo = setConnectionInfo();
  $statement = runQuery($pdo, "SELECT food_name, order_number, total_price, order_date, customer_id, restaurant_name
    FROM Orders INNER JOIN OrderDetails ON Orders.order_number=OrderDetails.order_no WHERE courier_id = ? GROUP BY order_number", array($CourierId));
  return $statement;
}

function readCourierRestaurants($CourierId) {
  $pdo = setConnectionInfo();
    $statement = runQuery($pdo, "SELECT restaurant_name, num_orders_delivered FROM Courier INNER JOIN WorksFor ON Courier.cour_id=WorksFor.courier_id WHERE courier_id = ?", array($CourierId));
    return $statement;
}
?>
