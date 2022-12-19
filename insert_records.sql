-- transport_type
insert into transport_type (type)  values 
	('Metro'),
	('Bus'),
	('Light rail'),
	('Trolley'),
	('Tramway'),
	('Ferries'),
	('Minibus'),
	('Atmospheric railway'),
	('Funicular'),
	('Funitel'),
	('Maglev'),
	('Chairlift'),
	('Heritage streetcar'),
	('Slope car'),
	('Bicycle-sharing system'),
	('Monorail');


-- Driver
insert into driver (First_name, Last_name, Age, Driver_license_category)  values 
	('Vasyl', 'Poroshenko', 19, 'D'),
	('Olga', 'Petrenko', 43, 'D'),
	('Andrii', 'Borysenko', 53, 'D'),
	('Bohdan', 'Zghurskyi', 60, 'D'),
	('Dmytro', 'Mykhailenko', 69, 'D'),
	('Oleh', 'Galagan', 20, 'D'),
	('Oleksii', 'Haievych', 31, 'D'),
	('Roman', 'Sternenko', 33, 'D'),
	('Vlad', 'Taraban', 37, 'M'),
	('Yurii', 'Trots', 42, 'D'),
	('Daniil', 'Zhupnick', 35, 'T'),
	('Natalia', 'Melnikova', 29, 'T'),
	('Stepan', 'Skopivskiy', 45, 'T');


-- route;
insert into route (description, Transport_Type_id)  values 
	('Dubliany - Halytska Square', 2),
	('Pasichna St - Konovaltsia St', 5),
	('ZALIZNYCHNYI VOKZAL - POHULIANKA', 2),
	('KING CROSS LEOPOLIS MALL - RIZNI SQUARE', 2),
	('RIASNE-2 MICRORAYON - HALYTSKA SQUARE', 2),
	('HALYTSKE PEREKHRESTIA - AVTOVOKZAL', 2),
	('v. Pidriasne - v. Pidbirtsi', 2),
	('Chervonoi Kalyny Ave - Halytske perekhrestia', 2),
	('Rudne - Petra Pancha St', 2),
	('Santa Barbara - Riasne-2 Microrayon', 2),
	('Hrinchenka St - Skrypnyka St', 7),
	('Zernova St - v. Briukhovychi', 7),
	('Chervonoi Kalyny Ave - Riasne-2 Microrayon', 7),
	('Subotivska St - Chervonoi Kalyny Ave', 7),
	('Prymiskyi vokzal - Medovoi Pechery St', 7),
    ('Pasichna St - Konovaltsia St', 5),
    ('Soborna Square - Akvapark', 5),
    ('Zaliznychnyi vokzal - Vernadskoho St', 5),
    ('Mykolaichuka St - Zaliznychnyi vokzal', 5),
    ('PASICHNA ST - KONOVALTSIA ST', 5);


-- stop
insert into stop (stop_name, street_name)  values 
	('Shevchenka', 'Shevchenka st'),
	('Buzkova', 'Buzkova st'),
	('Brativ Mikhnovskykh', 'Brativ Mikhnovskykh st'),
	('RIZNI', 'RIZNI SQU'),
	('Akademika Liulky', 'Akademika Liulky st'),
	('Pohulianka', 'Pohulianka st'),
	('Halytska', 'Halytska st'),
	('Pekarska', 'Pekarska st'),
	('Stryiska', 'Stryiska st'),
	('Ruska', 'Ruska st'),
	('Krakivska', 'Krakivska st'),
	('Zelena', 'Zelena st'),
	('Mytna', 'Mytna sq'),
	('Soborna', 'Soborna sq'),
	('Marka Kropyvnytskoho', 'Marka Kropyvnytskoho sq'),
	('Koliivshchyny', 'Koliivshchyny sq'),
	('Adama Mitskevycha', 'Adama Mitskevycha sq'),
	('Henerala Hryhorenka', 'Henerala Hryhorenka sq'),
	('Ivana Pidkovy', 'Ivana Pidkovy sq'),
	('Shevska', 'Shevska st');


-- company
insert into company (Country, company_name, region, address)  values 
	('Ukraine', 'KP LvivElectroTrans', 'Lviv', '2, Ak. Sakharova St, Lviv'),
	('Ukraine', 'LK ATP #1', 'Lviv', '1, Aviatsiina St, Lviv'),
	('Ukraine', 'LK ATP #2', 'Lviv', '5, Aviatsiina St, Lviv'),
	('GB', 'Best busses company LTD', 'London', '115, Boris Djonson st, London'),
	('Poland', 'Best trams company', 'Krakiv', '2, Ak. Duda St, Krakiv'),
	('Ukraine', 'PP KyivElectroTrans', 'Kyiv', '111, Ak. Shevchenka St, Kyiv'),
	('Ukraine', 'TOV Fine Busses Company', 'Lviv', '10, Ak. Banderi St, Lviv');


