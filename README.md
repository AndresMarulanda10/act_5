# Proyecto de Diseño de Bases de Datos

## Descripción General

Este proyecto involucra el diseño e implementación de dos sistemas de bases de datos relacionales:

1. **Ventas Papelería**: Una base de datos para gestionar ventas en una papelería.
2. **Universidad Académica**: Una base de datos para gestionar información académica en un entorno universitario.

## Estructura del Proyecto

El proyecto está organizado en los siguientes directorios y archivos:

```
act_5/
├── ventas_papeleria/
│   ├── create_tables.sql       # Sentencias SQL para crear tablas para la base de datos ventas_papeleria
│   ├── insert_data.sql         # Sentencias SQL para insertar datos de ejemplo en ventas_papeleria
│   └── queries.sql             # Consultas SQL para recuperar información de ventas_papeleria
├── universidad_academica/
│   ├── create_tables.sql       # Sentencias SQL para crear tablas para la base de datos universidad_academica
│   ├── insert_data.sql         # Sentencias SQL para insertar datos de ejemplo en universidad_academica
│   └── queries.sql             # Consultas SQL para recuperar información de universidad_academica
├── docs/
│   └── tasks.md                # Especificaciones y requisitos del proyecto
├── taller_sql_actividad5.sql   # Script SQL combinado para todas las operaciones de base de datos
└── README.md                   # Documentación del proyecto
```

## Instrucciones de Configuración

### Opción 1: Ejecutar los Scripts Individuales

1. **Motor de Base de Datos**: Asegúrate de tener PostgreSQL instalado y en ejecución.
2. **Crear Bases de Datos y Tablas**: 
   - Ejecuta los archivos `create_tables.sql` para crear las bases de datos y tablas necesarias.
3. **Insertar Datos de Ejemplo**: 
   - Ejecuta los scripts `insert_data.sql` para poblar las bases de datos con datos de ejemplo.
4. **Ejecutar Consultas**: 
   - Utiliza los archivos `queries.sql` para ejecutar las consultas requeridas.

### Opción 2: Usar el Script Combinado (taller_sql_actividad5.sql)

Para mayor comodidad, todas las operaciones SQL están combinadas en un solo archivo, pero deben ejecutarse por segmentos:

1. **Primer segmento - Crear Bases de Datos**:
   - Conéctate a una base de datos del sistema (por ejemplo, template1)
   - Ejecuta solo los comandos de creación de bases de datos:
   ```sql
   DROP DATABASE IF EXISTS ventas_papeleria;
   DROP DATABASE IF EXISTS universidad_academica;
   CREATE DATABASE ventas_papeleria TEMPLATE template0;
   CREATE DATABASE universidad_academica TEMPLATE template0;
   ```

2. **Segundo segmento - Ventas Papelería**:
   - Conéctate a la base de datos `ventas_papeleria`
   - Ejecuta la sección para crear tablas, insertar datos y consultas para esta base de datos

3. **Tercer segmento - Universidad Académica**:
   - Conéctate a la base de datos `universidad_academica`
   - Ejecuta la sección para crear tablas, insertar datos y consultas para esta base de datos

## Instrucciones de Ejecución en DataGrip

Cuando uses DataGrip para ejecutar el script combinado:

1. Cierra todas las conexiones existentes a las bases de datos
2. Utiliza el selector de base de datos en el editor para cambiar entre bases de datos
3. Selecciona y ejecuta solo las porciones relevantes del script para cada base de datos
4. Evita ejecutar todo el script de una vez, ya que DataGrip no cambia automáticamente los contextos de bases de datos

## Notas Adicionales

- El script utiliza características específicas de PostgreSQL. Asegúrate de usar una versión compatible.
- Si encuentras errores de "la base de datos está siendo accedida por otros usuarios", desconecta todas las sesiones activas antes de intentar eliminar las bases de datos.
- Para un entorno de prueba limpio, asegúrate de que todas las conexiones anteriores estén cerradas antes de la ejecución.
- Todas las consultas han sido probadas exhaustivamente y devuelven los resultados esperados cuando se ejecutan en el orden adecuado.

Este README sirve como guía para entender, configurar y ejecutar los sistemas de bases de datos para el proyecto.