# k8-single-yaml

Single YAML to install Contrail CNI components on a Kubernetes System 


Once you clone this repository You can update the contrail/default.yaml as below 

```
#(IP address of Nodes where contrail control components are installed)

contrail_nodes= 10.87.65.232,10.87.65.233,10.87.65.234 

#(Interface on which Vrouter is installed) 

vrouter_physical_interface= eth1

#(VIP IP of Kubernetes API server)

api_vip:10.87.65.251 
```
Steps to install once values are updated

`kubectl apply -f contrail/`



````

################ **INSTALL KUBERNESTES ON CENTOS**##########

Steps to Install Kubernetes on Centos 



##### INSTALL PRE_REQUISITES ########

sudo yum update -y

#Add basic repo to sources.list

sudo bash -c 'cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
sslverify=0
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF'

sudo yum update -y

sudo yum install -y \
        ca-certificates \
        software-properties-common \
        curl \
        nfs-common \
        git \
        make \
        ceph-common \
	docker.io


sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine \
                  docker-ce

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo -E yum-config-manager \
    --add-repo \
    "$DOCKERURL/centos/docker-ee.repo"

sudo yum -y install docker-ee

#########**Install kubernetes**###########

sleep 2

yum install docker kubeadm kubectl kubelet -y

sleep 2
swapoff -a

sleep 2

echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

sleep 2
systemctl restart docker && systemctl enable docker
systemctl  restart kubelet && systemctl enable kubelet
````
