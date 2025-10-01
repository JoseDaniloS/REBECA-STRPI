# Usa uma imagem Node.js como base
FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /opt/app

# Copia os arquivos de configuração de dependência
COPY package.json yarn.lock ./

# Instala as dependências (preferencialmente usando yarn, se for o seu caso)
RUN yarn install --production

# Copia o restante dos arquivos da aplicação
COPY . .

# Expõe a porta que o Strapi utiliza
EXPOSE 1337

# Comando para iniciar o servidor Strapi em modo de produção
CMD ["npm", "start"] 
# OU, se estiver usando yarn: CMD ["yarn", "start"]