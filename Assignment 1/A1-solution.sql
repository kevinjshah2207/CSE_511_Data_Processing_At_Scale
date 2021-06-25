create table users (
    userid int primary key not null,
    name text not null
);

create table movies (
    movieid int primary key not null,
    title text not null
);

create table taginfo (
    tagid int primary key not null,
    content text not null
);

create table genres (
    genreid int primary key not null,
    name text not null
);

create table ratings (
    userid int not null,
    movieid int not null,
    rating float not null,
    "timestamp" bigint not null,
    constraint ratingspk primary key (userid, movieid),
    constraint userid foreign key (userid)
        references users(userid) match simple
        on update cascade
        on delete cascade
        not valid,
    constraint movieid foreign key (movieid)
        references movies(movieid) match simple
        on update cascade
        on delete cascade
        not valid,
    constraint rating check (rating >= 0 and rating <= 5) not valid
);

create table tags (
    userid int not null,
    movieid int not null,
    tagid int not null,
    "timestamp" bigint,
    constraint tagspk primary key (userid, movieid, tagid)
    constraint userid foreign key (userid)
        references users(userid) match simple
        on update cascade
        on delete cascade
        not valid,
    constraint movieid foreign key (movieid)
        references movies(movieid) match simple
        on update cascade
        on delete cascade
        not valid,
    constraint tagid foreign key (tagid)
        references tags(tagid) match simple
        on update cascade
        on delete cascade
        not valid,
);

create table hasagenre (
    movieid int not null,
    genreid int not null,
    constraint movieid foreign key (movieid)
        references movies(movieid) match simple
        on update cascade
        on delete cascade
        not valid,
    constraint genreid foreign key (genreid)
        references genres(genreid) match simple
        on update cascade
        on delete cascade
        not valid,
);