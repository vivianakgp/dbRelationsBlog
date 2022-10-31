CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE,
  "age" int
);

CREATE TABLE "authors" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "category_name" varchar UNIQUE
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar NOT NULL,
  "user_id" int,
  "post_id" int
);

CREATE TABLE "Posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar,
  "content" varchar NOT NULL,
  "author_id" int NOT NULL,
  "categories_id" int NOT NULL
);

CREATE TABLE "rel_post_category" (
  "id" SERIAL PRIMARY KEY,
  "post_id" int,
  "categories_id" int
);

ALTER TABLE "Posts" ADD FOREIGN KEY ("author_id") REFERENCES "authors" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "Posts" ("id");

ALTER TABLE "Posts" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "rel_post_category" ADD FOREIGN KEY ("post_id") REFERENCES "Posts" ("id");

ALTER TABLE "rel_post_category" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

insert into users (name, email , age) values ('Andres', 'andres@gmail.com', 23);
insert into users (name, email , age) values ('Martha', 'martha@gmail.com', 33),
('Amelia', 'amelia@gmail.com', 29);
insert into categories (category_name) VALUES ('Lactancia'),('Maternidad'),('Gestacion');
insert into authors (name , last_name) values  ('Amanda', 'Escobar'),('Esteban','Gaston'),('Renata','Castro');
insert into "Posts" (title, description, content, author_id, categories_id) values 
('Un regalo para tu bebe', 'descrition 01', 'contenido01', 2, 1);
insert into "Posts" (title, description, content, author_id, categories_id) values 
('El mejor baño', 'descrition 02', 'contenido02', 1, 2), ('Cuida su piel', 'descrition 03', 'contenido03', 3, 3);
insert into "comments" (comment, user_id, post_id) values ('comentario01', 3, 1), ('comentario02', 2, 3);
insert into "comments"  (comment, user_id, post_id) values ('comentario03', 3, 3);
insert into rel_post_category (post_id, categories_id) values (1, 1);
insert into rel_post_category (post_id, categories_id) values (1, 2), (3,1),(2,1);
