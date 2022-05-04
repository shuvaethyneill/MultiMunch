<!-- Shuvaethy Neill 101143478 -->

<?php
require_once('includes/database.inc.php');

// if we have a non-empty search string, search for restaurant matches
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['search']) && !empty($_GET['search']) ) {
   $restaurants = readSelectRestaurantBySearch($_GET['search']);

}
else {
   // otherwise get all restaurants
   $restaurants = readAllRestaurants();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Multi Munch</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.blue_grey-orange.min.css">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/semantic.min.css">
  <script src="https://code.jquery.com/jquery-1.7.2.min.js" ></script>
  <script src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</head>

<body>
  <div>
    <?php include 'includes/header.inc.php'; ?>
    <?php include 'includes/left-nav.inc.php'; ?>
    <section class="page-content">
      <h1 class="ui header">
        Restaurants
        <div class="sub header">Information about all restaurants in the system.</div>
      </h1>

      <form role="search" method="get" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <input type="text" placeholder="Search..." name="search">
        <button type="submit" class="btn btn-default">Submit</button>
      </form>

      <div class="ui two column grid">
        <div class="three wide column">
          <div class="ui vertical menu">
            <div class="item">
              <div class="menu">
                <?php
                foreach ($restaurants as $rest) {
                  echo '<a class="item" href="restaurant.php?restaurant=' . $rest['name'] . '">' . $rest['name'] . '</a>';
                }
                ?>

              </div>
            </div>
          </div>
        </div>

        <div class="nine wide column">
          <?php
          if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            if ( isset($_GET['restaurant']) ) {
              $results = readSelectRestaurantByName($_GET['restaurant']);
  				    $requestedRestaurant = $results->fetch();
          ?>
          <div class="ui raised segment">
            <?php echo '<h2 class="ui header">' . $requestedRestaurant['name'] . '</h2>';?>
          </div>
          <div class="ui raised segment">
            <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
              <div class="mdl-tabs__tab-bar">
                <a href="#info-panel" class="mdl-tabs__tab is-active">INFO</a>
                <a href="#menu-panel" class="mdl-tabs__tab">MENU</a>
                <a href="#order-panel" class="mdl-tabs__tab">ORDERS</a>
                <a href="#courier-panel" class="mdl-tabs__tab">COURIERS</a>
              </div>

              <div class="mdl-tabs__panel is-active" id="info-panel">
                <div class="ui message">
                  <?php
                  echo 'Cuisines:' . ' ' . $requestedRestaurant['cusines'] . '<br>';
                  echo 'Rating:' . ' ' . $requestedRestaurant['rating'] . '<br>';
                  echo 'Address:' . ' ' . $requestedRestaurant['location'] . '<br>';
                  ?>
                </div>
                <?php
                  }  // end if ( isset ...
                }  // // end if ( $_SERVER ...
                ?>
              </div>
              <div class="mdl-tabs__panel" id="menu-panel">
                <?php
                $foodItems = readSelectFoodItemByRestaurant($requestedRestaurant['name']);
                foreach ($foodItems as $food) {
                  echo '<div class="ui message"><div class="header">' . $food['dish_name'] . '</div><p>$' . $food['price'] . '</p></div>';
                }
                ?>
              </div>
              <div class="mdl-tabs__panel" id="order-panel">
                <?php
                $orders = readRestaurantOrders($requestedRestaurant['name']);
                foreach ($orders as $order) {
                  $results = readSelectCustomerById($order['customer_id']);
                  $custname = $results->fetch();
                  $results = readSelectCourierById($order['courier_id']);
                  $courname = $results->fetch();
                  echo '<div class="ui message"><div class="header"> Order No. ' . $order['order_number'] . '</div><p>Date and time: ' . $order['order_date'] .'<br>Total price: $' . $order['total_price'] . '<br>Delivered by courier: ' . $courname['cour_name']. ' (ID: '. $order['courier_id'] . ')<br>Purchased by customer: ' . $custname['cust_name']. ' (ID: ' . $order['customer_id'] . ')</p></div>';
                }
                ?>
              </div>
              <div class="mdl-tabs__panel" id="courier-panel">
                <?php
                $couriers = readRestaurantCouriers($requestedRestaurant['name']);
                foreach ($couriers as $cour) {
                  echo '<div class="ui message"><div class="header">' . $cour['cour_name'] . '</div><p>ID: ' . $cour['courier_id'] .  '</p></div>';
                }
                ?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</body>
</html>
