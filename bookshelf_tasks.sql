-- 1 задание

select count(books.id) as books_count, authors.name
from authors
join authors_books on authors.id = authors_books.authors_id
join books on books.id = authors_books.books_id
group by authors.name
order by books_count desc
limit 1;

-- 2 задание

select * 
from books
where year is not null
order by books.year asc
limit 5;

-- 3 задание

select count(books.shelves_id) 
from shelves
join books on shelves.id = books.shelves_id
where shelves_id = (
    select id from shelves
   where shelves.title = "Полка в кабинете"
    )


-- 4 задание

select books.title, books.year, authors.name
from shelves
join books on shelves.id = books.shelves_id
join authors 
join authors_books on books.id = authors_books.books_id and authors.id = authors_books.authors_id
where shelves.title = "Полка в спальне"

-- 5 задание

select books.title, books.year
from authors
join authors_books on authors.id = authors_books.authors_id
join books on books.id = authors_books.books_id
where authors.name = 'Лев Толстой'

-- 6 задание

select books.title, authors.name
from authors
join authors_books on authors.id = authors_books.authors_id
join books on books.id = authors_books.books_id
where authors.name like 'А%'

-- 7 задание

select books.title, authors.name, shelves.title
from shelves 
join books on books.shelves_id = shelves_id
join authors
join authors_books on books.id = authors_books.books_id and authors.id = authors_books.authors_id
where shelves.title like '%Верхняя%' or shelves.title like '%Нижняя%'

-- 8 задание 

update books
set friends_id = (
select id from friends
where friends.name = 'Иванов Иван'
)
where id = (
    select books.id
    from books
    join authors_books on books.id = authors_books.books_id
    join authors on authors.id = authors_books.authors_id
    where
    books.title = "Божественная комедия"
    and
    authors.name = "Данте Алигьери"
    
)

-- 9 задание
INSERT INTO books (title, year, shelves_id)
VALUES ('Краткие ответы на большие вопросы', 2020, 2);

INSERT INTO authors (name)
VALUES ('Стивен Хокинг');










