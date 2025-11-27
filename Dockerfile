FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-aarch64.lock /tmp/conda-linux-aarch64.lock

RUN conda update --quiet --file /tmp/conda-linux-aarch64.lock \
    && conda clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"