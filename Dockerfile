FROM ubuntu
RUN apt-get update && apt-get install -y \
  git \
  wget \
  python3-pip 
RUN pip3 install --upgrade pip
RUN pip3 install theano==0.9.0 keras==1.2.1 hyperopt==0.1 networkx==1.11 pandas seaborn jupyter
 
 


