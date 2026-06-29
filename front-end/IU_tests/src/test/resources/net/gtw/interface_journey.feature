@recorrido-interfaz
Feature: Recorrido principal de GeoTour Way
  Se quiere comprobar el recorrido principal de usuario en la interfaz

  Scenario Outline: Explorar monumento, favoritos, clima, gastronomia y alojamientos
    Given se accede al landing de GeoTour Way
    And se vacian los favoritos
    And se comprueba la paginacion del home
    When se realiza el recorrido completo por la interfaz usando busqueda "<busqueda>" y valoracion minima "<valoracionMinima>"
    Then el recorrido se completa correctamente

    Examples:
      | busqueda | valoracionMinima |
      | nombre   | compatible       |

  Scenario Outline: Comprobar visibilidad por busqueda filtros y favoritos
    Given se accede al landing de GeoTour Way
    When se entra al home de GeoTour Way
    And se prepara un monumento de referencia
    And se busca "<busqueda>" y se aplica valoracion minima "<valoracionMinima>"
    Then el monumento de referencia debe "<resultadoHome>" en resultados
    When se deja el monumento de referencia como "<estadoFavorito>"
    Then el monumento de referencia debe "<resultadoFavoritos>" en favoritos
    And si el monumento queda "<estadoFavorito>" se prueba el boton de eliminar todos

    Examples:
      | busqueda          | valoracionMinima | resultadoHome | estadoFavorito | resultadoFavoritos |
      | nombre            | compatible       | aparecer      | no favorito    | no aparecer        |
      | nombre            | compatible       | aparecer      | favorito       | aparecer           |

  Scenario: Comprobar que una busqueda inexistente no muestra el patrimonio
    Given se accede al landing de GeoTour Way
    When se entra al home de GeoTour Way
    And se prepara un monumento de referencia
    And se busca "patrimonio inexistente" y se aplica valoracion minima "compatible"
    Then el monumento de referencia debe "no aparecer" en resultados

  Scenario: Consultar la ruta home mal escrita
    Given se accede al landing de GeoTour Way
    When se navega a la ruta "/hom"
    Then se ve la pagina no encontrada
