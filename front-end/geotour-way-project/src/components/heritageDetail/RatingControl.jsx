import { Check, Star } from 'lucide-react'
import { useEffect, useRef, useState } from 'react'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/RatingControl.css'

function RatingControl({ isUpdating, onUpdate, value }) {
  const [isOpen, setIsOpen] = useState(false)
  const [rating, setRating] = useState('')
  const editorRef = useRef(null)
  const { t } = useLanguage()

  useEffect(() => {
    if (!isOpen) {
      return undefined
    }

    function handleOutsideClick(event) {
      if (!editorRef.current?.contains(event.target)) {
        setIsOpen(false)
      }
    }

    function handleEscape(event) {
      if (event.key === 'Escape') {
        setIsOpen(false)
      }
    }

    document.addEventListener('pointerdown', handleOutsideClick)
    document.addEventListener('keydown', handleEscape)

    return () => {
      document.removeEventListener('pointerdown', handleOutsideClick)
      document.removeEventListener('keydown', handleEscape)
    }
  }, [isOpen])

  function handleOpen() {
    setRating('')
    setIsOpen(true)
  }

  function handleSubmit(event) {
    event.preventDefault()
    const numericRating = Number(rating)

    if (rating === '' || numericRating < 0 || numericRating > 10) {
      return
    }

    onUpdate(numericRating).then(() => setIsOpen(false))
  }

  return (
    <div className="heritage-rating" ref={editorRef}>
      <Star size={25} fill="currentColor" aria-hidden="true" />
      <button
        type="button"
        className="heritage-rating__value"
        aria-expanded={isOpen}
        onClick={() => (isOpen ? setIsOpen(false) : handleOpen())}
      >
        {Number(value).toFixed(1)}
      </button>
      {isOpen && (
        <form className="heritage-rating__editor" onSubmit={handleSubmit}>
          <label htmlFor="heritage-rating-input">
            {t('heritageDetail.yourRating')}
          </label>
          <div className="heritage-rating__input-row">
            <input
              id="heritage-rating-input"
              type="number"
              min="0"
              max="10"
              step="0.1"
              inputMode="decimal"
              placeholder="0 - 10"
              value={rating}
              onChange={(event) => setRating(event.target.value === '' ? '' : String(Math.min(10, Math.max(0, Number(event.target.value)))))}
              aria-label={t('heritageDetail.selectRating')}
              autoFocus
              disabled={isUpdating}
            />
            <button
              type="submit"
              aria-label={t('heritageDetail.saveRating')}
              title={t('heritageDetail.saveRating')}
              disabled={isUpdating || rating === ''}
            >
              <Check size={18} aria-hidden="true" />
            </button>
          </div>
        </form>
      )}
    </div>
  )
}

export default RatingControl
