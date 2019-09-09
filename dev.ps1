if ( $args.count -gt 0 ) {
    $command, $commandargs = $args;

    switch ($command) {
        "start" {
            docker-compose up -d;
            break;
        }

        "stop" {
            docker-compose down;
            break;
        }

        "rebuild" {
            docker-compose down;
            docker-compose build;
            docker-compose up -d;
            break;
        }

        "bash" {
            docker-compose exec app bash $commandargs
            break;
        }

        "artisan" {
            docker-compose exec app php artisan $commandargs
            break;
        }

        "composer" {
            docker-compose exec app composer $commandargs
            break;
        }

        "laravel" {
            docker-compose exec app laravel $commandargs
        }

        "phpunit" {
            docker-compose exec app ./vendor/bin/phpunit $commandargs
            break;
        }

        "npm" {
            docker-compose run --rm node npm $commandargs
            break;
        }

        "yarn" {
            docker-compose run --rm node yarn $commandargs
            break;
        }

        "gulp" {
            docker-compose run --rm node ./node_modules/.bin/gulp $commandargs
            break;
        }

        "tailwind" {
            docker-compose run --rm node ./node_modules/.bin/tailwind $commandargs
            break;
        }

        default {
            docker-compose $args
            break;
        }
    }
} else {
    docker-compose ps;
}
