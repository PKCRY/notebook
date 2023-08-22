
DROP DATABASE IF EXISTS "journaling";
CREATE DATABASE "journaling";


DROP TABLE IF EXISTS "users" CASCADE;
CREATE TABLE "users" (
	"user_id" SERIAL PRIMARY key,
	"username" VARCHAR ( 50 ) UNIQUE NOT NULL,
	"password" VARCHAR ( 50 ) NOT NULL,
	"email" VARCHAR ( 255 ) UNIQUE NOT null
);

DROP TABLE IF EXISTS "journals" CASCADE;
CREATE TABLE IF NOT EXISTS "journals" (
	"journal_id" SERIAL PRIMARY KEY,
	"journal_name" VARCHAR ( 250 ),
	"journal_desc" VARCHAR ( 250 ),
    "user_id_fk" INTEGER REFERENCES "users"("user_id") NOT NULL
);

DROP TABLE IF EXISTS "pages" CASCADE;
CREATE TABLE "pages" (
	"page_id" SERIAL PRIMARY KEY,
	"page_title" VARCHAR ( 50 ),
	"page_contents" TEXT,
	"page_number" INTEGER,
    "journal_id_fk" INTEGER REFERENCES "journals"("journal_id") NOT NULL
);


INSERT INTO "users" ("username","password","email") VALUES
	 ('nick card','123','nickcard@email.com'),
	 ('travis hammonds','123','travishammonds@email.com'),
	 ('siobhan mcshea','123','siobhanmcshea@email.com'),
	 ('olivia brumguard','123','oliviabrumgard@email.com'),
	 ('brayden hoak','123','braydenhoak@email.com');
	
INSERT INTO "journals" ("user_id_fk","journal_name","journal_desc") VALUES
	 (1,'Coding Notes','notes for getting better at coding '),
	 (2,'Coding Notes','Notes for Class'),
	 (3,'Nursing Notes','Notes for nursing'),
	 (4,'Cafe recipies','notes for how to pull the best espresso'),
	 (5,'how to get a big tiddy goth gf','self explanitory');
	
INSERT INTO "pages" ("journal_id_fk", "page_title","page_contents", "page_number") VALUES
	 (1,'Coding Notes','notes for getting better at coding', 1),
	 (2,'Coding Notes','Notes for Class',1),
	 (3,'Nursing Notes','Notes for nursing',1),
	 (4,'Cafe recipies','notes for how to pull the best espresso',1),
	 (5,'how to get a big tiddy goth gf','self explanitory',1);


