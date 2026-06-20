import { Star } from 'lucide-react'
import './styles/AccommodationMarkerLabel.css'

function AccommodationMarkerLabel({ accommodation }) {
  const rate = Math.round(
    Math.min(3, Math.max(1, Number(accommodation.rate))),
  )

  return (
    <div className="accommodation-marker-label">
      <strong>{accommodation.name}</strong>
      <span className="accommodation-marker-label__stars" aria-label={`${rate} / 3`}>
        {Array.from({ length: 3 }, (_, index) => (
          <Star
            key={index}
            size={14}
            fill={index < rate ? 'currentColor' : 'none'}
            aria-hidden="true"
          />
        ))}
      </span>
    </div>
  )
}

export default AccommodationMarkerLabel
