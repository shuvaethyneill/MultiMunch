/* Shuvaethy Neill 101143478 */

--DROP OLD VERSIONS OF THE TABLES
---------------------------------------
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Restaurant;
DROP TABLE IF EXISTS FoodItem;
DROP TABLE IF EXISTS Courier;
DROP TABLE IF EXISTS WorksFor;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderDetails;

--CREATE DATABASE TABLES
----------------------------------------
CREATE TABLE Customer(
      cust_id integer primary key NOT NULL, --customer id
      cust_name text NOT NULL,
      cust_email text NOT NULL,
      cust_bank_acc_number integer NOT NULL,
      address text NOT NULL
);

CREATE TABLE Restaurant(
      name text primary key NOT NULL, --restaurant name
      location text NOT NULL,
      rating decimal(2,1) NOT NULL,
      cusines text NOT NULL,
      rest_bank_acc_number integer NOT NULL
);

CREATE TABLE FoodItem(
      dish_name text NOT NULL, --name of food dish
      rest_name text NOT NULL,
      price decimal(5,2) NOT NULL,
      primary key (dish_name, rest_name),
      foreign key (rest_name) references Restaurant(name)
);

CREATE TABLE Courier(
      cour_id integer primary key NOT NULL, --courier id
      cour_name text NOT NULL,
      cour_email text NOT NULL,
      cour_bank_acc_number integer NOT NULL,
      phone_number integer NOT NULL
);

CREATE TABLE WorksFor(
      courier_id integer NOT NULL, --courier id foreign key
      restaurant_name text NOT NULL,
      num_orders_delivered integer default NULL,
      primary key (courier_id, restaurant_name),
      foreign key (courier_id) references Courier(cour_id),
      foreign key (restaurant_name) references Restaurant(name)
);

CREATE TABLE Orders(
      order_number integer primary key NOT NULL,
      total_price decimal (6,2) NOT NULL,
      order_date datetime NOT NULL,
      courier_id integer NOT NULL,
      customer_id integer NOT NULL,
      foreign key (courier_id) references Courier(cour_id),
      foreign key (customer_id) references Customer(cust_id)
);

CREATE TABLE OrderDetails(
      order_no integer NOT NULL, -- foreign key unique order number
      food_name text NOT NULL,
      restaurant_name text NOT NULL,
      quantity integer NOT NULL,
      primary key (order_no, food_name, restaurant_name),
      foreign key (order_no) references Orders(order_number),
      foreign key (food_name) references FoodItem(dish_name),
      foreign key (restaurant_name) references Restaurant(name)
);

--INSERT DATA INTO Restaurant TABLE
-------------------------------------------------
INSERT INTO Restaurant VALUES('Seoul Dog','154 O''Connor Street, Ottawa, ON, K2P 1T5', 4.2,'Asian',100001);
INSERT INTO Restaurant VALUES('El Camino','82 Clarence Street, Ottawa, ON, K1N 5P5', 4.4,'Mexican',100002);
INSERT INTO Restaurant VALUES('Browns Socialhouse','160 Elgin Street, Ottawa, ON, K2P 2C4', 4.4,'American',100003);
INSERT INTO Restaurant VALUES('Ammas Biryani','1618 Merivale Road, Nepean, ON, K2G 3G3', 4.6,'Indian',100004);
INSERT INTO Restaurant VALUES('Lone Star Texas Grill','128 George Street, Ottawa, ON, K1N 9N9', 4.1,'American, Mexican',100005);
INSERT INTO Restaurant VALUES('Chungchun Rice Dog','1379 Woodroffe Avenue, Ottawa, ON, K2G 1V7', 4.7,'Asian',100006);
INSERT INTO Restaurant VALUES('Pizza Pizza','2301 Navaho Drive, Nepean, ON, K2G 6Z1', 4.7,'Italian',100007);
INSERT INTO Restaurant VALUES('Edo Japan','1379 Woodroffe Avenue, Nepean, ON, K2G 1V7', 4.0,'Asian',100008);
INSERT INTO Restaurant VALUES('Umbrella Bar','1001 Queen Elizabeth Driveway, Ottawa, ON, K1S 5K7', 4.8,'American',100009);
INSERT INTO Restaurant VALUES('Allo Mon Coco','2277 Riverside Drive, Ottawa, ON, K1H 7X6', 4.3,'American',100010);
INSERT INTO Restaurant VALUES('Datsun','380 Elgin Street, Ottawa, ON, K2P 1N1', 4.4,'Asian',100011);
INSERT INTO Restaurant VALUES('Gitanes Burger','381 Elgin Street, Ottawa, ON, K2P 1N1', 4.4,'American',100012);
INSERT INTO Restaurant VALUES('Vivaan','225 Preston Street, Ottawa, ON, K1R 7R1', 4.4,'Indian',100013);
INSERT INTO Restaurant VALUES('Kettlemans Bagel','912 Bank St, Ottawa, ON, K1S 3W6', 4.8,'American',100014);
INSERT INTO Restaurant VALUES('Osmows','347 Dalhousie St, Ottawa, ON, K1N 7G1', 4.5,'Mediterranean',100015);


--INSERT DATA INTO FoodItem TABLE
-------------------------------------------------
INSERT INTO FoodItem VALUES('Half Beef / Half Cheese Corn-dog','Seoul Dog', 9.50);
INSERT INTO FoodItem VALUES('Cheese Corn-dog','Seoul Dog', 10.50);
INSERT INTO FoodItem VALUES('Beef Corn-dog','Seoul Dog', 8.50);
INSERT INTO FoodItem VALUES('Chicken Sausage Corn-dog','Seoul Dog', 8.50);
INSERT INTO FoodItem VALUES('Korean Rice Cake Skewers','Seoul Dog', 8.50);

INSERT INTO FoodItem VALUES('Crispy Fish Taco','El Camino', 8.25);
INSERT INTO FoodItem VALUES('Beef Barbacoa Taco','El Camino', 8.10);
INSERT INTO FoodItem VALUES('Chorizo Taco','El Camino', 8.40);
INSERT INTO FoodItem VALUES('Lamb Quesabirria','El Camino', 8.00);
INSERT INTO FoodItem VALUES('Grilled Chicken Taco', 'El Camino', 8.10);
INSERT INTO FoodItem VALUES('Cauliflower Taco','El Camino', 7.80);

