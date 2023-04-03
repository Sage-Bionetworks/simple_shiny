FROM sagebionetworks/shiny-base:release-1.1

USER root
RUN apt-get update

USER shiny

WORKDIR /srv/shiny-server/app
COPY --chown=shiny ./ ./

RUN Rscript -e 'install.packages(c("shiny", "waiter"))'

CMD ["./dca_startup.sh"]
