-- get date of the end of a subscribtion
CREATE OR REPLACE FUNCTION get_subscription_end_date(p_starting_date DATE)
RETURNS DATE
LANGUAGE plpgsql AS $$
DECLARE
	-- constants
	subscribtion_period CONSTANT INTERVAL := '1 year';
BEGIN
	RETURN p_starting_date + subscribtion_period;
END$$;

-- get if a subscribtion is expired
CREATE OR REPLACE FUNCTION is_subscription_expired(p_starting_date DATE)
RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
BEGIN
	RETURN CURRENT_DATE > get_subscription_end_date(p_starting_date);
END$$;


--
CREATE OR REPLACE is_librarySubscription_expired(p_librarySubscription_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE
	var_last_payment_date DATE;
BEGIN
	SELECT payment_date INTO var_last_payment_date FROM get_last_librarySubscription_librarySubscriptionPayment_payment_date(p_librarySubscription_id);
	RETURN is_subscription_expired(var_last_payment_date);
END$$;