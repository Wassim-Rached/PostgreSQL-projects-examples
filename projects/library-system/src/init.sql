CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS Address (
    address_id UUID DEFAULT uuid_generate_v4(),
    street_address VARCHAR NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(4) NOT NULL, 
	
	-- checks and validations
	CONSTRAINT valid_postal_code CHECK(postal_code ~ '^[0-9]{4}$'),
	
	-- keys and indexes
	CONSTRAINT address_pk PRIMARY KEY(address_id)
);

CREATE TABLE IF NOT EXISTS Person(
    person_id UUID DEFAULT uuid_generate_v4(), 
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
	CONSTRAINT person_pk PRIMARY KEY (person_id),
	CONSTRAINT unique_full_name UNIQUE(first_name,last_name),
	CONSTRAINT person_adress_fk FOREIGN KEY (address_id) REFERENCES Address(address_id)
);


CREATE TABLE IF NOT EXISTS Author(
    author_id UUID DEFAULT uuid_generate_v4(),
	person_id UUID NOT NULL,
	biography TEXT,
	
	-- keys and indexes
	CONSTRAINT author_pk PRIMARY KEY(author_id),
	CONSTRAINT author_person_fk FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE IF NOT EXISTS LibrarySubscription(
    librarySubscription_id UUID DEFAULT uuid_generate_v4(),
	person_id UUID NOT NULL UNIQUE,
	
	-- keys and indexes
	CONSTRAINT librarySubscription_pk PRIMARY KEY(librarySubscription_id),
	CONSTRAINT librarySubscription_person_fk 
		FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE IF NOT EXISTS LibrarySubscriptionPayment(
    librarySubscriptionPayment_id UUID DEFAULT uuid_generate_v4(),
	librarySubscription_id UUID NOT NULL,
	payment_date DATE NOT NULL,
	
	-- checks and validations
    CONSTRAINT valid_payment_date CHECK(payment_date <= CURRENT_DATE),
	
	-- keys and indexes
	CONSTRAINT librarySubscriptionPayment_pk PRIMARY KEY(librarySubscriptionPayment_id),
	CONSTRAINT librarySubscriptionPayment_librarySubscription_fk
		FOREIGN KEY(librarySubscription_id) REFERENCES LibrarySubscription(librarySubscription_id)
);

CREATE TABLE IF NOT EXISTS Book(
    book_id UUID DEFAULT uuid_generate_v4(),
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
	CONSTRAINT book_pk PRIMARY KEY(book_id),
	CONSTRAINT book_author_fk FOREIGN KEY(author_id) REFERENCES Author(author_id)
);

CREATE TABLE IF NOT EXISTS BookLoan(
    bookLoan_id UUID DEFAULT uuid_generate_v4(),
 	book_id UUID NOT NULL,
    librarySubscription_id UUID NOT NULL,
	loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
	return_date DATE,
	
	-- checks and validations
	CONSTRAINT valid_loan_date CHECK(loan_date <= CURRENT_DATE),
	CONSTRAINT valid_return_date CHECK(return_date IS NULL OR return_date >= loan_date),
	
	-- keys and indexes
	CONSTRAINT bookLoan_pk PRIMARY KEY(bookLoan_id),
	CONSTRAINT bookLoan_book_fk FOREIGN KEY(book_id) REFERENCES Book(book_id),
	CONSTRAINT bookLoan_librarySubscription_fk FOREIGN KEY(librarySubscription_id) REFERENCES LibrarySubscription(librarySubscription_id)
);

CREATE TABLE IF NOT EXISTS MulctType(
	mulctType_id UUID DEFAULT uuid_generate_v4(),
	mulct_type VARCHAR NOT NULL,
	mulct_amount NUMERIC(12,2) NOT NULL,

	-- checks and validations
	CONSTRAINT valid_mulct_amount CHECK(mulct_amount > 0),

	-- keys and indexes
	CONSTRAINT mulctType_pk PRIMARY KEY(mulctType_id)
);

CREATE TABLE IF NOT EXISTS Mulct(
    mulct_id UUID DEFAULT uuid_generate_v4(),
	person_id UUID NOT NULL,
	mulctType_id UUID NOT NULL,
	mulct_open_date DATE NOT NULL DEFAULT CURRENT_DATE,
	mulct_close_date DATE,

	-- keys and indexes
	CONSTRAINT payment_pk PRIMARY KEY(mulct_id),
	CONSTRAINT mulct_person_fk FOREIGN KEY(person_id) REFERENCES Person(person_id),
	CONSTRAINT mulct_mulctType_fk FOREIGN KEY(mulctType_id) REFERENCES MulctType(mulctType_id)
);
