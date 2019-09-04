#!/usr/bin/bash

if [ $# -gt 0 ]; then
    
        if [ "$1" == "start" ]; then
            docker-compose up -d;
            break;
        

        elif [ "$1" == "stop" ]; then
            docker-compose down;
            break;
        

        elif [ "$1" == "artisan" ]; then
            docker-compose exec app php artisan "$@"
            break;
        

        elif [ "$1" == "composer" ]; then
            docker-compose exec app composer "$@"
            break;
        

        elif [ "$1" == "phpunit" ]; then
            docker-compose exec app ./vendor/bin/phpunit "$@"
            break;
        

        elif [ "$1" == "npm" ]; then
            docker-compose run --rm node npm "$@"
            break;
        

        elif [ "$1" == "yarn" ]; then
            docker-compose run --rm node yarn "$@"
            break;
        

        elif [ "$1" == "gulp" ]; then
            docker-compose run --rm node ./node_modules/.bin/gulp "$@"
            break;
        

        else
            docker-compose "$@"
            break;
        fi;
    
 else
    docker-compose ps;
 fi;
