SELECT DISTINCT u.id AS userid,
         u.username,
         c.id AS courseid,
         c.shortname,
         ue.status AS ue_status,
         e.status AS enrol_status,
         u.suspended,
         ue.timeend,
         u.deleted
FROM mdl_user u
JOIN mdl_user_enrolments ue
    ON ue.userid = u.id
JOIN mdl_enrol e
    ON e.id = ue.enrolid
JOIN mdl_course c
    ON e.courseid = c.id
WHERE ue.status = 3