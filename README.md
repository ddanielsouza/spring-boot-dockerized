### RUN
#### Development environment
```sh
$ docker-compose -f docker-compose-development.yaml up --build
```

No ambiente de desenvolvimento é executado o script **startup.sh**, a qual fica monitorando mudanças no projeto para reexecutar 

#### Production environment
```sh
$ docker-compose -f docker-compose.yaml up --build
```
