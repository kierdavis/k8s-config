

Get nginx logs

	kubectl -n iand logs $(kubectl -n iand get pod -l app=static-websites -o name)

Delete nginx pod after deploy

    kubectl -n iand delete $(kubectl -n iand get pod -l app=static-websites -o name)
