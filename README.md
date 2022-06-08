# README

* Ruby version 2.7.0
* Rails version 6.0.5

# Windows или MacOS
Чтобы запустить приложение на данной ОС, рекомендуетс установить VM с Linux (например VirtualBox). 
Далее делать всё в соответсвии с алгоритмом для Linux.

# Linux
 1. Установить ruby+rails указанной версии, рекомендуется через rvm.
 2. Установить PostgreSQL

# Для запуска приложения
1. Склонировать git репозиторий командой 
* git clone https://github.com/katrin3744/StoreFile
2. В приложении выполнить 
* bundle install
* заполнить файл database.yml на основе database.yml.sample, подлкючиться к бд storage_file_development
* rails db:migrate 
* symmetric-encryption --generate
* mkdir ~/.symmetric-encryption
* sudo chmod -R 0400 ~/.symmetric-encryption
* изменить файл symmetric-encryption.yml  соотвествии с symmetric-encryption.yml.sample