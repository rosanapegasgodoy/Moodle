SELECT DISTINCT 
         c.id AS courseid,
         c.shortname,
         ue.status AS ue_status,
         e.status AS enrol_status,
         ue.timeend
FROM mdl_user_enrolments ue
JOIN mdl_enrol e
    ON e.id = ue.enrolid
JOIN mdl_course c
    ON e.courseid = c.id
WHERE ue.status = 3