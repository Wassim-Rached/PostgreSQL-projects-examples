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


-- get a random id from the 'Person' table taht is not a library subscriber
-- (main perpose is to be used in the 'populate_dummy_librarySubscriptions' procedure)
CREATE OR REPLACE FUNCTION get_random_non_librarySubscriber_person_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT person_id INTO var_id FROM Person WHERE person_id NOT IN (SELECT person_id FROM LibrarySubscription) ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get a random id from the 'LibrarySubscription' table
-- (main perpose is to be used in the 'populate_dummy_librarySubscriptionPayments' procedure)
CREATE OR REPLACE FUNCTION get_random_librarySubscription_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT librarySubscription_id INTO var_id FROM LibrarySubscription ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get a random book id from the 'Book' table
-- (main perpose is to be used in the 'populate_dummy_BookLoan' procedure)
CREATE OR REPLACE FUNCTION get_random_book_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT book_id INTO var_id FROM Book ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get random person id
CREATE OR REPLACE FUNCTION get_random_person_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT person_id INTO var_id FROM Person ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;

-- get random 'MulctType' id
CREATE OR REPLACE FUNCTION get_random_mulctType_id()
RETURNS UUID
LANGUAGE plpgsql AS $$
DECLARE 
	var_id UUID;
BEGIN
	SELECT mulctType_id INTO var_id FROM MulctType ORDER BY random() LIMIT 1;
	RETURN var_id;
END$$;