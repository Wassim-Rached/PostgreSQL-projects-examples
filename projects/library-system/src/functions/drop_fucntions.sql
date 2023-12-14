-- drop the address table
CREATE OR REPLACE PROCEDURE drop_addresses()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS Address CASCADE;
END$$;

-- drop the persons table
CREATE OR REPLACE PROCEDURE drop_persons()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS Person CASCADE;
END$$;

-- drop the authors table
CREATE OR REPLACE PROCEDURE drop_authors()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS Author CASCADE;
END$$;

-- drop the librarySubscriptions table
CREATE OR REPLACE PROCEDURE drop_librarySubscriptions()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS LibrarySubscription CASCADE;
END$$;

-- drop the librarySubscriptionPayments table
CREATE OR REPLACE PROCEDURE drop_librarySubscriptionPayments()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS LibrarySubscriptionPayment CASCADE;
END$$;

-- drop the books table
CREATE OR REPLACE PROCEDURE drop_books()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS Book CASCADE;
END$$;

-- drop the bookLoans table
CREATE OR REPLACE PROCEDURE drop_bookLoans()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS BookLoan CASCADE;
END$$;

-- drop the mulcts table
CREATE OR REPLACE PROCEDURE drop_mulcts()
LANGUAGE plpgsql AS $$
BEGIN
	DROP TABLE IF EXISTS Mulct CASCADE;
END$$;

-- drop the whole database
CREATE OR REPLACE PROCEDURE drop_database()
LANGUAGE plpgsql AS $$
BEGIN
	CALL drop_mulcts();
	CALL drop_bookLoans();
	CALL drop_books();
	CALL drop_librarySubscriptionPayments();
	CALL drop_librarySubscriptions();
	CALL drop_authors();
	CALL drop_persons();
	CALL drop_addresses();
END$$;