# Tarea: Almacenamiento en cach� de la inversa de una matriz
# 
#Su tarea es escribir un par de funciones que almacenen en cach� el inverso de una matriz.
#
# Matriz especial creada para guardar en cach� su inversa
makeCacheMatrix<- function(ma = matrix()){
  #inicializamos la matriz inversa 
  in <- NULL
  #establecer la matriz con un metodo
  set<- function(matrix){
    ma<<- matrix()
    in<<- NULL
    
  }
  #Obetenemos la matriz por otro metodo
  get<- function(){
    ma
  }
  #establecer la inversa de la matriz con un metodo
  setInversa<- function(inverse){
    in<<- inverse
  }
  #Obetenemos la matriz imnversa por otro metodo
  getInversa<- function(){
    in
  }
  
  #Lista de metodod 
  
  list(get = get, set = set, getInversa = getInversa, setInversa = setInversa)
  
}
  

##cacheSolve: esta funci�n calcula el inverso de la "matriz" especial devuelta 
##por makeCacheMatrix arriba. Si ya se calcul� la inversa (y la matriz no ha cambiado), 
##entonces el cachesolve deber�a recuperar la inversa del cach�.

caheSolve<- function(x, ...){
  #retorna la inversa de la matriz x si existe 
  
  ma<- x$getInversa
  
  if (!is.null(ma)){
    message("La matriz no a cambiado Obtengala de los datos del cache")
    return(ma)
  }
  ## Obtenemos la matriz del objeto nuestro 
  
  data<- x$get()
  
  ## en este punto Calcular la inversa mediante la multiplicaci�n de matrices
  
  ma <- solve(data) %*% data
  
  #establecemos la inversa 
  
  x$getInverse(ma)
  
  # retornamos la matriz
  
  ma
  
}
