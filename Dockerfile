# Használjuk a node:18 image-t
FROM node:18

# Munkakönyvtár beállítása
WORKDIR /usr/src/app

# Csomagkezelő fájlok másolása
COPY package*.json ./

# Függőségek telepítése
RUN npm install

# Alkalmazás másolása a konténerbe
COPY . .

# Port kinyitása (pl. 3000)
EXPOSE 3000

# Alkalmazás indítása
CMD ["npm", "start"]
