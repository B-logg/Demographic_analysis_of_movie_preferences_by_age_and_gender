-- create database fgr;
-- use fgr;

create table AgeRange (
    age_id int,
    age_range varchar(20) unique,
	check (age_range in ('5-11', '11-14', '15-18', '19-29', '30-39', '40-49', 
    '50-59', '60-69', '70-79', '80-89', '90-100', '100-')),
    primary key (age_id)
);

create table User (
	user_id int,
    gender varchar(6) not null,
    age_id int,
    birth_of_year int,
    name varchar(100),
    check (gender in ('Male', 'Female')),
    check(birth_of_year between 1900 and 2020),
    primary key (user_id),
    foreign key(age_id) references AgeRange(age_id)
);

create table Movie (
    movie_id int,
    title varchar(255) unique not null,
    release_date varchar(20),
    director varchar(100) not null,
    age_limit varchar(5),
    running_time varchar(10),
    movieInfo varchar(1000),
    actor varchar(255),
    check (age_limit in ('0', '12+', '15+', '19+')),
    primary key(movie_id)
);

create table Genre (
    genre_id int,
    genreName VARCHAR(50) unique not null,
    information varchar(500),
    primary key(genre_id)
);

create table MovieGenre (
    genre_id int,
    movie_id int,
    primary key (genre_id, movie_id),
    foreign key (genre_id) references Genre(genre_id),
    foreign key (movie_id) references Movie(movie_id)
);

create table MovieRating (
    user_id int,
    movie_id int,
    rating decimal(2,1) not null,
    watched_date varchar(20),
    until_the_end boolean,
    review varchar(1000),
    primary key (user_id, movie_id),
    foreign key (user_id) references User(user_id),
    foreign key (movie_id) references Movie(movie_id),
    check (rating >= 0.0 and rating <= 5.0)
);
