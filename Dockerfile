# Build Phase
FROM node:10-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
# /app/build <-- all compile code
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
