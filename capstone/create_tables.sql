drop table if exists sale;
drop table if exists time;
drop table if exists property;
drop table if exists postcode;

create table if not exists time
(
    timestamp TIMESTAMP not null primary key,
    day       INTEGER,
    week      INTEGER,
    month     INTEGER,
    year      INTEGER,
    weekday   INTEGER
);

create table if not exists property
(
    id       SERIAL  not null primary key,
    type     VARCHAR not null,
    is_new   BOOLEAN,
    duration VARCHAR
);

create table if not exists postcode
(
    code      VARCHAR(7) not null primary key,
    region    VARCHAR    not null,
    country   VARCHAR    not null,
    latitude  FLOAT      not null,
    longitude FLOAT      not null
);

create table if not exists sale
(
    id          VARCHAR(36) not null primary key,
    price       INTEGER     not null,
    date        TIMESTAMP   not null references time (timestamp),
    property_id INTEGER     not null references property (id),
    postcode    VARCHAR(7)  not null references postcode (code),
    address     varchar
);
