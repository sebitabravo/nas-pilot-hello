FROM nginx:1.27-alpine
COPY index.html /usr/share/nginx/html/index.html
COPY healthz /usr/share/nginx/html/healthz
HEALTHCHECK --interval=30s --timeout=5s --retries=3 --start-period=10s CMD wget -qO /dev/null http://localhost:80/healthz || exit 1
EXPOSE 80