INSERT INTO FoodItem VALUES('Spicy Crispy Chicken Sandwich','Browns Socialhouse', 21.50);
INSERT INTO FoodItem VALUES('Southwest Blackened Chicken Rice Bowl','Browns Socialhouse', 24.00);
INSERT INTO FoodItem VALUES('Crispy Chicken Taco','Browns Socialhouse', 19.25);
INSERT INTO FoodItem VALUES('Veggie Burger','Browns Socialhouse', 19.00);
INSERT INTO FoodItem VALUES('Traditional Pub Burger','Browns Socialhouse', 21.00);
INSERT INTO FoodItem VALUES('Baja Fish Taco','Browns Socialhouse', 20.50);
INSERT INTO FoodItem VALUES('Szechuan Beef Noodle Bowl','Browns Socialhouse', 24.00);
INSERT INTO FoodItem VALUES('Crispy Fried Chicken Ramen','Browns Socialhouse', 21.50);
INSERT INTO FoodItem VALUES('Fish & Chips','Browns Socialhouse', 23.25);
INSERT INTO FoodItem VALUES('Fettuccine Alfredo','Browns Socialhouse', 15.50);
INSERT INTO FoodItem VALUES('Crispy Cauliflower','Browns Socialhouse', 15.50);
INSERT INTO FoodItem VALUES('Yam Fries','Browns Socialhouse', 10.00);
INSERT INTO FoodItem VALUES('Salt & Pepper Dry Ribs','Browns Socialhouse', 16.50);

INSERT INTO FoodItem VALUES('Chicken Biryani','Ammas Biryani', 11.99);
INSERT INTO FoodItem VALUES('Veg Biryani','Ammas Biryani', 10.99);
INSERT INTO FoodItem VALUES('Mutton Biryani','Ammas Biryani', 14.99);
INSERT INTO FoodItem VALUES('Wings Karahi','Ammas Biryani', 13.99);
INSERT INTO FoodItem VALUES('Rice Pudding','Ammas Biryani', 4.99);

INSERT INTO FoodItem VALUES('Chips & Salsa','Lone Star Texas Grill', 9.99);
INSERT INTO FoodItem VALUES('Chips & Queso','Lone Star Texas Grill', 11.99);
INSERT INTO FoodItem VALUES('Chips & Guacamole','Lone Star Texas Grill', 11.99);
INSERT INTO FoodItem VALUES('California Burrito','Lone Star Texas Grill', 18.99);
INSERT INTO FoodItem VALUES('Chicken Enchiladas','Lone Star Texas Grill', 23.99);
INSERT INTO FoodItem VALUES('Lone Star State Nachos','Lone Star Texas Grill', 21.99);
INSERT INTO FoodItem VALUES('Onion Rings','Lone Star Texas Grill', 11.99);
INSERT INTO FoodItem VALUES('Chicken Fingers','Lone Star Texas Grill', 18.99);
INSERT INTO FoodItem VALUES('Double Bacon Burger','Lone Star Texas Grill', 21.99);
INSERT INTO FoodItem VALUES('Crispy Chicken Sandwich','Lone Star Texas Grill', 18.99);
INSERT INTO FoodItem VALUES('Chicken Wrap','Lone Star Texas Grill', 18.99);
INSERT INTO FoodItem VALUES('Chicken Caesar Salad','Lone Star Texas Grill', 19.99);
INSERT INTO FoodItem VALUES('Steak Fajita Bowl','Lone Star Texas Grill', 24.99);
INSERT INTO FoodItem VALUES('Churros','Lone Star Texas Grill', 7.99);
INSERT INTO FoodItem VALUES('Apple Crumble Pie','Lone Star Texas Grill', 8.99);

INSERT INTO FoodItem VALUES('Potato Hotdog','Chungchun Rice Dog', 6.25);
INSERT INTO FoodItem VALUES('Half Mozzarella Hotdog','Chungchun Rice Dog', 6.25);
INSERT INTO FoodItem VALUES('Cheddar Cheese Hotdog','Chungchun Rice Dog', 6.25);
INSERT INTO FoodItem VALUES('Ramen Chip Hotdog','Chungchun Rice Dog', 6.25);
INSERT INTO FoodItem VALUES('Double Cheese Hotdog','Chungchun Rice Dog', 7.35);
INSERT INTO FoodItem VALUES('Whole Mozzarella Cheese Hotdog','Chungchun Rice Dog', 6.25);
INSERT INTO FoodItem VALUES('Sweet Potato Hotdog','Chungchun Rice Dog', 7.35);
INSERT INTO FoodItem VALUES('Veggie Hotdog','Chungchun Rice Dog', 7.35);
INSERT INTO FoodItem VALUES('Squid Ink Cheese Hotdog','Chungchun Rice Dog', 7.35);

