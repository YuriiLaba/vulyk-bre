source activate vulyk

mongoexport --db wikidata --collection triplet_train --out /H/train.json -f Subject,Object,Predicate,Text,WikipediaLink,WikipediaTitle -q "{HasRelation:null}"
mongo vulyk --eval "db.tasks.remove({})"
mongo vulyk --eval "db.batches.remove({})"

python ../vulyk/manage.py db load bre_task --batch 01_bre /H/train.json
