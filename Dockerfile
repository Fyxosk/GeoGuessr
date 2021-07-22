FROM ubuntu

COPY install_packages.sh .
RUN ./install_packages.sh

COPY . .
WORKDIR /src/
ENTRYPOINT [ "python3" , "BotGeoguessr.py"]