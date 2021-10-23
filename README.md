# Postgres and PGAdmin

A twin-container install of a [Postgres](https://www.postgresql.org/) Database along with [PGAdmin](https://www.pgadmin.org/) designed to run with [SharpNet](https://github.com/Sharpz7/sharpnet) and [SharpCD](https://github.com/Sharpz7/sharpcd)

![](https://files.mcaq.me/752t.png)

# Installation

- Make sure [SharpCD](https://github.com/Sharpz7/sharpcd) and [SharpNet](https://github.com/Sharpz7/sharpnet) have been installed.

- Create a sharpcd.yml file like the following:

```yml
version: 1

tasks:
  postgres_task:
    name: Postgres Server
    envfile: .env
    type: docker
    sharpurl: https://mydomain.com:5666
    giturl: https://raw.githubusercontent.com/Sharpz7/
    compose: /postgres/main/docker-compose.yml

```

- Ensure the enviromental variables have been set in an enviromental variable file:

```env
ADMIN_EMAIL=myemail@mail.com
ADMINPASS=pgadminpass
POSTPASS=postgrespass
```

- Run `sharpcd` to get started!

## Maintainers

- [Adam McArthur](https://adam.mcaq.me)

## TODO

- Remove sharpnet domain and replace to Env var
- Remove site.conf domain
