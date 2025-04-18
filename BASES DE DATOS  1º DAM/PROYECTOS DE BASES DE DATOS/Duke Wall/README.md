# 📘 PROYECTO DE BASES DE DATOS - DUKE WALL

## 📌 Descripción

Para este proyecto hemos elegido el **Caso Práctico 2: Sistema de Gestión de Compras para GlobalMart Ltda.**  
Nuestro objetivo es diseñar e implementar un sistema que administre de manera eficiente el proceso de compras de la empresa, utilizando una base de datos relacional como núcleo del sistema.

Este sistema permite registrar proveedores, gestionar órdenes de compra, productos y controlar el historial de adquisiciones, facilitando así la toma de decisiones dentro de la organización.

---

## 🛠️ Tecnologías utilizadas

- **MySQL** – Motor de base de datos relacional.  
- **MySQL Workbench** – Herramienta para diseño y gestión de la base de datos.  
- **draw.io** – Para el modelado del Diagrama Entidad-Relación (DER).  

---

## ⚙️ Instalación y configuración

1. Abre **MySQL Workbench** y ejecuta los scripts en el siguiente orden:

   - `creacion.sql` – Crea la base de datos y las tablas.
   - `insercion.sql` – Inserta los datos iniciales.
   - `consultas.sql` – Contiene consultas útiles para explorar la base.
   - `ampliacion.sql` – Agrega modificaciones o nuevas estructuras al modelo.
   - `vistas-triggers.sql` – Define vistas y triggers que automatizan ciertas acciones.

2. (Opcional) Abre el archivo `Modelo conceptual.drawio.xml` para visualizar el modelo conceptual completo.

✅ ¡Listo!🎉

---
## 🙋‍♂️ Autor

**Duke Wall**  
Estudiante de [Nombre de tu universidad]  
Apasionado por bases de datos, sistemas y desarrollo backend.  
GitHub: [@DukeGW](https://github.com/DukeGW)

-----

## 📂 Estructura del proyecto

```plaintext
📁 Duke Wall/
├── 📂 capturas/
│   ├── INSERCION - TABLA CLIENTE.png
│   ├── INSERCION - TABLAS PEDIDO.png
│   ├── INSERCION - TABLA PROVEEDOR.png
│   ├── INSERCION - TABLA PRODUCTO.png
│   ├── INSERCION - TABLAS DETALLEPEDIDO.png
│   ├── Modelo conceptual.png
│   ├── Modelo relacional+ampliaciones.png
│   ├── Modelo relacional.png
│   ├── TRIGGER ACTUALIZACION ESTADO PAGO.png
│   ├── TRIGGER ESTADO DE PEDIDO.png
│   └── TRIGGER VERIFIA EL STOCK.png
├── 📂 recursos/
│   └── README.md
├── 📂 script/
│   ├── Modelo conceptual.drawio.xml
│   ├── ampliacion.sql
│   ├── consultas.sql
│   ├── creacion.sql
│   ├── insercion.sql
│   └── vistas-triggers.sql
├── Informe GlobalMart.md
└── README.md