INSERT INTO FoodItem VALUES('Small Canadian Pizza','Pizza Pizza', 13.29);
INSERT INTO FoodItem VALUES('Small Spicy BBQ Chicken Pizza','Pizza Pizza', 15.29);
INSERT INTO FoodItem VALUES('Small Tropical Hawaiian','Pizza Pizza', 14.29);
INSERT INTO FoodItem VALUES('Small Sausage Mushroom Melt Pizza','Pizza Pizza', 12.69);
INSERT INTO FoodItem VALUES('Small Pepperoni Pizza','Pizza Pizza', 10.09);
INSERT INTO FoodItem VALUES('Small Chicken Bruschetta Pizza','Pizza Pizza', 15.89);
INSERT INTO FoodItem VALUES('Small Garden Veggie Pizza','Pizza Pizza', 13.29);
INSERT INTO FoodItem VALUES('Medium Canadian Pizza','Pizza Pizza', 15.59);
INSERT INTO FoodItem VALUES('Medium Spicy BBQ Chicken Pizza','Pizza Pizza', 17.29);
INSERT INTO FoodItem VALUES('Medium Tropical Hawaiian','Pizza Pizza', 16.59);
INSERT INTO FoodItem VALUES('Medium Sausage Mushroom Melt Pizza','Pizza Pizza', 14.79);
INSERT INTO FoodItem VALUES('Medium Pepperoni Pizza','Pizza Pizza', 11.99);
INSERT INTO FoodItem VALUES('Medium Chicken Bruschetta Pizza','Pizza Pizza', 18.39);
INSERT INTO FoodItem VALUES('Medium Garden Veggie Pizza','Pizza Pizza', 15.59);
INSERT INTO FoodItem VALUES('Large Canadian Pizza','Pizza Pizza', 19.19);
INSERT INTO FoodItem VALUES('Large Spicy BBQ Chicken Pizza','Pizza Pizza', 21.19);
INSERT INTO FoodItem VALUES('Large Tropical Hawaiian','Pizza Pizza', 20.19);
INSERT INTO FoodItem VALUES('Large Sausage Mushroom Melt Pizza','Pizza Pizza', 18.09);
INSERT INTO FoodItem VALUES('Large Pepperoni Pizza','Pizza Pizza', 14.99);
INSERT INTO FoodItem VALUES('Large Chicken Bruschetta Pizza','Pizza Pizza', 22.29);
INSERT INTO FoodItem VALUES('Large Garden Veggie Pizza','Pizza Pizza', 19.19);
INSERT INTO FoodItem VALUES('Pepperoni Panzerotti','Pizza Pizza', 7.29);
INSERT INTO FoodItem VALUES('Cheese Panzerotti','Pizza Pizza', 7.29);
INSERT INTO FoodItem VALUES('Veggie Panzerotti','Pizza Pizza', 9.69);
INSERT INTO FoodItem VALUES('Garlic Bread','Pizza Pizza', 4.99);

INSERT INTO FoodItem VALUES('Teriyaki Chicken','Edo Japan', 12.10);
INSERT INTO FoodItem VALUES('Teriyaki Beef and Shrimp','Edo Japan', 16.70);
INSERT INTO FoodItem VALUES('Teriyaki Salmon','Edo Japan', 14.10);
INSERT INTO FoodItem VALUES('Chicken Noodlefull Bowl','Edo Japan', 13.80);
INSERT INTO FoodItem VALUES('Beef Chop Chop Bowl','Edo Japan', 13.80);
INSERT INTO FoodItem VALUES('Cup of Miso Soup','Edo Japan', 3.35);
INSERT INTO FoodItem VALUES('Veggie Udon','Edo Japan', 12.35);
INSERT INTO FoodItem VALUES('Gyoza','Edo Japan', 3.90);
INSERT INTO FoodItem VALUES('Edamame','Edo Japan', 5.10);

INSERT INTO FoodItem VALUES('Fried Chicken Sandwich','Umbrella Bar', 12.50);
INSERT INTO FoodItem VALUES('Mac N Cheese','Umbrella Bar', 13.50);
INSERT INTO FoodItem VALUES('Double Cheeseburger','Umbrella Bar', 13.85);
INSERT INTO FoodItem VALUES('Fresh Fried Donut','Umbrella Bar', 3.65);
INSERT INTO FoodItem VALUES('Strawberry Milkshake','Umbrella Bar', 7.05);
INSERT INTO FoodItem VALUES('Spiced Curly Fries','Umbrella Bar', 8.25);
INSERT INTO FoodItem VALUES('Broccoli Salad','Umbrella Bar', 9.00);
INSERT INTO FoodItem VALUES('Sweet Potato Fries','Umbrella Bar', 7.55);

INSERT INTO FoodItem VALUES('Grilled Vegetables','Allo Mon Coco', 17.95);
INSERT INTO FoodItem VALUES('Philly Steak','Allo Mon Coco', 17.95);
INSERT INTO FoodItem VALUES('Western Omlette','Allo Mon Coco', 15.95);
INSERT INTO FoodItem VALUES('Cheese Omlette','Allo Mon Coco', 13.05);
INSERT INTO FoodItem VALUES('Wild Berries Waffles','Allo Mon Coco', 19.95);
INSERT INTO FoodItem VALUES('Fried Chicken Waffles','Allo Mon Coco', 20.95);

INSERT INTO FoodItem VALUES('Pork Belly Bao','Datsun', 6.75);
INSERT INTO FoodItem VALUES('Crispy Chicken Bao','Datsun', 6.75);
INSERT INTO FoodItem VALUES('Beef Brisket Bao','Datsun', 6.75);
INSERT INTO FoodItem VALUES('Dandan Noodles','Datsun', 16.00);
INSERT INTO FoodItem VALUES('Wafu Salad','Datsun', 12.05);
INSERT INTO FoodItem VALUES('Spicy Chicken Wings','Datsun', 15.00);

INSERT INTO FoodItem VALUES('Gitanes Burger','Gitanes Burger', 14.00);
INSERT INTO FoodItem VALUES('American','Gitanes Burger', 13.00);
INSERT INTO FoodItem VALUES('Fish Sandwich','Gitanes Burger', 12.00);
INSERT INTO FoodItem VALUES('Single Avec Fromage','Gitanes Burger', 9.00);
INSERT INTO FoodItem VALUES('Fried Chicken Sandwich','Gitanes Burger', 13.50);
INSERT INTO FoodItem VALUES('Tomato Sanwich','Gitanes Burger', 10.00);
INSERT INTO FoodItem VALUES('Beef Tartare Burger','Gitanes Burger', 11.00);

INSERT INTO FoodItem VALUES('Veg Galouti Kebab','Vivaan', 18.00);
INSERT INTO FoodItem VALUES('Cheesy Crispy Corn','Vivaan', 15.00);
INSERT INTO FoodItem VALUES('Scallops','Vivaan', 17.00);
INSERT INTO FoodItem VALUES('Chilli Chicken','Vivaan', 17.00);
INSERT INTO FoodItem VALUES('Amritsari Fish Fry','Vivaan', 18.00);
INSERT INTO FoodItem VALUES('Burrata Paapdi Chaat','Vivaan', 15.00);
INSERT INTO FoodItem VALUES('Pani Puri','Vivaan', 14.00);
INSERT INTO FoodItem VALUES('Dal Makhani','Vivaan', 22.00);
INSERT INTO FoodItem VALUES('Chana Masala','Vivaan', 20.00);

