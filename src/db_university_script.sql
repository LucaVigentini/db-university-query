-- 1 Selezionare tutti gli studenti nati nel 1990 

select * 
from students s 
where year(date_of_birth) = 1990;

-- 2 Selezionare tutti i corsi che valgono più di 10 crediti

select *
from courses c 
where cfu > 10;

-- 3 Selezionare tutti gli studenti che hanno più di 30 anni

select *
from students s 
where timestampdiff(year, date_of_birth, curdate()) > 30;


-- 4 Selezionare tutti i corsi di laurea magistrale

select *
from degrees d 
where `level` = 'magistrale'; 


-- 5 Da quanti dipartimenti è composta l’università?

select count(department_id) as n_dipartimenti
from degrees d 
where department_id is not null;

-- 6 Quanti sono gli insegnanti che non hanno un numero di telefono?

select count(name) as insegnanti_senza_telefono
from teachers t 
where phone is null;

-- 7 Contare quanti iscritti ci sono stati ogni anno

select year(enrolment_date) as year, count(id) as iscritti
from students
group by year(enrolment_date)
order by enrolment_date;

-- 8 Calcolare la media dei voti di ogni appello d’esame 

select exam_id as appello, avg(vote) as media
from exam_student es 
group by exam_id;

-- 9 Contare quanti corsi di laurea ci sono per ogni dipartimento

select d.name as dipartimento, count(d2.id)
from departments d 
join degrees d2 on d2.department_id = d.id
group by d.id;

-- 10 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

select s.name
from students s 
join `degrees` d on s.degree_id = d.id 
where d.name = 'Corso di Laurea in Economia';


-- 11 Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

select d.name 
from `degrees` d 
join departments d2  on d.department_id = d2.id
where d.level = 'magistrale' and d2.name = 'Dipartimento di Neuroscienze';


-- 12 Selezionare tutti i corsi in cui insegna Fulvio Amato

select ct.course_id 
from course_teacher ct 
join teachers t on ct.teacher_id = t.id
where t.name = 'Fulvio' and t.surname ='Amato';


-- 13 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

select s.name, s.surname, d.name as corso_di_laurea, dep.name as dipartimento
from departments dep
inner join degrees d
on dep.id = d.department_id
inner join students s 
on d.id = s.degree_id
order by s.surname, s.name asc;



