-- Creation De La BASE DE DONNEES --------------

CREATE DATABASE "SchoolsDB";

-- La creation des schemas
CREATE SCHEMA IF NOT EXISTS "ref";  -- reference data
CREATE SCHEMA IF NOT EXISTS "sec";  -- security module
-- Run the script on the SchoolsDB database (not on the schemas)
DROP EXTENSION IF EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp"