DROP TABLE IF EXISTS anatomy;
DROP TABLE IF EXISTS associates;
DROP TABLE IF EXISTS binds;
DROP TABLE IF EXISTS biological_process;
DROP TABLE IF EXISTS causes;
DROP TABLE IF EXISTS cellular_component;
DROP TABLE IF EXISTS compound;
DROP TABLE IF EXISTS covaries;
DROP TABLE IF EXISTS disease;
DROP TABLE IF EXISTS downregulates;
DROP TABLE IF EXISTS expresses;
DROP TABLE IF EXISTS gene;
DROP TABLE IF EXISTS includes;
DROP TABLE IF EXISTS interacts;
DROP TABLE IF EXISTS localizes;
DROP TABLE IF EXISTS molecular_function;
DROP TABLE IF EXISTS palliates;
DROP TABLE IF EXISTS participates;
DROP TABLE IF EXISTS pathway;
DROP TABLE IF EXISTS pharmacologic_class;
DROP TABLE IF EXISTS presents;
DROP TABLE IF EXISTS regulates;
DROP TABLE IF EXISTS resembles;
DROP TABLE IF EXISTS side_effect;
DROP TABLE IF EXISTS symptom;
DROP TABLE IF EXISTS treats;
DROP TABLE IF EXISTS upregulates;

CREATE TABLE anatomy (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE associates (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE binds (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE biological_process (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE causes (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE cellular_component (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE compound (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE covaries (
    sid int NOT NULL,
    tid int NOT NULL
);
CREATE TABLE disease (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE downregulates (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE expresses (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE gene (
    nid int NOT NULL,
    name text NOT NULL
);
CREATE TABLE includes (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE interacts (
    sid int NOT NULL,
    tid int NOT NULL
);
CREATE TABLE localizes (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE molecular_function (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE palliates (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE participates (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE pathway (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE pharmacologic_class (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE presents (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE regulates (
    sid int NOT NULL,
    tid int NOT NULL
);
CREATE TABLE resembles (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE side_effect (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE symptom (
    nid text NOT NULL,
    name text NOT NULL
);
CREATE TABLE treats (
    sid text NOT NULL,
    tid text NOT NULL
);
CREATE TABLE upregulates (
    sid text NOT NULL,
    tid text NOT NULL
);
