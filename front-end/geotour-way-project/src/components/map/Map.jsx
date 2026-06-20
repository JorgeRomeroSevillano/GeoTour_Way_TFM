import L from 'leaflet'
import { ChevronDown, ChevronUp, Ruler } from 'lucide-react'
import { useCallback, useEffect, useMemo, useState } from 'react'
import {
  CircleMarker,
  MapContainer,
  Marker,
  Polyline,
  Popup,
  Rectangle,
  ScaleControl,
  TileLayer,
  Tooltip,
  useMap,
  useMapEvents,
} from 'react-leaflet'
import 'leaflet/dist/leaflet.css'
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/Map.css'

const DEFAULT_CENTER = [40.4168, -3.7038]
const DEFAULT_ZOOM = 5

L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
})

const redMarkerIcon = L.divIcon({
  className: 'map__red-marker-wrapper',
  html: '<span class="map__red-marker"></span>',
  iconAnchor: [11, 28],
  iconSize: [22, 28],
  popupAnchor: [0, -28],
})

function formatDistance(distance) {
  if (distance >= 1000) {
    return `${(distance / 1000).toFixed(distance >= 10000 ? 0 : 2)} km`
  }

  return `${Math.round(distance)} m`
}

function MeasureEvents({ active, onPointSelected }) {
  useMapEvents({
    click(event) {
      if (active) {
        onPointSelected(event.latlng)
      }
    },
  })

  return null
}

function MapViewTracker({ onViewChange }) {
  const map = useMapEvents({
    moveend() {
      onViewChange(map)
    },
    zoomend() {
      onViewChange(map)
    },
  })

  useEffect(() => {
    onViewChange(map)
  }, [map, onViewChange])

  return null
}

function MiniMapUpdater({ center, zoom }) {
  const map = useMap()

  useEffect(() => {
    map.setView(center, zoom, { animate: false })
  }, [center, map, zoom])

  return null
}

function MiniMap({ bounds, center, isOpen, onToggle, parentZoom }) {
  const { t } = useLanguage()
  const miniMapZoom = Math.max(parentZoom - 6, 3)

  return (
    <div
      className={isOpen ? 'map-shell__minimap' : 'map-shell__minimap map-shell__minimap--closed'}
    >
      {isOpen && (
        <MapContainer
          className="map-shell__minimap-map"
          attributionControl={false}
          boxZoom={false}
          center={center}
          doubleClickZoom={false}
          dragging={false}
          keyboard={false}
          scrollWheelZoom={false}
          touchZoom={false}
          zoom={miniMapZoom}
          zoomControl={false}
        >
          <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
          <MiniMapUpdater center={center} zoom={miniMapZoom} />
          {bounds && (
            <Rectangle
              bounds={bounds}
              pathOptions={{ color: '#e57b25', fillOpacity: 0.08, weight: 2 }}
            />
          )}
        </MapContainer>
      )}
      <button
        type="button"
        className="map-shell__minimap-toggle"
        aria-label={t(isOpen ? 'map.hideMiniMap' : 'map.showMiniMap')}
        title={t(isOpen ? 'map.hideMiniMap' : 'map.showMiniMap')}
        onClick={onToggle}
      >
        {isOpen ? (
          <ChevronDown size={18} aria-hidden="true" />
        ) : (
          <ChevronUp size={18} aria-hidden="true" />
        )}
      </button>
    </div>
  )
}

function Map({
  center = DEFAULT_CENTER,
  enableMeasure = false,
  markers = [],
  showMiniMap = false,
  showScale = false,
  variant = 'default',
  zoom = DEFAULT_ZOOM,
}) {
  const { t } = useLanguage()
  const [isMeasuring, setIsMeasuring] = useState(false)
  const [isMiniMapOpen, setIsMiniMapOpen] = useState(true)
  const [measurePoints, setMeasurePoints] = useState([])
  const [mapView, setMapView] = useState({
    bounds: null,
    center,
    zoom,
  })
  const measuredDistance = useMemo(() => {
    if (measurePoints.length !== 2) {
      return null
    }

    return measurePoints[0].distanceTo(measurePoints[1])
  }, [measurePoints])

  const handleViewChange = useCallback((leafletMap) => {
    const currentCenter = leafletMap.getCenter()

    setMapView({
      bounds: leafletMap.getBounds(),
      center: [currentCenter.lat, currentCenter.lng],
      zoom: leafletMap.getZoom(),
    })
  }, [])

  function handleMeasureToggle() {
    setMeasurePoints([])
    setIsMeasuring((currentValue) => !currentValue)
  }

  function handleMeasurePointSelected(point) {
    setMeasurePoints((currentPoints) => {
      if (currentPoints.length >= 2) {
        return currentPoints
      }

      return [...currentPoints, point]
    })
  }

  return (
    <div className={`map-shell map-shell--${variant}`}>
      <MapContainer
        className={`map map--${variant}`}
        center={center}
        doubleClickZoom
        scrollWheelZoom
        touchZoom
        zoom={zoom}
        zoomControl
      >
        <TileLayer
          attribution="&copy; OpenStreetMap contributors"
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />

        {markers.map((marker) => (
          <Marker
            key={marker.id ?? marker.popupText}
            icon={marker.color === 'red' ? redMarkerIcon : undefined}
            position={marker.position}
          >
            {marker.popupText && <Popup>{marker.popupText}</Popup>}
          </Marker>
        ))}

        {showScale && <ScaleControl imperial={false} position="bottomright" />}
        {showMiniMap && <MapViewTracker onViewChange={handleViewChange} />}
        {enableMeasure && (
          <MeasureEvents
            active={isMeasuring}
            onPointSelected={handleMeasurePointSelected}
          />
        )}
        {measurePoints.length > 0 && (
          <>
            {measurePoints.map((point, index) => (
              <CircleMarker
                key={`${point.lat}-${point.lng}`}
                center={point}
                pathOptions={{ color: '#ffffff', fillColor: '#d92525', fillOpacity: 1, weight: 2 }}
                radius={6}
              >
                <Tooltip permanent>{index + 1}</Tooltip>
              </CircleMarker>
            ))}
            <Polyline
              pathOptions={{ color: '#d92525', dashArray: '6 6', weight: 3 }}
              positions={measurePoints}
            >
              {measuredDistance !== null && (
                <Tooltip permanent>{formatDistance(measuredDistance)}</Tooltip>
              )}
            </Polyline>
          </>
        )}
      </MapContainer>

      {enableMeasure && (
        <button
          type="button"
          className={
            isMeasuring
              ? 'map-shell__measure map-shell__measure--active'
              : 'map-shell__measure'
          }
          aria-pressed={isMeasuring}
          onClick={handleMeasureToggle}
          title={t('map.measureDistance')}
          aria-label={t('map.measureDistance')}
        >
          <Ruler size={18} aria-hidden="true" />
        </button>
      )}
      {showMiniMap && (
        <MiniMap
          bounds={mapView.bounds}
          center={mapView.center}
          isOpen={isMiniMapOpen}
          onToggle={() => setIsMiniMapOpen((currentValue) => !currentValue)}
          parentZoom={mapView.zoom}
        />
      )}
    </div>
  )
}

export default Map
