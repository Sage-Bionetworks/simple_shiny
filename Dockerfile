FROM sagebionetworks/shiny-base:release-1.1

USER ROOT

# overwrite the default config with our modified copy
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf 

RUN apt-get update

USER shiny

WORKDIR /srv/shiny-server/app
COPY --chown=shiny ./ ./

RUN Rscript -e 'install.packages(c("shiny", "waiter"))'

CMD ["./dca_startup.sh"]
