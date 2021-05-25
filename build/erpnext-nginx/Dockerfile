ARG NODE_IMAGE_TAG=12-prod
ARG GIT_BRANCH=version-12
ARG VERSION=latest

FROM bitnami/node:${NODE_IMAGE_TAG}

COPY build/erpnext-nginx/install_app.sh /install_app

RUN /install_app erpnext https://github.com/ovenube/erpnext ${GIT_BRANCH}

FROM ovenube/frappe-nginx:${VERSION}

COPY --from=0 /home/frappe/frappe-bench/sites/ /var/www/html/
COPY --from=0 /rsync /rsync
RUN echo "erpnext" >> /var/www/html/apps.txt

VOLUME [ "/assets" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
