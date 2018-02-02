FROM jupyter/base-notebook

ENV NB_UID=999 \
    NB_GID=999

RUN conda install theano==0.9.0 keras==1.2.2 networkx==1.11 pandas seaborn pygpu
RUN pip install hyperopt==0.1
# Setup Jupyter Config and notebooks directory
ENV NOTEBOOKS_CONFIG_DIR /etc/jupyter
COPY jupyter_notebook_config.py $NOTEBOOKS_CONFIG_DIR/
USER root
RUN mkdir -p /data /data/notebooks
RUN fix-permissions /data
WORKDIR /data/notebooks
RUN echo -e "[global]\ndevice=nvidia\nfloatX=float32" > $HOME/.theanorc
CMD ["start-notebook.sh"]