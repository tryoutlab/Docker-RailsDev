# Ruby on Rails on Docker

## Overview

Ruby on Railsが動くDockerコンテナを目指して作りました。

## Usage

1. Ruby on Rails用のDocker imageをビルドします

```
$ docker-compose build
```

2. 作成したイメージをコンテナとして実行します。

```
$ docker run -td {Docker_Image_ID} /bin/bash
```

3. 実行したコンテナにアタッチします

```
$ docker exec -it {Docker_Container_ID} /bin/bash
```

4. `rails new .`します。

```
$ rails new . 
```

## Description

