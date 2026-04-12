/*-----------------------------------------SECURITY------------------------------------------------------*/
/*------SEC.ROLES-------*/
--
DROP TABLE IF EXISTS "sec"."Roles";
--
CREATE TABLE IF NOT EXISTS "sec"."Roles"
(
    "Id" BIGSERIAL PRIMARY KEY,
    "RoleNameFr" varchar(64) NOT NULL,
	"RoleNameAr" varchar(64) NOT NULL,
	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ
);

--DATA Roles

INSERT INTO "sec"."Roles" ("RoleNameFr","RoleNameAr")
VALUES
	('Manager', 'المسير'),
	('Teacher', 'أستاذ'),
	('Parent', 'الولي'),
	('Student', 'تلميذ')
ON CONFLICT ("Id") DO NOTHING;

/*------SEC.PRIVILEGES-------*/
--
DROP TABLE IF EXISTS "sec"."Privileges";
--
CREATE TABLE IF NOT EXISTS "sec"."Privileges"
(
    "Id" BIGSERIAL PRIMARY KEY,
    "Action" varchar(64) NOT NULL,
	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ
);

--DATA Privileges

INSERT INTO "sec"."Privileges" ("Action")
VALUES
	('ListerTeachers'),
	('ListerParents'),
	('ListerStudents'),
	('ManagerUsers'  )
ON CONFLICT ("Id") DO NOTHING;

/*---------SEC.USERS-----------*/
--
DROP TABLE IF EXISTS "sec"."Users";
--
CREATE TABLE IF NOT EXISTS "sec"."Users"
(
    "Id" BIGSERIAL PRIMARY KEY,
    "FirstName" VARCHAR(64) NOT NULL DEFAULT '',
    "LastName" VARCHAR(64) NOT NULL DEFAULT '',
    "Email" VARCHAR(64) NOT NULL DEFAULT '',
    "Phone" VARCHAR(16) NOT NULL DEFAULT '',
	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ
);

--DATA Users

INSERT INTO "sec"."Users" ("FirstName","LastName","Email","Phone")
VALUES
('Belilita','Salim', 'salim@gmail.com',     '0670041517'),
('Bourahla','Yacine', 'yacine@hotmail.com', '0670041518'),
('Djellabi','Daoud','daoud@gmail.com',      '0560041520'),
('Tabet','Mohamed','mohamed@gmail.com',     '0670041515'),
('Ait Ali','Moussa','moussa@gmail.com',     '0670041510')
ON CONFLICT ("Id") DO NOTHING;


/*---------SEC.CREDENTIALES-----------*/
--  
DROP TABLE IF EXISTS "sec"."Credentials";
--
/*
CREATE TABLE IF NOT EXISTS "sec"."Credentials"
(
    "Id" BIGSERIAL PRIMARY KEY,
    "UserId" INT8 NOT NULL,
    "Password" VARCHAR(255) NOT NULL DEFAULT '',
	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ,
    CONSTRAINT FK_Credentials_Users FOREIGN KEY("UserId") REFERENCES "sec"."Users"("Id")
);
*/

CREATE TABLE IF NOT EXISTS "sec"."Credentials"
(
    "Id" BIGSERIAL PRIMARY KEY,
    "UserId" INT8 NOT NULL,
    "Password" VARCHAR(255) NOT NULL DEFAULT '',
    "Notes" varchar(255) NOT NULL DEFAULT '',
    "Token" varchar(512) NOT NULL DEFAULT '',
    "TokenCreationDate" TIMESTAMPTZ,
    "LastLoginDateTime" TIMESTAMPTZ NULL,
    "LastPasswordChangedDateTime" TIMESTAMPTZ NULL,
    "FailedPasswordAttemptCount" INT DEFAULT 0,
    "FailedPasswordStartDateTime" TIMESTAMPTZ NULL,
    "LastLockedOutDateTime" TIMESTAMPTZ NULL,
    "LockedOutStatus" bool DEFAULT false NOT NULL,
    "Status" SMALLINT NOT NULL DEFAULT 1,
    "Version" INT8 NOT NULL DEFAULT 1,
    "CreatedBy" INT8,
    "CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
    "UpdatedBy" INT8,
    "UpdatedOn" TIMESTAMPTZ,
    "DeletedOn" TIMESTAMPTZ,
    CONSTRAINT FK_Credentials_Users FOREIGN KEY("UserId") REFERENCES "sec"."Users"("Id")
);



--DATA Credentials

INSERT INTO "sec"."Credentials" ("UserId","Password")
VALUES
	(1, '$2a$11$A9p2CjJvSV9axhhSBaCg8.OeOgUGu/3/SiEIHdxVqXxXxrH5V3Wz6'),
	(2, '$2a$11$A9p2CjJvSV9axhhSBaCg8.OeOgUGu/3/SiEIHdxVqXxXxrH5V3Wz6'),
	(3, '$2a$11$A9p2CjJvSV9axhhSBaCg8.OeOgUGu/3/SiEIHdxVqXxXxrH5V3Wz6'),
	(4, '$2a$11$A9p2CjJvSV9axhhSBaCg8.OeOgUGu/3/SiEIHdxVqXxXxrH5V3Wz6'),
	(5, '$2a$11$A9p2CjJvSV9axhhSBaCg8.OeOgUGu/3/SiEIHdxVqXxXxrH5V3Wz6')
ON CONFLICT ("Id") DO NOTHING;

/*--------SEC.UserRoles------------*/
--
DROP TABLE IF EXISTS "sec"."UserRoles";
--
CREATE TABLE IF NOT EXISTS "sec"."UserRoles"
(
    "UserId" INTEGER NOT NULL,
    "RoleId" INTEGER NOT NULL,
	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ,


    CONSTRAINT FK_UserRoles_Users
        FOREIGN KEY ("UserId")
        REFERENCES "sec"."Users"("Id"),

    CONSTRAINT FK_UserRoles_Roles
        FOREIGN KEY ("RoleId")
        REFERENCES "sec"."Roles"("Id"),

    CONSTRAINT Unique_UserRoles UNIQUE ("UserId", "RoleId")
);

--DATA  UserRoles

INSERT INTO "sec"."UserRoles" ("UserId","RoleId")
VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(3, 3),
	(4, 1),
	(4, 3),
	(5, 4);

/*---------------SEC.RolePrivileges--------------*/
--
DROP TABLE IF EXISTS "sec"."RolePrivileges";
--
CREATE TABLE IF NOT EXISTS "sec"."RolePrivileges"
(
    "RoleId"      INT8 NOT NULL,
    "PrivilegeId" INT8 NOT NULL,
	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ,

    CONSTRAINT FK_RolePrivileges_Roles
        FOREIGN KEY ("RoleId")
        REFERENCES "sec"."Roles"("Id"),

    CONSTRAINT FK_RolePrivileges_Privileges
        FOREIGN KEY ("PrivilegeId")
        REFERENCES "sec"."Privileges"("Id"),

    CONSTRAINT Unique_RolePrivileges UNIQUE ("RoleId", "PrivilegeId")
);

--DATA RolePrivileges

INSERT INTO "sec"."RolePrivileges" ("RoleId","PrivilegeId")
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 2),
	(2, 3),
	(3, 2);
/*-------------------------------------------------------FIN---------------------------------------------------------------------*/