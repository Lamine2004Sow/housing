# Housing - TP Data Science

Ce projet est un TP de preparation au stage Data Science FTTH/PBO. Il utilise le dataset
`data/Housing.csv` pour travailler un pipeline complet sur donnees tabulaires : exploration,
preparation, feature engineering, entrainement, evaluation et livraison d'un modele.

Le dataset n'est pas un jeu de donnees telecom, mais il sert de support pour reviser les
gestes techniques qui seront utiles sur un sujet de prediction de saturation PBO.

## Objectif

Construire un mini-projet professionnel de machine learning a partir de `Housing.csv` :

- auditer et comprendre le dataset avec Pandas ;
- identifier les variables numeriques, categorielles, la cible et les features ;
- produire une analyse exploratoire claire avec graphiques et commentaires ;
- preparer les donnees sans fuite entre train et test ;
- entrainer une baseline puis des modeles plus avances ;
- evaluer une regression avec MAE, RMSE et R2 ;
- transformer le probleme en classification binaire avec la cible `expensive` ;
- evaluer la classification avec matrice de confusion, precision, rappel, F1 et ROC-AUC ;
- sauvegarder un modele et fournir un script de prediction reutilisable.

## Donnees

Le fichier principal est `data/Housing.csv`.

Il contient 545 lignes et 13 colonnes :

| Colonne | Role |
| --- | --- |
| `price` | cible de regression |
| `area` | surface |
| `bedrooms`, `bathrooms`, `stories` | caracteristiques numeriques du logement |
| `mainroad`, `guestroom`, `basement` | variables oui/non |
| `hotwaterheating`, `airconditioning` | variables oui/non |
| `parking` | nombre de places de parking |
| `prefarea` | zone preferee oui/non |
| `furnishingstatus` | variable categorielle multi-modalites |

Pour la partie classification, une cible simulee `expensive` peut etre creee : une maison est
consideree chere si son prix appartient aux 25% les plus eleves.

## Lien avec le stage PBO

Le stage vise a predire la saturation de PBO FTTH a partir de donnees historiques et de la
proximite geographique des equipements. Ce TP prepare les briques suivantes :

- nettoyage et typage de donnees tabulaires ;
- separation train/test et validation croisee ;
- encodage des variables categorielles ;
- standardisation des variables numeriques ;
- pipelines Scikit-learn ;
- comparaison de modeles, notamment baseline, Random Forest, Gradient Boosting et XGBoost ;
- evaluation adaptee au metier ;
- passage d'un notebook exploratoire a du code Python reutilisable.

Sur le sujet PBO, les variables immobilieres seront remplacees par des variables comme la
capacite, le nombre de clients, le taux d'occupation, l'anciennete, les coordonnees GPS et les
indicateurs de voisinage geographique.

## Installation

```bash
python3 -m venv .venv
.venv/bin/python -m pip install --upgrade pip setuptools wheel
.venv/bin/python -m pip install -r requirements.txt
```

Ou avec le `makefile` :

```bash
make install
```

## Dependances principales

- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn
- xgboost
- joblib
- jupyter

## Travail attendu

### 1. Notebook d'exploration

Notebook recommande : `notebooks/01_eda_housing.ipynb`

- charger le dataset ;
- afficher dimensions, types, valeurs manquantes et statistiques descriptives ;
- produire au moins 6 graphiques ;
- commenter chaque graphique ;
- identifier les variables qui semblent les plus utiles pour predire `price`.

### 2. Notebook de modelisation

Notebook recommande : `notebooks/02_modeling_housing.ipynb`

- creer un pipeline complet avec `ColumnTransformer` ;
- entrainer une regression lineaire comme baseline ;
- tester au moins deux modeles plus avances ;
- comparer les scores en validation croisee ;
- evaluer le meilleur modele sur le jeu de test ;
- transformer le probleme en classification binaire `expensive` ;
- interpreter les resultats.

### 3. Code Python propre

Structure cible :

```text
src/
  data.py       # load_data(path)
  features.py   # add_features(df)
  model.py      # build_pipeline(model_type)
  evaluate.py   # fonctions de metriques
  predict.py    # script de prediction
```

Le code reutilisable doit sortir progressivement des notebooks pour pouvoir etre relance,
teste et livre.

### 4. Synthese finale

Fichier recommande : `reports/synthese_tp.md`

La synthese doit contenir :

- objectif du TP ;
- description des donnees ;
- principales observations EDA ;
- modeles testes ;
- meilleurs resultats ;
- limites ;
- parallele avec le stage PBO.

## Regles methodologiques importantes

- Ne pas apprendre l'encodage, la standardisation ou l'imputation sur tout le dataset avant le
  split train/test.
- Utiliser un `Pipeline` et un `ColumnTransformer` pour eviter les fuites de donnees.
- Comparer tout modele complexe a une baseline simple.
- Interpreter les metriques, pas seulement les afficher.
- Verifier qu'une feature serait disponible au moment reel de la prediction.
- Pour une classification desequilibree, ne pas se limiter a l'accuracy.

## Notions a expliciter dans le TP

Quand une notion mathematique ou statistique est utilisee, il faut indiquer son nom, son idee
ou sa formule, puis son utilite pratique dans le projet.

Notions importantes :

- standardisation centree-reduite ;
- correlation lineaire de Pearson ;
- separation train/test ;
- validation croisee K-fold ;
- moindres carres ordinaires ;
- MAE, RMSE et R2 ;
- matrice de confusion, precision, rappel et F1-score ;
- desequilibre de classes et stratification ;
- distance de Haversine pour le futur travail de voisinage geographique PBO.

## Extension PBO

Une extension possible consiste a creer un mini-dataset simule de PBO avec :

- `pbo_id` ;
- `latitude`, `longitude` ;
- `capacity` ;
- `nb_clients` ;
- `age_days` ;
- `occupation_rate` ;
- `sature`.

Le travail complementaire consiste ensuite a calculer les voisins geographiques, ajouter une
feature comme `mean_occupation_neighbors`, puis comparer une classification avec et sans
variables de voisinage.

## Checklist

- Le projet s'installe avec `requirements.txt`.
- Les chemins de fichiers sont relatifs.
- Les notebooks sont lisibles et commentes.
- Le preprocessing est appris uniquement sur le train.
- Les scripts Python fonctionnent hors notebook.
- Les metriques sont interpretees.
- Le modele final est sauvegarde dans `models/`.
- Le script de prediction produit un CSV dans `reports/`.
- Les conclusions font le lien avec le besoin metier PBO.
