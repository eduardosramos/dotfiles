   41  systemctl status docker
   42  sudo dnf remove docker                   docker-client                   docker-client-latest                   docker-common                   docker-latest                   docker-latest-logrotate                   docker-logrotate                   docker-selinux                   docker-engine-selinux                   docker-engine
   43  sudo dnf -y install dnf-plugins-core
   44  sudo dnf config-manager     --add-repo     https://download.docker.com/linux/fedora/docker-ce.repo
   45  sudo dnf install docker-ce docker-ce-cli containerd.io
   46  dnf list docker-ce  --showduplicates | sort -r
   47  sudo dnf -y install docker-ce-3:19.03.8 docker-ce-cli-3:19.03.8 containerd.io
   48  sudo dnf -y install docker-ce-3:19.03.8  containerd.io
   49  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
   50  sudo systemctl start docker
   51  sudo docker run hello-world
   52  yum install grubby
   53  sudo yum install grubby
   54  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
   55  sudo systemctl start docker
   56  sudo docker run hello-world
   57  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
   58  sudo docker run hello-world
   59  sudo mkdir /sys/fs/cgroup/systemd
   60  sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd
   61  sudo docker run hello-world

