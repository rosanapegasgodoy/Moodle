SELECT DISTINCT 
         ue.status AS ue_status,
         count(c.id) as qtd_cursos
FROM mdl_user_enrolments ue
JOIN mdl_enrol e
    ON e.id = ue.enrolid
JOIN mdl_course c
    ON e.courseid = c.id
group by 1