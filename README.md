# Tutorat pour les élèves des Prépas Talents | https://www.tutorat.fonction-publique.gouv.fr/

## Lancer en prod
Ce repo contient tout ce qu'il faut pour tourner sur Scalingo. Il suffit de déployer la branche main sur votre instance Scalingo.

Le deploiement sur scalingo se base sur le fichier [`Procfile`](https://doc.scalingo.com/platform/app/procfile)


## Lancer ce site localement
Vous devez avoir npm installé sur votre machine.

```bash
git clone https://github.com/betagouv/tutorat-betagouv.git
cd tutorat-betagouv
npm install
npm start

# http://localhost:8000 is ready 
```

## Lancer les tests
Pour lancer les tests
```bash
# start tests
npm test
```

