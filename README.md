# Steps to reproduce

```bash
composer install
docker-compose build
docker-compose up
```
Visit http://127.0.0.1:8000/

Should throw a 500 error and checking in the terminal where docker was started you will see the error.