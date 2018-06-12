FROM rasa/rasa_nlu:0.12.3-spacy

COPY projects /app/projects
COPY config.yml /app/config.yml
VOLUME ["/app/projects", "/app/logs", "/app/data"]

EXPOSE 5000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["start", "-c", "/app/config.yml", "--path", "/app/projects"]
