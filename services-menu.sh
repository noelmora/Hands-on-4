#!/bin/bash

while true; do
    # Mostrar el menú de opciones
    echo "Seleccione una opción:"
    echo "1) Listar el contenido de un fichero (directorio)"
    echo "2) Crear un archivo de texto con una línea de texto"
    echo "3) Comparar dos archivos de texto"
    echo "4) Mostrar uso del comando awk"
    echo "5) Mostrar uso del comando grep"
    echo "6) Salir"
    read -p "Opción: " opcion

    case $opcion in
        1)
            read -p "Ingrese la ruta absoluta del fichero (directorio): " ruta
            if [ -d "$ruta" ]; then
                echo "Contenido del directorio $ruta:"
                ls "$ruta"
            else
                echo "La ruta ingresada no es un directorio válido"
            fi
            ;;

        2)
            read -p "Ingrese el nombre del archivo a crear: " archivo
            read -p "Ingrese la línea de texto para almacenar: " texto
            echo "$texto" > "$archivo"
            echo "Archivo '$archivo' creado con el texto: $texto"
            ;;

        3)
            read -p "Ingrese la ruta del primer archivo: " archivo1
            read -p "Ingrese la ruta del segundo archivo: " archivo2
            if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
                diff "$archivo1" "$archivo2" > /dev/null
                if [ $? -eq 0 ]; then
                    echo "Los archivos son idénticos"
                else
                    echo "Los archivos son diferentes"
                    diff "$archivo1" "$archivo2"
                fi
            else
                echo "Uno o ambos archivos no existen o no son válidos"
            fi
            ;;

        4)
            echo "Ejemplo de uso del comando awk:"
            echo "Ingrese el archivo a procesar con awk:"
            read archivo
            if [ -f "$archivo" ]; then
                echo "Primera columna del archivo $archivo:"
                awk '{print $1}' "$archivo"
            else
                echo "El archivo no existe"
            fi
            ;;

        5)
            echo "Ejemplo de uso del comando grep:"
            echo "Ingrese el archivo a buscar con grep:"
            read archivo
            if [ -f "$archivo" ]; then
                echo "Ingrese el patrón de búsqueda para grep:"
                read patron
                grep "$patron" "$archivo"
            else
                echo "El archivo no existe"
            fi
            ;;

        6)
            echo "Saliendo"
            break
            ;;

        *)
            echo "Opción no válida, Intente nuevamente"
            ;;
    esac

    echo "" 
done
