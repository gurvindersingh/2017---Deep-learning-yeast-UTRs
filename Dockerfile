FROM ubuntu
RUN apt-get update && apt-get install -y \
  git \
  wget \
  python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install theano==0.9.0 keras==1.2.1 hyperopt==0.1 networkx==1.11 pandas seaborn jupyter

# Setup Jupyter Config and notebooks directory
ENV NOTEBOOKS_CONFIG_DIR /opt/jupyter/config
ENV NB_UID 999
ENV NB_USER promec
RUN mkdir -p $NOTEBOOKS_CONFIG_DIR
COPY jupyter_notebook_config.py $NOTEBOOKS_CONFIG_DIR/
RUN mkdir -p /notebooks /data
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER
RUN chown -R $NB_USER /notebooks /data
WORKDIR /notebooks
USER $NB_USER
CMD jupyter notebook --config $NOTEBOOKS_CONFIG_DIR/jupyter_notebook_config.py
