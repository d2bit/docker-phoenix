FROM elixir

MAINTAINER David BF <d2bit.dev@gmail.com>

# Add normal user
RUN groupadd --gid 1001 phoenix \
  && useradd --uid 1001 --gid phoenix --shell /bin/bash --create-home phoenix

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs inotify-tools

USER phoenix

# Install phoenix
RUN mix local.hex --force \
  && mix archive.install --force hex phx_new 1.4.10 \
  && mix local.rebar --force

WORKDIR /home/phoenix
