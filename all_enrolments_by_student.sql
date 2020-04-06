SELECT DISTINCT u.id AS userid, u.username, c.id AS courseid, c.shortname,ue.status as ue_status
FROM mdl_user u
JOIN mdl_user_enrolments ue ON ue.userid = u.id
JOIN mdl_enrol e ON e.id = ue.enrolid
JOIN mdl_role_assignments ra ON ra.userid = u.id
JOIN mdl_context ct ON ct.id = ra.contextid AND ct.contextlevel = 50
JOIN mdl_course c ON c.id = ct.instanceid AND e.courseid = c.id
JOIN mdl_role r ON r.id = ra.roleid AND r.shortname = 'student'
WHERE 
e.status = 0 AND 
u.suspended = 0 AND 
u.deleted = 0
  AND (ue.timeend = 0 OR ue.timeend > NOW()) 