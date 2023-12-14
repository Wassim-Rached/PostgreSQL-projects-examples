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
		('23456789', 'Alice', 'Johnson', '23456789', '1988-03-10', 'alice.johnson@email.com', 'F', get_random_address_id())
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


-- fill the 'Book' table with dummy data
CREATE OR REPLACE PROCEDURE populate_dummy_books()
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO Book (isbn, title, author_id, publication_year, genre, total_pages, language)
	VALUES
	('9781234567894', 'Sample Book 1', get_random_author_id(), 2022, 'Fiction', 300, 'English'),
	('9782345678903', 'Sample Book 2', get_random_author_id(), 2020, 'Mystery', 250, 'Spanish'),
	('9783456789016', 'Sample Book 3', get_random_author_id(), 2019, 'Science Fiction', 400, 'French'),
	('9784567890126', 'Sample Book 4', get_random_author_id(), 2021, 'Romance', 350, 'German'),
	('9785678901237', 'Sample Book 5', get_random_author_id(), 2018, 'Thriller', 320, 'Italian'),
	('9786789012348', 'Sample Book 6', get_random_author_id(), 2023, 'Fantasy', 280, 'Portuguese'),
	('9787890123459', 'Sample Book 7', get_random_author_id(), 2017, 'Historical Fiction', 420, 'Russian'),
	('9788901234561', 'Sample Book 8', get_random_author_id(), 2020, 'Biography', 300, 'Chinese'),
	('9789012345674', 'Sample Book 9', get_random_author_id(), 2019, 'Comedy', 350, 'Japanese'),
	('9780123456785', 'Sample Book 10', get_random_author_id(), 2021, 'Drama', 320, 'Arabic'),
	('9781234567890', 'Sample Book 11', get_random_author_id(), 2018, 'Horror', 280, 'Korean'),
	('9782345678901', 'Sample Book 12', get_random_author_id(), 2022, 'Action', 400, 'Hindi'),
	('9783456789012', 'Sample Book 13', get_random_author_id(), 2020, 'Adventure', 300, 'Bengali'),
	('9784567890123', 'Sample Book 14', get_random_author_id(), 2023, 'Poetry', 250, 'Turkish'),
	('9785678901234', 'Sample Book 15', get_random_author_id(), 2017, 'Self-Help', 420, 'Dutch'),
	('9786789012345', 'Sample Book 16', get_random_author_id(), 2021, 'Science', 350, 'Swedish'),
	('9787890123456', 'Sample Book 17', get_random_author_id(), 2019, 'Technology', 320, 'Greek'),
	('9788901234567', 'Sample Book 18', get_random_author_id(), 2020, 'Business', 280, 'Hebrew'),
	('9789012345678', 'Sample Book 19', get_random_author_id(), 2018, 'Finance', 400, 'Polish'),
	('9780123456789', 'Sample Book 20', get_random_author_id(), 2022, 'Health', 300, 'Norwegian');
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