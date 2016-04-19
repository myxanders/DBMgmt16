-- Returns the immediate prerequisites for the passed-in course number
CREATE OR REPLACE FUNCTION PreReqsFor (INTEGER, REFCURSOR) returns REFCURSOR AS --creates the function (stored procedure)
$$
DECLARE
   desirenum INTEGER := $1;
   resultSet REFCURSOR := $2;
BEGIN
   OPEN resultSet for 
      select * -- pulls all of the data from the courses table
      from courses
      where num in (select prereqnum -- matches the prereqnum(s) found with corresponding information found in the courses table via inner join
		    from Prerequisites -- finds the prereqnum for the course number entered
		    where coursenum = desirenum 
		    );
   return resultSet;
END;
$$
LANGUAGE PLPGSQL;

select PreReqsFor(499, 'results');
fetch all from results;

-- Returns the course(s) for which the passed-in course number is an immediate pre-requisite
CREATE OR REPLACE FUNCTION IsPreReqFor (INTEGER, REFCURSOR) returns REFCURSOR AS -- creates the function (stored procedure)
$$
DECLARE
   desirenum INTEGER := $1;
   resultSet REFCURSOR := $2;
BEGIN
   OPEN resultSet for 
      select * -- pulls all of the data from the courses table
      from courses
      where num in (select coursenum -- matches the coursenum(s) found with corresponding information found in the courses table via inner join
		    from Prerequisites -- finds where the number entered exists in the Prerquisites table as a prereqnum and selects the coursenum associated with it
		    where prereqnum = desirenum 
		    );
   return resultSet;
END;
$$
LANGUAGE PLPGSQL;

select IsPreReqFor(120, 'results');
fetch all from results;