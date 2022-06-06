[![CircleCI](https://circleci.com/gh/Sharpz7/postgres/tree/main.svg?style=svg)](https://circleci.com/gh/Sharpz7/postgres/tree/main)

# Postgres and PGAdmin

A twin-container install of a [Postgres](https://www.postgresql.org/) Database along with [PGAdmin](https://www.pgadmin.org/) designed to run with [SharpNet](https://github.com/Sharpz7/sharpnet) and [SharpCD](https://github.com/Sharpz7/sharpcd)

![](https://files.mcaq.me/752t.png)

# Installation

- Make sure [SharpCD](https://github.com/Sharpz7/sharpcd) havs been installed.

- Ensure the enviromental variables have been set in an enviromental variable file:

```env
ADMIN_EMAIL=myemail@mail.com
ADMINPASS=pgadminpass
POSTPASS=postgrespass

# Domains that PG Admin will be available on
SHARPDOMAINS=domain1.com,domain2.com

#=============================

# sharpnet ports
HTTP_PORT=80
HTTPS_PORT=443

# Sharpnet gmail login credentials
# for sending errors
MAILPASS=email_password
SENDER_EMAIL=email

# Email that problems will be sent to
RECEIVER_EMAIL=email@domain1.com

# Domain for certificates
DOMAIN=domain2.com

# For Devs only
DEV=FALSE
NETWORK=sharpnet
```

**(See the [sharpnet](https://github.com/Sharpz7/sharpnet) documentation for more information)**

- Run the following command to install the postgres:

```bash
sharpcd --remotefile https://raw.githubusercontent.com/Sharpz7/postgres/main/.sharpcd/sharpcd.yml
```

## Maintainers

- [Adam McArthur](https://adam.mcaq.me)