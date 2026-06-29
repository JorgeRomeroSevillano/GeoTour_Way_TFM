package net.gtw;

import java.time.Duration;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import io.cucumber.java.After;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;

public class InterfaceJourneyStepDefinition extends BaseStepDefinition {

    private static final String BASE_URL = System.getProperty("gtw.baseUrl", "http://localhost:5173");
    private static final String REFERENCE_HERITAGE_NAME = "Catedral de Valencia";
    private static final int DEFAULT_TIMEOUT_SECONDS = 60;
    private static final int IMAGE_TIMEOUT_SECONDS = 38;
    private static final int OPTIONAL_CONTENT_TIMEOUT_SECONDS = 45;

    private WebDriverWait wait;
    private String selectedHeritageName;
    private String selectedMinimumRating;
    private boolean accommodationPinOpened;
    private boolean finalStatusWritten;
    private boolean suppressLazyImageWarning;
    private final java.util.Set<String> lazyImageWarningSelectors = new java.util.HashSet<>();

    @Given("se accede al landing de GeoTour Way")
    public void accessGeoTourWayLanding() {
        createPDFFile();
        addTexto("Inicio de prueba: recorrido por la interfaz de GeoTour Way");

        WebDriverManager.chromedriver().setup();
        dr = new ChromeDriver();
        dr.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
        dr.manage().window().maximize();
        wait = new WebDriverWait(dr, DEFAULT_TIMEOUT_SECONDS);

        dr.get(BASE_URL + "/");
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".landing")));
        waitForBackgroundImage(".landing");
        captureScreenshot();
    }

    @When("se realiza el recorrido completo por la interfaz usando busqueda {string} y valoracion minima {string}")
    public void completeInterfaceJourney(String searchValue, String minimumRatingValue) {
        enterHomeFromLanding();
        translateToEnglishAndBackToSpanish();
        searchFilterAndOpenHeritageDetailFromHome(searchValue, minimumRatingValue);
        addDetailToFavourites();
        goHome();
        openFavouriteDetail();
        removeDetailFromFavourites();
        updateHeritageRating();
        openAnnualClimate();
        openGastronomyAndReturn();
        openAccommodationFilterAndClickBluePin();
    }

    @When("se vacian los favoritos")
    public void clearFavourites() {
        addTexto("Se vacian los favoritos antes de iniciar el recorrido");
        clearFavouritesThroughGateway();
    }

    @When("se comprueba la paginacion del home")
    public void checkHomePagination() {
        enterHomeFromLanding();
        testHomePagination();
    }

    @Then("el recorrido se completa correctamente")
    public void interfaceJourneyCompletesSuccessfully() {
        if (accommodationPinOpened) {
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".leaflet-popup-content")));
        }
        addTexto("Recorrido completo finalizado correctamente");
        addTexto("Prueba finalizada OK!");
        finalStatusWritten = true;
    }

    @When("se entra al home de GeoTour Way")
    public void enterGeoTourWayHome() {
        enterHomeFromLanding();
    }

    @When("se prepara un monumento de referencia")
    public void prepareReferenceHeritage() {
        prepareValenciaReferenceHeritage();
        addTexto("Monumento de referencia: " + selectedHeritageName);
    }

    @When("se busca {string} y se aplica valoracion minima {string}")
    public void searchAndApplyMinimumRating(String searchValue, String minimumRatingValue) {
        applyHomeSearchAndMinimumRating(searchValue, minimumRatingValue);
    }

    @Then("el monumento de referencia debe {string} en resultados")
    public void referenceHeritageShouldBeInResults(String expectedResult) {
        assertReferenceVisibilityInCurrentResults(expectedResult);
        captureScreenshot();
    }

    @When("se deja el monumento de referencia como {string}")
    public void setReferenceHeritageFavouriteState(String favouriteState) {
        setReferenceFavouriteState(favouriteState);
    }

    @Then("el monumento de referencia debe {string} en favoritos")
    public void referenceHeritageShouldBeInFavourites(String expectedResult) {
        assertReferenceVisibilityInFavourites(expectedResult);
        document.newPage();
        captureScreenshot();
    }

    @Then("si el monumento queda {string} se prueba el boton de eliminar todos")
    public void testClearAllButtonIfHeritageIsFavourite(String favouriteState) {
        if (!"favorito".equalsIgnoreCase(favouriteState)) {
            addTexto("Prueba finalizada OK!");
            finalStatusWritten = true;
            return;
        }

        addTexto("Se prueba el boton de vaciar lista de favoritos");
        click(By.cssSelector(".favourites__clear-button"));
        wait.until((ExpectedCondition<Boolean>) driver -> getFavouriteIdStringsFromGateway().isEmpty());
        waitForResultsSettled();
        waitForCardNotVisibleByTitle(selectedHeritageName);
        document.newPage();
        captureScreenshot();
        addTexto("Prueba finalizada OK!");
        finalStatusWritten = true;
    }

    @When("se navega a la ruta {string}")
    public void navigateToRoute(String route) {
        addTexto("Se navega a la ruta " + route);
        dr.get(BASE_URL + route);
        waitForPageReady();
    }

    @Then("se ve la pagina no encontrada")
    public void seeNotFoundPage() {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".notfound")));
        wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".notfound__eyebrow"), "404"));
        captureScreenshot();
    }

    private void enterHomeFromLanding() {
        if (dr.findElements(By.cssSelector(".landing__action")).isEmpty()
            && !dr.findElements(By.cssSelector(".home")).isEmpty()) {
            return;
        }

        addTexto("Se entra desde landing al home");
        if (!dr.findElements(By.cssSelector(".landing__action")).isEmpty()) {
            click(By.cssSelector(".landing__action"));
        }
        waitForHomeLoaded();
        captureScreenshot();
    }

    private void testHomePagination() {
        waitForHomeLoaded();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".home__pagination")));

        List<String> firstPageTitles = getVisibleCardTitles();
        addTexto("Se comprueba la paginacion del home");
        WebElement pageTwoButton = wait.until(ExpectedConditions.elementToBeClickable(
            By.xpath("//nav[contains(@class,'home__pagination')]//button[normalize-space()='2']")));
        safeClick(pageTwoButton);
        waitForResultsSettled();
        wait.until(ExpectedConditions.attributeContains(
            By.xpath("//nav[contains(@class,'home__pagination')]//button[normalize-space()='2']"),
            "class",
            "home__page-button--active"));
        wait.until((ExpectedCondition<Boolean>) driver -> !getVisibleCardTitles().equals(firstPageTitles));
        captureScreenshot();

        WebElement pageOneButton = wait.until(ExpectedConditions.elementToBeClickable(
            By.xpath("//nav[contains(@class,'home__pagination')]//button[normalize-space()='1']")));
        safeClick(pageOneButton);
        suppressLazyImageWarning = true;
        try {
            waitForResultsSettled();
        } finally {
            suppressLazyImageWarning = false;
        }
        wait.until(ExpectedConditions.attributeContains(
            By.xpath("//nav[contains(@class,'home__pagination')]//button[normalize-space()='1']"),
            "class",
            "home__page-button--active"));
    }

    private void translateToEnglishAndBackToSpanish() {
        addTexto("Se cambia el idioma a inglés y se vuelve a español");
        changeLanguage(1, "Heritage of Spain");
        sleep(Duration.ofSeconds(3));
        captureScreenshot();
        changeLanguage(0, "Patrimonio de");
    }

    private void searchFilterAndOpenHeritageDetailFromHome(String searchValue, String minimumRatingValue) {
        addTexto("Se usa el buscador con Catedral de Valencia, filtros si no se han borrado y ordenar por nombre en home antes de abrir el detalle");
        prepareValenciaReferenceHeritage();

        applyHomeSearchAndMinimumRating(searchValue, minimumRatingValue);
        captureScreenshot();

        WebElement filteredCard = findCardByTitle(selectedHeritageName);
        safeClick(filteredCard);

        waitForDetailLoaded();
        waitForDetailMapAndCurrentWeatherLoaded();
        wait.until(ExpectedConditions.textToBePresentInElementLocated(
            By.cssSelector(".heritage-detail__identity h1"), selectedHeritageName));
        captureScreenshot();
    }

    private void addDetailToFavourites() {
        addTexto("Se añade el monumento a favoritos desde el detalle");
        By favouriteButton = By.cssSelector(".heritage-detail__favourite-button");
        WebElement button = wait.until(ExpectedConditions.elementToBeClickable(favouriteButton));

        if (!button.getText().contains("Quitar")) {
            safeClick(button);
            waitForTextFragment(favouriteButton, "Quitar");
        }
    }

    private void goHome() {
        addTexto("Se vuelve al home");
        click(By.cssSelector(".header__brand"));
        waitForHomeLoaded();
    }

    private void openFavouriteDetail() {
        addTexto("Se entra en favoritos y se abre el detalle del monumento guardado");
        click(By.cssSelector(".header__favorite-button"));
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".favourites")));
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(By.cssSelector(".home__card"), 0));
        waitForImagesLoaded(".home__card-image");

        WebElement favouriteCard = findCardByTitle(selectedHeritageName);
        safeClick(favouriteCard);
        waitForDetailLoaded();
        waitForDetailMapAndCurrentWeatherLoaded();
        wait.until(ExpectedConditions.textToBePresentInElementLocated(
            By.cssSelector(".heritage-detail__identity h1"), selectedHeritageName));
        captureScreenshot();
    }

    private void removeDetailFromFavourites() {
        addTexto("Se quita el monumento de favoritos desde el detalle");
        By favouriteButton = By.cssSelector(".heritage-detail__favourite-button");
        WebElement button = wait.until(ExpectedConditions.elementToBeClickable(favouriteButton));

        if (button.getText().contains("Quitar")) {
            safeClick(button);
            waitForTextFragment(favouriteButton, "adir");
        }
    }

    private void updateHeritageRating() {
        addTexto("Se modifica la valoracion del monumento");
        WebElement ratingButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".heritage-rating__value")));
        safeClick(ratingButton);

        WebElement ratingInput = wait.until(ExpectedConditions.elementToBeClickable(By.id("heritage-rating-input")));
        ratingInput.clear();
        ratingInput.sendKeys("8.5");

        click(By.cssSelector(".heritage-rating__input-row button"));
        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".heritage-rating__editor")));
        wait.until((ExpectedCondition<Boolean>) driver -> {
            String ratingText = driver.findElement(By.cssSelector(".heritage-rating__value")).getText().trim();

            try {
                Double.parseDouble(ratingText.replace(",", "."));
                return true;
            } catch (NumberFormatException exception) {
                return false;
            }
        });
        addTexto("Valoracion visible tras guardar: " + dr.findElement(By.cssSelector(".heritage-rating__value")).getText());
    }

    private void openAnnualClimate() {
        addTexto("Se consulta el clima actual y el clima medio anual");
        waitForCurrentWeatherLoaded();
        click(By.cssSelector(".heritage-detail__climate-button"));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".climate-modal__dialog")));
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(By.cssSelector(".climate-modal__table-row"), 0));
        captureScreenshot();
        click(By.cssSelector(".climate-modal__close"));
        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".climate-modal__dialog")));
    }

    private void openGastronomyAndReturn() {
        addTexto("Se entra en gastronomia, se espera la carga completa y se vuelve al detalle");
        click(By.cssSelector(".heritage-detail__description-header button:nth-of-type(1)"));
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".heritage-gastronomy")));
        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".heritage-gastronomy--state")));
        waitForImagesLoaded(".gastronomy-card__image");
        captureScreenshot();

        click(By.cssSelector(".heritage-gastronomy__header button"));
        waitForDetailLoaded();
        waitForCurrentWeatherLoaded();
    }

    private void openAccommodationFilterAndClickBluePin() {
        addTexto("Se entra en alojamientos, se filtra por valoracion y se hace click en un pin azul");
        click(By.cssSelector(".heritage-detail__description-header button:nth-of-type(2)"));
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".heritage-accommodation")));
        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".heritage-accommodation--state")));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".accommodation-legend")));
        waitForLeafletMapLoaded();

        click(By.cssSelector(".accommodation-legend__filter summary"));
        applyAccommodationRatingFilterKeepingBluePins();

        WebElement bluePin = waitForOptionalElement(By.cssSelector(".map__blue-marker-wrapper"), OPTIONAL_CONTENT_TIMEOUT_SECONDS);

        if (bluePin == null) {
            addTexto("No hay pines azules de alojamiento disponibles en este momento. La prueba continua.");
            return;
        }

        safeClick(bluePin);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".leaflet-popup-content")));
        accommodationPinOpened = true;
        document.newPage();
        captureScreenshot();
    }

    private void waitForHomeLoaded() {
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".home")));
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(By.cssSelector(".home__card"), 0));
        waitForImagesLoaded(".home__card-image");
    }

    private void waitForDetailLoaded() {
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".heritage-detail")));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".heritage-detail__identity h1")));
        waitForImagesLoaded(".heritage-detail__image");
    }

    private void waitForDetailMapAndCurrentWeatherLoaded() {
        waitForLeafletMapLoaded();
        waitForCurrentWeatherLoaded();
    }

    private void waitForPageReady() {
        wait.until((ExpectedCondition<Boolean>) driver ->
            "complete".equals(((JavascriptExecutor) driver).executeScript("return document.readyState")));
    }

    private void waitForCurrentWeatherLoaded() {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".current-weather")));
        try {
            new WebDriverWait(dr, OPTIONAL_CONTENT_TIMEOUT_SECONDS).until((ExpectedCondition<Boolean>) driver -> {
                String temperature = driver.findElement(By.cssSelector(".current-weather__temperature")).getText().trim();
                return temperature.contains("C") && !temperature.contains("--");
            });
        } catch (TimeoutException exception) {
            addTexto("El clima actual tarda demasiado en cargar. La prueba continua.");
        }
    }

    private void waitForImagesLoaded(String selector) {
        try {
            new WebDriverWait(dr, IMAGE_TIMEOUT_SECONDS).until((ExpectedCondition<Boolean>) driver -> {
                List<WebElement> images = driver.findElements(By.cssSelector(selector));

                if (images.isEmpty()) {
                    return true;
                }

                for (WebElement image : images) {
                    Boolean loaded;

                    try {
                        loaded = (Boolean) ((JavascriptExecutor) driver).executeScript(
                            "return arguments[0].complete && arguments[0].naturalWidth > 0", image);
                    } catch (StaleElementReferenceException exception) {
                        return false;
                    }

                    if (!Boolean.TRUE.equals(loaded)) {
                        return false;
                    }
                }

                return true;
            });
        } catch (TimeoutException exception) {
            if (!suppressLazyImageWarning && lazyImageWarningSelectors.add(selector)) {
                addTexto("Alguna/s imagen/es tarda/n demasiado en cargar debido al tipo de carga lazy. La prueba continua.");
            }
        }
    }

    private void waitForBackgroundImage(String selector) {
        wait.until((ExpectedCondition<Boolean>) driver -> {
            WebElement element = driver.findElement(By.cssSelector(selector));
            String image = String.valueOf(((JavascriptExecutor) driver)
                .executeScript("return window.getComputedStyle(arguments[0]).backgroundImage", element));
            return image != null && image.contains("url(") && !image.contains("none");
        });
    }

    private void waitForLeafletMapLoaded() {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".leaflet-container")));
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(By.cssSelector(".leaflet-marker-icon"), 0));
    }

    private WebElement findCardByTitle(String title) {
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(By.cssSelector(".home__card"), 0));
        List<WebElement> cards = dr.findElements(By.cssSelector(".home__card"));

        for (WebElement card : cards) {
            if (title.equals(card.findElement(By.cssSelector("h2")).getText())) {
                return card;
            }
        }

        throw new AssertionError("No se encontro la tarjeta favorita: " + title);
    }

    private List<String> getVisibleCardTitles() {
        List<String> titles = new java.util.ArrayList<>();
        List<WebElement> cards = dr.findElements(By.cssSelector(".home__card"));

        for (WebElement card : cards) {
            titles.add(card.findElement(By.cssSelector("h2")).getText());
        }

        return titles;
    }

    private String getCompatibleMinimumRating(WebElement card) {
        String ratingText = card.findElement(By.cssSelector(".home__rating")).getText().trim();
        double rating = Double.parseDouble(ratingText.replace(",", "."));
        double minimumRating = Math.max(0, Math.floor(rating));
        return String.valueOf(minimumRating);
    }

    private void prepareValenciaReferenceHeritage() {
        selectedHeritageName = REFERENCE_HERITAGE_NAME;
        searchInHome(selectedHeritageName);
        WebElement referenceCard = findCardByTitle(selectedHeritageName);
        selectedMinimumRating = getCompatibleMinimumRating(referenceCard);
    }

    private void applyHomeSearchAndMinimumRating(String searchValue, String minimumRatingValue) {
        String resolvedSearch = resolveSearchValue(searchValue);
        String resolvedMinimumRating = resolveMinimumRatingValue(minimumRatingValue);

        searchInHome(resolvedSearch);
        captureScreenshot();
        applyMinimumRatingFilter(resolvedMinimumRating);
    }

    private String resolveSearchValue(String searchValue) {
        if ("nombre".equalsIgnoreCase(searchValue)) {
            return selectedHeritageName;
        }

        return searchValue;
    }

    private String resolveMinimumRatingValue(String minimumRatingValue) {
        if ("compatible".equalsIgnoreCase(minimumRatingValue)) {
            return selectedMinimumRating;
        }

        return minimumRatingValue;
    }

    private void searchInHome(String searchText) {
        WebElement searchInput = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".home__search input")));
        searchInput.clear();
        searchInput.sendKeys(searchText);
        click(By.cssSelector(".home__search button"));
        waitForResultsSettled();
    }

    private void applyMinimumRatingFilter(String minimumRating) {
        openHomeFilters();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".home__filters")));

        WebElement ratingInput = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".home__rating-input")));
        ratingInput.clear();
        ratingInput.sendKeys(minimumRating);

        click(By.cssSelector(".home__apply-filters"));
        waitForResultsSettled();
    }

    private void openHomeFilters() {
        WebElement filtersButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".home__toolbar-button")));

        if (!"true".equals(filtersButton.getAttribute("aria-expanded"))) {
            safeClick(filtersButton);
        }
    }

    private void waitForCardVisibleByTitle(String title) {
        wait.until((ExpectedCondition<Boolean>) driver -> {
            List<WebElement> cards = driver.findElements(By.cssSelector(".home__card"));

            for (WebElement card : cards) {
                if (title.equals(card.findElement(By.cssSelector("h2")).getText())) {
                    return true;
                }
            }

            return false;
        });
    }

    private void waitForCardNotVisibleByTitle(String title) {
        wait.until((ExpectedCondition<Boolean>) driver -> {
            List<WebElement> cards = driver.findElements(By.cssSelector(".home__card"));

            for (WebElement card : cards) {
                if (title.equals(card.findElement(By.cssSelector("h2")).getText())) {
                    return false;
                }
            }

            return true;
        });
    }

    private void waitForResultsSettled() {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".home__heritage-results")));

        if (!dr.findElements(By.cssSelector(".home__card-image")).isEmpty()) {
            waitForImagesLoaded(".home__card-image");
        }
    }

    private void assertReferenceVisibilityInCurrentResults(String expectedResult) {
        if ("aparecer".equalsIgnoreCase(expectedResult)) {
            waitForCardVisibleByTitle(selectedHeritageName);
            return;
        }

        if ("no aparecer".equalsIgnoreCase(expectedResult)) {
            waitForCardNotVisibleByTitle(selectedHeritageName);
            return;
        }

        throw new AssertionError("Resultado esperado no reconocido: " + expectedResult);
    }

    private void setReferenceFavouriteState(String favouriteState) {
        clearFavouritesThroughGateway();
        resetHomeState();
        searchInHome(selectedHeritageName);
        WebElement referenceCard = findCardByTitle(selectedHeritageName);
        safeClick(referenceCard);
        waitForDetailLoaded();
        wait.until(ExpectedConditions.textToBePresentInElementLocated(
            By.cssSelector(".heritage-detail__identity h1"), selectedHeritageName));

        By favouriteButton = By.cssSelector(".heritage-detail__favourite-button");
        WebElement button = wait.until(ExpectedConditions.elementToBeClickable(favouriteButton));
        String buttonText = button.getText();
        boolean isCurrentlyFavourite = buttonText.contains("Quitar");

        if ("favorito".equalsIgnoreCase(favouriteState)) {
            if (!isCurrentlyFavourite) {
                safeClick(button);
                waitForTextFragment(favouriteButton, "Quitar");
            }
            waitForReferenceFavouriteInGateway(true);
            return;
        }

        if ("no favorito".equalsIgnoreCase(favouriteState)) {
            if (isCurrentlyFavourite) {
                safeClick(button);
                waitForTextFragment(favouriteButton, "adir");
            }
            waitForReferenceFavouriteInGateway(false);
            return;
        }

        if ("favorito".equalsIgnoreCase(favouriteState) && buttonText.contains("AÃ±adir")) {
            safeClick(button);
            wait.until(ExpectedConditions.textToBePresentInElementLocated(favouriteButton, "Quitar"));
            return;
        }

        if ("no favorito".equalsIgnoreCase(favouriteState) && buttonText.contains("Quitar")) {
            safeClick(button);
            wait.until(ExpectedConditions.textToBePresentInElementLocated(favouriteButton, "AÃ±adir"));
            return;
        }

        if (!"favorito".equalsIgnoreCase(favouriteState) && !"no favorito".equalsIgnoreCase(favouriteState)) {
            throw new AssertionError("Estado de favorito no reconocido: " + favouriteState);
        }
    }

    private void assertReferenceVisibilityInFavourites(String expectedResult) {
        ((JavascriptExecutor) dr).executeScript("window.localStorage.removeItem('geotour-way-favourites-page');");
        click(By.cssSelector(".header__favorite-button"));
        waitForPageReady();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".favourites")));
        waitForResultsSettled();
        assertReferenceVisibilityInCurrentResults(expectedResult);
    }

    private void resetHomeState() {
        ((JavascriptExecutor) dr).executeScript("window.localStorage.removeItem('geotour-way-home-state');");
        ((JavascriptExecutor) dr).executeScript("window.localStorage.removeItem('geotour-way-favourites-page');");
        dr.get(BASE_URL + "/home");
        waitForHomeLoaded();
    }

    private void clearFavouritesThroughGateway() {
        executeGatewayRequest("favoritos", "/favoritos", "DELETE", null);
        wait.until((ExpectedCondition<Boolean>) driver -> getFavouriteIdStringsFromGateway().isEmpty());
    }

    private void waitForReferenceFavouriteInGateway(boolean expectedFavourite) {
        wait.until((ExpectedCondition<Boolean>) driver -> {
            List<String> favouriteIds = getFavouriteIdStringsFromGateway();
            String selectedId = getSelectedHeritageIdFromPage();
            return expectedFavourite == favouriteIds.contains(selectedId);
        });
    }

    private String getSelectedHeritageIdFromPage() {
        String path = String.valueOf(((JavascriptExecutor) dr).executeScript("return window.location.pathname"));
        String[] parts = path.split("/");
        return parts.length > 2 ? parts[2] : "";
    }

    private List<String> getFavouriteIdStringsFromGateway() {
        Object response = executeGatewayRequest("favoritos", "/favoritos", "GET", null);

        if (response instanceof java.util.Map<?, ?>) {
            java.util.Map<?, ?> responseMap = (java.util.Map<?, ?>) response;
            Object ids = responseMap.get("idsPatrimonio");

            if (ids instanceof List) {
                List<String> normalizedIds = new java.util.ArrayList<>();

                for (Object id : (List<?>) ids) {
                    normalizedIds.add(String.valueOf(id));
                }

                return normalizedIds;
            }
        }

        return java.util.Collections.emptyList();
    }

    private Object executeGatewayRequest(String service, String path, String targetMethod, String bodyJson) {
        String script =
            "var callback = arguments[arguments.length - 1];" +
            "fetch('http://localhost:8762/' + arguments[0] + arguments[1], {" +
            "  method: 'POST'," +
            "  headers: {'Content-Type': 'application/json'}," +
            "  body: JSON.stringify({targetMethod: arguments[2], queryParams: {}, body: arguments[3]})" +
            "})" +
            ".then(function(response) { return response.text(); })" +
            ".then(function(text) { callback(text ? JSON.parse(text) : null); })" +
            ".catch(function(error) { callback({error: String(error)}); });";

        return ((JavascriptExecutor) dr).executeAsyncScript(script, service, path, targetMethod, bodyJson);
    }

    private void changeLanguage(int optionIndex, String expectedHomeTitleText) {
        click(By.cssSelector(".header__language-button"));
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(By.cssSelector(".header__language-option"), optionIndex));
        List<WebElement> languageOptions = dr.findElements(By.cssSelector(".header__language-option"));
        safeClick(languageOptions.get(optionIndex));
        wait.until(ExpectedConditions.textToBePresentInElementLocated(By.cssSelector(".home__hero h1"), expectedHomeTitleText));
        waitForImagesLoaded(".home__card-image");
    }

    private void applyAccommodationRatingFilterKeepingBluePins() {
        List<WebElement> checkboxes = dr.findElements(By.cssSelector(".accommodation-legend__rate-options input[type='checkbox']"));
        int initialBluePins = dr.findElements(By.cssSelector(".map__blue-marker-wrapper")).size();

        if (initialBluePins == 0) {
            addTexto("No hay pines azules antes de aplicar el filtro de alojamientos.");
            return;
        }

        for (WebElement checkbox : checkboxes) {
            safeClick(checkbox);
            sleep(Duration.ofMillis(700));

            if (!dr.findElements(By.cssSelector(".map__blue-marker-wrapper")).isEmpty()) {
                return;
            }

            safeClick(checkbox);
            sleep(Duration.ofMillis(700));
        }

        throw new AssertionError("El filtro por valoracion no dejo ningun alojamiento visible");
    }

    private WebElement waitForOptionalElement(By locator, int timeoutSeconds) {
        try {
            return new WebDriverWait(dr, timeoutSeconds).until(ExpectedConditions.elementToBeClickable(locator));
        } catch (TimeoutException exception) {
            return null;
        }
    }

    private void waitForTextFragment(By locator, String textFragment) {
        wait.until((ExpectedCondition<Boolean>) driver -> {
            String text = driver.findElement(locator).getText();
            return text != null && text.contains(textFragment);
        });
    }

    private void click(By locator) {
        WebElement element = wait.until(ExpectedConditions.elementToBeClickable(locator));
        safeClick(element);
    }

    private void safeClick(WebElement element) {
        ((JavascriptExecutor) dr).executeScript("arguments[0].scrollIntoView({block: 'center', inline: 'center'});", element);

        try {
            element.click();
        } catch (WebDriverException exception) {
            ((JavascriptExecutor) dr).executeScript("arguments[0].click();", element);
        }
    }

    private void sleep(Duration duration) {
        try {
            Thread.sleep(duration.toMillis());
        } catch (InterruptedException exception) {
            Thread.currentThread().interrupt();
        }
    }

    @After
    public void closeScenario(Scenario scenario) {
        if (document != null && !finalStatusWritten) {
            addTexto(scenario.isFailed() ? "Prueba finalizada con errores" : "Prueba finalizada OK!");
        }

        if (dr != null) {
            dr.quit();
        }

        if (document != null) {
            closePdf();
        }
    }
}
