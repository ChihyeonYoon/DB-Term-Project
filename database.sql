grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;


DROP DATABASE IF EXISTS Shoesdb;
CREATE DATABASE Shoesdb
    default character set utf8 
	default collate utf8_general_ci;
    
USE Shoesdb;

CREATE TABLE Shoes(
    product_name varchar(100) DEFAULT NULL,
    brand varchar(100) DEFAULT NULL,
    model_number varchar(100) not NULL,
    color varchar(100) DEFAULT NULL,
    release_date varchar(100) DEFAULT NULL,
    price varchar(100) DEFAULT NULL,
    PRIMARY Key(model_number)
)ENGINE=InnoDB
    default character set utf8 
	default collate utf8_general_ci;
    
INSERT INTO Shoes (product_name, brand, model_number, color, release_date, price) VALUES
    ('Jordan 1 Retro High OG University Blue', 'Jordan', '555088-134', 'WHITE/UNIVERSITY BLUE/BLACK', '21/03/06', '199,000원'),
    ('Jordan 1 Retro High OG Shadow 2.0', 'Jordan', '555088-035', 'BLACK/LIGHT SMOKE GREY-WHITE', '21/05/15', '199,000원'),
    ('Jordan 1 Retro High OG Hyper Royal', 'Jordan', '555088-402', 'HYPER ROYAL/LIGHT SMOKE GREY/WHITE', '21/04/14', '199,000원'),
    ('Jordan 1 Retro High OG Rust Shadow', 'Jordan', '555088-033', 'BLACK/LIGHT ARMY/SAIL/FRESH MINT', '21/03/25', '199,000원'),
    ('Jordan 1 Retro High OG Volt Gold', 'Jordan', '555088-118', 'WHITE/VOLT/UNIVERSITY GOLD/BLACK', '21/01/02', '199,000원'),
    ('Jordan 1 Retro High OG Black Mocha', 'Jordan', '555088-105', 'SAIL/DARK MOCHA-BLACK-BLACK', '20/11/13', '199,000원'),
    ('Jordan 1 x Travis Scott Retro High Mocha', 'Jordan', 'CD4487-100', 'SAIL/BLACK-DARK MOCHA-UNIVERSITY RED', '19/05/12', '239,000원'),
    ('Jordan 1 Retro High OG Court Purple 2020', 'Jordan', '555088-500', 'COURT PURPLE/WHITE-BLACK', '20/04/18', '199,000원'),
    ('Jordan 1 Retro High Obsidian UNC', 'Jordan', '555088-140', 'SAIL/OBSIDIAN-UNIVERSITY BLUE', '19/09/01', '177,700원'),
    ('Jordan 1 Retro High OG Gym Red', 'Jordan', '555088-061', 'BLACK/GYM RED-WHITE-SAIL', '19/06/30', '199,000원'),
    ('Jordan 1 Retro High Shattered Backboard 3.0', 'Jordan', '555088-028', 'BLACK/PALE VANILLA-STARFISH', '19/10/27', '199,000원'),
    ('Jordan 1 Retro High OG Defiant SB LA to Chicago', 'Jordan', 'CD6578-507', 'COURT PURPLE/BLACK-SAIL-UNIVERSITY GOLD', '19/05/26', '209,000원'),
    ('Jordan 1 Retro High Rookie of the Year', 'Jordan', '555088-700', 'GOLDEN HARVEST/BLACK-SAIL', '18/11/18', '199,000원'),
    ('Jordan 1 x Union Retro High Blue Toe', 'Jordan', 'BV1300-146', 'WHITE/STORM BLUE-VARSITY RED-BLACK', '18/11/18', '211,100원'),
    ('Jordan 1 x Union Retro High Black Toe', 'Jordan', 'BV1300-106', 'WHITE/BLACK-VARSITY RED-WOLF GREY', '18/11/18', '211,100원'),
    ('Jordan 1 Retro High Not for Resale Varsity Red', 'Jordan', '861428-106', 'SAIL/BLACK-VARSITY RED', '18/11/08', '177,700원'),
    ('Jordan 1 x Dior High OG', 'Jordan', 'CN8607-002', 'WOLF GREY/SAIL-PHOTON DUST-WHITE', '20/07/08', '3,000,000원'),
    ('Jordan 1 Retro High OG Royal Toe', 'Jordan', '555088-041', 'BLACK/WHITE-GAME ROYAL-BLACK', '20/05/09', '199,000원'),
    ('Jordan 1 x Off-White Retro High Chicago The Ten', 'Jordan', 'AA3834-101', 'WHITE/BLACK-VARSITY RED', '17/09/10', '211,100원'),
    ('Jordan 1 Retro High OG Chicago 2015', 'Jordan', '555088-101', 'WHITE/VARSITY RED-BLACK', '15/05/31', '177,700원');
    
    
SELECT * from Shoes;
    
CREATE TABLE Seller(
    id int(10) not NULL AUTO_INCREMENT,
    Seller_name varchar(100) DEFAULT NULL, 
    Selling_product varchar(100) DEFAULT NULL,
    Selling_product_number varchar(100) NOT NULL,
    Selling_price varchar(100) DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(Selling_product_number) REFERENCES Shoes(model_number)
        on delete cascade on update cascade
)ENGINE = INNODB
 DEFAULT CHARACTER SET utf8
 DEFAULT COLLATE utf8_general_ci;
 
 INSERT INTO Seller (id, Seller_name, Selling_product, Selling_product_number, Selling_price) VALUES
     (1, '조던팝니다.', 'Jordan 1 Retro High OG Gym Red', '555088-061', '300,000원');
     
SELECT * from Seller;
 
 CREATE TABLE Buyer(
     id int(10) not NULL AUTO_INCREMENT,
     Buyer_name varchar(100) DEFAULT NULL,
     Buying_product varchar(100) DEFAULT NULL,
     Buying_product_number varchar(100) NOT NULL,
     Buying_price varchar(100) DEFAULT NULL,
     PRIMARY KEY(id),
     FOREIGN KEY(Buying_product_number) REFERENCES Shoes(model_number)
         on delete cascade on update cascade
 )ENGINE = INNODB
 DEFAULT CHARACTER SET utf8
 DEFAULT COLLATE utf8_general_ci;
 
 INSERT INTO Buyer (id, Buyer_name, Buying_product, Buying_product_number, Buying_price) VALUES
     (1, '조던삽니다.', 'Jordan 1 Retro High OG Gym Red', '555088-061', '290,000원');
     
SELECT * from Buyer;
     
##############################################################################################################
     
SELECT Seller.Seller_name as 'Seller name', Seller.Selling_product as 'product', Seller.Selling_price as 'price' from Seller;

###############################################################################################################

SELECT 
Seller_name as 'Seller name', Selling_product as 'Selling product', Selling_price as 'Selling price', 
Buyer_name as 'Buyer name', Buying_product as 'Buying product', Buying_price as 'Buying price' 
from Seller 
join Buyer on Selling_product_number = Buying_product_number;

#WHERE Seller.Selling_product_number = Buyer.Buying_product_number;



 