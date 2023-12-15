-- empty the address table
CREATE OR REPLACE PROCEDURE empty_addresses()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE Address CASCADE;
END$$;

-- empty the persons table
CREATE OR REPLACE PROCEDURE empty_persons()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE Person CASCADE;
END$$;

-- empty the authors table
CREATE OR REPLACE PROCEDURE empty_authors()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE Author CASCADE;
END$$;

-- empty the librarySubscriptions table
CREATE OR REPLACE PROCEDURE empty_librarySubscriptions()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE LibrarySubscription CASCADE;
END$$;

-- empty the librarySubscriptionPayments table
CREATE OR REPLACE PROCEDURE empty_librarySubscriptionPayments()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE LibrarySubscriptionPayment CASCADE;
END$$;

-- empty the books table
CREATE OR REPLACE PROCEDURE empty_books()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE Book CASCADE;
END$$;

-- empty the bookLoans table
CREATE OR REPLACE PROCEDURE empty_bookLoans()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE BookLoan CASCADE;
END$$;

-- empty the mulctTypes table
CREATE OR REPLACE PROCEDURE empty_mulctTypes()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE MulctType CASCADE;
END$$;

-- empty the mulcts table
CREATE OR REPLACE PROCEDURE empty_mulcts()
LANGUAGE plpgsql AS $$
BEGIN
	TRUNCATE TABLE Mulct CASCADE;
END$$;

-- empty the whole database
CREATE OR REPLACE PROCEDURE empty_database()
LANGUAGE plpgsql AS $$
BEGIN
	CALL empty_mulcts();
	CALL empty_mulctTypes();
	CALL empty_bookLoans();
	CALL empty_books();
	CALL empty_librarySubscriptionPayments();
	CALL empty_librarySubscriptions();
	CALL empty_authors();
	CALL empty_persons();
	CALL empty_addresses();
END$$;