INSERT INTO FoodItem VALUES('Breakfast Bagel','Kettlemans Bagel', 6.49);
INSERT INTO FoodItem VALUES('Club Classic','Kettlemans Bagel', 11.49);
INSERT INTO FoodItem VALUES('BLT','Kettlemans Bagel', 8.59);
INSERT INTO FoodItem VALUES('Caesar Salad','Kettlemans Bagel', 8.49);
INSERT INTO FoodItem VALUES('LGBT Sandwich','Kettlemans Bagel', 10.19);
INSERT INTO FoodItem VALUES('Reuben','Kettlemans Bagel', 13.19);
INSERT INTO FoodItem VALUES('Montreal Smoked Meat','Kettlemans Bagel', 11.89);
INSERT INTO FoodItem VALUES('Oven Roasted Chicken','Kettlemans Bagel', 11.79);
INSERT INTO FoodItem VALUES('Turkey','Kettlemans Bagel', 11.89);
INSERT INTO FoodItem VALUES('Roast Beef','Kettlemans Bagel', 11.49);
INSERT INTO FoodItem VALUES('Philly Cheesesteak','Kettlemans Bagel', 11.79);
INSERT INTO FoodItem VALUES('Vegetarian','Kettlemans Bagel', 9.19);

INSERT INTO FoodItem VALUES('SAJ Chicken Shawarma Wrap','Osmows', 10.72);
INSERT INTO FoodItem VALUES('SAJ Beef Shawarma Wrap','Osmows', 12.42);
INSERT INTO FoodItem VALUES('SAJ Falafel Wrap','Osmows', 10.72);
INSERT INTO FoodItem VALUES('JR Chicken Shawarma','Osmows', 5.07);
INSERT INTO FoodItem VALUES('JR Beef Shawarma','Osmows', 6.77);
INSERT INTO FoodItem VALUES('JR Lamb Shawarma','Osmows', 7.33);
INSERT INTO FoodItem VALUES('Half & Half Beef Shawarma','Osmows', 14.90);
INSERT INTO FoodItem VALUES('Half & Half Lamb Shawarma','Osmows', 16.03);
INSERT INTO FoodItem VALUES('Mixed Half & Half','Osmows', 15.47);


--INSERT DATA INTO Customer TABLE
-------------------------------------------------
INSERT INTO Customer VALUES(0001,'Andrew Garfield','andrew.garf@gmail.com', 200001, '123 Sesame Street, Ottawa, ON, K1J 9Y6');
INSERT INTO Customer VALUES(0002,'Tom Holland','tom.holland@gmail.com', 200002, '50 Claridge Street, Ottawa, ON, K2L 4K6');
INSERT INTO Customer VALUES(0003,'Julie Carter','julie.carter@gmail.com', 200003, '284 Redstone Avenue, Ottawa, ON, K4N 8D2');
INSERT INTO Customer VALUES(0004,'Glenn Hurst','glenn.hurst@gmail.com', 200004, '34 Altha Avenue, Ottawa, ON, K1L 7C5');
INSERT INTO Customer VALUES(0005,'Joel Ross','joel.ross@gmail.com', 200005, '8 Bowman Road, Ottawa, ON, K1H 6V6');
INSERT INTO Customer VALUES(0006,'Randall Stevens','randall.stevans@gmail.com', 200006, '67 Chelsea Drive, Ottawa, ON, K1K 0M7');
INSERT INTO Customer VALUES(0007,'Cole Briggs','cole.briggs@gmail.com', 200007, '99 Kimway Cresent, Ottawa, ON, K1N 5Y3');
INSERT INTO Customer VALUES(0008,'Jillian Anderson','jillian.anderson@gmail.com', 200008, '2918 Fleet Street, Ottawa, ON, K2J 2S6');
INSERT INTO Customer VALUES(0009,'Brooke Moon','brooke.moon@gmail.com', 200009, '52 Saginaw Cresent, Nepean, ON, K2E 5N7');
INSERT INTO Customer VALUES(0010,'Tianna Mclean','tianna.mclean@gmail.com', 200010, '1109 Falaise Road, Nepean, ON, K2E 6R1');
INSERT INTO Customer VALUES(0011,'Elsa Holmes','elsa.holmes@gmail.com', 200011, '526 Hilson Avenue, Ottawa, ON, K1Z 6C8');
INSERT INTO Customer VALUES(0012,'Mohammad Hicks','moe.hicks@gmail.com', 200012, '139 Iona Street, Ottawa, ON, K1Y 3M2');
INSERT INTO Customer VALUES(0013,'Odin Brooks','odin.brooks@gmail.com', 200013, '205 Keyworth Avenue, Ottawa, ON, K1Y 0E8');
INSERT INTO Customer VALUES(0014,'Greta Mullins','greta.mullins@gmail.com', 200014, '362 Roosevelt Avenue, Ottawa, ON, K2A 1Z3');
INSERT INTO Customer VALUES(0015,'Tania Brown','tania.brown@gmail.com', 200015, '642 Sherbourne Road, Ottawa, ON, K2A 3H3');
INSERT INTO Customer VALUES(0016,'Alexandra King','alexandra.king@gmail.com', 200016, '6 Winslow Court, Ottawa, ON, K2B 8H1');
INSERT INTO Customer VALUES(0017,'Mason Flynn','mason.flynn@gmail.com', 200017, '2150 Rushton Road, Ottawa, ON, K2A 1N7');
INSERT INTO Customer VALUES(0018,'Blaine Stephens','blaine.stephens@gmail.com', 200018, '1171 Albany Drive, Ottawa, ON, K2C 2L1');
INSERT INTO Customer VALUES(0019,'Megan Lee','megan.lee@gmail.com', 200019, '1282 Tara Drive, Ottawa, ON, K2C 2H5');
INSERT INTO Customer VALUES(0020,'Lainey Poole','lainey.poole@gmail.com', 200020, '79 Tower Road, Ottawa, ON, K2G 2E8');

