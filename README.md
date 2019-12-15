# Ruby on Rails on Docker

## Overview

Ruby on Railsが動くDockerコンテナを目指して作りました。

## Usage

### 初期の使い方

1. Ruby on Rails用のDocker imageをビルドします

```shell
$ docker-compose build
```

2. 作成したイメージをコンテナとして実行します。

```shell
$ docker run -v $PWD/src:/app -td {Docker_Image_ID} /bin/bash
```

3. 実行したコンテナにアタッチします

```shell
$ docker exec -it {Docker_Container_ID} /bin/bash
```

4. `rails new .`します。

```shell
$ rails new . --force
```

5. この状況でホスト側の`./src`ディレクトリの下にRailsアプリケーションのコード一式が出来上がる。

<スクリーンショット貼る>

### Gemfileが更新された場合

もう一度ビルドしてbundle installを再度実行させる。これによって、Gemをイメージに焼き込む必要がある。

```shell
$ docker-compose build
```

## Description

