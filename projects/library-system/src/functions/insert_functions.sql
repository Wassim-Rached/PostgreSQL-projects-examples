-- Purpose: contains functions and procedures to insert data into the database

-- fill the 'Address' table with dummy data
CREATE OR REPLACE PROCEDURE populate_dummy_addresses()
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO Address (street_address, city, state, postal_code)
	VALUES
		('123 Main St', 'Cityville', 'StateA', '1234'),
		('456 Oak Ave', 'Townsville', 'StateB', '5678'),
		('789 Pine Ln', 'Villagetown', 'StateC', '9012'),
		('234 Elm Dr', 'Hamletsville', 'StateD', '3456'),
		('567 Maple Blvd', 'Suburbville', 'StateE', '7890'),
		('890 Cedar Rd', 'Metropolis', 'StateF', '2345'),
		('345 Birch Pl', 'Urbanville', 'StateG', '6789'),
		('678 Spruce St', 'Cityburg', 'StateH', '0123'),
		('901 Redwood Ave', 'Megalopolis', 'StateI', '4567'),
		('234 Sequoia Cir', 'Smalltown', 'StateJ', '8901');
END$$;

-- fill the 'Person' table with dummy data
CREATE OR REPLACE PROCEDURE populate_dummy_persons()
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO Person (cin, first_name, last_name, phone_number, birth_date, email, gender, address_id)
	VALUES
		('12345678', 'John', 'Doe', '12345678', '1990-05-15', 'john.doe@email.com', 'M', get_random_address_id()),
		('87654321', 'Jane', 'Smith', '87654321', '1985-08-22', 'jane.smith@email.com', 'F', get_random_address_id()),
		('23456789', 'Alice', 'Johnson', '23456789', '1988-03-10', 'alice.johnson@email.com', 'F', get_random_address_id()),
		('34567890', 'Bob', 'Williams', '34567890', '1992-11-05', 'bob.williams@email.com', 'M', get_random_address_id()),
		('78901234', 'Eva', 'Brown', '78901234', '1983-07-18', 'eva.brown@email.com', 'F', get_random_address_id()),
		('45678901', 'David', 'Jones', '45678901', '1995-04-30', 'david.jones@email.com', 'M', get_random_address_id()),
		('89012345', 'Sophie', 'Taylor', '89012345', '1980-12-03', 'sophie.taylor@email.com', 'F', get_random_address_id()),
		('56789012', 'Michael', 'Miller', '56789012', '1998-09-25', 'michael.miller@email.com', 'M', get_random_address_id()),
		('90123456', 'Grace', 'Anderson', '90123456', '1987-02-14', 'grace.anderson@email.com', 'F', get_random_address_id()),
		('67890123', 'Kevin', 'White', '67890123', '1993-06-08', 'kevin.white@email.com', 'M', get_random_address_id());
END$$;


-- fill the 'Author' table with dummy data
CREATE OR REPLACE PROCEDURE populate_dummy_authors()
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO Author (person_id, biography)
	VALUES
		(get_random_non_author_person_id(), 'An accomplished author with a passion for storytelling.'),
		(get_random_non_author_person_id(), 'A talented writer known for captivating novels.'),
		(get_random_non_author_person_id(), 'An imaginative writer who explores the realms of fantasy.'),
		(get_random_non_author_person_id(), 'A knowledgeable author who shares wisdom through insightful non-fiction works.'),
		(get_random_non_author_person_id(), 'An author celebrated for novels with emotional depth and realism.'),
		(get_random_non_author_person_id(), 'An author who delves into science fiction with futuristic narratives.'),
		(get_random_non_author_person_id(), 'A creative writer who crafts enchanting tales for young readers.'),
		(get_random_non_author_person_id(), 'A mystery novelist known for keeping readers on the edge of their seats.'),
		(get_random_non_author_person_id(), 'An author who explores historical events through historical fiction.'),
		(get_random_non_author_person_id(), 'A thriller writer known for stories with unexpected twists and turns.');
END$$;

CREATE OR REPLACE PROCEDURE populate_database()
LANGUAGE plpgsql AS $$
BEGIN
	-- fill the 'Address' table with dummy data
	CALL populate_dummy_addresses();
	
	-- fill the 'Person' table with dummy data
	CALL populate_dummy_persons();
	
	-- fill the 'Author' table with dummy data
	CALL populate_dummy_authors();
END$$;