--INSERT DATA INTO Courier TABLE
-------------------------------------------------
INSERT INTO Courier VALUES(3001,'Amelia Vargas','amelia.vargas@gmail.com', 300001, 6132549284);
INSERT INTO Courier VALUES(3002,'Issac Reid','issac.reid@gmail.com', 300002, 6137394733);
INSERT INTO Courier VALUES(3003,'Rohan Harper','rohan.harper@gmail.com', 300003, 6138048897);
INSERT INTO Courier VALUES(3004,'Jarret Young','jarret.young@gmail.com', 300004, 6138302973);
INSERT INTO Courier VALUES(3005,'Tyler Swanson','tyler.swanson@gmail.com', 300005, 6135732148);
INSERT INTO Courier VALUES(3006,'Abby Para','abby.para@gmail.com', 300006, 4167245767);
INSERT INTO Courier VALUES(3007,'Safia Newton','safia.newton@gmail.com', 300007, 6136389376);
INSERT INTO Courier VALUES(3008,'Matthew Addley','matthew.addley@gmail.com', 300008, 6135348436);
INSERT INTO Courier VALUES(3009,'Daniel Lewis','daniel.lewis@gmail.com', 300009, 6138765680);
INSERT INTO Courier VALUES(3010,'Meghan Adrain','meghan.adrain@gmail.com', 300010, 6131231234);
INSERT INTO Courier VALUES(3011,'Amy Li','amy.li@gmail.com', 300011, 6132342524);
INSERT INTO Courier VALUES(3012,'Callum Liddle','callum.liddle@gmail.com', 300012, 6136352524);
INSERT INTO Courier VALUES(3013,'Olivia Little','olivia.little@gmail.com', 300013, 6138479274);
INSERT INTO Courier VALUES(3014,'Mikayla Long','mikayla.long@gmail.com', 300014, 6137362534);
INSERT INTO Courier VALUES(3015,'Simon Ludington','simon.ludington@gmail.com', 300015, 6139489887);
INSERT INTO Courier VALUES(3016,'Erin Allen','erin.allen@gmail.com', 300016, 6134827978);
INSERT INTO Courier VALUES(3017,'Filip Lukic','matthew.addley@gmail.com', 300017, 6139509487);
INSERT INTO Courier VALUES(3018,'William Ma','william.ma@gmail.com', 300018, 6137008754);
INSERT INTO Courier VALUES(3019,'Lucien Bacon','lucien.bacon@gmail.com', 300019, 6134005345);
INSERT INTO Courier VALUES(3020,'Matthew Baker','matthew.baker@gmail.com', 300020, 6135267357);


--INSERT DATA INTO WorksFor TABLE
-------------------------------------------------
INSERT INTO WorksFor VALUES(3001, 'Chungchun Rice Dog', 3);
INSERT INTO WorksFor VALUES(3001, 'El Camino', 1);
INSERT INTO WorksFor VALUES(3002, 'Seoul Dog', 4);
INSERT INTO WorksFor VALUES(3003, 'Ammas Biryani', 4);
INSERT INTO WorksFor VALUES(3003, 'Browns Socialhouse', 2);
INSERT INTO WorksFor VALUES(3003, 'Pizza Pizza', 3);
INSERT INTO WorksFor VALUES(3004, 'Chungchun Rice Dog', 1);
INSERT INTO WorksFor VALUES(3004, 'Lone Star Texas Grill', 6);
INSERT INTO WorksFor VALUES(3005, 'Seoul Dog', 4);
INSERT INTO WorksFor VALUES(3005, 'Chungchun Rice Dog', 2);
INSERT INTO WorksFor VALUES(3005, 'Lone Star Texas Grill', 1);
INSERT INTO WorksFor VALUES(3006, 'Osmows', 1);
INSERT INTO WorksFor VALUES(3006, 'Umbrella Bar', 0);
INSERT INTO WorksFor VALUES(3007, 'Gitanes Burger', 2);
INSERT INTO WorksFor VALUES(3008, 'Vivaan', 3);
INSERT INTO WorksFor VALUES(3009, 'Allo Mon Coco', 2);
INSERT INTO WorksFor VALUES(3010, 'Datsun', 0);
INSERT INTO WorksFor VALUES(3010, 'Edo Japan', 2);
INSERT INTO WorksFor VALUES(3011, 'Datsun', 1);
INSERT INTO WorksFor VALUES(3012, 'Pizza Pizza', 1);
INSERT INTO WorksFor VALUES(3013, 'Gitanes Burger', 2);
INSERT INTO WorksFor VALUES(3014, 'Osmows', 1);
INSERT INTO WorksFor VALUES(3015, 'Umbrella Bar', 2);
INSERT INTO WorksFor VALUES(3016, 'Browns Socialhouse', 0);
INSERT INTO WorksFor VALUES(3016, 'Seoul Dog', 1);
INSERT INTO WorksFor VALUES(3016, 'Allo Mon Coco', 0);
INSERT INTO WorksFor VALUES(3017, 'Kettlemans Bagel', 2);
INSERT INTO WorksFor VALUES(3017, 'Vivaan', 0);
INSERT INTO WorksFor VALUES(3018, 'Pizza Pizza', 0);
INSERT INTO WorksFor VALUES(3018, 'Edo Japan', 2);
INSERT INTO WorksFor VALUES(3019, 'Datsun', 2);
INSERT INTO WorksFor VALUES(3020, 'Lone Star Texas Grill', 0);
INSERT INTO WorksFor VALUES(3020, 'Umbrella Bar', 1);

