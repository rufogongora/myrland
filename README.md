# Myrland 8.6	

Para instalar Myrland simplemente descarga este repositorio de github y sigue los siguientes pasos:

* Instala XAMPP o MySQL
* Crea un usuario, contraseña y base de datos en MySQL para Myrland
* Importa el  MySQL Schema a la base de datos dentro de /schemas/MySQL.sql
* Copia el config(example).lua y llámalo config.lua
* Cambia la siguiente configuracion del config.lua

``` lua
	sqlType = "mysql"
	sqlHost = "localhost"
	sqlPort = 3306
	sqlUser = "root"
	sqlPass = ""
	sqlDatabase = ""
```
* Para abrir el servidor hay que desbloquear los puertos 7171 en el router y cambiar la siguiente configuración en config.lua

```lua
	ip = "127.0.0.1"
```
 
 Correr el archivo TheForgottenServerV8.2 (32 o 64 bits).exe
 


# Gracias!
