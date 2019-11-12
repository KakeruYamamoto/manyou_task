# README

Usersテーブル

| カラム名 | データ型 |
|---------|--------|
| user_name | string |
| email | string |
| password_digest | string |


Tasksテーブル

| カラム名 | データ型 |
|---------|---------|
| task_name | string |
| task_content | text |
| deadline | datetime |
| priority | integer |
| status | string |
| task_label | string |


あくまで現段階の予定です



## Description
deploy to github
* git add
+ git commit -m 'message'
- git push origin master


deploy to heroku
* heroku create
+ heroku push origin master
- heroku run rails db:migrate
