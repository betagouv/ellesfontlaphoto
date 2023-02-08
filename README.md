# Elles font la Culture
L'objectif est de rendre visible les femmes de l'art et de la culture; aujourd'hui présentes mais sous-représentées dans le secteur, en commençant par la photographie.


## SETUP

Ruby Version : 3.0.3
Rails Version : 6.1.4
Base de données : Postgresql

Commencer par:
```bundle install```
``` yarn install ```

Création base de donnée en local:
``` rails db:setup ```

Lancer serveur en local:
``` rails s ```

Compile les assets:
``` webpack-dev-server ```

Lance sidekiq:
``` sidekiq ```

#### http://localhost:3000 est prêt



## ADMIN

Espace d'administration accessible à l'url /admin,
Un compte admin est créé avec l'execution de la seed en local.
identifiant : admin@example.fr
mot de passe : password


## STATISTIQUES

Page statistiques accessible à l'url /stats,


## DEPLOIEMENT

Lorsqu'une PR est mergé sur la branche staging, les changements sont automatiquements déployés sur l'environnement de [staging](https://www.ellesfontlaculture.incubateur.net/).

Lorsqu'une PR est mergé sur la branche master, les changements sont automatiquements déployés sur l'environnement de [production](https://www.ellesfontlaculture.beta.gouv.fr/).
