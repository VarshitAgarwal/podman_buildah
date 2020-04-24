   mypy=$(buildah from scratch)
   echo $mypy
   buildah run  $mypy bash
   varshit=$(buildah mount $mypy)
   echo $varshit
   dnf install --installroot $scratchmnt --releasever 30 bash coreutils --setopt install_weak_deps=false -y   ----> [Installation of Bash in Scratch]
   yum install -y --releasever=8 --installroot=$varshit redhat-release
  yum install -y --setopt=reposdir=/etc/yum.repos.d      --installroot=$varshit     --setopt=cachedir=/var/cache/dnf python36
  buildah config --cmd /usr/bin/python3  $mypy
  buildah commit $mypy varshitpy
  buildah images
  buildah run $mypy /usr/bin/python3
  podman images
  podman tag localhost/varshitpy quay.io/varshit/mypythonimage
  podman login quay.io
  podman push quay.io/varshit/mypythonimage

