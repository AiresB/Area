DROP TABLE IF EXISTS "users";
CREATE TABLE "public"."users" (
    "id" VARCHAR(50) NOT NULL PRIMARY KEY,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(200),
    "email" VARCHAR(50),
    "google" VARCHAR(500)
) WITH (oids = false);
