-- DROP TABLES (reset database)

DROP TABLE IF EXISTS project_category CASCADE;
DROP TABLE IF EXISTS service_project CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS organization CASCADE;



-- CREATE TABLES

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    project_date DATE NOT NULL,

    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization (organization_id)
);


CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    PRIMARY KEY (project_id, category_id),

    FOREIGN KEY (project_id)
        REFERENCES service_project (project_id)
        ON DELETE CASCADE,

    FOREIGN KEY (category_id)
        REFERENCES categories (category_id)
        ON DELETE CASCADE
);


-- INSERT ORGANIZATIONS

INSERT INTO organization (
    name,
    description,
    contact_email,
    logo_filename
)
VALUES
(
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
),
(
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
),
(
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
);


-- INSERT SERVICE PROJECTS

INSERT INTO service_project
    (organization_id, title, description, location, project_date)
VALUES
-- BrightFuture Builders
(1, 'Community Park Renovation',
 'Renovating a local park by improving playground equipment and green spaces.',
 'Santiago del Estero', '2026-03-15'),

(1, 'Safe Homes Initiative',
 'Repairing homes for families in need and improving living conditions.',
 'Beltran', '2026-04-20'),

(1, 'Community Center Construction',
 'Building a community center to provide educational and social activities.',
 'Santiago del Estero', '2026-05-10'),

(1, 'School Infrastructure Project',
 'Improving classrooms and facilities in local public schools.',
 'La Banda', '2026-06-12'),

(1, 'Accessible Sidewalks Project',
 'Constructing accessible sidewalks to improve mobility for residents.',
 'Santiago del Estero', '2026-07-18'),

-- GreenHarvest Growers
(2, 'Urban Garden Initiative',
 'Creating community gardens where residents can grow fresh vegetables.',
 'Santiago del Estero', '2026-03-22'),

(2, 'Sustainable Farming Workshop',
 'Teaching families sustainable farming and gardening techniques.',
 'La Banda', '2026-04-18'),

(2, 'School Garden Program',
 'Helping students create and maintain vegetable gardens at their schools.',
 'Beltran', '2026-05-15'),

(2, 'Composting for Communities',
 'Promoting composting practices to reduce household organic waste.',
 'Santiago del Estero', '2026-06-20'),

(2, 'Fresh Food Distribution',
 'Distributing fresh produce grown in community gardens to local families.',
 'La Banda', '2026-07-25'),

-- UnityServe Volunteers
(3, 'Neighborhood Cleanup Day',
 'Organizing volunteers to clean public spaces and collect litter.',
 'Santiago del Estero', '2026-03-28'),

(3, 'Food Bank Support',
 'Coordinating volunteers to organize and distribute food donations.',
 'La Banda', '2026-04-25'),

(3, 'Elderly Assistance Program',
 'Providing companionship and practical assistance to elderly residents.',
 'Beltran', '2026-05-22'),

(3, 'Community School Supplies Drive',
 'Collecting and distributing school supplies to children in need.',
 'Santiago del Estero', '2026-06-27'),

(3, 'Animal Shelter Volunteer Day',
 'Supporting local animal shelters through cleaning and care activities.',
 'La Banda', '2026-07-30');


-- INSERT CATEGORIES

INSERT INTO categories (category_name)
VALUES
    ('Environmental'),
    ('Educational'),
    ('Community Service'),
    ('Health and Wellness'),
    ('Infrastructure');


-- INSERT PROJECT-CATEGORY RELATIONSHIPS

INSERT INTO project_category (project_id, category_id)
VALUES
-- BrightFuture Builders
(1, 1), (1, 3), (1, 5),
(2, 3), (2, 4), (2, 5),
(3, 3), (3, 5),
(4, 2), (4, 5),
(5, 3), (5, 5),

-- GreenHarvest Growers
(6, 1), (6, 3),
(7, 1), (7, 2),
(8, 1), (8, 2),
(9, 1), (9, 3),
(10, 1), (10, 3), (10, 4),

-- UnityServe Volunteers
(11, 1), (11, 3),
(12, 3), (12, 4),
(13, 3), (13, 4),
(14, 2), (14, 3),
(15, 3), (15, 4);