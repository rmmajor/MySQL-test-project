-- знаходимо найзайнятіших водіїв. Бачимо, що всі вони зареєстровані на двох транспортних засобах. Пізніше проаналізуємо їх маршрути
-- цікаво відмітити, що всі вони мають категорію D. Можна зробити висновок, що автобуси є найзатребуванішим видом громадського транспорту
select Driver_id, First_name, Last_name, Driver_license_category, count(t.Transport_id) as vehicles
from driver d
inner join transport t using(Driver_id)
group by driver_id
order by vehicles desc
limit 3;

-- бачимо, що наші водії трудяться на різних маршрутах. На жаль схемою бази даних не передбачена розбивка на дні тижня
-- тому ми не можемо перевірити такого роду накладки в графіках
select Driver_id, First_name, Last_name, count(t.Transport_id) as routs
from driver d
inner join transport t using(Driver_id)
inner join route r using(Route_num)
group by driver_id 
order by routs desc
limit 3;

-- натомість проаналізуємо укомплектованість маршрутів транспортом
-- розділимо маршрути на три категорії: недостатня комплектація, нормальна і задовільна.
-- при цьому будемо вважати 0 критичним значенням, 1-3 достатнім, >4 надмірним
select description, count(t.Transport_id),
	 case when count(t.Transport_id) = 0 then 'too little'
 		 when count(t.Transport_id) <= 3 then 'enough'
 		 else  'too many' end
		 as category
from route r
left join transport t using(Route_num)
group by Route_num;

-- ВИСНОВОК: бачимо, що багато наших маршрутів критично недоукомплектовані, а також деякі 
-- наші водії змушені працювати на кількох маршрутах одночасно.
-- Отже, необхідно доукомплектувати маршрути, найняти більше водіїв, ефективніше організувати формквання розкладу