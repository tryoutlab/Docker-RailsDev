# DockerHubからRuby2.6.5をダウンロード
FROM ruby:2.6.5-stretch

# アプリケーションのルートディレクトリを指定
ENV APP_ROOT /app

# コンテナ内の/appをカレントディレクトリとして利用する
WORKDIR $APP_ROOT

# 環境変数にバージョンを指定（今回は利用しない）
#ENV NODE_VERSION=12.13.0 
#  NODE_DISTRO linux-x64 \
#  YARN_VERSION 1.19.1

# nodeのコンテナからnode.jsのバイナリをコピーする
COPY --from=node:12.13.0-stretch /usr/local/ /usr/local/
COPY --from=node:12.13.0-stretch /opt/ /opt/

# Gemfile追加
ADD ./src/Gemfile $APP_ROOT/Gemfile
ADD ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

# bundle install
ARG BUNDLE_INSTALL_ARGS="-j 4"
RUN bundle install ${BUNDLE_INSTALL_ARGS}

# srcフォルダをコンテナの中に追加する
ADD ./src/ $APP_ROOT