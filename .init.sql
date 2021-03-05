DROP TABLE IF EXISTS "users";
CREATE TABLE "public"."users" (
    "id" VARCHAR(50) NOT NULL PRIMARY KEY,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(200),
    "email" VARCHAR(50) UNIQUE,
    "google" json
) WITH (oids = false);

DROP TABLE IF EXISTS "area";
CREATE TABLE "public"."area" (
    "id" VARCHAR(50) NOT NULL PRIMARY KEY,
    "user_id" VARCHAR(50) NOT NULL,
    "action_id" VARCHAR(50),
    "action_desc" VARCHAR(500),
    "reaction_id" VARCHAR(50),
    "reaction_desc" VARCHAR(500)
) WITH (oids = false);
