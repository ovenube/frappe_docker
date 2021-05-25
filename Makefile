.DEFAULT_GOAL := help

TAG = latest
GIT-BRANCH = version-12
CONTAINER_OWNER = ovenube

rebuild:
	docker build --no-cache --build-arg GIT_BRANCH=${GIT-BRANCH} --build-arg VERSION=${version} -t ${CONTAINER_OWNER}/${target}-nginx:${version} -f build/${target}-nginx/Dockerfile .
	docker build --no-cache --build-arg GIT_BRANCH=${GIT-BRANCH} --build-arg VERSION=${version} -t ${CONTAINER_OWNER}/${target}-worker:${version} -f build/${target}-worker/Dockerfile .

	docker push ${CONTAINER_OWNER}/${target}-nginx:${version}
	docker push ${CONTAINER_OWNER}/${target}-worker:${version}

rebuild.all:
	make rebuild target=frappe version=${version}
	make rebuild target=erpnext version=${version}
	make rebuild target=ovenube version=${version}