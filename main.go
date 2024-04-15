package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/mattn/go-sqlite3"
)

func main() {

	// Se inicializa la variable db global
	var db *sql.DB

	// se verifica si la base de datos existe
	_, err := os.Stat("./datos.db")

	// Si no se recibe ningun error, es decir existe, entonces:
	if err == nil {
		fmt.Printf("Base de datos encontrada.")
		// si la base de datos no existe di lo notifica
	} else if os.IsNotExist(err) {
		fmt.Printf("La base de datos no ha sido encontrada. \n Creando Base de datos...")
		// Algo falló :b
	} else {
		fmt.Printf("Ocurrio un error al verificar la base de datos...")
	}

	// Se inicia la conexion con la db, si el archivo no está entonces lo crea
	db, err = sql.Open("sqlite3", "./datos.db")
	if err != nil {
		log.Fatal(err)
	}

	sqlScript := `
		CREATE TABLE IF NOT EXISTS personal (
      cedula INTEGER PRIMARY KEY,
      nombre TEXT,
      apellidos TEXT,
      correo TEXT,
      telefono TEXT,
      ocupacion TEXT
    );
    CREATE TABLE IF NOT EXISTS horarios (
      id_asign INTEGER PRIMARY KEY,
      cedula_personal INTEGER,
      aula_numero INTEGER,
      dia_semana TEXT,
      hora_entrada TEXT,
      hora_salida TEXT,
      FOREIGN KEY (cedula_personal) REFERENCES personal(cedula),
      FOREIGN KEY (aula_numero) REFERENCES aulas(numero_aula)
    );
  
    CREATE TABLE IF NOT EXISTS aulas (
      numero_aula INTEGER PRIMARY KEY,
      horario_disponibilidad TEXT
    );
  
    CREATE TABLE IF NOT EXISTS alquiler (
      id_alqui INTEGER PRIMARY KEY,
      cedula_personal2 INTEGER,
      equipo_numero INTEGER,
      hora_alqui DATETIME,
      hora_retorno DATETIME,
      FOREIGN KEY (cedula_personal2) REFERENCES personal(cedula),
      FOREIGN KEY (equipo_numero) REFERENCES equipos(numero_equipo)
    );
  
    CREATE TABLE IF NOT EXISTS equipos (
      numero_equipo INTEGER PRIMARY KEY,
      nombre_equipo TEXT
    );
    CREATE TABLE IF NOT EXISTS ingreso (
      id_ingreso INTEGER PRIMARY KEY,
      cedula_ingreso INTEGER,
      hora_ingreso DATETIME,
      hora_salida DATETIME,
      FOREIGN KEY (cedula_ingreso) REFERENCES personal(cedula)
    );
		`

	// Ejecuta el script guardado en sqlScript.
	_, err = db.Exec(sqlScript)
	if err != nil {
		log.Fatalf("Error al ejecutar SQL Script: %v", err)
	}
}
