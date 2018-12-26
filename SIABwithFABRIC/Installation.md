#SIAB with FABRIC

* Fabric entegrasyonu için Makefile içerisinden mininet ve load-tosca-to-nem adımlarını cıkarttık. Bu halini aşağıdaki github'da bulabilirsiniz.
```
mkdir -p ~/cord
cd ~/cord
git clone https://github.com/huseyinbolt/automation-tools.git
git clone https://github.com/huseyinbolt/helm-charts.git
cd automation-tools/seba-in-a-box-with-fabric
```
* Daha önce içeride kurulum var ise
```
make reset-kubeadm
```
* Kurulum sıfırdan başlanıyorsa
```
make
```
* Load TOSCA into NEM
```
cd ~/cord/helm-charts
helm install -n ponsim-pod xos-profiles/ponsim-pod
```

* RG'ye bağlanılır EAP yapılır, DHCP'den IP alınır. DHCP servera ping atılır.