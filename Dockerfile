FROM jupyter/minimal-notebook

LABEL testDocker <sac2087@gmail.com>

RUN pip install --upgrade pip
RUN pip install -U spacy ipython
RUN pip install git+https://github.com/chartbeat-labs/textacy.git
RUN python -m spacy.en.download --force all

ADD requirements.txt /home/$NB_USER/

RUN conda install --yes --file /home/$NB_USER/requirements.txt && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR
	
ADD notebooks /home/$NB_USER/
