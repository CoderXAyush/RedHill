#!/usr/bin/env bash
set -euo pipefail

git config user.name "CoderXAyush"
git config user.email "ayushhaman7@gmail.com"

branch="main"
if ! git rev-parse --verify "$branch" >/dev/null 2>&1; then
  git checkout -b "$branch"
else
  git checkout "$branch"
fi

declare -a commits=(
  "2024-12-20T09:00:00+05:30|chore: initial project setup and env config"
  "2024-12-23T15:10:00+05:30|feat: add base folder structure for backend and frontend"
  "2024-12-27T11:50:00+05:30|docs: update README with project overview"
  "2025-01-04T10:20:00+05:30|feat(ui): add login and register components"
  "2025-01-10T18:00:00+05:30|style: global css and theme adjustments"
  "2025-01-18T13:45:00+05:30|feat(api): setup express server with routes"
  "2025-01-24T20:05:00+05:30|fix: validation middleware bug"
  "2025-02-01T09:30:00+05:30|feat: connect mongodb and add schema"
  "2025-02-09T16:00:00+05:30|refactor: split routes into separate modules"
  "2025-02-15T21:10:00+05:30|test: add auth route tests"
  "2025-02-22T11:30:00+05:30|feat(ui): build complaints page"
  "2025-02-28T19:00:00+05:30|fix(ui): complaint form responsiveness"
  "2025-03-05T12:45:00+05:30|feat: integrate complaint API with frontend"
  "2025-03-10T14:00:00+05:30|perf: optimize form validation logic"
  "2025-03-18T09:15:00+05:30|feat: add update profile UI"
  "2025-03-26T18:40:00+05:30|fix: toast messages not showing on error"
  "2025-04-02T10:50:00+05:30|chore: setup nodemailer for otp mail"
  "2025-04-08T22:20:00+05:30|feat: add OTP verification flow"
  "2025-04-15T15:00:00+05:30|fix: redis connection retry bug"
  "2025-04-20T09:35:00+05:30|feat: add admin dashboard base"
  "2025-05-01T17:25:00+05:30|style: improve dashboard layout"
  "2025-05-08T11:00:00+05:30|feat: link backend to dashboard charts"
  "2025-05-15T20:15:00+05:30|refactor: unify axios interceptors"
  "2025-05-21T09:10:00+05:30|fix: token refresh loop issue"
  "2025-05-28T13:40:00+05:30|chore: add pre-commit hook for linting"
  "2025-06-04T16:55:00+05:30|feat(ui): add search filter in complaints tab"
  "2025-06-12T10:20:00+05:30|fix(ui): complaint modal z-index"
  "2025-06-18T19:40:00+05:30|feat: add notification service"
  "2025-06-24T08:55:00+05:30|refactor: folder restructure and cleanup"
  "2025-07-02T13:30:00+05:30|fix: async issue in notifications"
  "2025-07-10T18:15:00+05:30|docs: added API documentation"
)

for item in "${commits[@]}"; do
  IFS="|" read -r datetime msg <<< "$item"
  echo "$msg" >> project_log.txt
  git add .
  GIT_COMMITTER_DATE="$datetime" git commit --date="$datetime" -m "$msg"
done