--INSERT DATA INTO Orders TABLE
-------------------------------------------------
INSERT INTO Orders VALUES(1, 37.00, '2021-11-27 13:22:15', 3002, 0001);
INSERT INTO Orders VALUES(2, 64.95, '2021-06-13 10:12:47', 3001, 0002);
INSERT INTO Orders VALUES(29, 27.20, '2021-10-03 6:21:56', 3001, 0003);
INSERT INTO Orders VALUES(4, 32.35, '2021-12-23 09:34:17', 3001, 0010);
INSERT INTO Orders VALUES(13, 22.05, '2021-06-28 10:12:34', 3001, 0011);
INSERT INTO Orders VALUES(6, 42.50, '2022-01-22 09:23:47', 3002, 0007);
INSERT INTO Orders VALUES(18, 25.50, '2021-08-31 03:03:15', 3002, 0008);
INSERT INTO Orders VALUES(8, 18.00, '2022-03-11 14:23:39', 3002, 0020);
INSERT INTO Orders VALUES(9, 23.98, '2022-02-12 17:21:13', 3003, 0002);
INSERT INTO Orders VALUES(22, 24.97, '2022-01-01 14:12:47', 3003, 0014);
INSERT INTO Orders VALUES(15, 19.98, '2021-01-24 19:01:12', 3003, 0015);
INSERT INTO Orders VALUES(12, 47.96, '2021-03-10 01:14:29', 3003, 0005);
INSERT INTO Orders VALUES(5, 82.75, '2021-12-09 09:55:00', 3003, 0006);
INSERT INTO Orders VALUES(14, 58.50, '2021-02-12 02:17:12', 3003, 0007);
INSERT INTO Orders VALUES(11, 31.48, '2021-04-21 02:44:23', 3003, 0004);
INSERT INTO Orders VALUES(16, 45.67, '2021-05-19 08:44:47', 3003, 0016);
INSERT INTO Orders VALUES(24, 20.19, '2021-11-29 19:12:55', 3003, 0020);
INSERT INTO Orders VALUES(7, 28.30, '2021-05-03 10:12:47', 3004, 0013);
INSERT INTO Orders VALUES(19, 56.96, '2022-04-11 02:27:03', 3004, 0009);
INSERT INTO Orders VALUES(20, 43.98, '2021-11-11 09:34:22', 3004, 0010);
INSERT INTO Orders VALUES(21, 81.96, '2021-05-17 22:13:45', 3004, 0011);
INSERT INTO Orders VALUES(10, 18.99, '2021-06-01 23:57:14', 3004, 0008);
INSERT INTO Orders VALUES(23, 27.98, '2021-02-27 23:02:49', 3004, 0007);
INSERT INTO Orders VALUES(17, 30.98, '2021-12-30 11:34:21', 3004, 0012);
INSERT INTO Orders VALUES(25, 25.50, '2021-09-17 21:39:48', 3005, 0013);
INSERT INTO Orders VALUES(26, 8.50, '2021-07-26 13:48:29', 3005, 0016);
INSERT INTO Orders VALUES(27, 37.00, '2021-02-19 02:24:21', 3005, 0014);
INSERT INTO Orders VALUES(28, 17.00, '2021-06-13 10:12:47', 3005, 0018);
INSERT INTO Orders VALUES(3, 18.75, '2022-03-29 08:20:38', 3005, 0019);
INSERT INTO Orders VALUES(30, 32.35, '2021-09-31 03:48:28', 3005, 0020);
INSERT INTO Orders VALUES(31, 7.99, '2021-04-23 05:28:38', 3005, 0020);
INSERT INTO Orders VALUES(32, 22.80, '2021-12-31 04:23:18', 3006, 0011);
INSERT INTO Orders VALUES(33, 40.00, '2022-01-21 19:55:27', 3007, 0016);
INSERT INTO Orders VALUES(34, 20.00, '2022-05-18 23:01:22', 3007, 0009);
INSERT INTO Orders VALUES(35, 80.00, '2022-12-01 21:09:35', 3008, 0007);
INSERT INTO Orders VALUES(36, 83.00, '2022-07-02 18:35:32', 3008, 0013);
INSERT INTO Orders VALUES(37, 35.00, '2022-08-27 17:38:15', 3008, 0003);
INSERT INTO Orders VALUES(38, 19.95, '2021-11-20 20:20:20', 3009, 0001);
INSERT INTO Orders VALUES(39, 46.95, '2022-01-09 13:12:11', 3009, 0006);
INSERT INTO Orders VALUES(40, 32.60, '2021-03-01 14:14:12', 3010, 0008);
INSERT INTO Orders VALUES(41, 19.05, '2022-04-02 18:32:43', 3010, 0011);
INSERT INTO Orders VALUES(42, 47.25, '2021-05-03 12:29:14', 3011, 0013);
INSERT INTO Orders VALUES(43, 29.58, '2022-06-04 16:28:42', 3012, 0015);
INSERT INTO Orders VALUES(44, 36.00, '2022-06-04 17:25:25', 3013, 0018);
INSERT INTO Orders VALUES(45, 36.00, '2022-06-04 16:29:29', 3013, 0019);
INSERT INTO Orders VALUES(46, 30.94, '2021-03-09 19:53:46', 3014, 0020);
INSERT INTO Orders VALUES(47, 17.15, '2021-07-21 12:38:23', 3015, 0016);
INSERT INTO Orders VALUES(48, 47.25, '2021-03-09 17:27:41', 3015, 0004);
INSERT INTO Orders VALUES(49, 36.00, '2021-05-11 23:18:51', 3016, 0007);
INSERT INTO Orders VALUES(50, 23.38, '2021-02-27 23:38:18', 3017, 0019);
INSERT INTO Orders VALUES(51, 23.58, '2021-06-06 21:28:38', 3017, 0018);
INSERT INTO Orders VALUES(52, 50.10, '2021-06-29 13:05:18', 3018, 0003);
INSERT INTO Orders VALUES(53, 44.70, '2021-06-18 21:27:28', 3018, 0009);
INSERT INTO Orders VALUES(54, 24.10, '2021-06-19 20:17:38', 3019, 0002);
INSERT INTO Orders VALUES(55, 31.00, '2021-06-21 17:28:37', 3019, 0014);
INSERT INTO Orders VALUES(56, 20.75, '2021-06-23 19:29:38', 3020, 0017);


