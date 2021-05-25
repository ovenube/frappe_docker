ARG VERSION=latest
ARG GIT_BRANCH=version-12

FROM ovenube/erpnext-worker:${VERSION}

ARG VERSION=latest
ARG GIT_BRANCH=version-12

RUN install_app ovenube_peru https://github.com/ovenube/ovenube_peru.git ${GIT_BRANCH}
# Only add the branch if you are using a specific tag or branch.