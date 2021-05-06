ARG GIT_BRANCH=version-12
FROM tokhna/frappe-worker:${GIT_BRANCH}

ARG GIT_BRANCH
RUN install_app erpnext https://github.com/frappe/erpnext ${GIT_BRANCH}
