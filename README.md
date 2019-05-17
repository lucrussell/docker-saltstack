# docker-saltstack
This is a Docker Compose setup for learning and working with Saltstack. It is a fork of [this project](https://github.com/cyface/docker-saltstack).

You can read a full article describing how to use this setup [here](https://medium.com/@timlwhite/the-simplest-way-to-learn-saltstack-cd9f5edbc967).

## Quickstart
You will need a system with Docker and Docker Compose installed to use this project.

Run the following command from a checkout of this directory, and the master and minion will start up with debug logging to the console.

    docker-compose --compatibility up -d

Then you can run (in a separate shell window):

    docker-compose exec salt-master bash

and it will log you into the command line of the salt-master server.

From that command line you can run something like:

    salt '*' test.ping

and in the window where you started docker compose, you will see the log output of both the master sending the command and the minion receiving the command and replying.


Note:
The `compatibility` option allows this section in the docker-compose file:

    deploy:
        replicas: 1

## Using
Two volumes are mapped in docker-comopse.yml:

- `master-etc-salt`: this allows modifying the `master` config file. Restart the master if you change this
- `master-srv-salt`: this allows editing the Salt state files



## Useful Commands
Commands starting with `salt` should be run on the Salt master.


| Command  | Purpose |
|---|---|
|  `docker-compose exec salt-master bash`  |  Enter the Salt master |
|  `salt '*' state.apply package_name`  |  Install the specified package |
| `salt "*" pkg.remove package_name`  |  Remove the specified package |
| `salt '*' state.apply`  |  Apply all states from top.sls |
| `salt-run manage.down removekeys=True`  |  Remove minions if they have been restarted and the master can't contact them any more |
| `salt-run manage.up`  |  See which minions are running |




