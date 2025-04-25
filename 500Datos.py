import csv
import random
import string
from faker import Faker
from datetime import timedelta
from pathlib import Path

fake = Faker('es_MX')

def generar_codigo_libro(usados):
    while True:
        codigo = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
        if codigo not in usados:
            usados.add(codigo)
            return codigo

def generar_isbn(usados):
    while True:
        isbn = fake.isbn13(separator="-")
        if isbn not in usados:
            usados.add(isbn)
            return isbn

def generar_datos():
    cantidad = 500_000
    carpeta = Path("datos_biblioteca")
    carpeta.mkdir(parents=True, exist_ok=True)

    isbns_usados = set()
    codigos_usados = set()

    colonias = ["Centro", "San Juan", "Industrial", "Lomas", "Guadalupe", "Santa Fe", "Jardines", "Del Valle"]
    temas = ["tiempo", "viento", "fuego", "memoria", "oscuridad", "luz", "sombras", "silencio", "deseo", "verdad"]
    formas = ["El misterio de", "La sombra de", "Crónicas de", "El legado de", "Secretos de", "La historia de", "Ecos de", "A través del", "El arte de"]

    with open(carpeta / "autores.csv", "w", newline="", encoding="utf-8") as a_file, \
         open(carpeta / "editoriales.csv", "w", newline="", encoding="utf-8") as e_file, \
         open(carpeta / "libros.csv", "w", newline="", encoding="utf-8") as l_file, \
         open(carpeta / "autor_libro.csv", "w", newline="", encoding="utf-8") as al_file, \
         open(carpeta / "ejemplares.csv", "w", newline="", encoding="utf-8") as ej_file, \
         open(carpeta / "usuarios.csv", "w", newline="", encoding="utf-8") as u_file, \
         open(carpeta / "prestamos.csv", "w", newline="", encoding="utf-8") as p_file:

        escritor_autor = csv.writer(a_file)
        escritor_editorial = csv.writer(e_file)
        escritor_libro = csv.writer(l_file)
        escritor_autor_libro = csv.writer(al_file)
        escritor_ejemplar = csv.writer(ej_file)
        escritor_usuario = csv.writer(u_file)
        escritor_prestamo = csv.writer(p_file)

        for i in range(1, cantidad + 1):
            # Editorial
            editorial_nombre = fake.company()
            escritor_editorial.writerow([i, editorial_nombre])

            # Autor
            escritor_autor.writerow([i, fake.first_name(), fake.last_name()])

            # Libro
            codigo_libro = generar_codigo_libro(codigos_usados)
            titulo = f"{random.choice(formas)} {random.choice(temas)}"
            isbn = generar_isbn(isbns_usados)
            paginas = random.randint(100, 900)
            escritor_libro.writerow([codigo_libro, titulo, isbn, i, paginas])

            # Autor-libro
            escritor_autor_libro.writerow([i, codigo_libro])

            # Ejemplar
            localizacion = f"Sala-{random.randint(1, 30)}-{random.choice(['A', 'B', 'C'])}-{random.randint(1, 20)}"
            escritor_ejemplar.writerow([localizacion, codigo_libro])

            # Usuario
            colonia = random.choice(colonias)
            direccion = f"{fake.street_name()} #{random.randint(1,999)}, Col. {colonia}, {fake.city()}"
            telefono = fake.phone_number()
            escritor_usuario.writerow([i, fake.first_name(), fake.last_name(), telefono, direccion])

            # Préstamo
            fecha_prestamo = fake.date_between(start_date='-1y', end_date='-30d')
            fecha_devolucion = fecha_prestamo + timedelta(days=random.randint(7, 30))
            escritor_prestamo.writerow([i, i, i, fecha_prestamo, fecha_devolucion])

    print("✅ Todos los archivos fueron generados correctamente en 'datos_biblioteca/'")

if __name__ == "__main__":
    generar_datos()
