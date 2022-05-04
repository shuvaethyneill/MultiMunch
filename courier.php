<!-- Shuvaethy Neill 101143478 -->

<?php
require_once('includes/database.inc.php');

// if we have a non-empty search string, search for courier matches
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['search']) && !empty($_GET['search']) ) {
  $couriers = readSelectCourierBySearch($_GET['search']);
}
else {
  // otherwise get all customers
  $couriers = readAllCouriers();
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
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/semantic.min.css">

  <script src="https://code.jquery.com/jquery-1.7.2.min.js" ></script>

</head>


<body>
  <div>
    <?php include 'includes/header.inc.php'; ?>
    <?php include 'includes/left-nav.inc.php'; ?>

    <section class="page-content">
      <h1 class="ui header">
        Couriers
        <div class="sub header">Information about all couriers in the system.</div>
      </h1>

      <form role="search" method="get" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <input type="text" placeholder="Search..." name="search">
        <button type="submit" class="btn btn-default">Submit</button>
      </form>

      <div class="ui two column grid">
        <div class="four wide column">
          <div class="ui raised segment">
            <div class="ui middle aligned divided list">
              <?php
              foreach ($couriers as $cour) {
                echo '<div class="item"><img class="ui avatar image" src="images/user_icon.png">
                <div class="content"><a class="header" href="courier.php?courier=' . $cour['cour_id'] . '">' . $cour['cour_name'] . '</a></div></div>';
              }
              ?>
            </div>
          </div>
        </div>
        <div class="eight wide column">
          <?php
          if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            if ( isset($_GET['courier']) ) {
              $results = readSelectCourierById($_GET['courier']);
              $requestedCourier = $results->fetch();
          ?>
          <div class="ui raised segment">
            <?php echo '<h2 class="ui header">' . $requestedCourier['cour_name'] . '</h2>';?>
          </div>
          <div class="ui raised segment">
            <div class="ui message">
              <?php
              echo 'ID:' . ' ' . $requestedCourier['cour_id'] . '<br>';
              echo 'Email:' . ' ' . $requestedCourier['cour_email'] . '<br>';
              echo 'Phone Number:' . ' ' . $requestedCourier['phone_number'] . '<br>';
              ?>
            </div>
          </div>
          <div class="ui raised segment">
            <h3 class="ui header">Works For</h3>
            <div class="ui message">
              <?php
              $restaurants = readCourierRestaurants($requestedCourier['cour_id']);
              foreach ($restaurants as $rest) {
                echo '<p><b>' . $rest['restaurant_name'] .'</b><br>Total deliveries made: ' . $rest['num_orders_delivered'] . '</p>';
              }
              ?>
            </div>
          </div>
          <div class="ui raised segment">
            <h3 class="ui header">Orders Delivered</h3>
            <div class="ui message">
              <?php
              $orders = readCourierDeliveries($requestedCourier['cour_id']);
              foreach ($orders as $order) {
                echo '<p><b>Order No. ' . $order['order_number'] .' - ' . $order['restaurant_name'] .'</b><br>Date and time: ' . $order['order_date'] . '<br> Customer (ID): ' . $order['customer_id'] . '</p></br>';
              }
              ?>
            </div>
          </div>
        </div>
      </div>
      <?php
        }  // end if ( isset ...
      }  // // end if ( $_SERVER ...
      ?>
    </section>
  </div>
</body>
</html>
