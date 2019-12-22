FROM node:lts-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/mvmjacobs/firebase-aciton"
LABEL homepage="https://github.com/mvmjacobs/firebase-aciton"
LABEL maintainer="Marcos Vinicius Jacobs <@mvmjacobs>"

LABEL com.github.actions.name="GitHub Action for Firebase"
LABEL com.github.actions.description="A GitHub Action to deploy to Firebase Hosting using firebase-tools CLI."

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN npm install -g firebase-tools

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
