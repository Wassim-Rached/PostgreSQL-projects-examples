CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Address CASCADE;

CREATE TABLE IF NOT EXISTS Address (
    id UUID DEFAULT uuid_generate_v4(),
    street_address VARCHAR NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(4) NOT NULL, 
	
	-- checks and validations
	CONSTRAINT valid_postal_code CHECK(postal_code ~ '^[0-9]{4}$'),
	
	-- keys and indexes
	CONSTRAINT address_pk PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Person(
    id UUID DEFAULT uuid_generate_v4(), 
	cin VARCHAR(8) UNIQUE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	phone_number VARCHAR(8) NOT NULL,
	birth_date DATE NOT NULL,
	email VARCHAR NOT NULL UNIQUE,
	gender CHAR(1) NOT NULL,
	address_id UUID,
	
	-- checks and validations
	CONSTRAINT valid_cin CHECK(cin ~ '^[0-9]{8}$'),
	CONSTRAINT valid_phone_number CHECK(phone_number ~ '^[0-9]{8}$'),
	CONSTRAINT valid_gender CHECK(gender IN ('M','F')),
	
	-- keys and indexes
	CONSTRAINT person_pk PRIMARY KEY (id),
	CONSTRAINT unique_full_name UNIQUE(first_name,last_name),
	CONSTRAINT person_adress_fk FOREIGN KEY (address_id) REFERENCES Address(id)
);


CREATE TABLE IF NOT EXISTS Author(
    id UUID DEFAULT uuid_generate_v4(),
	person_id UUID NOT NULL,
	biography TEXT,
	
	-- keys and indexes
	CONSTRAINT author_pk PRIMARY KEY(id),
	CONSTRAINT author_person_fk FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE IF NOT EXISTS LibrarySubscription(
    id UUID DEFAULT uuid_generate_v4(),
	person_id UUID NOT NULL,
	
	-- keys and indexes
	CONSTRAINT librarySubscription_pk PRIMARY KEY(id),
	CONSTRAINT librarySubscription_person_fk 
		FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE IF NOT EXISTS LibrarySubscriptionPayment(
    id UUID DEFAULT uuid_generate_v4(),
	librarySubscription_id UUID NOT NULL,
	ends_at DATE NOT NULL,
	
	-- checks and validations
    CONSTRAINT valid_ends_at CHECK(ends_at > CURRENT_DATE),
	
	-- keys and indexes
	CONSTRAINT librarySubscriptionPayment_pk PRIMARY KEY(id),
	CONSTRAINT librarySubscriptionPayment_librarySubscription_fk
		FOREIGN KEY(librarySubscription_id) REFERENCES LibrarySubscription(id)
);

CREATE TABLE IF NOT EXISTS BookLoan(
    id UUID DEFAULT uuid_generate_v4(),
 	book_id UUID NOT NULL,
    person_id UUID NOT NULL,
	loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
	return_date DATE,
	
	-- checks and validations
	CONSTRAINT valid_loan_date CHECK(loan_date >= CURRENT_DATE),
	CONSTRAINT valid_return_date CHECK(return_date IS NULL OR return_date >= loan_date),
	
	-- keys and indexes
	CONSTRAINT bookLoan_pk PRIMARY KEY(id),
	CONSTRAINT bookLoan_book_fk FOREIGN KEY(book_id) REFERENCES Book(id),
	CONSTRAINT bookLoan_person_fk FOREIGN KEY(person_id) REFERENCES Person(id)
);

CREATE TABLE IF NOT EXISTS Mulct(
    id UUID DEFAULT uuid_generate_v4(),
	amount NUMERIC(12,2) NOT NULL,
	person_id UUID NOT NULL,
	paymentCompleted BOOLEAN DEFAULT FALSE,
	reasons TEXT,
	
	-- checks and validations
	CONSTRAINT valid_amount CHECK(amount > 0),
	
	-- keys and indexes
	CONSTRAINT payment_pk PRIMARY KEY(id),
	CONSTRAINT mulct_person_fk FOREIGN KEY(person_id) REFERENCES Person(id)
);

CREATE TABLE IF NOT EXISTS Book(
    id UUID DEFAULT uuid_generate_v4(),
	isbn VARCHAR(13) UNIQUE,
	title VARCHAR,
	author_id UUID NOT NULL,
	publication_year INTEGER NOT NULL,
	genre VARCHAR NOT NULL,
	total_pages INTEGER NOT NULL,
	language VARCHAR(50) NOT NULL,
	
	-- checks and validations
	CONSTRAINT valid_isbn CHECK(LENGTH(isbn)=13),
	CONSTRAINT valid_total_pages CHECK(total_pages > 0),
	
	-- keys and indexes
	CONSTRAINT book_pk PRIMARY KEY(id),
	CONSTRAINT book_author_fk FOREIGN KEY(author_id) REFERENCES Author(id)
);