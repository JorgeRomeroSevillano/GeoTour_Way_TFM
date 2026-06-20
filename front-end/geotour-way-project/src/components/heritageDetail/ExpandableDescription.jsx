import { ChevronDown, ChevronUp } from 'lucide-react'
import { useEffect, useRef, useState } from 'react'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/ExpandableDescription.css'

const COLLAPSED_HEIGHT = 90

function ExpandableDescription({ text }) {
  const [isExpanded, setIsExpanded] = useState(false)
  const [hasOverflow, setHasOverflow] = useState(false)
  const contentRef = useRef(null)
  const { t } = useLanguage()

  useEffect(() => {
    const content = contentRef.current

    if (!content) {
      return undefined
    }

    function checkOverflow() {
      setHasOverflow(content.scrollHeight > COLLAPSED_HEIGHT + 1)
    }

    checkOverflow()
    const observer = new ResizeObserver(checkOverflow)
    observer.observe(content)

    return () => observer.disconnect()
  }, [text])

  return (
    <div className="expandable-description">
      <p
        ref={contentRef}
        className={
          isExpanded
            ? 'expandable-description__content expandable-description__content--expanded'
            : 'expandable-description__content'
        }
      >
        {text}
      </p>
      {hasOverflow && (
        <button
          type="button"
          className="expandable-description__toggle"
          aria-expanded={isExpanded}
          onClick={() => setIsExpanded((currentValue) => !currentValue)}
        >
          {isExpanded ? t('heritageDetail.readLess') : t('heritageDetail.readMore')}
          {isExpanded ? (
            <ChevronUp size={16} aria-hidden="true" />
          ) : (
            <ChevronDown size={16} aria-hidden="true" />
          )}
        </button>
      )}
    </div>
  )
}

export default ExpandableDescription
