CREATE OR REPLACE VIEW person_fullInfo AS 
	SELECT 
		*
	FROM
		Person
		INNER JOIN Address USING(address_id);

