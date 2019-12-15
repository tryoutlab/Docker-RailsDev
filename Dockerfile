FROM ruby:2.6.5-stretch

WORKDIR /app

ENV NODE_VERSION=v12.13.0 \
  NODE_DISTRO=linux-x64 \
  YARN_VERSION=1.19.1

#ENV PATH=/opt/node-${NODE_VERSION}-${NODE_DISTRO}/bin:/opt/yarn-v${YARN_VERSION}/bin:${PATH}

#RUN curl -sSfLO https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz \
#  && tar -xJf node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz -C /opt \
#  && rm -v node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz \
#  && curl -o - -sSfL https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION} \
#  && mv /root/.yarn /opt/yarn-v${YARN_VERSION}

ARG BUNDLE_INSTALL_ARGS="-j 4"
COPY Gemfile Gemfile.lock ./
RUN bundle install ${BUNDLE_INSTALL_ARGS}

COPY --from=node:12.13.0-stretch /usr/local/ /usr/local/
COPY --from=node:12.13.0-stretch /opt/ /opt/

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
#ENTRYPOINT ["/docker-entrypoint.sh"]

#COPY . ./

#CMD ["rails", "s", "-b", "0.0.0.0"]
#EXPOSE 3000