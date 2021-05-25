ARG GIT_BRANCH=version-12
ARG VERSION=latest

FROM bitnami/node:12-prod

COPY build/ovenube-nginx/install_app.sh /install_app

ARG GIT_BRANCH=version-12
ARG VERSION=latest

RUN /install_app ovenube_peru https://github.com/ovenube/ovenube_peru.git ${GIT_BRANCH}

FROM ovenube/erpnext-nginx:${VERSION}

COPY --from=0 /home/frappe/frappe-bench/sites/ /var/www/html/
COPY --from=0 /rsync /rsync
RUN echo -n "\novenube_peru" >> /var/www/html/apps.txt

VOLUME [ "/assets" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]