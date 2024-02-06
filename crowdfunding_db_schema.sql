--DROP DATABASE IF EXISTS crowdfunding_db;
-- CREATE DATABASE crowdfunding_db;

DROP TABLE IF EXISTS "CAMPAIGN";
DROP TABLE IF EXISTS "CONTACTS";
DROP TABLE IF EXISTS "SUBCATEGORY";
DROP TABLE IF EXISTS "CATEGORY";


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/D8pBGV
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE crowdfunding_db.public."CAMPAIGN" (
    "cf_id" int   NOT NULL,
    "contact_id" VARCHAR(4)   NOT NULL,
    "company_name" text   NOT NULL,
    "description" text   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" text   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" VARCHAR(2)   NOT NULL,
    "currency" VARCHAR(3)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(4)   NOT NULL,
    "subcategory_id" VARCHAR(8)   NOT NULL,
    CONSTRAINT "pk_CAMPAIGN" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE crowdfunding_db.public."CATEGORY" (
    "category_id" VARCHAR(4)   NOT NULL,
    "category" text   NOT NULL,
    CONSTRAINT "pk_CATEGORY" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE crowdfunding_db.public."SUBCATEGORY" (
    "subcategory_id" VARCHAR(8)   NOT NULL,
    "subcategory" text   NOT NULL,
    CONSTRAINT "pk_SUBCATEGORY" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE crowdfunding_db.public."CONTACTS" (
    "contact_id" VARCHAR(4)   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "email" text   NOT NULL,
    CONSTRAINT "pk_CONTACTS" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE crowdfunding_db.public."CAMPAIGN" ADD CONSTRAINT "fk_CAMPAIGN_contact_id" FOREIGN KEY("contact_id")
REFERENCES crowdfunding_db.public."CONTACTS" ("contact_id");

ALTER TABLE crowdfunding_db.public."CAMPAIGN" ADD CONSTRAINT "fk_CAMPAIGN_category_id" FOREIGN KEY("category_id")
REFERENCES crowdfunding_db.public."CATEGORY" ("category_id");

ALTER TABLE crowdfunding_db.public."CAMPAIGN" ADD CONSTRAINT "fk_CAMPAIGN_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES crowdfunding_db.public."SUBCATEGORY" ("subcategory_id");


SELECT * FROM crowdfunding_db.public."CAMPAIGN";
SELECT * FROM crowdfunding_db.public."CONTACTS";
SELECT * FROM crowdfunding_db.public."CATEGORY";
SELECT * FROM crowdfunding_db.public."SUBCATEGORY";
