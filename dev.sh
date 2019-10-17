#!/usr/bin/bash

if [ $# -gt 0 ]; then
    
        if [ "$1" == "start" ]; then
            docker-compose up -d;

        elif [ "$1" == "stop" ]; then
            docker-compose down;
        
        elif [ "$1" == "rebuild" ]; then
            docker-compose down;
            docker-compose build;
            docker-compose up -d;

        elif [ "$1" == "bash" ]; then
            docker-compose exec app bash "$@";
        
        elif [ "$1" == "artisan" ]; then
            docker-compose exec app php artisan "$@";

        elif [ "$1" == "ide-regen" ]; then
            docker-compose exec app bash -c "php artisan clear-compiled && php artisan ide-helper:generate";

        elif [ "$1" == "composer" ]; then
            docker-compose exec app composer "$@";

        elif [ "$1" == "laravel" ]; then
            docker-compose exec app bash -c "\$HOME/.composer/vendor/bin/laravel \"$@\"";

        elif [ "$1" == "phpunit" ]; then
            docker-compose exec app ./vendor/bin/phpunit "$@";
        

        elif [ "$1" == "npm" ]; then
            docker-compose run --rm node npm "$@";
        

        elif [ "$1" == "yarn" ]; then
            docker-compose run --rm node yarn "$@";

        elif [ "$1" == "gulp" ]; then
            docker-compose run --rm node ./node_modules/.bin/gulp "$@";

        elif [ "$1" == "tailwind" ]; then
            docker-compose run --rm node ./node_modules/.bin/tailwind "$@";

        else
            docker-compose "$@"
        fi;

 else
    docker-compose ps;
 fi;
