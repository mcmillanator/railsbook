FROM rubydata/datascience-notebook:latest

USER root

RUN gem install -qN --silent --no-post-install-message \
	jupyter_on_rails \
	ffi-rzmq \
	rails

WORKDIR /srv

# Install the zsh kernel and jupyter extentions
RUN python -m pip install -q \
    notebook \
    zsh_jupyter_kernel \
    jupyterlab-lsp \
    jupyter_react && \
    python -m zsh_jupyter_kernel.install

# add zsh
RUN apt-get update && \
		apt-get install -qy zsh && \

RUN chown -R jovyan /srv /usr/local/

RUN truncate -s 0 /var/log/*.log

USER jovyan

RUN rails new rails_app

WORKDIR /srv/rails_app

RUN bundle add jupyter_on_rails ffi-rzmq

WORKDIR /srv

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
