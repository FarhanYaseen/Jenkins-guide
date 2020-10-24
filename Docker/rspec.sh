# Concate all spec single space separated string
specs="$*"

echo "Running RAILS_ENV=test rake db:drop"
docker-compose run -e "RAILS_ENV=test" -e "DB_HOST=postgres" rails rake db:drop

echo "Running RAILS_ENV=test rake db:create"
docker-compose run -e "RAILS_ENV=test" -e "DB_HOST=postgres" rails rake db:create

echo "Running RAILS_ENV=test rake db:schema:load"
docker-compose run -e "RAILS_ENV=test" -e "DB_HOST=postgres" rails rake db:schema:load

echo "Running rspec $specs"
docker-compose run -e "RAILS_ENV=test" -e "DB_HOST=postgres" rails rspec $specs


