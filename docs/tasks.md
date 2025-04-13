## **🧠 Objetivo General**

Diseñar, montar y consultar dos sistemas de bases de datos relacionales utilizando un motor de base de datos de libre acceso. Uno modela un entorno de **ventas de papelería** y el otro **gestión académica universitaria**. La entrega final debe contener el **export completo de ambas bases de datos** y los **scripts SQL que resuelvan las consultas planteadas**.

---

## **✅ FASE 1: Instalación del entorno**

### **1.1. Elegir motor de base de datos**

- Motor seleccionado: **PostgreSQL 14.17** (instalado vía Homebrew)

### **1.2. Instalar el motor**

- Descargar e instalar el motor en el equipo local.
- Verificar que el servidor esté corriendo correctamente.

### **1.3. Instalar herramienta de administración gráfica**

- Instalar por ejemplo **Workbench** (MySQL), **pgAdmin** (PostgreSQL) u otra alternativa (DBeaver, HeidiSQL, etc.).
- Probar la conexión con el motor instalado.

---

## **✅ FASE 2: Modelado y creación de esquemas**

### **2.1. Base de Datos de Ventas (Papelería)**

**Nombre sugerido**: ventas_papeleria

### **Tablas requeridas:**

- proveedor (id, nombre, contacto, etc.)
- productos (id, nombre, precio, proveedor_id [FK])
- clientes (id, nombre, contacto, etc.)
- ventas (id, producto_id [FK], cliente_id [FK], fecha, cantidad, total)

### **Requisitos técnicos:**

- Definir tipos de datos adecuados.
- Establecer **llaves primarias** y **llaves foráneas** correctamente.

### **2.2. Base de Datos de Universidad**

**Nombre sugerido**: universidad_academica

### **Tablas requeridas:**

- facultad (id, nombre)
- programa (id, nombre, facultad_id [FK])
- usuarios (id, nombre, correo, rol_id [FK])
- rol (id, tipo: estudiante/docente)
- cursos (id, nombre, programa_id [FK])
- clases (id, curso_id [FK], profesor_id [FK], horario, salón)
- matricula (id, estudiante_id [FK], clase_id [FK])

### **Requisitos técnicos:**

- Usar tipos adecuados (VARCHAR, INT, DATE, etc.).
- Establecer relaciones con llaves foráneas.
- Agregar restricciones donde sea necesario (UNIQUE, NOT NULL, etc.).

---

## **✅ FASE 3: Poblado de datos**

- Insertar registros **coherentes y suficientes** para poder probar correctamente las sentencias SQL.
- Sugerencia:
    - Al menos 3 proveedores, 5 productos, 5 clientes, 10 ventas.
    - Al menos 2 facultades, 3 programas, 5 docentes, 10 estudiantes, 3 cursos, 5 clases, 20 matrículas.

---

## **✅ FASE 4: Consultas SQL requeridas**

### **Desde**

### **ventas_papeleria**

### **:**

1. **No. de productos asociados a cada proveedor**
2. **Valor promedio de todas las ventas totales**
3. **Tres (o más) días con mayor número de productos vendidos**
4. **Tres (o más) clientes con mayores ventas**

### **Desde**

### **universidad_academica**

### **:**

1. **Programas por facultades**
2. **Estudiantes matriculados en cursos del programa “Ingeniería de Software”**
3. **Cursos con estudiantes matriculados (y número de estudiantes por curso)**
4. **Número de materias matriculadas por estudiante**
5. **Estudiantes sin materias matriculadas**
6. **Número de estudiantes a cargo de cada profesor en cada curso**

---

## **✅ FASE 5: Exportación y entrega**

### **5.1. Exportar bases de datos**

- Usar herramienta gráfica o línea de comandos para generar los .sql completos:
    - Incluir creación de esquemas, inserción de datos y relaciones.

### **5.2. Crear archivo de entrega**

- Crear archivo único .sql que contenga:
    - - comentarios con nombre del autor y motor utilizado.
    - Script para crear ambas bases.
    - INSERT INTO de los datos agregados.
    - Scripts SQL que resuelven los 10 ítems del taller.

### **5.3. Validación**

- Probar todos los scripts desde 0 en otro equipo o entorno limpio.
- Confirmar que el archivo .sql corre sin errores.

---

## **📦 ENTREGABLE FINAL**

> Archivo único: taller_sql_actividad5.sql
> 

> Contenido:
> 
- Esquemas y estructuras de ambas bases.
- Inserts de datos.
- Sentencias SQL requeridas.
- Comentarios explicativos opcionales.