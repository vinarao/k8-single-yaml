# k8-single-yaml

Single YAML to install Contrail CNI components on a Kubernetes System 


Once you clone this repository You can run the below script to install Contrail

./config.sh  

```
##############**SINGLE NODE**#############
./config.sh 
Hello, root.  This script will install contrail on a Kubernetes cluster

Contrail Nodes (This is a list of nodes on which Contrail Components are installed)
eg for Single Node- Contrail Nodes: 10.87.65.231
eg for HA- Contrail Nodes: 10.87.65.231,10.87.65.232,10.87.65.233
Contrail Nodes [ENTER]:10.87.65.231 

Please enter the Kubernetes Master VIP IP(In case of Single Master use Master node IP)
eg Kubernetes VIP: 10.87.65.231
Kubernetes VIP [ENTER]: 10.87.65.231

Please enter the Physical Interface for the VROUTER
 eg Vrouter Interface: eth2
Vrouter Interface [ENTER]: eth2

Please enter the Registry for the Contrail Docker images
eg contrail_registry: docker.io/opencontrailnightly
Disclaimer: Please do not enter the http/https urls but docker friendly url
contrail_registry [ENTER]: docker.io/opencontrailnightly

Please enter the Contrail Image Tag(Version) that you want installed
eg contrail_tag: newton-master-44
contrail_tag [ENTER]:newton-master-44

Installing Contrail




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
