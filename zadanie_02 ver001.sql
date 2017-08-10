

# generate AGENCY'es 
    
insert into contact (phone, email) values ('+48 500 122 345', 'wroclaw.west@rentalagency.com');
insert into address (street, h_num, city, postal, country) values ('prosta', '22', 'wroclaw', '00-000', 'PL');
insert into agency (address_id, contact_id) values ((select max(id) from contact), (select max(id) from address));

insert into contact (phone, email) values ('+48 500 122 395', 'wroclaw.south@rentalagency.com');
insert into address (street, h_num, city, postal, country) values ('dluga', '5', 'wroclaw', '00-000', 'PL');
insert into agency (address_id, contact_id) values ((select max(id) from contact), (select max(id) from address));

insert into contact (phone, email) values ('+48 500 122 325', 'wroclaw.center@rentalagency.com');
insert into address (street, h_num, city, postal, country) values ('parkowa', '11', 'wroclaw', '00-000', 'PL'); 
insert into agency (address_id, contact_id) values ((select max(id) from contact), (select max(id) from address));

insert into contact (phone, email) values ('+48 500 122 305', 'poznan.center@rentalagency.com');
insert into address (street, h_num, city, postal, country) values ('szewska', '27', 'poznan', '00-000', 'PL'); 
insert into agency (address_id, contact_id) values ((select max(id) from contact), (select max(id) from address));

insert into contact (phone, email) values ('+48 500 122 335', 'poznan.airport@rentalagency.com');
insert into address (street, h_num, city, postal, country) values ('bukowska', '139', 'poznan', '00-000', 'PL'); 
insert into agency (address_id, contact_id) values ((select max(id) from contact), (select max(id) from address));


# generate CUSTOMER's

insert into contact (phone, email) values ('+48 601 642 395', 'mariusz.nowak@gmail.com');
insert into address (street, h_num, city, postal, country) values ('dabrowskiego', '12a', 'wroclaw', '00-000', 'PL'); 
insert into customer (cname, surname, birthdate, creditcard, address_id, contact_id) values ('Mariusz', 'Nowak', '1974-12-03', '149812349823',  (select max(id) from contact), (select max(id) from address));

insert into contact (phone, email) values ('+48 503 942 295', 'michal.kowalski@wp.pl');
insert into address (street, h_num, city, postal, country) values ('pilsudskiego', '43/15', 'wroclaw', '00-000', 'PL'); 
insert into customer (cname, surname, birthdate, creditcard, address_id, contact_id) values ('Michal', 'Kowalski', '1987-03-27', '249312349828',  (select max(id) from contact), (select max(id) from address));

insert into contact (phone, email) values ('+48 604 682 197', 'tomasz.jankowski@gmail.com');
insert into address (street, h_num, city, postal, country) values ('nadrzeczna', '7b', 'wroclaw', '00-000', 'PL'); 
insert into customer (cname, surname, birthdate, creditcard, address_id, contact_id) values ('Tomasz', 'Jankowski', '1962-09-08', '179852349823',  (select max(id) from contact), (select max(id) from address));


# generate WORKER's

insert into positions (job) values ('advisor'), ('manager'), ('accountant');
insert into worker (wname, surname, birthdate, agency_id, position_id) values ('Michal', 'Walczak', '1991-07-05', '1', '1');
insert into worker (wname, surname, birthdate, agency_id, position_id) values ('Stefan', 'Baranowski', '1983-08-22', '1', '2');
insert into worker (wname, surname, birthdate, agency_id, position_id) values ('Roman', 'Mielczarek', '1993-11-02', '2', '1');
insert into worker (wname, surname, birthdate, agency_id, position_id) values ('Bartosz', 'Wojciechowski', '1978-01-17', '2', '2');
insert into worker (wname, surname, birthdate, agency_id, position_id) values ('Mateusz', 'aFtowicz', '1978-01-17', '2', '3');


# generate VEHICLE's

insert into vehicle (veh_type, veh_model, manufacturer, prod_year, colour, capacity, horsepower, mileage) values ('sedan', '626', 'mazda', '1994', 'silver', '1998', '118', '211800');
insert into vehicle (veh_type, veh_model, manufacturer, prod_year, colour, capacity, horsepower, mileage) values ('roadster', 'mx-5', 'mazda', '1998', 'red', '1598', '115', '100550');
insert into vehicle (veh_type, veh_model, manufacturer, prod_year, colour, capacity, horsepower, mileage) values ('sedan', '407', 'peugeot', '2008', 'blue', '1995', '123', '87630');


# assign Vehicles to Workers

insert into vehicle_worker values('1', '1');
insert into vehicle_worker values('1', '3');
insert into vehicle_worker values('2', '1');
insert into vehicle_worker values('3', '1');
insert into vehicle_worker values('3', '3');


# generate LEASE events

insert into lease (customer_id, vehicle_id, lease_value, taken_place_id, taken_date, return_place_id, return_date) values ('1', '3', '90', '4', '2016-11-02', '3', '2016-11-09');
insert into lease (customer_id, vehicle_id, lease_value, taken_place_id, taken_date, return_place_id, return_date) values ('2', '3', '210', '3', '2017-08-06', '2', '2017-08-07');
insert into lease (customer_id, vehicle_id, lease_value, taken_place_id, taken_date, return_place_id, return_date) values ('3', '2', '270', '3', '2017-08-04', '1', '2017-08-08');
insert into lease (customer_id, vehicle_id, lease_value, taken_place_id, taken_date, return_place_id, return_date) values ('3', '2', '290', '1', '2017-08-09', '1', '2017-08-10');
insert into lease (customer_id, vehicle_id, lease_value, taken_place_id, taken_date, return_place_id, return_date) values ('2', '1', '320', '4', '2017-07-29', '1', '2017-07-31');
insert into lease (customer_id, vehicle_id, lease_value, taken_place_id, taken_date, return_place_id, return_date) values ('2', '1', '550', '1', '2017-08-01', '3', '2017-08-05');



# eventually look at the data

  select * from lease;
  select * from agency;

  select * from customer;
  select * from worker;

  select * from address;
  select * from contact;
  
  select * from vehicle;
  select * from vehicle_worker;
  select * from positions;
  
  
  
