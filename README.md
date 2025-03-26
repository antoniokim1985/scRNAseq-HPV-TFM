## ANEXO TFM: Análisis de expresión génica en adenocarcinoma cervical por HPV16 y HPV18 con Scanpy

1. Organización de ficheros y directorios
2. Requerimientos previos
3. Pasos para la ejecución

### 1. Organización de ficheros y directorios
  A. deps
  Se encuentra en deps/requirements.txt las dependencias necesarias para poder ejecutar el pipeline
  
  B. pipelines
  Dentro de ella podemos observar:
  hpv16.ipynb y hpv18.ipynb: Pipeline de muestra HPV16 y 18 (no incluye proceso de anotación)
  Ambas al ejecutar generan resultados en HPV16_results y HPV18_results respectivamente
  singleR16.R y singleR18.R: Pipeline de muestra HPV16 y 18 (para realizar la anotación). Éstas consumen de datos generados en las pipelines previas.
  
  C. plots
  Directorio con gráficos. Las mismas están distribuidas en:
  Clusters: contiene archivo xls con gráficos y tablas utilizados en la confección del trabajo.
  Venn: documentación y código utilizado para realizar los diagramas de Venn.
  
  D. RAW
  Directorio en donde irán los archivos crudos.
  
  E. gene_research
  En este directorio se almacenan archivos con datos de investigación gen por gen con índice bibliográfico incluido.

### 2. Requerimientos previos

  A. Python3 (3.10.12 o superior)
  B. Jupyter notebook
  C. Pip3 (22.0.2 o superior)
  D. venv (3.13.2 o superior) https://docs.python.org/3/library/venv.html
  E. R (4.4.2)
  F. RStudio (Cualquier versión compatible con R)


### 3. Pasos para la ejecución
  
  A. Crear entorno virtual
  Ejecutar:
  
  ```
  python3 -m venv <nombre_del_entorno>
  ```
  
  Activar el entorno:
  
  ```
  source <nombre_del_entorno>/bin/activate
  ```
  
  B. Instalar dependencias desde requirements
  
  Ejecutar
  
  ```
  pip3 install -r requirements.txt
  ```
  
  
  C. Descargar
  
  |Desde | Destino | Archivos |
  |---|---|---|
  |https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM5917940 | RAW/hpv16/ | barcodes.tsv.gz + features.tsv.gz, matrix.mtx.gz|
  |https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM5917941 | RAW/hpv18/ | barcodes.tsv.gz + features.tsv.gz, matrix.mtx.gz|
  
  
  D. Abrir Jupyter notebook con las dependencias activas
  
  Ejecutar
  
  ```
  Jupyter notebook
  ```
  
  E. Abrir notebook deseada desde el navegador y ejecutar el código
  
  F. Abrir archivo singleR16 o singleR18 y ejecutar código.

