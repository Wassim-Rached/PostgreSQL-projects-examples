-- Purpose: contains functions and procedures to retrive data from the database

-- get a random id from the 'Address' table
-- (main perpose is to be used in the 'populate_dummy_persons' procedure)
CREATE OR REPLACE FUNCTION get_random_address_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT address_id INTO var_id FROM Address ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get a random id from the 'Person' table that is not an author
-- (main perpose is to be used in the 'populate_dummy_authors' procedure)
CREATE OR REPLACE FUNCTION get_random_non_author_person_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT person_id INTO var_id FROM Person WHERE person_id NOT IN (SELECT person_id FROM Author) ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get a random id from the 'Author' table
-- (main perpose is to be used in the 'populate_dummy_books' procedure)
CREATE OR REPLACE FUNCTION get_random_author_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT author_id INTO var_id FROM Author ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get person by id
CREATE OR REPLACE FUNCTION get_person_by_id(p_id UUID)
RETURNS SETOF Person
LANGUAGE plpgsql AS $$
BEGIN
	RETURN QUERY SELECT * FROM Person p1 WHERE p1.person_id = p_id;
END$$;

