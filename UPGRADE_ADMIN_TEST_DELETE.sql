-- Existing admin ALL policies already include DELETE. Run this optional check.
select schemaname, tablename, policyname, cmd from pg_policies
where schemaname='public' and policyname in ('admin_invitations','admin_classes','admin_learners','admin_grades','admin_attendance');
