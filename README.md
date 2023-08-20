# Entorno de trabajo para la materia optativa "Programación Distribuida sobre Grandes Volúmenes de Datos" con Pyspark

El entorno de trabajo tiene 3 módulos principales:

* Apache Zeppelin ([entorno principal de las clase](https://bitbucket.org/bigdata_famaf/diplodatos_bigdata/src/master/))
    * http://localhost:8080/
* Jupyter Notebook + Pyspark (para probar otro entorno)
    * http://localhost:8888/
* Una instancia de Postgresql local (para hacer pruebas de ETL en una base de datos con spark desde Jupyter)

Pasos para levantar todo el entorno con docker compose:

1) Ejecutar desde el directorio raiz del repositorio:

```
$ docker compose up --build
```

2) Tomarse un café ☕
