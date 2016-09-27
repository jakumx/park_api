#Creación de proyecto park_api

se actualizaron los componentes elixir y phoenix


    bower update

se instalo el postgres por medio de su  [pagina](https://www.postgresql.org/download/macosx/)

se creo el proyecto por medio de

    mix phoenix.new park_api

se crearon los modelos json Game y Park ejem:

    mix phoenix.genmix phoenix.gen.json Game games name:string description:string active:boolean images:array:string  

en web/router.ex, se agregan dependiendo de los modelos

    resources "/games", GameController, except: [:new, :edit]

quedando:

    scope "/api", ParkApi do
      pipe_through :api

      resources "/games", GameController, except: [:new, :edit]
      resources "/parks", ParkController, except: [:new, :edit]
    end

para el deploy en heroic, el mismo heroku tiene sus [pasos](http://www.phoenixframework.org/docs/heroku) para hacerlo, desde como empezar el proyecto y agregar ala base de datos igual de heroku, sus buildpacks y hacer el ecto.migrate


sus rutas:

    page_path  GET     /               ParkApi.PageController :index
    game_path  GET     /api/games      ParkApi.GameController :index
    game_path  GET     /api/games/:id  ParkApi.GameController :show
    game_path  POST    /api/games      ParkApi.GameController :create
    game_path  PATCH   /api/games/:id  ParkApi.GameController :update
               PUT     /api/games/:id  ParkApi.GameController :update
    game_path  DELETE  /api/games/:id  ParkApi.GameController :delete
    park_path  GET     /api/parks      ParkApi.ParkController :index
    park_path  GET     /api/parks/:id  ParkApi.ParkController :show
    park_path  POST    /api/parks      ParkApi.ParkController :create
    park_path  PATCH   /api/parks/:id  ParkApi.ParkController :update
               PUT     /api/parks/:id  ParkApi.ParkController :update
    park_path  DELETE  /api/parks/:id  ParkApi.ParkController :delete

##Notas
Cabe aclarar que estos pasos sencillos tomaron su tiempo aprenderlos pues empece creando el proyecto con --no-html, --no-bulch y con jaserializer. El cual cuando se hacia el deploy no funcionaba y con el jaserializer no me devolvía las images.

##Heroku

[https://desolate-ravine-88557.herokuapp.com](https://desolate-ravine-88557.herokuapp.com)