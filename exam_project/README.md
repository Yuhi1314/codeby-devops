
Pre-Install: 
* kuberntes cluster;




For adding monitoring:
* helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
* helm repo update
* helm install -n monitoring prometheus-operator prometheus-community/kube-prometheus-stack

Ресурс доступен по адресу 
http://185.119.196.182 

Веб ресурс, prometheus и grafana доступны по CLusterIP.

Поэтому надо сначала

kubectl expose service prometheus-operated  --namespace monitoring --type=NodePort --target-port=9090 --name=prom-ext

потом

kubectl port-forward svc/prom-ext  31993:9090 -n monitoring --address 185.119.196.182

с остальными по аналогии

![image](https://github.com/yuhi1314/exam_project/assets/123218375/b1a94434-0255-4c2e-b818-16c6dc9bd85f)

http://185.119.196.182:30528/

http://185.119.196.182:31993


kibana

http:/185.119.196.182:3006

![image](https://github.com/yuhi1314/exam_project/assets/123218375/1f7c402f-3642-42cb-9b5f-9fbc2cd4ed71)



