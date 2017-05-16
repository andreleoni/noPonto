FROM ruby:2.3-slim
# Instala as nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Seta nosso path
ENV INSTALL_PATH /usr/src/app
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# BUNDLE CACHE
ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle
# Instala as Gems
RUN bundle install
# Copia nosso código para dentro do container
COPY . .
# Roda nosso servidor
CMD puma -C config/puma.rb
