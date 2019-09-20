# pintos-env-kaist-cs330/2019-fall

Dockerized Pintos development environment for KAIST CS330 cource

## Environment

- Ubuntu: 16.04
- gcc/g++: 5.4.0
- bochs: 2.6.2
- qemu: 2.5.0

## Installation

#### pull

```bash
$ docker pull hood/pintos-env-kaist-cs330-2019-fall
```

#### run

```bash
docker run -d -it --name pintos hood/pintos-env-kaist-cs330-2019-fall
```

If you want to mount your local pintos directory, run following command 
```bash
docker run -d -it --name pintos -v <local-pintos-dir>:/pintos hood/pintos-env-kaist-cs330-2019-fall
```

#### access

```bash
docker exec -it pintos bash
```
