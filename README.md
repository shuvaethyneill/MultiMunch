# MultiMunch

## Description
MultiMunch is an online food delivery management system that keeps track of orders made between customers and restaurants within the application, along with the couriers who delivered these orders. The website uses **PHP**, **HTML**, **CSS**, and **SQLite3**.

All data relating to customers, couriers, restaurants, orders, and food items will be kept in one central location within the system database. The database provides indexing information that catalogs well-known restaurants, their food items, and orders. Using the MultiMunch interface, individuals will be able to search or click for restaurants, customers, and couriers by name in a list on their respective pages.

**The website consists of various main .php files:**

- restaurant.php
- customer.php
- courier.php

**The website is supported by various include files in the includes folder:**

- header.inc.php
	- This file includes MultiMunch logo that appears as a header. It also contains the top navigation bar that is for each page of the site that gives a user the ability to switch between the restaurant, customer, and courier pages.

- database.inc.php
	- This file contains a collection of functions to deal with the SQLite3 database (multimunch.db) including database connection and querying. 

- database/multimunch.db
	- This file is the SQLite3 database that makes up all of the data presented in the interface. It is stored in a database folder within the includes folder. 


The CSS folder contains open source formatting and design specifications. The images folder contains user profile images. 

## Installation & Setup

To successfully run the program, a user must have access to XAMPP on a Windows/MacOS device.

1. Download XAMPP onto your computer using the following link:
	- https://www.apachefriends.org/index.html 

2. Create a MultiMunch folder that contains all the files and folders mentioned in the section above. 

3. Move the MultiMunch folder into the directory path: C:\XAMPP\htdocs.


## Usage
1. After downloading XAMPP successfully onto your computer, open the XAMPP Control Panel. Under the "Manage Servers" tab, click "Apache Web Server" and press Start.

2. To run the web application, open your preferred web browser and type the following in the search bar: 
	```
	localhost/MultiMunch/restaurant.php
	```

3. The MultiMunch interface will now appear on the page.

</br>

**Steps on how to navigate your way through the site:**

- restaurant.php
	- The restaurant page contains information about all restaurants in the system. On the left hand side there is a list of all the available restaurants and users will be able to see further details about a restaurant if they click its name. There is also a search bar that lets a user search for their desired restaurant by name and it will adjust the list of restaurants depending on the search results. There are 4 tabs you can view after selecting a restaurant: info, menu, orders, couriers. The info tab states the cuisines, rating, and address of the restaurant. The menu tab lists all the food items the restaurant has to offer. The orders tab lists all the past orders that have be made by customers and delivered by couriers. Finally, the courier tab lists all the couriers that work for the restaurant. 

- customer.php
	- The customer page contains information about all customers in the system. On the left hand side there is a list of all the customers and if a name is clicked, further details about the customer will appear including their unique id, email, phone, and the restaurants they work for (along with how many deliveries they have done for each), and the specific orders they have delivered. There is also a search bar that lets a user search for a specific courier by name and it will adjust the list of courier depending on the search results. 

- courier.php
	- The courier page contains information about all courier in the system. On the left hand side there is a list of all the courier and if a name is clicked, further details about the courier will appear including their unique id, email, address, and past orders. There is also a search bar that lets a user search for a specific customer by name and it will adjust the list of customers depending on the search results.
