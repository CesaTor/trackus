# trackus - offline Todoist clone

## Why
I started this project with the goal to better understand local db, streams and backups

And because I don't really need Todoist's server for my personal stuff ✨

## What can it do
- create tasks
    - add priority and due-date and project
    - do/undo
    - edit
- inbox
- search
- create project/sub-projects
    - create task inside project
- backup&restore to file

## Techy things
Classic structure
- Clean Architecture (Usecases, Models, Repositories...)
- BLoc (State management)
- Isar (Local Database)
- GoRouter (Navigation)

Except
- Slang (Localization)
It's dead simple and I love the scope separation and safety

## TODO
- [ ] Delete tasks
- [ ] Tags
- [ ] Fix base behaviors
- [ ] Task Detail page
- [ ] Align with Todoist functions
