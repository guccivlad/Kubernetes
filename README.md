# ДЗ по Kubernetes

Для запуска выполните команды

```
chmod +x deploy.sh
./deploy.sh
```

В `Deployment` использовался `hostPath`, так как если монтировать `emptyDir`, то `DaemonSet` не сможет видеть логи, что ожидаемо.
