#!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

# сборка
npm run build

# переход в каталог сборки
cd dist

# если вы публикуете на пользовательский домен
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# если публикация происходит по адресу https://<USERNAME>.github.io
# git push -f git@github.com:womajies/masha-and-bear.github.io.git master

# если публикация происходит по адресу https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:womajies/masha-and-bear.git master:gh-pages

cd -