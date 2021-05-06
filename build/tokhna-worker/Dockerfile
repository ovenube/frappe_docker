ARG GIT_BRANCH=version-12
FROM tokhna/erpnext-worker:${GIT_BRANCH}

ARG GIT_BRANCH
RUN install_app tokhna_peru https://github.com/Tokhna/tokhna_peru ${GIT_BRANCH} skipcache
# Only add the branch if you are using a specific tag or branch.