--INSERT DATA INTO OrderDetails TABLE
-------------------------------------------------
INSERT INTO OrderDetails VALUES(1, 'Half Beef / Half Cheese Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(1, 'Korean Rice Cake Skewers', 'Seoul Dog', 2);
INSERT INTO OrderDetails VALUES(1, 'Cheese Corn-dog', 'Seoul Dog', 1);

INSERT INTO OrderDetails VALUES(2, 'Crispy Fish Taco', 'El Camino', 3);
INSERT INTO OrderDetails VALUES(2, 'Grilled Chicken Tac', 'El Camino', 4);
INSERT INTO OrderDetails VALUES(2, 'Cauliflower Taco', 'El Camino', 1);

INSERT INTO OrderDetails VALUES(29, 'Potato Hotdog', 'Chungchun Rice Dog', 2);
INSERT INTO OrderDetails VALUES(29, 'Squid Ink Cheese Hotdog', 'Chungchun Rice Dog', 1);
INSERT INTO OrderDetails VALUES(29, 'Sweet Potato Hotdog', 'Chungchun Rice Dog', 1);

INSERT INTO OrderDetails VALUES(4, 'Cheddar Cheese Hotdog', 'Chungchun Rice Dog', 1);
INSERT INTO OrderDetails VALUES(4, 'Whole Mozzarella Cheese Hotdog', 'Chungchun Rice Dog', 3);
INSERT INTO OrderDetails VALUES(4, 'Veggie Hotdog', 'Chungchun Rice Dog', 1);

INSERT INTO OrderDetails VALUES(13, 'Sweet Potato Hotdog', 'Chungchun Rice Dog', 1);
INSERT INTO OrderDetails VALUES(13, 'Double Cheese Hotdog', 'Chungchun Rice Dog', 1);
INSERT INTO OrderDetails VALUES(13, 'Squid Ink Cheese Hotdog', 'Chungchun Rice Dog', 1);

INSERT INTO OrderDetails VALUES(6, 'Korean Rice Cake Skewers', 'Seoul Dog', 3);
INSERT INTO OrderDetails VALUES(6, 'Chicken Sausage Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(6, 'Beef Corn-dog', 'Seoul Dog', 1);

INSERT INTO OrderDetails VALUES(18, 'Korean Rice Cake Skewers', 'Seoul Dog', 3);

INSERT INTO OrderDetails VALUES(8, 'Beef Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(8, 'Half Beef / Half Cheese Corn-dog', 'Seoul Dog', 1);

INSERT INTO OrderDetails VALUES(9, 'Chicken Biryani', 'Ammas Biryani', 2);

INSERT INTO OrderDetails VALUES(22, 'Mutton Biryani', 'Ammas Biryani', 1);
INSERT INTO OrderDetails VALUES(22, 'Rice Pudding', 'Ammas Biryani', 2);

INSERT INTO OrderDetails VALUES(15, 'Mutton Biryani', 'Ammas Biryani', 1);

INSERT INTO OrderDetails VALUES(12, 'Veg Biryani', 'Ammas Biryani', 2);
INSERT INTO OrderDetails VALUES(12, 'Chicken Biryani', 'Ammas Biryani', 1);
INSERT INTO OrderDetails VALUES(12, 'Wings Karahi', 'Ammas Biryani', 1);

INSERT INTO OrderDetails VALUES(5, 'Spicy Crispy Chicken Sandwich', 'Browns Socialhouse', 1);
INSERT INTO OrderDetails VALUES(5, 'Veggie Burger', 'Browns Socialhouse', 2);
INSERT INTO OrderDetails VALUES(5, 'Fish & Chips', 'Browns Socialhouse', 1);

INSERT INTO OrderDetails VALUES(14, 'Traditional Pub Burger', 'Browns Socialhouse', 2);
INSERT INTO OrderDetails VALUES(14, 'Salt & Pepper Dry Ribs', 'Browns Socialhouse', 1);

INSERT INTO OrderDetails VALUES(11, 'Small Chicken Bruschetta Pizza', 'Pizza Pizza', 1);
INSERT INTO OrderDetails VALUES(11, 'Medium Canadian Pizza', 'Pizza Pizza', 1);

INSERT INTO OrderDetails VALUES(16, 'Large Canadian Pizza', 'Pizza Pizza', 1);
INSERT INTO OrderDetails VALUES(16, 'Large Garden Veggie Pizza', 'Pizza Pizza', 1);
INSERT INTO OrderDetails VALUES(16, 'Cheese Panzerotti', 'Pizza Pizza', 1);

INSERT INTO OrderDetails VALUES(24, 'Large Tropical Hawaiian', 'Pizza Pizza', 1);

INSERT INTO OrderDetails VALUES(7, 'Squid Ink Cheese Hotdog', 'Chungchun Rice Dog', 3);
INSERT INTO OrderDetails VALUES(7, 'Ramen Chip Hotdog', 'Chungchun Rice Dog', 1);

INSERT INTO OrderDetails VALUES(19, 'Chips & Salsa', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(19, 'California Burrito', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(19, 'Apple Crumble Pie', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(19, 'Chicken Wrap', 'Lone Star Texas Grill', 1);

INSERT INTO OrderDetails VALUES(20, 'Lone Star State Nachos', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(20, 'Double Bacon Burger', 'Lone Star Texas Grill', 1);

INSERT INTO OrderDetails VALUES(21, 'Steak Fajita Bowl', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(21, 'Crispy Chicken Sandwich', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(21, 'Chicken Wrap', 'Lone Star Texas Grill', 2);

INSERT INTO OrderDetails VALUES(10, 'Chicken Wrap', 'Lone Star Texas Grill', 1);

INSERT INTO OrderDetails VALUES(23, 'Chicken Caesar Salad', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(23, 'Churros', 'Lone Star Texas Grill', 1);

INSERT INTO OrderDetails VALUES(17, 'California Burrito', 'Lone Star Texas Grill', 1);
INSERT INTO OrderDetails VALUES(17, 'Onion Rings', 'Lone Star Texas Grill', 1);

INSERT INTO OrderDetails VALUES(25, 'Chicken Sausage Corn-dog', 'Seoul Dog', 2);
INSERT INTO OrderDetails VALUES(25, 'Beef Corn-dog', 'Seoul Dog', 1);

INSERT INTO OrderDetails VALUES(26, 'Chicken Sausage Corn-dog', 'Seoul Dog', 1);

INSERT INTO OrderDetails VALUES(27, 'Cheese Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(27, 'Half Beef / Half Cheese Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(27, 'Korean Rice Cake Skewers', 'Seoul Dog', 2);

INSERT INTO OrderDetails VALUES(28, 'Beef Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(28, 'Korean Rice Cake Skewers', 'Seoul Dog', 3);

INSERT INTO OrderDetails VALUES(3, 'Potato Hotdog', 'Chungchun Rice Dog', 2);
INSERT INTO OrderDetails VALUES(3, 'Half Mozzarella Hotdog', 'Chungchun Rice Dog', 1);


INSERT INTO OrderDetails VALUES(30, 'Half Mozzarella Hotdog', 'Chungchun Rice Dog', 2);
INSERT INTO OrderDetails VALUES(30, 'Veggie Hotdog', 'Chungchun Rice Dog', 1);
INSERT INTO OrderDetails VALUES(30, 'Whole Mozzarella Cheese Hotdog', 'Chungchun Rice Dog', 2);

INSERT INTO OrderDetails VALUES(31, 'Churros', 'Lone Star Texas Grill', 1);

INSERT INTO OrderDetails VALUES(32, 'JR Beef Shawarma', 'Osmows', 1);
INSERT INTO OrderDetails VALUES(32, 'Half & Half Lamb Shawarma', 'Osmows', 1);

INSERT INTO OrderDetails VALUES(33, 'Gitanes Burger', 'Gitanes Burger', 2);
INSERT INTO OrderDetails VALUES(33, 'Fish Sandwich', 'Gitanes Burger', 1);

INSERT INTO OrderDetails VALUES(34, 'Beef Tartare Burger', 'Gitanes Burger', 1);
INSERT INTO OrderDetails VALUES(34, 'Single Avec Fromage', 'Gitanes Burger', 1);

INSERT INTO OrderDetails VALUES(35, 'Pani Puri', 'Vivaan', 1);
INSERT INTO OrderDetails VALUES(35, 'Dal Makhani', 'Vivaan', 3);

INSERT INTO OrderDetails VALUES(36, 'Amritsari Fish Fry', 'Vivaan', 2);
INSERT INTO OrderDetails VALUES(36, 'Chilli Chicken', 'Vivaan', 1);
INSERT INTO OrderDetails VALUES(36, 'Burrata Paapdi Chaat', 'Vivaan', 2);

INSERT INTO OrderDetails VALUES(37, 'Scallops', 'Vivaan', 1);
INSERT INTO OrderDetails VALUES(37, 'Veg Galouti Kebab', 'Vivaan', 1);

INSERT INTO OrderDetails VALUES(38, 'Wild Berries Waffles', 'Allo Mon Coco', 1);

INSERT INTO OrderDetails VALUES(39, 'Philly Steak', 'Allo Mon Coco', 1);
INSERT INTO OrderDetails VALUES(39, 'Western Omlette', 'Allo Mon Coco', 1);
INSERT INTO OrderDetails VALUES(39, 'Cheese Omlette', 'Allo Mon Coco', 1);

INSERT INTO OrderDetails VALUES(40, 'Teriyaki Chicken', 'Edo Japan', 2);
INSERT INTO OrderDetails VALUES(40, 'Gyoza', 'Edo Japan', 3);

INSERT INTO OrderDetails VALUES(41, 'Veggie Udon', 'Edo Japan', 1);
INSERT INTO OrderDetails VALUES(41, 'Cup of Miso Soup', 'Edo Japan', 2);

INSERT INTO OrderDetails VALUES(42, 'Pork Belly Bao', 'Datsun', 7);

INSERT INTO OrderDetails VALUES(43, 'Medium Sausage Mushroom Melt Pizza', 'Pizza Pizza', 2);

INSERT INTO OrderDetails VALUES(44, 'American', 'Gitanes Burger', 2);
INSERT INTO OrderDetails VALUES(44, 'Tomato Sanwich', 'Gitanes Burger', 1);

INSERT INTO OrderDetails VALUES(45, 'Fish Sandwich', 'Gitanes Burger', 3);

INSERT INTO OrderDetails VALUES(46, 'Mixed Half & Half', 'Osmows', 2);

INSERT INTO OrderDetails VALUES(47, 'Mac N Cheese', 'Umbrella Bar', 1);
INSERT INTO OrderDetails VALUES(47, 'Fresh Fried Donut', 'Umbrella Bar', 1);

INSERT INTO OrderDetails VALUES(48, 'Double Cheeseburger', 'Umbrella Bar', 2);
INSERT INTO OrderDetails VALUES(48, 'Fried Chicken Sandwich', 'Umbrella Bar', 1);
INSERT INTO OrderDetails VALUES(48, 'Strawberry Milkshake', 'Umbrella Bar', 1);

INSERT INTO OrderDetails VALUES(49, 'Cheese Corn-dog', 'Seoul Dog', 1);
INSERT INTO OrderDetails VALUES(49, 'Chicken Sausage Corn-dog', 'Seoul Dog', 3);

INSERT INTO OrderDetails VALUES(50, 'Club Classic', 'Kettlemans Bagel', 1);
INSERT INTO OrderDetails VALUES(50, 'Montreal Smoked Meat', 'Kettlemans Bagel', 1);

INSERT INTO OrderDetails VALUES(51, 'Philly Cheesesteak', 'Kettlemans Bagel', 2);

INSERT INTO OrderDetails VALUES(52, 'Teriyaki Beef and Shrimp', 'Edo Japan', 3);

INSERT INTO OrderDetails VALUES(53, 'Edamame', 'Edo Japan', 6);
INSERT INTO OrderDetails VALUES(53, 'Teriyaki Salmon', 'Edo Japan', 1);

INSERT INTO OrderDetails VALUES(54, 'Wafu Salad', 'Datsun', 2);

INSERT INTO OrderDetails VALUES(55, 'Dandan Noodles', 'Datsun', 1);
INSERT INTO OrderDetails VALUES(55, 'Spicy Chicken Wings', 'Datsun', 1);

INSERT INTO OrderDetails VALUES(56, 'Fried Chicken Sandwich', 'Umbrella Bar', 1);
INSERT INTO OrderDetails VALUES(56, 'Spiced Curly Fries', 'Umbrella Bar', 1);