-- company_info
insert into company_info (Company_id, Registration_date, Release_date, number_of_employees)  values 
	(1, '2012-11-30','2013-11-30', 1000),
	(2, '1992-09-16','1993-09-16', 200),
	(3, '2017-07-01','2018-07-01', 300),
	(4, '2009-10-09','2009-11-09', 400),
	(5, '2011-11-11','2011-11-13', 500),
	(6, '1996-10-24','1996-11-24', 600),
	(7, '2001-02-03','2001-03-03', 70);


-- transport
insert into transport (max_speed, finance_los, number_of_passengers, license_plate, Color, Route_num, Company_id, Driver_id)  values 
	(50, 10, 100,'BC7749ET', 'Yellow', 1, 1, 5),
	(75, 15, 50,'BC5359OA', 'Blue', 1, 2, 6),
	(100, 7, 150,'BC2556ET', 'Black', 2, 3, 7),
	(80, 8, 75,'BC1290OI', 'White', 2, 1, 8),
	(50, 20, 80,'BC6436OI', 'Yellow', 3, 4, 9),
	(30, 10, 60,'BC9578OH', 'Green', 3, 5, 10),
	(90, 10, 65,'BC3582OB', 'Yellow', 4, 6, 12),
	(50, 10, 100,'BC8749ET', 'Yellow', 5, 5, 11),
	(75, 30, 100,'BC9359OA', 'Blue', 6, 2, 13),
	(100, 10, 150,'B22556ET', 'Black', 6, 3, 12),
	(80, 10, 30,'BC34290OI', 'White', 6, 3, 11),
	(50, 5, 80,'BC6436OI', 'Yellow', 7, 7, 10),
	(30, 10, 130,'BC9578OH', 'Green', 8, 7, 9),
	(90, 7, 200,'BC6582OB', 'Yellow', 9, 2, 8),
	(50, 7, 150,'BC7749ET', 'Yellow', 9, 3, 7),
	(75, 10, 100,'BC5859OA', 'Blue', 10, 5, 6),
	(100, 10, 100,'BC4556ET', 'Black', 11, 7, 5),
	(80, 10, 75,'BC1990OI', 'White', 11, 6, 4),
	(50, 10, 95,'BC6236OI', 'Yellow', 12, 2, 3),
	(30, 10, 90,'BC9878OH', 'Green', 12, 2, 2),
	(90, 10, 100,'BC4582OB', 'Yellow', 13, 3, 1);
	

-- transport_has_stop
insert into transport_has_stop (transport_id, Stop_id, Start_time, Stop_time, Spanding_time)  values 
	(1, 1, '07:30:00', '07:32:00', '00:02:00'),
	(1, 2, '08:30:00', '08:35:00', '00:05:00'),
	(1, 3, '09:30:00', '09:37:00', '00:07:00'),
	(1, 4, '10:30:00', '10:33:00', '00:03:00'),
	(1, 5, '11:30:00', '11:34:00', '00:04:00'),
	(1, 6, '12:30:00', '12:35:00', '00:05:00'),
	(1, 7, '13:30:00', '13:35:00', '00:05:00'),
	(1, 8, '14:30:00', '14:31:00', '00:01:00'),
	(1, 9, '15:30:00', '15:33:00', '00:03:00'),
	(1, 10, '16:30:00', '16:32:00', '00:02:00'),
	(1, 11, '17:30:00', '17:32:00', '00:02:00'),
	(1, 12, '18:30:00', '18:32:00', '00:02:00'),
	(1, 13, '19:30:00', '19:40:00', '00:10:00'),
	(1, 14, '20:30:00', '20:15:00', '00:15:00'),
	(1, 15, '07:30:00', '07:30:00', '00:05:00'),
	(1, 16, '08:30:00', '08:30:00', '00:05:00'),
	(1, 17, '09:30:00', '09:30:00', '00:05:00'),
	(1, 18, '10:30:00', '10:30:00', '00:02:00'),
	(2, 1, '12:30:00', '12:32:00', '00:02:00'),
	(2, 2, '13:30:00', '13:32:00', '00:02:00'),
	(2, 3, '14:30:00', '14:37:00', '00:07:00'),
	(2, 4, '15:30:00', '15:40:00', '00:10:00'),
	(2, 5, '16:30:00', '16:32:00', '00:02:00'),
	(2, 6, '17:30:00', '17:32:00', '00:02:00');
        