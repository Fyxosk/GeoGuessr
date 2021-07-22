FROM ubuntu

COPY install_packages.sh .
RUN ./install_packages.sh

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .
WORKDIR /src/
ENTRYPOINT [ "python3" , "BotGeoguessr.py"]