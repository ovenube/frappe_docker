ARG GIT_BRANCH=version-12
ARG VERSION=latest

FROM ovenube/frappe-worker:${VERSION}

ARG GIT_BRANCH=version-12
RUN install_app erpnext https://github.com/ovenube/erpnext ${GIT_BRANCH}
