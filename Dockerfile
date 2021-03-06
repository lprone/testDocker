FROM jupyter/minimal-notebook

LABEL testDocker <sac2087@gmail.com>

ADD requirements.txt /home/$NB_USER/

RUN conda install --yes --file /home/$NB_USER/requirements.txt && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR
	
RUN python -m spacy download es

ADD notebooks /home/$NB_USER/
