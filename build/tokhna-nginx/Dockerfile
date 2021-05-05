FROM bitnami/node:12-prod

COPY build/[custom]-nginx/install_app.sh /install_app

RUN /install_app tokhna_peru https://github.com/Tokhna/tokhna_peru version-12

FROM frappe/erpnext-nginx:v12

COPY --from=0 /home/frappe/frappe-bench/sites/ /var/www/html/
COPY --from=0 /rsync /rsync
RUN echo -n "\ntokhna_peru" >> /var/www/html/apps.txt

VOLUME [ "/assets" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]