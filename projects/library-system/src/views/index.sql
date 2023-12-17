CREATE OR REPLACE VIEW person_fullInfo AS 
	SELECT 
		*
	FROM
		Person
		INNER JOIN Address USING(address_id);

CREATE OR REPLACE VIEW author_fullInfo AS
	SELECT
		*
	FROM
		Author
		INNER JOIN person_fullInfo USING(person_id);

CREATE OR REPLACE VIEW librarySubscription_fullInfo AS
	SELECT
		*,
		is_subscription_expired(
			get_last_librarySubscription_librarySubscriptionPayment_payment_date(ls.librarySubscription_id)
		) AS subscription_expired
	FROM
		LibrarySubscription AS ls
		INNER JOIN person_fullInfo USING(person_id);
