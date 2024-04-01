FROM ethereum/client-go:v1.13.14

ARG ACCOUNT_PASSWORD

COPY genesis.json .

RUN geth init ./genesis.json \
    && rm -f ~/.ethereum/geth/nodekey \
    && echo ${ACCOUNT_PASSWORD} > ./password.txt \
    && geth account new --password ./password.txt 
   
EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]
