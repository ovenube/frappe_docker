.DEFAULT_GOAL := help

TAG = latest
GIT-BRANCH = version-12
CONTAINER_OWNER = tokhna

d.rebuild:
	docker build --build-arg GIT_BRANCH=${GIT-BRANCH} -t ${CONTAINER_OWNER}/${target}-nginx:${version} -f build/${target}-nginx/Dockerfile .
	docker build --build-arg GIT_BRANCH=${GIT-BRANCH} -t ${CONTAINER_OWNER}/${target}-worker:${version} -f build/${target}-worker/Dockerfile .

	docker push ${CONTAINER_OWNER}/${target}-nginx:${version}
	docker push ${CONTAINER_OWNER}/${target}-worker:${version}

rebuild.all:
	make d.rebuild target=frappe version=${GIT-BRANCH}
	make d.rebuild target=erpnext version=${GIT-BRANCH}
	make d.rebuild target=tokhna version=${version}