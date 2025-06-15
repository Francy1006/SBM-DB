
CREATE TABLE menu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    menu varchar(50) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE item_group (
    id INT PRIMARY KEY AUTO_INCREMENT,
    group_name varchar(50) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE item_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category varchar(50) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE item_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type varchar(50) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE instruction (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description varchar(255) not null
);


CREATE TABLE item_configuration (
    id INT PRIMARY KEY AUTO_INCREMENT,
    configuration varchar(255) NOT NULL
);

