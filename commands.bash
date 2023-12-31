# Models 

rails generate model User email username name password role tweets_count likes_count
rails generate model Tweet body replies_count likes_count 
rails generate model Like 

# Migraciones 
## Añadir referencias
rails generate migration AddReferencesInSeveralColumns
## Añadir valores por defecto
rails generate migration AddDefaultInSeveralColumns
## Unificar columnas
rails generate migration AddIndexToSeveralColumns 
## Declarar que no deben ser vacías
rails generate migration ChangeNullTrueToFalseInSeveralColumns


# Controladores

rails generate controller Users index show edit new update destroy
rails generate controller Tweets index show edit new update destroy
# rails generate controller Likes index show edit new update destroy