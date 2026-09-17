# PCES Online SF9 Multi-Teacher System

## Features
- Supabase email/password authentication
- Admin invitations for admin, teacher, parent, and learner accounts
- Grade/section assignment
- Teacher-only assigned learner access
- Term 1-3 grades and attendance
- Admin approval/release
- Parent/learner released-card access
- Parent acknowledgment
- Half-bond 5.5 x 8.5 inch single-page SF9 print layout
- DepEd and PCES logos

## Setup
1. Create a Supabase project.
2. Open SQL Editor, copy `supabase-schema.sql`, replace `CHANGE_TO_ADMIN_EMAIL`, and run it.
3. In Authentication settings, enable Email/Password. Your first signup email must match the bootstrap invitation.
4. In Project Connect/API settings, copy Project URL and publishable key.
5. Copy `.env.example` to `.env.local` and fill both values for local testing.
6. Run `npm install` then `npm run dev`.
7. Upload all files to GitHub and import the repository into Vercel.
8. In Vercel Project Settings > Environment Variables, add `VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY`, then redeploy.

## Workflow
Admin invites teacher -> teacher signs up -> admin creates class and assigns teacher -> admin adds learners -> teacher encodes -> teacher submits -> admin approves/releases -> linked parent/learner views.

## Link parent or learner
After the invited parent/learner signs up, copy the user's UUID from the profiles table. Set `parent_user_id` or `learner_user_id` on the learner record in Supabase Table Editor. A future UI can automate this linking.

## Printing
Use Chrome/Edge. Select Print, paper 5.5 x 8.5 in if available, margins None, scale 100%, background graphics enabled. CSS uses `@page { size: 5.5in 8.5in; margin: 0; }`. Printer drivers may still require selecting a custom paper size.

## Security note
The included RLS policies restrict rows by role and class assignment. Before official school use, conduct a school/SDO privacy, records-management, and SF9-template review. Do not use sample or public links for live learner data until reviewed.


## Admin testing and delete update
- Admin Testing creates a TEST SECTION and sample learner with grades and attendance.
- Delete buttons are available for invitations, classes, and learners.
- Deleting a learner also deletes grades and attendance through cascade.
- Classes with assigned learners cannot be deleted until learners are removed.
- Auth users are removed separately in Supabase Authentication.
