## Some command to build

> kubectl config --kubeconfig=config-demo.yml set-cluster development --server=https://1.2.3.4 --certificate-authority=fake-ca-file

> kubectl config --kubeconfig=config-demo.yml set-cluster scratch --server=https://5.6.7.8 --insecure-skip-tls-verify

> kubectl config --kubeconfig=config-demo.yml set-credentials developer --client-certificate=fake-cert-file --client-key=fake-key-seefile

> kubectl config --kubeconfig=config-demo.yml set-credentials experimenter --username=exp --password=some-password

> kubectl config --kubeconfig=config-demo.yml set-context dev-frontend --cluster=development --namespace=frontend --user=developer

> kubectl config --kubeconfig=config-demo.yml set-context dev-storage --cluster=development --namespace=storage --user=developer

> kubectl config --kubeconfig=config-demo.yml set-context exp-scratch --cluster=scratch --namespace=default --user=experimenter

> 打開文件查看詳細信息

`kubectl config --kubeconfig=config-demo.yml view`

> `--minify` 查看當前集群 (?)

> 更換集群，之後 command 影響到這個集群

`kubectl config --kubeconfig=config-demo.yml use-context exp-scratch`

> 查看當前群集

`kubectl config current-context`

## 使用 kubernetes for start

> 清理環境變數

`source config-exercise/config.sh clear`

> 初始化環境變數

`source config-exercise/config.sh init`

> 開啟 kubectl proxy

`kubectl proxy`

[http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login)
