-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Service Projects Table
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES organization(organization_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL
);

-- ========================================
-- Insert Sample Projects
-- ========================================
INSERT INTO project (organization_id, title, description, location, project_date)
VALUES
-- BrightFuture Builders (Org 1)
(1, 'Community Center Renovation', 'Help paint and repair local youth community center.', '123 Main St, Springfield', '2026-11-15'),
(1, 'Park Bench Construction', 'Build and install weather-proof wooden benches.', 'Oak Park', '2026-11-20'),
(1, 'Shelter Accessibility Ramp', 'Construct a wheelchair ramp for the downtown shelter.', '456 Elm St', '2026-12-01'),
(1, 'School Playground Repair', 'Fix and restore playground swings and structures.', 'Lincoln Elementary', '2026-12-10'),
(1, 'Youth Housing Workshop', 'Assist in assembling modular housing frames.', '789 Pine Rd', '2027-01-05'),

-- GreenHarvest Growers (Org 2)
(2, 'Urban Garden Planting', 'Plant winter vegetables and prepare raised soil beds.', 'Green Street Garden', '2026-11-18'),
(2, 'Compost Bin Assembly', 'Build wooden compost bins for neighborhood distribution.', 'Community Farm Depot', '2026-11-25'),
(2, 'Food Forest Mulching', 'Spread mulch and clear pathways in community orchard.', 'Riverfront Park', '2026-12-05'),
(2, 'School Hydroponics Setup', 'Install small indoor hydroponic towers in classrooms.', 'Central High School', '2026-12-15'),
(2, 'Seed Bank Cataloging', 'Sort, package, and label organic seeds for spring distribution.', 'GreenHarvest HQ', '2027-01-12'),

-- UnityServe Volunteers (Org 3)
(3, 'Holiday Food Drive', 'Collect, pack, and distribute food hampers for families.', 'Civic Center Auditorium', '2026-11-22'),
(3, 'Senior Center Social Hour', 'Host afternoon tea, games, and assistance for seniors.', 'Sunshine Care Home', '2026-11-28'),
(3, 'Neighborhood Trash Cleanup', 'Clear litter along riverbanks and main roadways.', 'Riverside Trail', '2026-12-08'),
(3, 'Winter Coat Distribution', 'Sort and distribute warm clothing to local shelters.', 'UnityServe Hub', '2026-12-18'),
(3, 'Youth Literacy Mentoring', 'Read stories and distribute book packages to children.', 'City Library', '2027-01-15');

-- ========================================
-- Category Table
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ========================================
-- Insert Sample Categories
-- ========================================
INSERT INTO category (name)
VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

-- ========================================
-- Junction Table: Project <-> Category (Many-to-Many)
-- ========================================
CREATE TABLE project_category (
    project_id INT NOT NULL REFERENCES project(project_id) ON DELETE CASCADE,
    category_id INT NOT NULL REFERENCES category(category_id) ON DELETE CASCADE,
    PRIMARY KEY (project_id, category_id)
);

-- ========================================
-- Associate Projects with Categories
-- ========================================
INSERT INTO project_category (project_id, category_id)
VALUES
-- BrightFuture Projects (IDs 1-5)
(1, 3), (2, 1), (3, 3), (4, 2), (5, 3),
-- GreenHarvest Projects (IDs 6-10)
(6, 1), (7, 1), (8, 1), (9, 2), (10, 2),
-- UnityServe Projects (IDs 11-15)
(11, 3), (12, 4), (13, 1), (14, 3), (15, 2);