FROM bitnami/node:12-prod

COPY build/tokhna-nginx/install_app.sh /install_app

ARG GIT_BRANCH=version-12
RUN /install_app tokhna_peru https://github.com/Tokhna/tokhna_peru ${GIT_BRANCH} skipcache

ARG GIT_BRANCH
FROM tokhna/erpnext-nginx:version-12

COPY --from=0 /home/frappe/frappe-bench/sites/ /var/www/html/
COPY --from=0 /rsync /rsync
RUN echo -n "\ntokhna_peru" >> /var/www/html/apps.txt

VOLUME [ "/assets" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]