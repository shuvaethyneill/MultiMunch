<!-- Shuvaethy Neill 101143478 -->

<?php
require_once('includes/database.inc.php');

// if we have a non-empty search string, search for customer matches
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['search']) && !empty($_GET['search']) ) {
   $customers = readSelectCustomerBySearch($_GET['search']);
}
else {
   // otherwise get all customers
   $customers = readAllCustomers();
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
        Customers
        <div class="sub header">Information about all customers in the system.</div>
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
              foreach ($customers as $cust) {
                echo '<div class="item"><img class="ui avatar image" src="images/user_icon.png">
                <div class="content"><a class="header" href="customer.php?customer=' . $cust['cust_id'] . '">' . $cust['cust_name'] . '</a></div></div>';
              }
             ?>
            </div>
          </div>
        </div>
        <div class="eight wide column">
          <?php
          if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            if ( isset($_GET['customer']) ) {
              $results = readSelectCustomerById($_GET['customer']);
              $requestedCustomer = $results->fetch();
          ?>
          <div class="ui raised segment">
            <?php echo '<h2 class="ui header">' . $requestedCustomer['cust_name'] . '</h2>';?>
          </div>
          <div class="ui raised segment">
            <div class="ui message">
            <?php
            echo 'ID:' . ' ' . $requestedCustomer['cust_id'] . '<br>';
            echo 'Email:' . ' ' . $requestedCustomer['cust_email'] . '<br>';
            echo 'Address:' . ' ' . $requestedCustomer['address'] . '<br>';
            ?>
            </div>
          </div>
          <div class="ui raised segment">
            <h3 class="ui header">Past Orders</h3>
            <div class="ui message">
              <?php
              $orders = readCustomerOrder($requestedCustomer['cust_id']);
              foreach ($orders as $order) {
                echo '<br><p><b>Order No. ' . $order['order_number'] .' - ' . $order['restaurant_name'] .'</b><br>Total: $' . $order['total_price'] . '<br>Date and time: ' . $order['order_date'] . '</p>';
                $foodItems = readCustomerFoodItems($order['order_number']);
                echo '<p>Food items:</p>';
                foreach ($foodItems as $item) {
                  echo '<li>'. $item['food_name'] . ' (' . $item['quantity'] . ')</li>';
                }
              }
              ?>
            </div>
          </div>
        </div>
        <?php
          }  // end if ( isset ...
        }  // // end if ( $_SERVER ...
        ?>
      </div>
    </section>
  </div>
</body>
</html>
