-- get date of the end of a subscribtion
CREATE OR REPLACE FUNCTION get_subscription_end_date(starting_date DATE)
RETURNS DATE
LANGUAGE plpgsql AS $$
DECLARE
	-- constants
	subscribtion_period CONSTANT INTERVAL := '1 year';
BEGIN
	RETURN starting_date + subscribtion_period;
END$$;