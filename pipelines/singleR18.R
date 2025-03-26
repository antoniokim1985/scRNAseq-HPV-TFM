# Instalar BiocManager si no está instalado
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
# Instalar devtools si no está instalado
if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")

BiocManager::install(c("SingleR", "celldex", "dbplyr"))
BiocManager::install(c("ExperimentHub"))

library(SingleR)
library(celldex)
library(ExperimentHub)


# Leer la matriz de expresión
expression_matrix <- as.matrix(read.csv("./HPV18_results/18_QC2_expression_matrix.csv", row.names = 1))
# Leer los metadatos
metadata <- read.csv("./HPV18_results/18_QC2_metadata.csv", row.names = 1)

# Volver a crear el caché
hub <- ExperimentHub(localHub=TRUE)

# Cargar la base 
ref <- HumanPrimaryCellAtlasData()

# Ejecutar SingleR
singleR_results <- SingleR(
  test = expression_matrix,     # Matriz de expresión de tus datos
  ref = ref,                    # Conjunto de datos de referencia
  labels = ref$label.main       # Etiquetas principales del conjunto de referencia
)

# Resumen de las anotaciones
table(singleR_results$labels)

# Anotar cada cluster Leiden
cluster_annotations <- aggregate(
  singleR_results$labels,
  by = list(metadata$leiden),
  FUN = function(x) names(sort(table(x), decreasing = TRUE))[1]
)

# Renombrar las columnas
colnames(cluster_annotations) <- c("leiden", "annotation")

# Ver las anotaciones por cluster
print(cluster_annotations)

# Guardar las anotaciones en un archivo CSV
write.csv(cluster_annotations, "./HPV18_results/cluster_annotations18.csv", row.names = FALSE)

