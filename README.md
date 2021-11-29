# MovieStore
Movie Store with SwiftUI and Combine.

La app se realizo en el patrón MVVM (Model - View - ViewModel)
 

# Model
Dentro del la app van a encontrar Tres Modelos

MovieMOdel - MoviesResponse, encargado de la información de las películas, listado de (TOP - POPULAR - UPCOMING)
DetailMovieModel - DetailMovieResponse, encargado d e almacenar la información de detalle de una película.
MovieVideoModel - -MovieVideoResponse, Lista de Videos relacionados a una película.

# View
Existen 4 vistas principales. 

HomeView que posee un elemento de tipo TabView. y carga los ObservableObject para cada una de las listas. 

HomeMovieCatView que recibe como parámetro el ObservableObject que va a pintar, Listas de Películas de una Categoría con su barra de Search mediante su ViewModel.

DetailMovieView se utiliza para mostrar el detalle de una película, esta recibe como parámetro el id de la película y carga un observableObject con el detalle utilizando el ViewModel

SafariView la misma se encarga de mostrar todo lo relacionado a la web, como HomePage de las películas, videos de youtube, etc. 


# ViewModel

Se crearon dos ViewModel 

MovieHomeDataVM esta es de tipo ObservableObject el mismo comprende un Published con la lista de películas obtenidas del servicio (https://api.themoviedb.org) la cual almacena la lista original y exponer mediante el published la lista filtrada según la propiedad Search de tipo Published.


DetailMovieVM esta es de tipo ObservableObject el mismo comprende un Published con el detalle de la películas obtenidas del servicio (https://api.themoviedb.org).

# Services

MovieStore clase utilizada para el consumo del servicio de películas de https://api.themoviedb.org, contiene 3 metodos los cuales sin GetListMovie, getMovie y getMovieVideo.


 # Utilidades 
 
 AsyncImage clase utilizada para la carga asíncrona de las imágenes. 
 Collapsible View para mostrar secciones de la pagina de forma desplegable.
 
 



