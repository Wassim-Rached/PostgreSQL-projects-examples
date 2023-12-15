CREATE OR REPLACE VIEW person_fullInfo AS 
	SELECT 
		*
	FROM
		Person
		INNER JOIN Address ON Person.address_id = Address.address_id;
